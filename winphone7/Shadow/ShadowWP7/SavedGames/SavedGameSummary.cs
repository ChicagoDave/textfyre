using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.IO.IsolatedStorage;
using System.ComponentModel;

namespace ShadowWP7.SavedGames
{
	public class SavedGameSummary : INotifyPropertyChanged
	{
		private static Regex saveFileName = new Regex( "^(?<index>.*?)_(?<turn>[0-9]*?)_(?<title>.*?)_(?<time>.*?)_(?<score>.*?)_(?<created>.*?)$", RegexOptions.Compiled );

		public string Index { get; private set; }
		public DateTime CreatedTime { get; private set; }
		public string Title { get; private set; }
		public int Turn { get; private set; }
		public string Time { get; private set; }
		public string Score { get; private set; }

		public SavedGameSummary()
		{
		}

		public SavedGameSummary( string progressFile )
		{
			var match = saveFileName.Match( progressFile );

			Index = match.Groups[ "index" ].Value;
			Turn = int.Parse( match.Groups[ "turn" ].Value );
			Title = Decode( match.Groups[ "title" ].Value );
			Time = Decode( match.Groups[ "time" ].Value );
			Score = Decode( match.Groups[ "score" ].Value );
			CreatedTime = DateTime.Parse( Decode( match.Groups[ "created" ].Value ) );
		}

		public SavedGameSummary( string title, string time, string score )
		{
			Index = "Current";
			Title = title;
			Time = time;
			Score = score;
		}

		public void Update( string title, string time, string score )
		{
			Turn++;
			Title = title;
			Time = time;
			Score = score;
			CreatedTime = DateTime.Now;

			System.Diagnostics.Debug.WriteLine( string.Format( "Updating SavedGameSummary ({0})", title ) );
		}

		public string ArchiveFile( int? turn = null ) { return string.Format( "History_{0}", turn ?? Turn ); }

		public string ProgressFile
		{
			get
			{
				return string.Format(
					"Current_{0}_{1}_{2}_{3}_{4}",
					Turn, Encode( Title ), Encode( Time ), Encode( Score ), Encode( XmlConvert.ToString( CreatedTime ) ) );
			}
		}

		private static string Encode( string value )
		{
			if ( value == null ) return null;

			return Convert.ToBase64String( Encoding.UTF8.GetBytes( value ) );
		}

		private static string Decode( string value )
		{
			if ( value == null ) return null;

			var bytes = Convert.FromBase64String( value );

			return Encoding.UTF8.GetString( bytes, 0, bytes.Length );
		}

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged( string propertyName )
		{
			if ( PropertyChanged != null ) PropertyChanged( this, new PropertyChangedEventArgs( propertyName ) );
		}

		#endregion
	}
}