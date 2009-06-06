using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Xml;
using System.Windows.Forms;
using System.IO;

namespace FyreWords {
    public partial class MainForm : Form {

        private string _fileName;
        private Dictionary<string,WordDefinition> _defList;
        private char[] _delimiters = new char[] { '\r', '\n' };
        public MainForm() {
            InitializeComponent();
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e) {
            openFileDialog1.Filter = "FyreWord Files (WordDefinition.xml)|WordDefinition.xml";
            DialogResult result = openFileDialog1.ShowDialog();

            if (result == DialogResult.OK) {
                FileInfo fileInfo = new FileInfo(openFileDialog1.FileName);
                if (!fileInfo.Exists) {
                    DialogResult newfile = MessageBox.Show("Do you want to create a new WordDefinition.xml file?", "New File", MessageBoxButtons.OKCancel);
                    if (newfile == DialogResult.OK) {
                        saveFileDialog1.FileName = "WordDefinition.xml";
                        DialogResult savefile = saveFileDialog1.ShowDialog();
                        if (savefile == DialogResult.OK) {
                            _fileName = saveFileDialog1.FileName;
                        }
                    }
                } else
                    _fileName = openFileDialog1.FileName;
            }

            LoadFromFile();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e) {
            Close();
        }

        private void LoadFromFile() {
            FileInfo file = new FileInfo(_fileName);

            _defList = new Dictionary<string,WordDefinition>();
            PrimaryWords.Items.Clear();
            WordList.Clear();
            Definition.Clear();

            if (!file.Exists)
                return;

            XmlDocument doc = new XmlDocument();
            doc.Load(_fileName);

            XmlNodeList defs = doc.SelectNodes("//WordDefs/WordDef");

            foreach (XmlNode def in defs) {
                XmlNodeList wordList = def.SelectNodes("Words/Word");
                WordDefinition newWord = new WordDefinition();
                newWord.PrimaryWord = wordList[0].InnerText;
                newWord.Definition = def.SelectSingleNode("Description").InnerText;
                foreach (XmlNode word in wordList) {
                    newWord.WordList.Add(word.InnerText);
                }
                _defList.Add(newWord.PrimaryWord, newWord);
            }

            foreach (WordDefinition wordDef in _defList.Values) {
                PrimaryWords.Items.Add(wordDef.PrimaryWord);
            }

            doc = null;
        }

        private void SaveToFile() {

            XmlDocument newdoc = new XmlDocument();
            XmlNode nsNode = newdoc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
            nsNode.InnerText = nsNode.InnerText + " encoding=\"utf-8\" ";
            newdoc.AppendChild(nsNode);
            XmlNode wordDefs = newdoc.CreateNode(XmlNodeType.Element, "WordDefs", "");
            newdoc.AppendChild(wordDefs);
            foreach (WordDefinition wordDef in _defList.Values) {
                XmlNode newWordDef = newdoc.CreateNode(XmlNodeType.Element, "WordDef", "");
                wordDefs.AppendChild(newWordDef);
                XmlNode newWords = newdoc.CreateNode(XmlNodeType.Element, "Words", "");
                newWordDef.AppendChild(newWords);
                foreach (string word in wordDef.WordList) {
                    XmlNode newWord = newdoc.CreateNode(XmlNodeType.Element, "Word", "");
                    newWord.InnerText = word;
                    newWords.AppendChild(newWord);
                }
                XmlNode newDefinition = newdoc.CreateNode(XmlNodeType.Element, "Description", "");
                newDefinition.InnerText = wordDef.Definition;
                newWordDef.AppendChild(newDefinition);
            }
            newdoc.Save(_fileName);
        }

        private void CloseButton_Click(object sender, EventArgs e) {
            Close();
        }

        private void PrimaryWords_SelectedIndexChanged(object sender, EventArgs e) {

            WordList.Clear();
            Definition.Clear();

            string primaryWord = (string)PrimaryWords.SelectedItem;
            WordDefinition selectedDef = _defList[primaryWord];

            Definition.Text = selectedDef.Definition;

            string words = "";
            foreach (string word in selectedDef.WordList) {
                words = words + word + "\r\n";
            }
            WordList.Text = words;
        }

        private void WordList_Leave(object sender, EventArgs e) {
            string primaryWord = (string)PrimaryWords.SelectedItem;
            WordDefinition selectedDef = _defList[primaryWord];

            string[] words = WordList.Text.Split(_delimiters);

            selectedDef.WordList.Clear();

            foreach (string word in words) {
                if (word.Trim() != "")
                    selectedDef.WordList.Add(word);
            }

            SaveToFile();

        }

        private void Definition_Leave(object sender, EventArgs e) {
            string primaryWord = (string)PrimaryWords.SelectedItem;
            WordDefinition selectedDef = _defList[primaryWord];
            selectedDef.Definition = Definition.Text;

            SaveToFile();
        }

        private void NewWord_Click(object sender, EventArgs e) {
            string newWord = Microsoft.VisualBasic.Interaction.InputBox("New Word", "Add a new word definition","",10,10);

            WordDefinition newWordDef = new WordDefinition();
            newWordDef.Definition = "";
            newWordDef.PrimaryWord = newWord;
            newWordDef.WordList.Add(newWord);
            _defList.Add(newWord, newWordDef);

            SaveToFile();
            LoadFromFile();

            PrimaryWords.SelectedIndex = PrimaryWords.Items.Count - 1;
        }

    }
}
