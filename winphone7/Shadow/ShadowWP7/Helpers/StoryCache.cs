using System;
using System.Collections.Generic;
using System.IO;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Net;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Xml.Linq;
using Cjc.SilverFyre;
using ShadowWP7.SavedGames;
using FyreVM;

namespace ShadowWP7.Helpers
{
	public class StoryCache
	{
		private SavedGameSlot savedGameSlot;
		private IsolatedStorageFile storageFile;

		private Dictionary<int, PageBase> pageCache = new Dictionary<int, PageBase>();
		private List<int> pageCacheIndexes = new List<int>();

		public int SelectedTurn { get; private set; }
		public StoryHistoryItem SelectedHistoryItem { get; private set; }
		public StoryHistoryItem CurrentHistoryItem { get; private set; }

		public CreditsPage CreditsPage { get; private set; }

		public StoryCache( SavedGameSlot savedGameSlot, IsolatedStorageFile storageFile )
		{
			this.savedGameSlot = savedGameSlot;
			this.storageFile = storageFile;
			this.SelectedTurn = ( savedGameSlot.Game != null ) ? savedGameSlot.Game.Turn : 1;
		}

		public PageBase GetPage( int index, out int outsideBounds )
		{
			outsideBounds = 0;

			lock ( pageCache )
			{
				if ( savedGameSlot.Game == null ) return null;
				if ( pageCache.ContainsKey( index ) ) return pageCache[ index ];

				var minPage = pageCache.Keys.Cast<int?>().Min() ?? 0;
				var maxPage = pageCache.Keys.Cast<int?>().Max() ?? 0;

				var scanStep = ( CurrentHistoryItem == null )
					? 0
					: ( index < minPage ) ? -1 : ( index > maxPage ) ? 1 : (int?)null;

				var turn = SelectedTurn;

				while ( scanStep.HasValue )
				{
					var nextHistoryItem = LoadHistoryItem( scanStep != 0 ? turn + scanStep.Value : (int?)null );

					if ( nextHistoryItem != null )
					{
						var pages = LoadPages( nextHistoryItem ).ToArray();
						var pageIndex = 1;

						if ( CurrentHistoryItem != null )
						{
							if ( scanStep < 0 )
							{
								pageIndex = ( minPage -= pages.Length );
							}
							else if ( scanStep > 0 )
							{
								pageIndex = maxPage + 1;
								maxPage += pages.Length;
							}
						}

						pageCache.Clear();

						foreach ( var p in pages ) pageCache[ pageIndex++ ] = p;

						SelectedHistoryItem = nextHistoryItem;
						if ( CurrentHistoryItem == null ) CurrentHistoryItem = nextHistoryItem;

						if ( scanStep.HasValue ) turn += scanStep.Value;

						if ( pageCache.ContainsKey( index ) )
						{
							SelectedTurn = turn;

							return pageCache[ index ];
						}
					}
					else
					{
						outsideBounds = ( scanStep.Value < 0 )
							? index - minPage
							: index - maxPage;

						break;
					}
				}
			}

			return null;
		}

		public void SaveProgress( string lastCommand, StoryHistoryItem historyItem )
		{
			if ( savedGameSlot.Game == null ) savedGameSlot.Game = new SavedGameSummary( "Loading...", "0", "0" );

			var state = historyItem.State;

			savedGameSlot.SaveProgress( storageFile, lastCommand, state.Location, state.Time, state.Score, historyItem );

			lock ( pageCache )
			{
				var pageIndex = ( pageCache.Keys.Cast<int?>().Max() ?? 0 ) + 1;

				pageCache.Clear();

				foreach ( var p in LoadPages( historyItem ) ) pageCache[ pageIndex++ ] = p;
			}

			CurrentHistoryItem = SelectedHistoryItem = historyItem;
			SelectedTurn = savedGameSlot.Game.Turn;
		}

		public int? LastPage
		{
			get { lock ( pageCache ) return pageCache.Keys.Cast<int?>().Max(); }
		}

		public void DeleteProgress()
		{
			savedGameSlot.DeleteProgress( storageFile );
		}

		private StoryHistoryItem LoadHistoryItem( int? turn = null )
		{
			using ( var loadStream = savedGameSlot.LoadProgress( storageFile, turn ) )
			{
				return ( loadStream != null )
					? StoryHistoryItem.FromXml( XElement.Load( loadStream ) )
					: null;
			}
		}

		private PageBase[] LoadPages( int? turn )
		{
			SelectedHistoryItem = LoadHistoryItem( turn );

			return LoadPages( SelectedHistoryItem ).ToArray();
		}

		private IEnumerable<PageBase> LoadPages( StoryHistoryItem item )
		{
			if ( item.OutputArgs != null )
			{
				if ( item.OutputArgs.Package.ContainsKey( Channels.PROLOGUE ) ) yield return new ProloguePage( item );
				if ( item.OutputArgs.Package.ContainsKey( Channels.CREDITS ) ) CreditsPage = new CreditsPage( item );
				if ( item.OutputArgs.Package.ContainsKey( Channels.DEATH ) ) yield return new DeathPage( item );
				if ( item.OutputArgs.Package.ContainsKey( Channels.MAIN ) ) yield return new StoryPage( item );
			}
		}
	}
}