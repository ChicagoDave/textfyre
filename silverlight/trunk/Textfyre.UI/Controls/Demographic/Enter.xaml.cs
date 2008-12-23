using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI.Controls.Demographic
{
    public partial class Enter : UserControl
    {
        public Enter()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Enter_Loaded);
        }

        void Enter_Loaded(object sender, RoutedEventArgs e)
        {
            if (Settings.LogEnabled == false)
            {
                this.Visibility = Visibility.Collapsed;
                return;
            }
            
            if (Current.User.IsStored)
            {
                Current.User.Load();

                if (Current.User.Gender == "M")
                    this.GndrMale.IsChecked = true;
                else
                    this.GndrFemale.IsChecked = true;

                TxtAge.Text = Current.User.Age.ToString();

                TxtCity.Text = Current.User.City;
                TxtState.Text = Current.User.State;
                TxtSchool.Text = Current.User.School;

            }

            TxtMessage.Visibility = Visibility.Collapsed;
        }

        private void BtnSubmit_Click(object sender, RoutedEventArgs e)
        {
            TxtMessage.Visibility = Visibility.Collapsed;

            bool missingFields = false;

            if (!this.GndrFemale.IsChecked.Value && !this.GndrMale.IsChecked.HasValue)
                missingFields = true;

            
            string ageTxt = this.TxtAge.Text.Trim();
            int age = 0;
            try
            {
                age = Int32.Parse(ageTxt);
            }
            catch
            {
                age = 0;
                missingFields = true;
            }

            string school = this.TxtSchool.Text.Trim();
            string city = this.TxtCity.Text.Trim();
            string state = this.TxtState.Text.Trim();

            if (ageTxt.Length == 0 || city.Length == 0 || state.Length == 0 || school.Length == 0)
                missingFields = true;


            if (missingFields)
            {
                TxtMessage.Text = "Please enter all fields.";
                TxtMessage.Visibility = Visibility.Visible;

            }
            else
            {
                TxtMessage.Visibility = Visibility.Collapsed;

                Current.User.Gender = this.GndrMale.IsChecked.Value ? "M" : "F";
                Current.User.Age = age;
                Current.User.School = TxtSchool.Text;
                Current.User.City = TxtCity.Text;
                Current.User.State = TxtState.Text;
                Current.User.Save();

                TxtMessage.Text = String.Empty;
                Current.Game.MaxPageIndex = 3;
                Current.Game.TextfyreBook.FlipForward();
            }

        }
    }
}
