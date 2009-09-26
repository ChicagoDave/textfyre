<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs"
    Inherits="Textfyre.Web.Teachers" Title="Textfyre.Com for Teachers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrap" class="clear">
        <div class="content">
            <div class="content-in" style="font-size: 12pt;">
                <table id="homeFeatures" width="100%">
                    <tr>
                        <td style="vertical-align: top; text-align: center;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/teacherkids.jpg" AlternateText="Teacher with students using a school computer." />
                            <br />
                            <br />
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/students.jpg" AlternateText="Students using a school computer." />
                            <br />
                            <br />
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/tflogo.jpg" 
                                AlternateText="Textfyre.Com" />
                        </td>
                        <td style="width: 100%; padding: 5px 5px 5px 5px;border-left:solid 1px black;">
                            <p>
                                Welcome to Textfyre.Com!
                            </p>
                            <p>
                                <b>Our Passion for Learning</b><br />
                                In 2006 we started developing the idea of sharing our hobby with middle school kids
                                because we believe there's a special place for it in schools and on home computers.
                                Interactive Fiction provides hours of reading practice as well as the opportunity
                                to improve cognitive thinking skills. It's also fun. In no other medium does the
                                reader get to tell the main character of a story what to do - in their own words.
                                This includes telling the player to get in trouble, escape from trouble, and stay
                                out of trouble. We write stories that teach kids about honesty and bravery, as well
                                as just making them think outside of the box.</p>
                            <p>
                                <b>Teacher Features</b><br />
                                We welcome your ideas about our current products and promise to incorporate as many
                                of your ideas into our products as possible. For instance, we can do really interesting
                                things with Interactive Fiction. We can offer a version of each game that requires
                                each student to login. Each time they interact with the game, their sentences are
                                stored in a database. As the teacher, you can pull up a report for each student,
                                to see how they've interacted with the story and how they've progressed. You can
                                see exactly who is reading at a higher level and who is struggling. We even track
                                how long it takes for the student to enter each command sentence, giving you information
                                on how easily they use the computer and potentially how quickly they read. And those
                                mischievous kids will think twice when you ask them why they're trying to kiss or
                                kick everything in the game!
                            </p>
                            <p>
                                <b>Play the Demo!</b><br />
                                When you play the demo of Secret Letter, try holding down the Ctrl key on your keyboard.
                                You'll see some of the words display in red. Each of these words has a built-in
                                pop-up definition. If you click a red word, a balloon displays the definition. It's
                                features like this that you'll never find in a regular book.
                            </p>
                            <p>
                                <b>* * * * SPECIAL OFFER * * * *</b><br />
                                Since we're just getting started, we have a special offer to all teachers and schools.
                                If you license any of our products, we'll donate 25% of the licensing fee to your
                                PTA or PTO each year. Call us at 630 803 4302 for more information.
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
