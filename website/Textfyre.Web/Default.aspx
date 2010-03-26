<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="Textfyre.Web.Default" Title="Home of the Best Interactive Fiction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-left">
        <h1>
            Interactive Fiction</h1>
        <p>
            Textfyre creates Interactive Fiction, also known as text adventures. Our games require you
            to read and respond by typing in natural language commands. We use the greatest graphics
            in the universe...your imagination. We invite you to play our first to games, <i>The Shadow
            in the Cathedral</i> and <i>Jack Toresal and The Secret Letter</i>.
        </p>
        <img src="images/shbanner.jpg" alt="The New Klockwerk Series" />
        <p>
           <b>The Shadow in the Cathedral</b> has received
           rave reviews. Emily Short says it's "one of the best Interactive Fiction games of the year."
            <br /><br />
            <a href="https://www.textfyre.com/shadowdemo.aspx">
                <b>Try a demonstration of The Shadow in the Cathedral!</b></a><br /><br />
                <a href="https://www.textfyre.com/games.aspx"><b>Buy a copy today!</b></a>
                </p>
    </div>
    <div class="col-right">
        <h2>
            Jack Toresal and The Secret Letter</h2>
        <a href="Games.aspx">
            <img src="images/secretlettermap.jpg" alt="Jack Toresal and The Secret Letter" /></a>
        <p>
            Textfyre's first Interactive Fiction game, Jack Toresal and The
            Secret Letter, is also available...<br />
            <a class="articleLink" href="Games.aspx">Find out more...</a></p>
    </div>
</asp:Content>
