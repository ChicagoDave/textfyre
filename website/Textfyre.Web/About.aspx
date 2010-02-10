<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs"
    Inherits="Textfyre.Web.About" Title="Information about the People of Textfyre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" language="javascript">

        function toggleMontfort() {

            var nm = document.getElementById('nm');
            var nmLink = document.getElementById('nmLink');

            if (nm.style.display == 'none') {
                nm.style.display = 'block';
                nmLink.innerHTML = '(less)';
            }
            else {
                nm.style.display = 'none';
                nmLink.innerHTML = '(more)';
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-left">
        <h1>
            Information about Textfyre Publishing</h1>
        <p>
            Textfyre was founded by David Cornelson, and is the culmination of many years of
            planning and development. With the help of a few hobbyist authors, players, and
            fans, we've started something special.</p>
    </div>
    <div class="col-right">
        <p>
            If you would like to contact us about anything:</p>
        <table>
            <tr>
                <th>
                    Phone:
                </th>
                <td>
                    +1 1 630 803 4302
                </td>
            </tr>
            <tr>
                <th>
                    Email:
                </th>
                <td>
                    webadmin at textfyre dot com
                </td>
            </tr>
            <tr>
                <th>
                    Regular Mail:
                </th>
                <td>
                    Textfyre, Inc - 222, Suite A<br />
                    1144 East State Street<br />
                    Geneva, Illinois USA 60134<br />
                </td>
            </tr>
        </table>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image1" src="images/david.jpg" alt="David Cornelson, Founder and President" />
        <p style="font-size: 8pt; text-align: center;">
            Founder and President</p>
    </div>
    <div class="col-right">
        <p>
            DAVID CORNELSON is a computer consultant and entrepreneur in Chicago, Illinois.
            Most of his consulting work is in Fortune 500 corporations where he architects
            and develops highly visible enterprise web and windows systems. David has also
            had a passion for the Interactive Fiction medium since high school when he played
            Adventure and mainframe Zork on paper terminals.<br />
            <br />
            You can see a history of Textfyre's business development through <a href="http://chicagodave.wordpress.com">
                David's blog</a>.</p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image2" src="images/gentry.jpg" alt="Michael Gentry, Miradania Designer and Writer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Designer and Writer</p>
    </div>
    <div class="col-right">
        <p>
            MICHAEL GENTRY is an award winning Interactive Fiction author with two major games,
            Anchorhead and Little Blue Men. He lives on the east coast with his wife and children.</p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image3" src="images/finley.jpg" alt="Ian Finley, Klockwerk Designer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Designer</p>
    </div>
    <div class="col-right">
        <p>
            IAN FINLEY holds an MFA in Dramatic Writing from New York University, where he received
            the prestigious Harry Kodoleon Award for playwriting. His plays include The Nature
            of the Nautilus (winner of the Kennedy Center's Jean Kennedy Smith award), Green
            Square, 1960, and the Oakwood cycle of plays. His interactive fiction includes the
            award winning Babel, Exhibition, and Kaged.</p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image4" src="images/ingold.jpg" alt="Jon Ingold, Klockwerk Co-Designer and Writer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Designer and Writer</p>
    </div>
    <div class="col-right">
        <p>
            JON INGOLD is from Manchester, UK. His previous Interaction Fiction has won competitions
            and awards, most notably All Roads (winner of the 2001 Interactive Fiction competition
            and Best Game of the Year award, and published in the Electronic Literature Organisation's
            first annual collection) and Dead Cities (on display in the Museum of Science Fiction
            and Utopia in Switzerland in 2008).</p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image5" src="images/obrian.jpg" alt="Paul O'Brian, Giant Leaps Designer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Designer</p>
    </div>
    <div class="col-right">
        <p>
            PAUL O'BRIAN is the only person ever to have won the Interactive Fiction Competition
            twice, taking the top prize in 2002 and 2004 with games from his Earth And Sky series.
            In addition to authoring games, he has written hundreds of reviews, all of which
            are available <a id="aboutLink" href="http://spot.colorado.edu/~obrian/IF.htm">online</a>.
            He lives in Westminster, Colorado with his wife and son, and was once a counselor
            at the camp upon which Giant Leaps is based.
        </p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image8" src="images/chrishuang.jpg" alt="Chris Huang, Giant Leaps Writer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Writer</p>
    </div>
    <div class="col-right">
        <p>
            CHRISTOPHER HUANG lives in a pleasant little condo in the state of Complacency and
            is in a committed relationship with his internet connection. He enjoys National
            Novel Writing Month, taking second place in the annual IFcomp, pretending to be
            a pirate, attending Mass, and wearing waistcoats. When not doing any of the above,
            he can usually be found working in an architecture firm in downtown Montreal.
        </p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="Img4" src="images/sarah.jpg" alt="Sarah Moriarty, Historical Interactive Fiction Designer and Writer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Designer and Writer</p>
    </div>
    <div class="col-right">
        <p>
            SARAH MORAYATI, of Chapel Hill, is the author of several IF works including <i>Broken
                Legs</i>, which earned second place in the 2009 Interactive Fiction Competition.
            Outside the IF world, she's worked as a freelance writer and editor.
        </p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="ctl00_ContentPlaceHolder1_Image6" src="images/graeme.jpg" alt="Graeme Jefferis, Inform 7 Programmer" />
        <p style="font-size: 8pt; text-align: center;">
            Story Programmer</p>
    </div>
    <div class="col-right">
        <p>
            GRAEME JEFFERIS lives in Edinburgh, Scotland. He is a BSc Hons. software engineer
            who has worked for companies across the UK, and for CERN in Switzerland. He plays
            clarinet, saxophone, and bass guitar, and his code is fuelled by hot tea, Irn Bru,
            and biscuits. He's done 99% of the programming on all Textfyre games.</p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="Img1" src="images/snyder.jpg" alt="Mike Snyder, Story and Puzzle Designer" />
        <p style="font-size: 8pt; text-align: center;">
            Story and Puzzle Design Advisor</p>
    </div>
    <div class="col-right">
        <p>
            MIKE SNYDER lives with his wife and three children in Wichita, Kansas, where he
            spends his days developing software and his nights and weekends trying to be a &#8220;fun&#8221;
            dad. Mike has been writing interactive fiction since 1987, with later efforts ranking
            highly in the annual IF competition and winning XYZZY awards for Best Puzzles (Distress
            - 2005) and Best Story (The Traveling Swordsman - 2006). When time permits, Mike
            enjoys zombie-slaying and various forms of world-saving in one or another of the
            video games in his ever-growing collection.</p>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="Img2" src="images/montfort.jpg" alt="Nick Montfort, Interactive Fiction Advisor" />
        <p style="font-size: 8pt; text-align: center;">
            New Media Advisor</p>
    </div>
    <div class="col-right">
        <p>
            NICK MONTFORT writes computational and constrained poetry, develops computer games,
            and is a critic, theorist, and scholar of computational art and media. He is associate
            professor of digital media in the Program in Writing and Humanistic Studies at the
            Massachusetts Institute of Technology. He earned a Ph.D. in computer and information
            science from the University of Pennsylvania. <a id="nmLink" href="javascript:toggleMontfort();">
                (more)</a></p>
        <div id="nm" style="display: none;">
            <p>
                Montfort's digital media writing projects include the group blog Grand Text Auto,
                the ppg256 series of 256-character poetry generators; Ream, a 500-page poem written
                on one day; Mystery House Taken Over, a collaborative "occupation" of a classic
                game; Implementation, a novel on stickers written with Scott Rettberg; and several
                works of interactive fiction: Book and Volume, Ad Verbum, and Winchester's Nightmare.
                <br />
                <br />
                Montfort, with Ian Bogost, wrote Racing the Beam: The Atari Video Computer System
                (MIT Press, 2009), the first book in the Platform Studies series. He wrote Twisty
                Little Passages: An Approach to Interactive Fiction (MIT Press, 2003), and, with
                William Gillespie, 2002: A Palindrome Story (Spineless Books, 2002), which the Oulipo
                acknowledged as the world's longest literary palindrome. He also edited The Electronic
                Literature Collection Volume 1 (with N. Katherine Hayles, Stephanie Strickland,
                and Scott Rettberg, ELO, 2006) and The New Media Reader (with Noah Wardrip-Fruin,
                MIT Press, 2003). His current work is on narrative variation in interactive fiction
                and the role of platforms in creative computing.</p>
        </div>
    </div>
    <div class="clearLine">
    </div>
    <div class="col-left">
        <img id="Img3" src="images/davemay.jpg" alt="David May, Business Development Advisor" />
        <p style="font-size: 8pt; text-align: center;">
            Business Development Advisor</p>
    </div>
    <div class="col-right">
        <p>
            DAVID MAY is an IT executive and entrepreneur in Chicago. David was co-founder and
            CTO of LoanX, an internet-based financial services firm founded in 2001. In 2004,
            LoanX was sold to Markit Group, a London-based financial information services firm.
            Today, Markit exceeds $400 million dollars in revenue and more than 1,200 employees
            throughout the world. Its independent pricing, quotes and valuation services are
            now used by over 1,500 of the most prominent investment banks, hedge funds, asset
            managers, central banks, regulators, rating agencies and insurance companies. The
            combined entity is now worth in excess of $3 billion dollars. Following the acquisition
            of LoanX, David served as Co-CTO at Markit, retiring from the firm in 2008 to assist
            aspiring entrepreneurs.</p>
    </div>
</asp:Content>
