using System;
using System.Web.UI.WebControls;
using System.ServiceModel;
using Textfyre.Common.Contracts;
using System.Collections.Generic;

namespace WCFTestWeb {
    public partial class Default : System.Web.UI.Page {

        protected void Page_Load(object sender, EventArgs e) {
            PopulateCountries();

            string country = Request.Form[ddlCountries.UniqueID];
            UpdateSelection(ddlCountries, country);
            if (ddlCountries.SelectedIndex != 0) {
                PopulateCities(country);

                string city = Request.Form[ddlCities.UniqueID];
                UpdateSelection(ddlCities, city);
            } else {
                ddlCities.Items.Insert(0, new ListItem("Select a city...", String.Empty));
            }
        }

        private void UpdateSelection(DropDownList ddl, string text) {
            if(!String.IsNullOrEmpty(text)) {
                foreach(ListItem item in ddl.Items) {                    
                    if(item.Text == text) {
                        item.Selected = true;
                        break;
                    }
                }
            }

            if ((ddl.SelectedIndex == 0) && (ddl.Items.Count == 2)) {
                ddl.Items[0].Selected = false;
                ddl.Items[1].Selected = true;
            }
        }

        private void PopulateCountries() {            
            EndpointAddress epa = new EndpointAddress(@"http://localhost:3743/TimeZoneService.svc");
            ITimeZoneService proxy = ChannelFactory<ITimeZoneService>.CreateChannel(new BasicHttpBinding(), epa);
            List<string> countries = proxy.GetCountries();            

            ddlCountries.DataSource = countries;
            ddlCountries.DataBind();
            ddlCountries.Items.Insert(0, new ListItem("Select a country...", String.Empty));
        }

        private void PopulateCities(string country) {
            EndpointAddress epa = new EndpointAddress(@"http://localhost:3743/TimeZoneService.svc");
            ITimeZoneService proxy = ChannelFactory<ITimeZoneService>.CreateChannel(new BasicHttpBinding(), epa);
            Dictionary<string, int> cities = proxy.GetCities(country);

            ddlCities.Enabled = true;
            ddlCities.DataSource = cities;
            ddlCities.DataTextField = "Key";
            ddlCities.DataValueField = "Value";
            ddlCities.DataBind();            
            ddlCities.Items.Insert(0, "Select a city...");
        }

        protected void btnDisplay_Click(object sender, EventArgs e) {
            if ((ddlCountries.SelectedIndex != 0) && (ddlCities.SelectedIndex != 0)) {
                lblDisplay.Visible = true;
                lblDisplay.Text = ddlCountries.SelectedItem.Text + "::" + ddlCities.SelectedItem.Text;
            } else {
                lblDisplay.Visible = false;
            }
        }
    }
}
