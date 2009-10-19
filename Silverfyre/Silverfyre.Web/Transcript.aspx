<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transcript.aspx.cs" Inherits="SilverFyre.Web.Transcript" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>SilverFyre Transcript</title>
	<style>
		html, body { font-family: Arial, Sans Serif, Verdana; }
		h1 { color: darkblue; }
		h2 { color: darkred; }
		.prompt { color: blue; }
		.input { color: green; font-style: italic; }
		.death { color: red; }
	</style>
	<script type="text/javascript" language="javascript">
		function onLoad()
		{
			document.getElementById("email").focus();
		}
	</script>
</head>
<body onload="onLoad()">
	<form id="form1" runat="server" defaultbutton="send" enableviewstate="false">
	<div>
		Email address
		<asp:TextBox runat="server" ID="email" Width="400px" />
		<asp:Button runat="server" ID="send" OnClick="SendEmail" Text="Send transcript" />
	</div>
	<div id="sendResult" runat="server" />
	<hr />
	<div id="transcript" runat="server"/>
	</form>
</body>
</html>
