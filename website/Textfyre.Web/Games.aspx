<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs"
    Inherits="Textfyre.Web.Games" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in" style="font-size: 11pt;">
                <table width="100%" style="border-left: 1px black solid; border-right: 1px black solid;">
                    <tr>
                        <td style="padding-left: 10px; padding-top: 8px;">
                            <div>
                                <asp:Image runat="server" AlternateText="Jack Toresal and The Secret Letter" ImageUrl="images/secret.jpg" /></div>
                            <div style="text-align: center; margin-top: 20px;">
                                <table>
                                    <tr>
                                        <td style="vertical-align: middle;">
                                            <a href="http://textfyre.com/sldemo/" style="text-decoration: underline;" target="_blank">
                                                Play a demo of the Deluxe version online!</a><br />
                                                <br />
                                            <a href="http://textfyre.com/demos/SecretLetter-1.07StdDemo.msi" style="text-decoration: underline;">
                                            Download a demo of the Standard version (Windows only).</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 6pt; vertical-align: bottom; padding-top: 20px;">
                                            Deluxe System Requirements: Microsoft Windows XP, Windows Vista, Windows 7, or an
                                            Intel based Mac with OS X. On Windows, 32MB RAM is required and on the Mac, 512MB
                                            RAM is required. Both systems require 15MB of free disk space. Microsoft Silverlight
                                            2 or 3 is required and is a part of the installation process.<br />
                                            <br />
                                            Standard System Requirements: Microsoft Windows XP, Windows Vista, or Windows 7
                                            with 16MB RAM and 10MB disk space. The Microsoft .NET Framework is required and
                                            is a part of the installation process.<br />
                                            <br />
                                            <b style="font-size:8pt; text-align: center;">Standard version of Secret Letter</b><br />
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/secretletter-std.jpg" AlternateText="Standard UI" Width="240" /><br/><br/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td style="vertical-align: top; padding-left: 10px; padding-right: 10px; padding-bottom: 15px; border-left-style: solid; border-left-width: 1px; border-left-color: #000000;">
                            <h1>
                                Textfyre&#39;s first commercial Interactive Fiction game</h1>
                            was released on June 26th, 2009. Set in the town of Toresal in the kingdom of Miradania,
                            Secret Letter is an adventure about a fourteen year old orphan that everyone knows
                            as &quot;Jack&quot;. Jack is pulled into a dangerous mystery when a handful of Baron
                            Fossville&#39;s mercenaries begin hunting him. From Grubber&#39;s Market through
                            Commerce Street, and onto Lord&#39;s Keep; Jack is faced with numerous challenges.
                            Teisha lends a hand along the way, as does Bobby, the mysterious boy always lurking
                            in Lord&#39;s Market. The ladies at Maiden House are helpful, but can sometimes
                            be a bit overbearing. The shopkeepers are always willing to chat about the latest
                            gossip. Jack, he just wants to sit down and eat an apple.<br />
                            <br />
                            The Deluxe version is a Microsoft Silverlight application that runs in a browser. It includes
                            a book-like user interface that allows you to turn pages, has artist renderings of all of the
                            characters in the game as well as a full color map and hints. The Standard version is included.<br />
                            <br />
                            The Standard version is a Microsoft .NET Windows application that displays a text window, similar
                            to the old Infocom style. There are no hints available in the Standard version.<br />
                            <br />
                            Both versions include an introduction, map, and end user license agreement.
                        </td>
                        <td style="padding-left: 5px; border-left: 1px black solid; font-size: 10pt; vertical-align: top;
                            width: 200px;">
                            Deluxe Version Price: $24.95<br />
                            <br />
                            Purchase the Deluxe Version via PayPal<br />
                            <a href="https://www.e-junkie.com/ecom/gb.php?i=280404&c=single&cl=74327">
                                <img src="http://www.e-junkie.com/ej/x-click-butcc.gif" alt="Buy Now" /></a>
                            <br />
                            <br />
                            Purchase the Deluxe Version via Google Checkout<br />
                            <a href="https://www.e-junkie.com/ecom/gb.php?i=280404&c=gc&cl=74327&ejc=4">
                                <img src="https://checkout.google.com/buttons/checkout.gif?merchant_id=612728723718733&w=160&h=43&style=trans&variant=text&loc=en_US"
                                    alt="Buy Now" /></a>
                            <br />
                            <br />
                            Standard Version Price: $9.95<br />
                            <br />
                            Purchase the Standard Version (Windows Only) via PayPal<br />
                            <a href="https://www.e-junkie.com/ecom/gb.php?i=secretletter-standard&c=single&cl=74327"
                                target="ejejcsingle">
                                <img src="http://www.e-junkie.com/ej/x-click-butcc.gif" alt="Buy Now" /></a>
                            <br />
                            <br />
                            Purchase the Standard Version (Windows Only) via Google Checkout<br />
                            <a href="https://www.e-junkie.com/ecom/gb.php?i=secretletter-standard&c=gc&cl=74327&ejc=4">
                                <img src="https://checkout.google.com/buttons/checkout.gif?merchant_id=612728723718733&w=160&h=43&style=trans&variant=text&loc=en_US"
                                    alt="Buy Now" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="background-color: silver; margin-top: 5px;">
                            <span style="font-size: 1pt;">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px; padding-top: 8px;">
                            <asp:Image runat="server" AlternateText="The Shadow in the Cathedral" ImageUrl="images/shadow.jpg" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px; padding-right: 10px; padding-bottom: 15px; border-left-style: solid; border-left-width: 1px; border-left-color: #000000;">
                            The Shadow in the Cathedral, Textfyre&#39;s second game, will be released on September
                            25th, 2009. The first episode in the Klockwerk Series; Shadow begins an adventure
                            in a world of clocks, gears and ornithopters. You are Wren, 2nd assistant clock-polisher.
                            It&#39;s not a very important job, but it offers a place to sleep and bread to eat.
                            You just wish you could someday make it to 1st assistant clock-polisher. Before
                            too long though you are faced with blasphemy and intrigue within the church. Who
                            was that shadowy figure talking to the Abbott? The mystery unravels in just a few
                            weeks.
                        </td>
                        <td style="padding-left: 5px; border-left: 1px black solid; font-size: 10pt; vertical-align: top;">
                            Available November 6th, 2009.</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="background-color: silver; margin-top: 5px;">
                            <span style="font-size: 1pt;">&nbsp;</span>
                        </td>
                    </tr>
                </table>
                <div style="clear: both">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
