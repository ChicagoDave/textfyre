using System;
using System.Collections.Generic;
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
using Textfyre.VM;
using System.Xml.Linq;
using System.Xml;

namespace Cjc.SilverFyre
{
	public class StoryHistoryItem
	{
		private Paragraph[] paragraphs = null;
		private Paragraph[] death = null;

		public StoryHistoryItem( string input, OutputReadyEventArgs output )
		{
			this.Input = input;
			this.OutputArgs = output;
		}

		public bool HasInput { get { return Input != null; } }
		public bool HasOutput { get { return Paragraphs.Length > 0; } }
		public bool HasDeath { get { return Death.Length > 0; } }

		public string Input { get; private set; }
		public OutputReadyEventArgs OutputArgs { get; private set; }

		public Paragraph[] Paragraphs
		{
			get
			{
				if ( paragraphs == null ) paragraphs = GetParagraphs().ToArray();

				return paragraphs;
			}
		}

		private IEnumerable<Paragraph> GetParagraphs()
		{
			if ( OutputArgs != null )
			{
				if ( OutputArgs.Package.ContainsKey( OutputChannel.Prologue ) )
				{
					foreach ( var paragraph in GetParagraphs( OutputChannel.Prologue ) ) yield return paragraph;
				}

				if ( OutputArgs.Package.ContainsKey( OutputChannel.Main ) )
				{
					foreach ( var paragraph in GetParagraphs( OutputChannel.Main ) ) yield return paragraph;
				}
			}
		}

		private IEnumerable<Paragraph> GetParagraphs( OutputChannel channel )
		{
			if ( OutputArgs != null )
			{
				var xml = ParseContent( OutputArgs.Package[ channel ] );

				foreach ( var paragraph in xml.Elements( "Paragraph" ) )
				{
					yield return new Paragraph { Inlines = ExpandInlines( paragraph.Nodes() ).ToArray() };
				}
			}
		}

		public Paragraph[] Death
		{
			get
			{
				if ( death == null )
				{
					if ( OutputArgs != null && OutputArgs.Package.ContainsKey( OutputChannel.Death ) )
					{
						var xml = ParseContent( OutputArgs.Package[ OutputChannel.Death ] );

						death = new[] { new Paragraph { Inlines = ExpandInlines( xml.Nodes() ).ToArray() } };
					}
					else death = new Paragraph[ 0 ];
				}

				return death;
			}
		}

		private XElement ParseContent( string content )
		{
			try
			{

				return content.IsXml()
					? XElement.Parse( "<X>" + EnsureXml( content ) + "</X>" )
					: new XElement( "X", content );
			}
			catch
			{
				return new XElement( "X", content );
			}
		}

		public static string EnsureXml( string content )
		{
			// TODO - Remove temporary hacks!
			content = content.Replace( "</Paragraph></Paragraph>", "</Paragraph>" );
			if ( content.StartsWith( "<Paragraph>" ) && !content.EndsWith( "</Paragraph>" ) ) content += "</Paragraph>";

			return content;
		}

		private IEnumerable<Inline> ExpandInlines( IEnumerable<XNode> nodes )
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

		private Inline ApplyStyles( Inline inline, XElement element )
		{
			switch ( element.Name.LocalName )
			{
				case "Bold": inline.FontWeight = FontWeights.Bold; break;
				case "Italic": inline.FontStyle = FontStyles.Italic; break;
			}

			return inline;
		}
	}
}