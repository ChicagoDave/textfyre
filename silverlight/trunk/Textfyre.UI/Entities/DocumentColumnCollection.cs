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
using System.Collections.Generic;

namespace Textfyre.UI.Entities
{
    public class DocumentColumnCollection
    {
        private List<Entities.DocumentColumn> _columns = new List<DocumentColumn>();
        private int _activeColumnIndex = -1;

        public void Add(Entities.DocumentColumn docColumn)
        {
            if (_activeColumnIndex == -1)
                _activeColumnIndex = 0;

            _columns.Add(docColumn);
        }

        public Entities.DocumentColumn ActiveDocumentColumn
        {
            get
            {
                if (_activeColumnIndex > _columns.Count)
                    return null;

                return _columns[_activeColumnIndex];
            }
        }

        public bool IsActiveColumnLastColumn
        {
            get
            {
                return !(_activeColumnIndex < (_columns.Count - 1));
            }
        }

        public void NextColumn()
        {
            if (IsActiveColumnLastColumn == false)
            {
                _activeColumnIndex++;
            }
        }

        public int Count
        {
            get
            {
                return _columns.Count;
            }
        }
    }
}
