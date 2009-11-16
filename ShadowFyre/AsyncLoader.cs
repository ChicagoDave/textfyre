using System;
using System.Net;
using System.IO;

namespace Cjc.SilverFyre
{
	public class AsyncLoader
	{
		private Action<Stream> onLoaded;
		private Action<Exception> onError;

        public static void LoadResource(string resourceName, Action<Stream> OnLoaded) {
            Stream resourceStream = System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream(resourceName);
            OnLoaded(resourceStream);
        }

		/// <summary>
		/// Loads from the specified URL.
		/// </summary>
		/// <param name="url">The URL.</param>
		/// <param name="onLoaded">The Action to invoke when loaded.</param>
		public static void Load( string url, Action<Stream> onLoaded )
		{
			Load( url, onLoaded, null );
		}

		/// <summary>
		/// Loads from the specified URL.
		/// </summary>
		/// <param name="url">The URL.</param>
		/// <param name="onLoaded">The Action to invoke when loaded.</param>
		/// <param name="onError">The Action to invoke on error.</param>
		public static void Load( string url, Action<Stream> onLoaded, Action<Exception> onError )
		{
			new AsyncLoader( onLoaded, onError ).Load( url );
		}

		/// <summary>
		/// Initializes a new instance of the <see cref="AsyncLoader"/> class.
		/// </summary>
		/// <param name="onLoaded">The on loaded.</param>
		/// <param name="onError">The on error.</param>
		protected AsyncLoader( Action<Stream> onLoaded, Action<Exception> onError )
		{
			this.onLoaded = onLoaded;
			this.onError = onError;
		}

		/// <summary>
		/// Loads from the specified URL.
		/// </summary>
		/// <param name="url">The URL.</param>
		public void Load( string url )
		{
			var wc = new WebClient();
			wc.OpenReadCompleted += OpenReadCompleted;
			wc.OpenReadAsync( new Uri( "../" + url, UriKind.Relative ) );
		}

		/// <summary>
		/// Opens the read completed.
		/// </summary>
		/// <param name="sender">The sender.</param>
		/// <param name="e">The <see cref="System.Net.OpenReadCompletedEventArgs"/> instance containing the event data.</param>
		private void OpenReadCompleted( object sender, OpenReadCompletedEventArgs e )
		{
			if ( e.Error != null )
			{
				if ( onError != null ) onError( e.Error );
			}
			else if ( onLoaded != null )
			{
				try
				{
					onLoaded( e.Result );
				}
				finally
				{
					if ( e.Result != null ) e.Result.Close();
				}
			}
		}
	}
}