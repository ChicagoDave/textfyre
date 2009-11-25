using System;
using System.IO;
using System.Threading;
using Textfyre.VM;
using System.IO.IsolatedStorage;
using System.Collections.Generic;

namespace Textfyre.ShadowFyre
{
	public class EngineClient
	{
		public event OutputReadyEventHandler OutputReady;
		public event SaveRestoreEventHandler SaveRequested;
		public event SaveRestoreEventHandler LoadRequested;

		private MemoryStream game;
		private Thread thread;
		private Engine engine;

		private string nextLine;
		private char nextKey;

		private AutoResetEvent keyReady = new AutoResetEvent( false );
		private AutoResetEvent lineReady = new AutoResetEvent( false );
		private ManualResetEvent stop = new ManualResetEvent( false );

		private EventWaitHandle[] lineEvents;
		private EventWaitHandle[] keyEvents;

		public EngineClient( Stream gameFile )
		{
			lineEvents = new EventWaitHandle[] { lineReady, stop };
			keyEvents = new EventWaitHandle[] { keyReady, stop };

			var buffer = new byte[ gameFile.Length ];
			gameFile.Read( buffer, 0, buffer.Length );

			try
			{
				var blorb = Blorb.FromStream( new MemoryStream( buffer ) );
				game = new MemoryStream( blorb[ Blorb.GLUL ] );
			}
			catch
			{
				game = new MemoryStream( buffer );
			}

			thread = new Thread( Run );
			thread.Start();
		}

		public void Stop()
		{
		}

		public void SendLine( string line )
		{
			nextLine = line;
			lineReady.Set();
		}

		public void SendKey( char key )
		{
			nextKey = key;
			keyReady.Set();
		}

		private void Run()
		{
			try
			{
				engine = new Engine( game );

				engine.OutputReady += new OutputReadyEventHandler( engine_OutputReady );
				engine.KeyWanted += new KeyWantedEventHandler( engine_KeyWanted );
				engine.LineWanted += new LineWantedEventHandler( engine_LineWanted );
				engine.SaveRequested += new SaveRestoreEventHandler( engine_SaveRequested );
				engine.LoadRequested += new SaveRestoreEventHandler( engine_LoadRequested );

				while ( !stop.WaitOne( 0 ) )
				{
					var started = DateTime.Now;

					try
					{
						engine.Run();
					}
					catch ( Exception ex )
					{
						OutputError( ex );
					}

					// If game exited/failed immediately, take a breather...
					if ( ( DateTime.Now - started ).TotalMilliseconds < 1000 ) Thread.Sleep( 3000 );
				}
			}
			catch ( Exception ex )
			{
				OutputError( ex );
			}
		}

		private void OutputError( Exception ex )
		{
			if ( OutputReady != null )
			{
				var package = new Dictionary<OutputChannel, string>();
				package[ OutputChannel.Death ] = ex.Message;

				OutputReady( this, new OutputReadyEventArgs { Package = package } );
			}
		}

		void engine_KeyWanted( object sender, KeyWantedEventArgs e )
		{
			keyReady.Reset();

			if ( WaitHandle.WaitAny( keyEvents ) == 0 ) e.Char = nextKey;
			else engine.Stop();
		}

		void engine_LineWanted( object sender, LineWantedEventArgs e )
		{
			lineReady.Reset();

			if ( WaitHandle.WaitAny( lineEvents ) == 0 ) e.Line = nextLine;
			else engine.Stop();
		}

		void engine_OutputReady( object sender, OutputReadyEventArgs e )
		{
			if ( OutputReady != null ) OutputReady( this, e );
		}

		void engine_SaveRequested( object sender, SaveRestoreEventArgs e )
		{
			if ( SaveRequested != null ) SaveRequested( this, e );
		}

		void engine_LoadRequested( object sender, SaveRestoreEventArgs e )
		{
			if ( LoadRequested != null ) LoadRequested( this, e );
		}
	}
}