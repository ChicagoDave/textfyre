<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="Textfyre.Web.Default" Title="Textfyre.Com - Where Your Mind is the Game Console" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in">
                <table>
                    <tr style="vertical-align: top;">
                        <td style="border-left: 1px black solid; border-right: 1px black solid;">
                            <table id="homeFeatures" style="float: right;">
                                <tr>
                                    <td style="font-size: 12pt;">
                                        <h1 style="padding: 0 10px 0 10px;">
                                            Jack Toresal and The Secret Letter is Available</h1>
                                        <p style="margin: 0 10px 0 10px;">
                                            Textfyre&#39;s first commercial Interactive Fiction game was released on June 26th,
                                            2009. Set in the town of Toresal in the kingdom of Miradania, Secret Letter is an
                                            adventure about a fourteen year old orphan that everyone knows as &quot;Jack&quot;.
                                            Jack is pulled into a dangerous mystery when a handful of Baron Fossville&#39;s
                                            mercenaries begin hunting him. From Grubber&#39;s Market through Commerce Street,
                                            and onto Lord&#39;s Keep; Jack is faced with numerous challenges
                                            <asp:HyperLink runat="server" CssClass="articleLink" NavigateUrl="~/Games.aspx" Text=" ...more" /></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 12pt; padding-top: 10px;">
                                        <span style="font-weight: bold; padding: 0 10px 0 10px;">Upcoming Games</span>
                                        <p style="margin: 0 10px 0 10px;">
                                            Two more Interactive Fiction games are nearing completion, including the first story
                                            in the Klockwerk series. <i>The Shadow in the Cathedral</i>, due November 6th (delayed
                                            mostly due to the IF Competition), begins a tale in an Edwardian world where everyone
                                            worships clocks. A young neophyte within the church is our hero and will be faced
                                            with many challenges.
                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="articleLink" NavigateUrl="~/Games.aspx"
                                                Text=" ...more" /></p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="vertical-align: top; background-color: #FFF; padding: 5px; border-right: 1px black solid;
                            width: 400px;">
                            <div style="font-weight: bold; text-align: center; width: 400px; text-align: center;">
                                The Textfyre Book</div>
                            <div>
                                <p style="font-size: 12pt; padding-left: 10px; padding-right: 10px;">
                                    <asp:Image runat="server" ImageUrl="~/images/secret-prologue.png" AlternateText="Textfyre's User Interface" />
                                    Textfyre spent eighteen months developing the book interface used in our Interactive
                                    Fiction games. With the help of <a class="articleLink" href="http://willcapellaro.com/index.html">
                                        Will Capellaro</a>'s design (freelance art director) and Thomas Lynge's (Tenteo.Com)
                                    <a class="articleLink" href="http://www.silverlight.net">Silverlight</a> programming
                                    skills, we were able to create a user experience that immerses the game player into
                                    the story, much like a book.</p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- end .content-in -->
        </div>
        <!-- end .content -->
    </div>
    <!-- end #content-wrap -->
</asp:Content>
