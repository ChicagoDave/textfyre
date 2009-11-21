<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Textfyre.Web.Customer.Default" Title="Textfyre.Com - Customer Page" %>
<%@ Register src="../controls/Downloads.ascx" tagname="Downloads" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Downloads ID="Downloads1" runat="server" />
</asp:Content>
