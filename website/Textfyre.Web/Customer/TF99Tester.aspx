<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TF99Tester.aspx.cs" Inherits="Textfyre.Web.Customer.TF99Tester" EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" action="TF99ReceiptData.aspx" method="post">
    <div>
        first name <input type="text" name="firstname" /><br />
        last name <input type="text" name="lastname" /><br />
        city <input type="text" name="city" /><br />
        state <input type="text" name="state" /><br />
        email <input type="text" name="payer_email" /><br />
        productid <input type="text" name="item_number1" /><br />
        <input type="submit" name="postMe" value="Post Me!" />
    </div>
    </form>
</body>
</html>
