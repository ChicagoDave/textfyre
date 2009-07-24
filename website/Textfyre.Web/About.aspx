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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/david.jpg" AlternateText="David Cornelson, Founder and President" />
                        </td>
                        <td style="vertical-align: top; padding-left: 10px;">
                            Founded in 2007 by David Cornelson, Textfyre is the culmination of many years of
                            passionate computer consulting work and involvement in the hobbyist Interactive
                            Fiction community. David has been in the computer industry since 1985 and worked
                            as a consultant for many Fortune 500 corporations. He currently lives in Illinois
                            with his wife and five children.
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
                            Michael Gentry is an awared winning Interactive Fiction author with his two major games,
                            Anchorhead and Little Blue Men. He lives on the east coast.
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
                            Jon Ingold is from Manchester, UK. His previous Interaction Fiction has won competitions
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
                            Paul O'Brian is the only person ever to have won the Interactive Fiction Competition
                            twice, taking the top prize in 2002 and 2004 with games from his Earth And Sky series.
                            In addition to authoring games, he has written hundreds of reviews, all of which
                            are available <a id="aboutLink" href="http://spot.colorado.edu/~obrian/IF.htm">online</a>.
                            He lives in Westminster, Colorado with his wife and son, and was once a counselor
                            at the camp upon which Giant Leaps is based.
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
