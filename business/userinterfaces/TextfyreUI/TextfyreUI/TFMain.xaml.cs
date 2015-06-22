using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Threading;

namespace TextfyreUI {
    public partial class TFMain : Window {
        public TFMain() {
            InitializeComponent();
            BookTest1();
        }

        public void BookTest1() {
            book.UserCommandEvent += new EventHandler(book_UserCommandEvent);
            book.AddSection("<Paragraph>Now is the time for all good men to come to the aid of their country. Now is the time for all good men to come to the aid of their country. Now is the time for all good men to come to the aid of their country. Now is the time for all good men to come to the aid of their country. Now is the time for all good men to come to the aid of their country. Now is the time for all good men to come to the aid of their country. Now is the time for all good men to come to the aid of their country. </Paragraph>", "P1");
            book.SetPrompt();
        }

        private void book_UserCommandEvent(object sender, EventArgs e) {
            book.SetPrompt();
        }

    }
}
