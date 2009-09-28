<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WCFTestWeb.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>        
        <h1>Utilizing WCF Service</h1>
        
        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="lblCountries" runat="server" Text="Country:"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="true" EnableViewState="false"></asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Label runat="server" ID="lblCities" Text="City:"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlCities" runat="server" Enabled="False" EnableViewState="False"></asp:DropDownList>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlCountries" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Button ID="btnDisplay" runat="server" OnClick="btnDisplay_Click" Text="Display" />   
        <asp:Label ID="lblDisplay" runat="server" Visible="false"></asp:Label>
    </div>    
    </form>
</body>
</html>
