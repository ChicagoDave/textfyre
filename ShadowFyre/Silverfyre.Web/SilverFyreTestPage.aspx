<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%; overflow: hidden;">
<head runat="server">
    <title>SilverFyre</title>
    <script type="text/javascript" language="javascript">
    	function OnLoaded()
    	{
    		window.focus();
    		document.getElementById("Xaml1").focus();
    	}
    </script>
</head>
<body style="height:100%;margin:0;">
    <form id="form1" runat="server" style="height:100%;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div  style="height:100%;">
            <asp:Silverlight ID="Xaml1" runat="server" Source="~/ClientBin/Textfyre.ShadowFyre.xap" MinimumVersion="3.0.40818.0" Width="100%" Height="100%" OnPluginLoaded="OnLoaded" />
        </div>
    </form>
</body>
</html>