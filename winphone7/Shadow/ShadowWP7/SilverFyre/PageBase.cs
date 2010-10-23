using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Xml;
using System.Xml.Linq;
using Textfyre.VM;

namespace Cjc.SilverFyre
{
	public abstract class PageBase : INotifyPropertyChanged
	{
		private OutputChannel channel;
		private Paragraph[] paragraphs;

		public StoryHistoryItem StoryHistoryItem { get; private set; }

		public StoryState State { get { return ( StoryHistoryItem != null ) ? StoryHistoryItem.State : null; } }
		public Paragraph[] Paragraphs { get { return ( paragraphs != null ) ? paragraphs : paragraphs = GetParagraphs( channel ); } }
		public virtual string Command { get { return ( StoryHistoryItem != null ) ? StoryHistoryItem.Command : null; } }
		public string CommandText { get; set; }
		public string Information { get; set; }

		public virtual bool HasInput { get { return false; } }
		public virtual bool HasCommand { get { return false; } }

		public PageBase( StoryHistoryItem storyHistoryItem )
		{
			this.StoryHistoryItem = storyHistoryItem;

			if ( storyHistoryItem != null )
			{
				storyHistoryItem.PropertyChanged += delegate( object sender, PropertyChangedEventArgs e )
				{
					if ( e.PropertyName == "Command" )
					{
						RaisePropertyChanged( "HasInput" );
						RaisePropertyChanged( "HasCommand" );
						RaisePropertyChanged( "Command" );
					}
				};
			}
		}

		public PageBase( StoryHistoryItem storyHistoryItem, OutputChannel channel )
			: this( storyHistoryItem )
		{
			this.channel = channel;
		}

		protected Paragraph[] GetParagraphs( OutputChannel channel )
		{
			return GetParagraphs( StoryHistoryItem.OutputArgs.Package[ channel ] ).ToArray();
		}

		protected IEnumerable<Paragraph> GetParagraphs( string content )
		{
			var xml = ParseContent( content );

			foreach ( var paragraph in xml.Elements( "Paragraph" ) )
			{
				var inlines = new List<Inline>();

				foreach ( var inline in ExpandInlines( paragraph.Nodes() ) )
				{
					if ( inline is LineBreak )
					{
						yield return new Paragraph { Inlines = inlines.ToArray() };
						inlines.Clear();
					}
					else inlines.Add( inline );
				}

				yield return new Paragraph { Inlines = inlines.ToArray() };
			}
		}

		protected XElement ParseContent( string content )
		{
			try
			{

				return content.IsXml()
					? XElement.Parse( "<X>" + EnsureXml( content ) + "</X>" )
					: new XElement( "X", new XElement( "Paragraph",
						content.Split( '\n' ).Select( c => new[] { new XElement( "R", c ), new XElement( "LineBreak" ) } ) ) );
			}
			catch
			{
				return new XElement( "X", content );
			}
		}

		protected static string EnsureXml( string content )
		{
			// TODO - Remove temporary hacks!
			content = content.Replace( "</Paragraph></Paragraph>", "</Paragraph>" );
			if ( content.StartsWith( "<Paragraph>" ) && !content.EndsWith( "</Paragraph>" ) ) content += "</Paragraph>";

			return content;
		}

		protected IEnumerable<Inline> ExpandInlines( IEnumerable<XNode> nodes )
		{
			foreach ( var node in nodes )
			{
				switch ( node.NodeType )
				{
					case XmlNodeType.Text:
						{
							var textNode = (XText)node;

							yield return new Run
							{
								Text = textNode.Value//.Trim()
							};

							break;
						}

					case XmlNodeType.Element:
						{
							var element = node as XElement;

							if ( element.Name.LocalName == "LineBreak" )
							{
								yield return new LineBreak();
							}
							else
							{
								foreach ( var child in ExpandInlines( ( (XElement)node ).Nodes() ) )
								{
									yield return ApplyStyles( child, node as XElement );
								}
							}

							break;
						}
				}
			}
		}

		protected Inline ApplyStyles( Inline inline, XElement element )
		{
			switch ( element.Name.LocalName )
			{
				case "Bold": inline.FontWeight = FontWeights.Bold; break;
				case "Italic": inline.FontStyle = FontStyles.Italic; break;
			}

			return inline;
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