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
