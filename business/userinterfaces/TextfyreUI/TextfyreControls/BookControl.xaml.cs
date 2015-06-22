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
using System.Xml;
using System.Windows.Markup;
using System.IO;
using System.Threading;
using System.Windows.Threading;

namespace TextfyreControls {
    /// <summary>
    /// Interaction logic for BookControl.xaml
    /// </summary>
    public partial class BookControl : FlowDocument {

        public BookControl() {
            InitializeComponent();
        }

        public event EventHandler UserCommandEvent;

        static BookControl() {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(BookControl), new FrameworkPropertyMetadata(typeof(BookControl)));
        }

        //public static class FocusHelper {
        //    private delegate void MethodInvoker();

        //    public static void Focus(UIElement element) {
        //        //Focus in a callback to run on another thread, ensuring the main UI thread is initialized by the
        //        //time focus is set
        //        ThreadPool.QueueUserWorkItem(delegate(Object foo) {
        //            UIElement elem = (UIElement)foo;
        //            elem.Dispatcher.Invoke(System.Windows.Threading.DispatcherPriority.Normal,
        //                (MethodInvoker)delegate() {
        //                elem.Focus();
        //                Keyboard.Focus(elem);
        //            });
        //        }, element);
        //    }
        //}

        public void AddSection(string section, string sectionName) {
            this.Blocks.Add(StringToSection(section, sectionName));
        }

        public void SetPrompt() {

            WrapPanel uiPanel = new WrapPanel();

            Thickness th = new Thickness(0);

            uiPanel.Margin = th;

            Label promptLabel = new Label();
            promptLabel.Content = ">";
            promptLabel.HorizontalContentAlignment = HorizontalAlignment.Left;
            promptLabel.HorizontalAlignment = HorizontalAlignment.Left;
            promptLabel.VerticalAlignment = VerticalAlignment.Top;
            promptLabel.FontFamily = new FontFamily("Georgia");
            promptLabel.FontWeight = FontWeights.Bold;
            promptLabel.BorderThickness = th;
            promptLabel.Padding = th;
            uiPanel.Children.Add(promptLabel);

            m_textBox = new TextBox();
            m_textBox.FontFamily = new FontFamily("Georgia");
            m_textBox.FontWeight = FontWeights.Bold;
            m_textBox.Background = Brushes.Transparent;
            m_textBox.BorderThickness = th;
            m_textBox.VerticalAlignment = VerticalAlignment.Center;
            m_textBox.Padding = th;
            m_textBox.Focusable = true;

            m_textBox.KeyDown += new KeyEventHandler(gameInput_KeyDown);

            uiPanel.Children.Add(m_textBox);

            BlockUIContainer uiContainer = new BlockUIContainer(uiPanel);
            uiContainer.BorderThickness = th;
            uiContainer.Margin = th;

            m_gameInput = new Section(uiContainer);
            m_gameInput.BorderThickness = th;
            m_gameInput.Name = "XYZZY";

            this.Blocks.Add(m_gameInput);
            FocusHelper.Focus(m_textBox);
        }

        public static class FocusHelper {
            public static void Focus(UIElement element) {
                if (!element.Focus()) {
                    element.Dispatcher.BeginInvoke(DispatcherPriority.Input, new ThreadStart(delegate() {
                            element.Focus();
                        }));
                }
            }
        }


        public TextBox GameInputControl {
            get {
                return m_textBox;
            }
            set {
                m_textBox = value;
            }
        }

        private void gameInput_KeyDown(object sender, KeyEventArgs e) {

            // we only care when Enter is pressed, because then we're sending the text back to the main program.
            if (e.Key == Key.Enter) {
                TextBox gameBox = (TextBox)sender;
                string command = gameBox.Text;

                // remove textbox and replace with new static section reflecting entered command.
                this.Blocks.Remove(m_gameInput);

                Paragraph paragraph = new Paragraph();
                paragraph.FontFamily = new FontFamily("Georgia");
                paragraph.FontWeight = FontWeights.Bold;
                paragraph.ContentStart.InsertTextInRun(String.Concat("> ", command));

                Section commandSection = new Section(paragraph);

                commandSection.BorderThickness = new Thickness(0);
                this.Blocks.Add(commandSection);

                if (UserCommandEvent != null)
                    UserCommandEvent(command, null);
            }
        }

        private Section StringToSection(string section, string sectionName) {
            StringReader stringReader = new StringReader(String.Concat(SectionStart.Replace("@NAME", sectionName), section, SectionEnd));
            XmlTextReader xmlReader = new XmlTextReader(stringReader);
            return (Section)XamlReader.Load(xmlReader);
        }

        private const string SectionStart = "<Section Name=\"@NAME\" xmlns=\"http://schemas.microsoft.com/winfx/2006/xaml/presentation\" xmlns:x=\"http://schemas.microsoft.com/winfx/2006/xaml\">";
        private const string SectionEnd = "</Section>";

        private Section m_gameInput;
        private TextBox m_textBox;

    }
}
