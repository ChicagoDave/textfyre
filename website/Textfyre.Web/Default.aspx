<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="Textfyre.Web.Default" Title="Textfyre.Com - Where Your Mind is the Game Console" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
            <div class="col-left">
                <h1>Textfyre Interactive Fiction</h1>
                <p>Textfyre creates Interactive Fiction with education in mind. Combining the 
                    functionality of today's computers with the immersive powers of storytelling, 
                    our games create exciting worlds to explore and interact with, while 
                    developing reading and problem-solving skills.
                </p>
                <img src="images/secret-prologue.png" alt="Textfyre's User Interface"  /> 
                <p>Our unique book interface, made with the help of 
                <a class="articleLink" href="http://willcapellaro.com/index.html"> Will Capellaro</a>'s 
                    design (freelance art director) and Thomas Lynge's (Tenteo.Com) 
                <a class="articleLink" href="http://www.silverlight.net">Silverlight</a> programming 
                    skills, creates a user experience that immerses the game player right inside the 
                    story.<br />
                    <a href="https://www.textfyre.com/sldemo/" target="_blank"><br />Try our interface 
                        in your browser online!</a></p>
            </div>
            <div class="col-right">
                <h1> Jack Toresal and The Secret Letter</h1>
                    <a href="Games.aspx"><img src="images/secret.jpg" alt="Jack Toresal and The Secret Letter" /></a>
                
                    <h2>Now Available</h2>
                <p> Textfyre's first commercial Interactive Fiction game is set in the town of 
                    Toresal in the kingdom of Miradania, Secret Letter is an adventure about a 
                    fourteen year old orphan that everyone knows as &quot;Jack&quot;. Jack is pulled into a 
                    dangerous mystery when a handful of Baron Fossville's mercenaries begin hunting 
                    him.<br />
                    <a class="articleLink" href="Games.aspx"> Find out more...</a></p>
                <h1>Upcoming Games</h1>
                <p> Two more Interactive Fiction games are nearing completion, including the first 
                    story in the Klockwerk series. <i>The Shadow in the Cathedral</i>, due November 
                    6th, begins a tale in an Edwardian world where everyone worships clocks. A young 
                    neophyte within the church is our hero and will be faced with many challenges. <br />
                    <a id="ctl00_ContentPlaceHolder1_HyperLink1" class="articleLink" href="Games.aspx">
                    Find out more...</a></p>
                
                </div>
</asp:Content>
