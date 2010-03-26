<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuBar.ascx.cs" Inherits="Textfyre.Web.controls.MenuBar" %>
<div id="menuBar">
    <span class="menuButton">
        <asp:PlaceHolder ID="menuHome" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="menuGames" runat="server"></asp:PlaceHolder>
        <!--<asp:PlaceHolder ID="menuParents" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="menuTeachers" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="menuLibrarians" runat="server"></asp:PlaceHolder>-->
        <asp:PlaceHolder ID="menuCustomers" runat="server" Visible="false"></asp:PlaceHolder>
        <asp:PlaceHolder ID="menuForums" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="menuAbout" runat="server"></asp:PlaceHolder>
    </span>
</div>
