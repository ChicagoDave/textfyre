using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Documents;
using System.Windows.Media;

namespace Cjc.SilverFyre
{
	public class Paragraph
	{
		public ImageSource ImageSource { get; set; }
		public Stretch ImageStretch { get; set; }
		public IEnumerable<Inline> Inlines { get; set; }
	}
}
