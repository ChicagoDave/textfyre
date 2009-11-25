<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGame.Master" AutoEventWireup="true" CodeBehind="ShadowPlay.aspx.cs" Inherits="Textfyre.Web.Customer.ShadowPlay" %>
<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">
    	function OnLoaded()
    	{
    		window.focus();
    		document.getElementById("Xaml1").focus();
    	}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="height:650px;">
            <asp:Silverlight ID="Xaml1" runat="server" Source="~/ClientBin/Textfyre.Shadow.xap" MinimumVersion="3.0.40818.0" Width="100%" Height="100%" OnPluginLoaded="OnLoaded" />
    </div>
</asp:Content>
