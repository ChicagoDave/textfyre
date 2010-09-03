using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Controls;

namespace Cjc.SilverFyre
{
	public class Paragraph
	{
		private ItemCollection parentCollection;
		private TextBlock textBlock;

		public ImageSource ImageSource { get; set; }
		public Stretch ImageStretch { get; set; }
		public IEnumerable<Inline> Inlines { get; set; }

		public TextBlock TextBlock
		{
			get
			{
				if ( textBlock == null && Inlines != null )
				{
					textBlock = new TextBlock();

					foreach ( var inline in Inlines ) textBlock.Inlines.Add( inline );
				}

				return textBlock;
			}
		}

		public void AddToCollection( ItemCollection collection )
		{
			if ( parentCollection != collection )
			{
				RemoveFromCollection();

				collection.Add( TextBlock );

				parentCollection = collection;
			}
		}

		public void RemoveFromCollection()
		{
			if ( parentCollection != null )
			{
				parentCollection.Remove( TextBlock );
				parentCollection = null;
			}
		}
	}
}