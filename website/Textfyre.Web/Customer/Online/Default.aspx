<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Textfyre.Web.Customer.Online.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 284px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <asp:Image runat="server" ImageUrl="~/images/shbanner.jpg" AlternateText="The Shadow of the Cathedral" />
        <h2>
            The Shadow in the Cathedral</h2>
        <p>
            The Shadow in the Cathedral, Textfyre&#39;s second game, is now available for purchase.
            The first episode in the Klockwerk Series; Shadow begins a deep <i>steampunk</i>
            adventure in a world of clocks, gears and ornithopters. You are Wren, 2nd assistant
            clock-polisher. It&#39;s not a very important job, but it offers a place to sleep
            and bread to eat. You just wish you could someday make it to 1st assistant clock-polisher.
            Before too long you're trying to solve the greatest mystery in the history of St.
            Philip.
        </p>
        <p>
            <asp:HyperLink ID="ShadowLink" Visible="false" runat="server" NavigateUrl="Shadow/ShadowPlay.aspx"><b>Play the Online Edition!</b></asp:HyperLink><br />
            (Intel Mac/Windows - Requires Microsoft Silverlight).</p>
        <p>
            <a href="https://textfyre.com/demos/ShadowStd-Demo-1.0.msi"><b>Download a demo of the
                Standard version!</b></a><br />
            (Windows only).</p>
        <p>
            <a href="https://textfyre.com/ShadowDemo.aspx"><b>Play the online demonstration!</b></a><br />
            (Intel Mac and Windows - Requires Microsoft Silverlight)</p>
    </div>
    <div class="clearLineBlank">
    </div>
    <div style="height:2px;background-color:Black;"></div>
    <div>
        <br />
        <asp:Image runat="server" ImageUrl="~/images/JackGrubbers-small.jpg" AlternateText="Jack Toresal and The Secret Letter" />
        <h1>
            Jack Toresal and the Secret Letter</h1>
        <p>
            Textfyre&#39;s first commercial Interactive Fiction game was released on June 26th,
            2009. Set in the town of Toresal in the kingdom of Miradania, Secret Letter is an
            adventure about a fourteen year old orphan that everyone knows as &quot;Jack&quot;.
            Jack is pulled into a dangerous mystery when a handful of Baron Fossville&#39;s
            mercenaries begin hunting him. From Grubber&#39;s Market through Commerce Street,
            and onto Lord&#39;s Keep; Jack is faced with numerous challenges. Teisha lends a
            hand along the way, as does Bobby, the mysterious boy always lurking in Lord&#39;s
            Market. The ladies at Maiden House are helpful, but can sometimes be a bit overbearing.
            The shopkeepers are always willing to chat about the latest gossip. Jack, he just
            wants to sit down and eat an apple.
        </p>
        <p>
            <a href="https://textfyre.com/sldemo/" target="_blank"><b>Play a demo of the Deluxe Edition online!</b></a><br />
            (Intel Mac and Windows - Requires Microsoft Silverlight)
            <br />
            <a href="https://textfyre.com/demos/SecretLetter-1.07StdDemo.msi"><b>Download a demo
                of the Standard version</b> </a>
            <br />
            (Windows only)</p>
    </div>
    </asp:Content>
