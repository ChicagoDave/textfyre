<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs"
    Inherits="Textfyre.Web.About" Title="Textfyre.Com - About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in" style="font-size: 11pt;">
                <table style="width: 100%; padding-left: 10px; padding-right: 10px; border-left: 1px black solid;
                    border-right: 1px black solid;">
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/images/tflogo.jpg" AlternateText="Textfyre" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            <h1>
                                TEXTFYRE was founded by David Cornelson,</h1>
                            and is the culmination of many years of planning and development. With the help of a few
                            hobbyist authors, players, and fans, we've started something special.<br /><br />
                            If you would like to contact us about anything:<br />
                            Phone: +1 1 630 803 4302<br />
                            Email: webadmin at textfyre dot com<br />
                            Regular Mail:<br />
                            Textfyre, Inc - 222, Suite A<br />
                            1144 East State Street<br />
                            Geneva, Illinois USA 60134<br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px black solid; padding-top: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/david.jpg" AlternateText="David Cornelson, Founder and President" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            DAVID CORNELSON is a computer consultant in Chicago, Illinois and has spent many
                            years involved in the hobbyist Interactive Fiction community. He's worked as a consultant
                            for many Fortune 500 corporations helping them build enterprise web and windows
                            applications. He is married with five children.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px black solid; padding-top: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/gentry.jpg" AlternateText="Michael Gentry, Miradania Designer and Writer" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            MICHAEL GENTRY is an award winning Interactive Fiction author with two major games,
                            Anchorhead and Little Blue Men. He lives on the east coast with his wife and children.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px black solid; padding-top: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/finley.jpg" AlternateText="Ian Finley, Klockwerk Designer" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            IAN FINLEY holds an MFA in Dramatic Writing from New York University, where he received
                            the prestigious Harry Kodoleon Award for playwriting. His plays include The Nature
                            of the Nautilus (winner of the Kennedy Center's Jean Kennedy Smith award), Green
                            Square, 1960, and the Oakwood cycle of plays. His interactive fiction includes the
                            award winning Babel, Exhibition, and Kaged.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px black solid; padding-top: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/images/ingold.jpg" AlternateText="Jon Ingold, Klockwerk Co-Designer and Writer" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            JON INGOLD is from Manchester, UK. His previous Interaction Fiction has won competitions
                            and awards, most notably All Roads (winner of the 2001 Interactive Fiction competition
                            and Best Game of the Year award, and published in the Electronic Literature Organisation's
                            first annual collection) and Dead Cities (on display in the Museum of Science Fiction
                            and Utopia in Switzerland in 2008).
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px black solid; padding-top: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/images/obrian.jpg" AlternateText="Paul O'Brian, Giant Leaps Designer" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            PAUL O'BRIAN is the only person ever to have won the Interactive Fiction Competition
                            twice, taking the top prize in 2002 and 2004 with games from his Earth And Sky series.
                            In addition to authoring games, he has written hundreds of reviews, all of which
                            are available <a id="aboutLink" href="http://spot.colorado.edu/~obrian/IF.htm">online</a>.
                            He lives in Westminster, Colorado with his wife and son, and was once a counselor
                            at the camp upon which Giant Leaps is based.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px black solid; padding-top: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 8px;">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/images/graeme.jpg" AlternateText="Graeme Jefferis, Inform 7 Programmer" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            GRAEME JEFFERIS lives in Edinburgh, Scotland. He is a BSc Hons. software engineer
                            who has worked for companies across the UK, and for CERN in Switzerland. He plays
                            clarinet, saxophone, and bass guitar, and his code is fuelled by hot tea, Irn Bru,
                            and biscuits. He's done 99% of the programming on all Textfyre games.
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
