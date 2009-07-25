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
                                        <td>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/slbook.png" AlternateText="Jack Toresal and The Secret Letter Online Demo" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <a href="http://textfyre.com/sldemo/" style="text-decoration: underline;" target="_blank">
                                                Play the online demo!</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td style="vertical-align: top; padding-left: 10px; padding-right: 10px; padding-bottom: 15px;">
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
                            gossip. Jack, he just wants to sit down and eat an apple.
                        </td>
                        <td style="padding-left: 5px; border-left: 1px black solid; font-size: 10pt; vertical-align: top;
                            width: 200px;">
                            Price: $24.95<br />
                            <br />
                            Purchase via PayPal<br />
                            <a href="https://www.e-junkie.com/ecom/gb.php?i=280404&c=single&cl=74327">
                                <img src="http://www.e-junkie.com/ej/x-click-butcc.gif" border="0" alt="Buy Now" /></a>
                            <br />
                            <br />
                            Purchase via Google Checkout</b><br />
                            <a href="https://www.e-junkie.com/ecom/gb.php?i=280404&c=gc&cl=74327&ejc=4">
                                <img src="https://checkout.google.com/buttons/checkout.gif?merchant_id=612728723718733&w=160&h=43&style=trans&variant=text&loc=en_US"
                                    border="0" alt="Buy Now" /></a>
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
                        <td style="vertical-align: top; padding-left: 10px; padding-right: 10px; padding-bottom: 15px;">
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
                            Available September 25th, 2009.
                        </td>
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
