<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Parents.aspx.cs"
    Inherits="Textfyre.Web.Parents" Title="Textfyre.Com for Parents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in" style="font-size: 12pt;">
                <table id="homeFeatures" width="100%">
                    <tr>
                        <td style="vertical-align: top; text-align: center;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/parents1.jpg" AlternateText="Parents and children reading on a computer." />
                            <br />
                            <br />
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/parents2.jpg" AlternateText="Father and children reading on a computer." />
                            <br />
                            <br />
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/tflogo.jpg" AlternateText="Textfyre.Com" />
                        </td>
                        <td style="padding: 5px 5px 5px 5px;vertical-align:top;border-left:solid 1px black;">
                            <p>
                                Dear Parents,</p>
                            <p>
                                My name is David Cornelson and I created Textfyre for you and your kids. I have
                                five children of my own and I know how hard it is to keep them entertained in today's
                                world. The battle over the television, the computer, the game console, the Nintendo
                                DS and Leapster games is non-stop. As parents we're always fretting over whether
                                allowing our kids access to these outlets is good for them.</p>
                            <p>
                                At Textfyre we take the approach that all of these outlets exist, aren't going away,
                                and the best we can do is offer alternatives. With that in mind, we started developing
                                computer games that we would want our children to play.</p>
                            <p>
                                Our games are a combination of a chapter book and a game. As the player, you get
                                to tell the main character what to do, using the keyboard and entering natural language
                                commands.
                            </p>
                            <p>
                                We hope you take the time to play the online demo of Jack Toresal and The Secret
                                Letter and the upcoming Shadow in the Cathedral.</p>
                            <p>
                                Please mention our products to your teachers and librarians so we can share the
                                fun of reading and solving story puzzles.
                            </p>
                            <p>
                                Sincerely,</p>
                            <p>
                                David A. Cornelson<br />
                                Founder and President</p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
