using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI.DocSystem
{
    public class SectionTextBlockProxy
    {
        SectionTextBlock _txtBlk = new SectionTextBlock();
        SectionTextBlock _txtBlkScroll = new SectionTextBlock();

        public Grid HostGrid
        {
            get
            {
                return _txtBlk.HostGrid;
            }
        }

        public Grid HostGridScroll
        {
            get
            {
                return _txtBlkScroll.HostGrid;
            }
        }


        public bool IsEmpty
        {
            get
            {
                return _txtBlk.IsEmpty;
            }
        }

        public string Text
        {
            get
            {
                return _txtBlk.Text;
            }
        }

        public double Height
        {
            get
            {
                return _txtBlk.Height;
            }
        }

        public void Center()
        {
            _txtBlkScroll.Center();
            _txtBlk.Center();
        }

        public StackPanels AddImage(Image img, double maxWidthForText)
        {
            StackPanels sps = new StackPanels();
            sps.StackPanelScroll = _txtBlkScroll.AddImage(img, maxWidthForText);
            sps.StackPanel = _txtBlk.AddImage(img, maxWidthForText);

            return sps;
        }

        public StackPanels AddArt(ArtRegister artRegister, double maxWidthForText)
        {
            StackPanels sps = new StackPanels();
            sps.StackPanelScroll = _txtBlkScroll.AddArt(artRegister, maxWidthForText);
            sps.StackPanel = _txtBlk.AddArt(artRegister, maxWidthForText);

            return sps;
        }

        #region :: AddText ::
        public string AddText(string text, TextFormat tf, double maxWidthForText, StackPanels sps)
        {
            StackPanel spScroll = null;
            StackPanel sp = null;

            if( sps != null )
            {
                spScroll = sps.StackPanelScroll;
                sp = sps.StackPanel;
            }

            _txtBlkScroll.AddText(text, tf, maxWidthForText, spScroll);
            return _txtBlk.AddText(text, tf, maxWidthForText, sp);
        }
        
        //public string AddText(string text, TextFormat tf, double maxWidthForText)
        //{
        //    _txtBlkScroll.AddText(text, tf, maxWidthForText,null);
        //    return _txtBlk.AddText(text, tf, maxWidthForText,null);
        //}
        #endregion

        public bool IsWordDefMode
        {
            get
            {   // _txtBlkScroll
                return _txtBlk.IsWordDefMode;
            }
            set
            {
                _txtBlkScroll.IsWordDefMode = value;
                _txtBlk.IsWordDefMode = value;
            }
        }

        public string WordDefID
        {
            get
            {
                return _txtBlk.WordDefID;
            }
            set
            {
                _txtBlkScroll.WordDefID = value;
                _txtBlk.WordDefID = value;
            }
        }

        public void ShowWordDefs()
        {
            _txtBlkScroll.ShowWordDefs();
            _txtBlk.ShowWordDefs();
        }

        public void HideWordDefs()
        {
            _txtBlkScroll.HideWordDefs();
            _txtBlk.HideWordDefs();
        }


        #region :: StackPanels Class ::
        public class StackPanels
        {
            public StackPanel StackPanel;
            public StackPanel StackPanelScroll;
        }
        #endregion
    }
}
