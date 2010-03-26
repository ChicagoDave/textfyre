<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CompletedSale.aspx.cs"
    Inherits="Textfyre.Web.CompletedSale" Title="Textfyre.Com - Completed Sale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in" style="font-size: 11pt;">
                <div style="padding: 0 10px 0 10px;">
                    <p>
                        Hey <asp:Label runat="server" ID="custname" />,<br />
                        <br />
                        Thank you for your purchase. We recommend that you <a href="https://www.textfyre.com/registration/register.aspx">register</a> with Textfyre.Com, giving
                        you access to downloads of the latest files and updates, as well as information on upcoming games. If you do register, please use the same e-mail address
                        as with your purchase (<asp:Label runat="server" ID="custemail" />).
                        <br />
                        <br />
                        Textfyre.Com
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<!-- Google Code for Buy Game Conversion Page -->
<script type="text/javascript">
<!--
var google_conversion_id = 1040288876;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "v6rnCOa2uQEQ7JiG8AM";
var google_conversion_value = 0;
if (9.95) {
  google_conversion_value = 9.95;
}
//-->
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1040288876/?value=9.95&amp;label=v6rnCOa2uQEQ7JiG8AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
