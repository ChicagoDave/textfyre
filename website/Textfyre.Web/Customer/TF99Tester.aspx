<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TF99Tester.aspx.cs" Inherits="Textfyre.Web.Customer.TF99Tester" EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" action="TF99ReceiptData.aspx" method="post">
    <div>
        <input type="text" name="firstname" /><br />
        <input type="text" name="lastname" /><br />
        <input type="text" name="city" /><br />
        <input type="text" name="state" /><br />
        <input type="submit" name="postMe" value="Post Me!" />
    </div>
    </form>
</body>
</html>
