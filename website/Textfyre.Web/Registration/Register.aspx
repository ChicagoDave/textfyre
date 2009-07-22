<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs"
    Inherits="Textfyre.Web.Registration.Register" Title="Textfyre.Com - Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script language="javascript" type="text/javascript">
        function GoHome() {
            window.location.href = '/Default.aspx';
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in">
                <table>
                    <tr>
                        <td width="60%" style="padding-left: 10px; padding-right: 10px; border-left: 1px black solid;
                            border-right: 1px black solid;">
                            <p>
                                Welcome to Textfyre.Com and thank you for registering. In order to complete the
                                registration process, we will need to gather a few pieces of information from you.
                                Be assured that none of your personal information will be shared or sold.</br>
                                <br />
                                <span style="font-weight: bold">If you are under 18 years old, please have a parent
                                    register for you.</span>
                            </p>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" CssClass="regLabel" Text="First Name:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regFirstName" CssClass="regTextbox" />
                                        <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="regFirstName"
                                            ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" CssClass="regLabel" Text="Last Name:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regLastName" CssClass="regTextbox" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" CssClass="regLabel" Text="City:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regCity" CssClass="regTextbox" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" CssClass="regLabel" Text="State:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regState" CssClass="regTextbox" Width="40px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" CssClass="regLabel" Text="School:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regSchool" CssClass="regTextbox" Width="300px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" CssClass="regLabel" Text="E-Mail Address:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regEmail" CssClass="regTextbox" Width="400px" />
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="regEmail"
                                            ErrorMessage="E-Mail Address is required." ToolTip="E-Mail Address is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" CssClass="regLabel" Text="User Name:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regUsername" CssClass="regTextbox" />
                                        <asp:RequiredFieldValidator ID="UsernameRequired" runat="server" ControlToValidate="regUsername"
                                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" CssClass="regLabel" Text="Password:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regPassword" CssClass="regTextbox" TextMode="Password" />
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="regPassword"
                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" CssClass="regLabel" Text="Confirm Password:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regPassword2" CssClass="regTextbox" TextMode="Password" />
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="regPassword2"
                                            ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server" ID="ConfirmPasswordsEqual" ControlToCompare="regPassword" ControlToValidate="regPassword2"
                                        ErrorMessage="Password and Confirm Password must match." ToolTip="Passwords must match." ValidationGroup="Login1">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" CssClass="regLabel" Text="Security Question:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regQuestion" CssClass="regTextbox" Width="400px" />
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="regQuestion"
                                            ErrorMessage="Security Question is required." ToolTip="Security Question is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" CssClass="regLabel" Text="Security Answer:" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="regAnswer" CssClass="regTextbox" Width="400px" />
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="regAnswer"
                                            ErrorMessage="Security Answer is required." ToolTip="Security Answer is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label runat="server" ID="regError" CssClass="regError" />
                                        <asp:ValidationSummary runat="server" ID="vSummary" DisplayMode="List" ShowSummary="false" ShowMessageBox="true" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="float: right;">
                                        <input type="button" id="regCancelButton" onclick="javascript:GoHome();" value="Cancel" />
                                        <asp:Button runat="server" ID="regRegisterButton" Text="OK" OnClick="regRegisterButton_Click" ValidationGroup="Login1" CausesValidation="true" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="40%" style="padding-left: 10px; padding-right: 10px; border-right: 1px black solid;">
                            <div style="text-align: center; font-weight: bold;">
                                TEXTFYRE REGISTRATION</div>
                            <p>
                                Now is the time for all good students to come to the aid of their teachers.</p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
