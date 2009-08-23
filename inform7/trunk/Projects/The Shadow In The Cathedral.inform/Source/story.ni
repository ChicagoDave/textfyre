"The Shadow In The Cathedral" by Textfyre Inc

[
Include (- Constant DEBUG; -) after "Definitions.i6t".
]

[  Change Log
When			Who		What
23-Aug-2009		J. Ingold	New kind - locative glimpse backdrop - these "localise" a location and auto- navigate towards it. I've populated the Abbey with some to ease the player around.
22-Aug-2009		J. Ingold	Finished c7 playthrough. Fleshed out chase sequence and Caught location. 
22-Aug-2009		J. Ingold	Added multiple solutions to the Difference Engine puzzle - if anything, I've been too generous!! Couple of other minors. Added board messages to room descriptions once they've been seen - code's a bit messy to ensure paragraph breaks are correct.
18-Aug-2009		J. Ingold	Started to play through Chapter 7. Fixed a bug(GJ, please check this!) in Textfyre Standard Rules for implicitly opening. [ Update: actually, GJ may have fixed this already? Anyway, it's gone. ]
17-Aug-2009 	J. Ingold	More of Paul's feedback, mostly missing responses. Changed TALK TO behaviour to use a prescripted list of topics (would be nice if the last of these was "What do you want to talk about?", and then hooked into the parser properly. But that might be pure sci-fi.)
14-Aug-2009 	J. Ingold	More of Paul's feedback and some left over from Eric's script. Started on Paul's new transcripts too.
10-Aug-2009 	J. Ingold	Some of Paul's feedback + some playtesting of C7.
5-Aug-2009	G. Jefferis	Final bug fixes from Eric
4-Aug-2009	G. Jefferis	Bug fixes from Eric - sh-v0.61-ECSE-01 (and various others)
3-Aug-2009	G. Jefferis	Bug fixes from Eric - sh-v0.61-ECSE-01
31-July-2009	J. Ingold	Added chapter breaks in proper places and a method for doing whatever it is we're going to do with them.
31-July-2009	J. Ingold	Added ian's c5 feedback.
25-July-2009 	J. Ingold	Resolved file, added some missing responses.
24-July-2009	J. Ingold	The majority of Eric Eve's two feedback scripts are dealt with. Remaining issues are one with TSR extension and some missing grammar (on my list to do!)
23-July-2009	G. Jefferis	Eric Eve bug fixes and a few others
22-July-2009	J. Ingold	c6 pass complete. Not entirely sure about the "difference" puzzle, really, but it'll do for now until we get some real playtesters. Some weirdness with random number fixing - Covalt's behaviour doesn't seem to be consistent?
20-July-2009	J. Ingold	Ian's C4 changes in. Added a few more routes through Covalt's Bedroom scene. Started on the Clock Shop rummaging scene.
14-July-2009	J. Ingold	Fixed test script.
13-July-2009 	J. Ingold		Added alternate solution to Chapter 2 - you can climb over the garden walls using the ladder to your bedroom. Needed a lot of extra stuff to let you carry the ladder around, have Drake take it back to position, etc. Also fixed the build (doh.)
12-July-2009	J. Ingold		Finished C5. Added roof objects. Lots of down/jump responses. Fixed descriptions of bridge/plank. Can remove tarp from chimney. Various tweaks to turning things forwards and backwards. Rewrote chapter ending text. 
11-July-2009 	J. Ingold		Added types of entering: is the player lying, sitting or clambering (or neither) - just for differentiating negative responses. Couple more Sa'at conversations. Added hymnals. Added hint to Lower Gears. Finished C4, mostly just adding scenery and jumping responses.
8-Jul-2009	G. Jefferis	Fight with Covalt
7-Jul-2009	G. Jefferis	Inner Vault and arrival of the figure
6-Jul-2009	G. Jefferis	Henge and Brass Head
6-July-2009	J. Ingold		Ian's C3 changes are almost all in. Added a new verb, "approaching" to cover "go to" and "follow" commands, and some (limited) support for these in the game. This will need a lot of new rules writing... Added a new kind, a "glimpse backdrop", which is a backdrop "too far away" to interact with, that can be identified (new relation) to a real game object. When approaching a glimpse, the game will take the player towards the identified item (if it has been identified with anything). Meanwhile, working through c4: the escaping Figure is a backdrop in all these rooms who you can "follow" and attempt (and fail) to talk to. fixed the penduluum sequence (counters go up after messages are printed, it seems, not before!)
3-July-2009	J. Ingold 	Added "talk" verb, and "ask about <topic>" with no specified NPC. Began C4.
2-July-2009	J. Ingold		Added Herb Garden location, where the player can (optionally) pick up a knife by solving a quick puzzle involving revolving flower beds. If they do, the knife & tome are removed from the Cyclical Library (in c3). Player's can't do both!
1-July-2009	J. Ingold		Last of Ian's C2 feedback. Indicated Horloge will talk after tea. Finished c3 playthrough. Added some missing descriptions, and a way to get the knife later if you missed it. Extended Sa'at conversation again.
30-Jun-2009 	J. Ingold		Player can now specify how many times to turn a crank/lever (a variable is set called "the number of turns to make") to speed up dial-setting puzzles. A general turn will pick a number at random, but tilt the random process to stop at correct positions for ease of use. Added some conversation to Sa'at. 
29-Jun-2009	J. Ingold		Additions to Doric and Sa'at. More conversation topics. Doric can be crashed into during chase scene, and he drops a hint. Orrey description changes on second viewing. Added "shout at" action. Added balcony rail to Clerestory. Added plural controls (cranks and dials) for catching non-specific input in the Library. In general, trooping my way through chapter 3, but not done yet. Also, most of Ian's changes to c2 incorporated (remaining to be added anon.)
24-Jun-2009	G. Jefferis	Gnomon control puzzle
23-Jun-2009	G. Jefferis	Crypt map and scenery
22-Jun-2009	G. Jefferis	Entry to Crypt
21-Jun-2009	J. Ingold		Added "Set clock to dinner-time"
21-Jun-2009	J. Ingold		Doric: added hints to his creed response. Made chase sequence give a hint about the creed. Pushed players to explore further. Fixed a bug with hiding.
20-Jun-2009	J. Ingold		Started playthrough of ch. 3. Added "Cathedral Space" region to cover the rooms. Added cathedral backdrop to these. Made "in" and "out" work. Added some hints after meeting Doric and to room descriptions. Added "listen" responses for the monks. Auto-exit of pews.
19-Jun-2009	J. Ingold		ch. 1 stuff: Fixed issues from Ian and David. Added "making to leave" action, covering EXIT and GO OUT, for diverting movement. Added short-cuts, extra turns to first scene. Fixed bug on typing "open clock" twice. Added Wren's description to the start text. Some rewrites to try and add tension. DIDN'T add ceiling/wall/floor objects - that's a bit scary. 
18-Jun-2009	D. Cornelson	Updated standard credits and added play-testing commenting code. Added first bits of regression response testing.
16 Jun 2009	J. Ingold		Added "hide" command (action is "hiding from view"), used to give a response to more general input. Fixed a bug in the tea-machine process. Repaired the abbey test script, that I seem to have broken by changing Drake's logic. Changed descriptions of the Hall rooms when the gongs are ringing and the player should be heading out.
16 Jun 2009	G. Jefferis	Return to Cathedral
15 Jun 2009	G. Jefferis	Return to Cathedral; Calvin's Patrol
15 Jun 2009	J. Ingold		Play-tested C2. Several changes, including a Pantry off the kitchen with tea leaves in and the ability to hide from Drake. Synonym "fill <x> with water". 
11 Jun 2009	G. Jefferis	Return to Cathedral
09 Jun 2009	G. Jefferis	Autopothecary complete
05 Jun 2009	G. Jefferis	Autopothecary boxes
05 Jun 2009	J. Ingold		Better cluing for the 5pm time-setting. Horloge nows "walks through" to hint about the keys (so long as you haven't seen him before). Some text rewrites.
04 Jun 2009	J. Ingold		Added synonyms to verbs. Removed grammar lines leading to "rub" action. Added an ornamental action, "making the sign of". Slowed the clock-kind down to increase by 1 minute every 10 turns (to "discourage" accidental solution of time-puzzles -- it now takes 1200 moves for the Refectory Clock to strike 5pm, instead of only 120.) Added "[or-separated list of ...] substitution and used it to give help escaping Drake.
01 Jun 2009	G. Jefferis	Remainder of Covalt's conversation
27 May 2009	G. Jefferis	Return to Covalt's - conversation
26 May 2009	G. Jefferis	Return to Covalt's
18 May 2009	G. Jefferis	Gas Platform
15 May 2009	G. Jefferis	Bug fixes on ch. 7
30 Apr 2009	G. Jefferis	Updates to ch. 7
28 Apr 2009	G. Jefferis	Rope - finishing
27 Apr 2009	G. Jefferis	Rope - tying and looping
24 Apr 2009	G. Jefferis	5Z91 updates
21 Apr 2009	G. Jefferis	Rope work
10 Apr 2009	G. Jefferis	Warehouse
09 Apr 2009	G. Jefferis	Underwater
04 Apr 2009	G. Jefferis	Docklands
31 Mar 2009	G. Jefferis	Calculatrix Chase continued and Capture event
30 Mar 2009	G. Jefferis	Bug fixes for Counting House
28 Mar 2009	G. Jefferis	Calculatrix Chase beginnings
09-Dec-2008	D. Cornelson	Added FyreVM Support. Setup Title, credits, and prologue channels.
20 Oct 2008	G. Jefferis	Western Platform
16 Oct 2008	G. Jefferis	Grid layout for displaying table data
14 Oct 2008	G. Jefferis	Difference Engine
13 Oct 2008	G. Jefferis	Difference Engine
5 Oct 2008	G. Jefferis	Counting House continued
2 Oct 2008	G. Jefferis	Beginnings of Counting House
1 Oct 2008	G. Jefferis	End of Clock Shop
14 Sep 2008	G. Jefferis	5U92 compatibility, Covalt state 4
13 Sep 2008	J. Ingold  	Fixed typos, added synonyms to first two chapters
10 Sep 2008	G. Jefferis	Bug fixes and amendments to Clock Shop
5 Sep 2008	G. Jefferis	Covalt, in states 1 - 3; clock shop rummaging puzzle
4 Sep 2008	G. Jefferis	Rooftop playable
3 Sep 2008	G. Jefferis	Rooftop puzzles
2 Sep 2008	G. Jefferis	Various rooftops
1 Sep 2008	G. Jefferis	5T18 compatibility, Cathedral Clock
31 Aug 2008	G. Jefferis	New Clerestories, and Cathedral rooftops
30 Aug 2008	G. Jefferis	Abbot Gubbler's meeting with the Figure
25 Aug 2008	G. Jefferis	Archbishop's Library
25 Jul 2008	G. Jefferis	Chase scene with Brother Doric
24 Jul 2008	G. Jefferis	Brother Doric
22 Jul 2008	G. Jefferis	Work order puzzle playable
21 Jul 2008	G. Jefferis	Beginnings of library contraption
20 Jul 2008	G. Jefferis	Beginnings of work order puzzle
19 Jul 2008	G. Jefferis	Brazier, wax, and knife
26 Apr 2008	G. Jefferis	Cathedral map and beginning of wax puzzle
				Counters extension
25 Apr 2008	G. Jefferis	Refectory Clock and escape to Cathedral
				General bug finding
22 Apr 2008	G. Jefferis	Tea machine puzzle implemented
				Conversation topics extension
21 Apr 2008	G. Jefferis	Start tea machine puzzle
20 Apr 2008	G. Jefferis	Drake's movement and capturing.
				Start on Brother Horloge.
18 Apr 2008	G. Jefferis	Abbey map sketched out.
				Bug fixing.
17 Apr 2008	G. Jefferis	Hiding in Clock Case scene.
				Various additional verbs.
15 Apr 2008	G. Jefferis	Start project.
				Abbot's Quarters, player character and possessions. 
]

Use no scoring, American dialect and full-length room descriptions.
The story creation year is 2009.

Include FyreVM Support by Textfyre.
Include Custom Library Messages by David Fisher.
Include Punctuation Removal by Emily Short.
Include Basic Screen Effects by Emily Short.
Include Scripted Events by Textfyre.
Include Scripted Room Events by Textfyre.
Include Conversation Topics by Textfyre.
Include Counters by Textfyre.
Include Direct Questions by Textfyre.
Include Textfyre Standard Rules by Textfyre.
Include Grid Layout by Textfyre.
Include Test Suite by Textfyre.
Include Parse List by Textfyre.
Include Textfyre Standard Backdrops by Textfyre.

Book - Initialisation

Section 0 - Beating memory constraints

Use MAX_STATIC_DATA of 400000;
Use MAX_PROP_TABLE_SIZE of 600000.
Use MAX_DICT_ENTRIES of 2500.
Use MAX_OBJECTS of 1280.
Use MAX_SYMBOLS of 26000.
Use MAX_ZCODE_SIZE of 80000.
Use MAX_LINESPACE of 20000.

Chapter - Debugging and Analysing Verbs (not for release)

Section - Uncluster lists unclustered conversation topics

Unclustering is an action applying to nothing.
Understand "uncluster" as unclustering.
Carry out unclustering:
	repeat with item running through conversation topics:
		if the number of things clustered with the item is one, say "[item]...";

Section - Check chat for tests who has conversational responses to topics

Checking chat for is an action applying to one topic.

Understand "check chat for [text]" as checking chat for.
Definition: a person is tabled if the conversation table of it is not the table of nothing to say.
Check checking chat for:
	repeat with item running through tabled people:
		let flag be false;
		say "[Item] / [conversation table of the item]: ";
		repeat through the conversation table of the item:
			if the topic understood matches topic entry :
				say "Topic found.";
				let flag be true;
		if flag is false, say "Topic unlisted."

Section - Article checks

Checking articles for is an action out of world applying to one topic.

Understand "check articles for [text]" as checking articles for.

Carry out checking articles for "rooms": check articles for rooms, only showing definite articles;
Carry out checking articles for "people": check articles for people, only showing definite articles;
Carry out checking articles for "things": check articles for nontrigger things;
Carry out checking articles for "backdrops": check articles for backdrops;
Carry out checking articles for "scenery": check articles for nontrigger scenery things;

Definition: a thing is nontrigger:
	unless it is a trigger, yes;
	no;

To check articles for (D - a description), only showing definite articles:
	repeat with x running through D:
		say "[The x][unless only showing definite articles], [An x][end if] ([X])[line break]";

Section - Exit checks

Checking exits is an action out of world applying to one topic.

Understand "check exits" as checking exits.


Chapter - Start of Game 

Section 1 - Set up

Rule for printing the banner text:
	select the title channel;
	say "[b][story title][r][line break]";
	select the credits channel;
	say "[story title] by [story author][line break]";
	say "Copyright [story creation year] by [story author][line break]";
	say "Designed by Ian Finley[line break]";
	say "Written by Jon Ingold[line break]";
	say "Game Engine (FyreVM) by Jesse McGrew[line break]";
	say "Inform 7 Story Programming by Graeme Jefferis[line break]";
	say "Custom Library Messages extension by David Fisher[line break]";
	say "Testing by Jon Ingold, Ian Finley, Paul O'Brian and Eric Eve[line break]";
	say "User Interface Programming by Thomas Lynge[line break]";
	say "Special thanks to Graham Nelson and Emily Short[line break]";
	say "for all of their hard work on Inform 7.[line break]";
	say "All rights reserved[line break]";
	select the main channel;

When play begins:
	change the library message person to first person; 
	[ change the library message number to singular; ]
	change the current script to {AB_QUART1, AB_QUART2, AB_QUART_PAUSE, AB_QUART3, AB_QUART4, AB_QUART4B, AB_QUART5, CCASE1};

After reading a command:
	remove stray punctuation;

After reading a command: 
	let T be indexed text; 
	let T be the player's command;
	if T matches the regular expression "^\*|\[bracket]":
		say "[bracket][one of]Your comment has been noted[or]Noted[stopping].[close bracket][paragraph break]";
		reject the player's command; 
	otherwise:
		continue the action. 

Section 1a - Clouds

When play begins:
	now the weather is cloudy skies.

Before doing something when the backdrop-sky is involved:
	instead redirect the action from the backdrop-sky to the backdrop-clouds, and try that;

Instead of examining the backdrop-clouds:
	say "The clouds are indifferent, perfect, cycling by on their own clockwork tracks."

Section 2 - Clock setting

The time of day is 3:00 PM.

When play begins:
	repeat with timepiece running through clocks:
		set the timepiece to 3:00 PM;

Section 3 - Random directions in Lower Gears

The available-platforms is a list of objects [directions] that varies.
The available-platforms is {}.

When play begins:
	change the available-platforms to {north, northeast, east, southeast, south, southwest, west, northwest};
	sort the available-platforms in random order;
	truncate the available-platforms to 3 entries;

Section 4 - Allow portable scenery to be taken

[TODO: BUG: A trivially minor bug in the Custom Library Messages library, I expect, or the Standard Rules otherwise. Note to self: investigate, file report.]

The replacement can't take scenery rule is listed instead of the can't take scenery rule in the check taking rules.

This is the replacement can't take scenery rule:
	if the noun is scenery and the noun is not portable:
		say "That's hardly portable." instead;

Section 5 - Preventing non-portable scenery from showing up in "all" lists

Rule for deciding whether all includes a not portable scenery thing:
	it does not.


Section M - Miscellanea

The player is in the Abbot's Quarters.

The examine described devices rule is not listed in any rulebook.
The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.



Book A - New Phrases etc

Part 1 - New things to say

Chapter 2 - Directions which may be mirrored

To say (dir - a direction) with mirroring:
	if the hemisphere of the location is the natural hemisphere:
		say dir;
	otherwise:
		say dir in the mirror;

Chapter 4 - Or-separated lists

[ Two syntaxes: [or-separated list of ...] and [the or-separated list of...] .]

To say or-separated list of (the collection - a description):
	let N be the number of members of the collection;
	repeat with item running through the collection:
		say "[item]";
		decrease N by 1;
		if N is 1, say " or ";
		if N > 1, say ", ";

To say the or-separated list of (the collection - a description):
	let N be the number of members of the collection;
	repeat with item running through the collection:
		say "[the item]";
		decrease N by 1;
		if N is 1, say " or ";
		if N > 1, say ", "; 

Chapter 4b - Number of times

To say (N - a number) times:
	if N is zero:
		say "never";
	else if N is 1:
		say "once";
	else if N is 2:
		 say "twice";
	else:
		say "[N in words] times";

Chapter 5 - Default Message fixes

[ Parser errors should still be in second person. ]

Table of custom library messages (continued)
Message ID						Message Text 
LibMsg <who disambiguation>	"Who do you mean, " 
LibMsg <which disambiguation>	"Which do you mean, " 
LibMsg <whom disambiguation>	"Whom do you want[if main object is not the player] [the %][otherwise] me[end if] to [the last command]?" 
LibMsg <what disambiguation>	"What do you want[if main object is not the player] [the %][otherwise] me[end if] to [the last command]?" 

Instead of attacking the player:
	say "I'd rather hit Drake."

The first-person  Textfyre Standard replacement inventory rule is listed instead of the  Textfyre Standard replacement inventory rule in the carry out taking inventory rulebook.

This is the first-person Textfyre Standard replacement inventory rule:
	[The difference between this and the standard inventory style is that we do not show inventory information.]
	say "I'm carrying: [line break]";
	list the contents of the player, with newlines, indented, including contents, with extra indentation;

Chapter 5b - Altered Default Messages

Table of custom library messages (continued)
Message ID						Message Text 
LibMsg <report player waiting>	"[one of]The Universal Clock moves onwards: time happens.[or]Tick tock.[or]A few heartbeats measure a few seconds.[or]Time moves on.[at random]"
LibMsg <block jumping>			"Scared, are you?"
LibMsg <block showing>			"Might as well show a cobweb to a clock-face."
LibMsg <block giving>			"[one of]I've got few enough things as it is, without giving them away for no reason.[or]I'm not giving anything away.[at random]"
LibMsg <block thinking>			"My cogs turn."
LibMsg <block sleeping>			"Now's not the time for that!"
LibMsg <block smelling>			"The only smell around is the one I'm most used to - it's not bath-time for another week!"
LibMsg <block tasting>			"Eugh! Why would I do that?"
LibMsg <block singing>			"This doesn't feel like the moment for it, somehow."


Chapter 5c - Talking to Yourself

Check asking the player about:
	say "I'm not ready to start talking to myself quite yet." instead.
Check telling the player about:
	say "I'm not ready to start talking to myself quite yet." instead.

Chapter 6 - Say by index

[ To print one of a list of possibilities depending on a numerical index ]

To say by (N - a number) -- beginning say_by_index:
(-
	switch(({N} % ( {-segment-count} ))) { 0:
-).

To say or by  -- continuing say_by_index:
(-
	{-segment-count}:
-).

To say end -- ending say_by_index:
	(- {-close-brace} -).

Part 2 - New things to do

Chapter 3 - Solidity of wax

Definition: a wax lump is molten:
	if it is in the brazier, yes;
	no;

Chapter 4 - Scraping tools

Definition: a thing is suitable for scraping:
	if it is the knife, yes;
[	if it is the tumbler, yes; - can't allow this, sadly, as we need to ensure the player has the knife ]
	no;

Definition: a thing is unsuitable for scraping:
	unless it is suitable for scraping, yes;
	no;

Chapter 5 - Screwing tools

Definition: a thing is suitable for screwing:
	if it is the knife, yes;
	if it is the wrench, yes;
	no;

Definition: a thing is unsuitable for screwing:
	unless it is suitable for screwing, yes;
	no;

Chapter 6 - Wrapping tools

Definition: a thing is suitable for wrapping:
	if it is the tarp, yes;
	if it is the linen cloth, yes;
	no;

Definition: a thing is unsuitable for wrapping:
	unless it is suitable for wrapping, yes;
	no;

Chapter 7 - Clutter

Definition: a thing is worthy of inspection:
	if it is clutter, yes;
	no;

Chapter 8 - Jamming tools

Definition: a thing is suitable for jamming:
	if it is the wrench, yes;
	if it is the knife, yes;
	no;

Definition: a thing is unsuitable for jamming:
	unless it is suitable for jamming, yes;
	no;

Part 3 - Chapter Break Mechanics

The current game chapter is a number that varies.

When play begins: 
	now the current game chapter is 1;
	change the right hand status line to "[turn count]";
	change the left hand status line to "Chapter [current game chapter]: [current chapter name] -- [location]".

Table of Chapter Titles
title						chapter
"Between a Rack and a Gear-Trace"		1
"No Place to Hide"			2
"In the Cathedral of Time"		3
"The Figure in Grey"			4
"The Rooftops of the St Philip"		5
"The Clockmaker"			6
"The Counting House"		7
"The Secret in the Docklands"				8
"Covalt's Device"			9
"Back to the Cathedral"		10
"Into the Crypt"					11
"Midnight"					12

To say current chapter name:
	say title corresponding to a chapter of the current game chapter in the table of Chapter Titles;


Section 1 - Release method

To end a/the chapter:
	increase the current game chapter by 1;
	pause the game;

Section 2 - Debug method (not for release)

To end a/the chapter:
	increase the current game chapter by 1;
	say "[paragraph break][bold type]*** CHAPTER [current game chapter]: [current chapter name] ***[roman type][paragraph break]";

[Chapter 4 - Punctuation removal

[ this phrase seems to be broken ] 

After reading a command:
	resolve punctuated titles.]

Book B - New Kinds

Part 1 - Window

A window is a kind of container. A window is usually closed, not openable.

Instead of climbing a window:
	try entering the noun;

A glass window is a kind of window. Understand "glass", "window" as a glass window.

A stained glass window is a kind of glass window. Understand "stained", "stained-glass" as a stained glass window.

Instead of attacking a stained glass window:
	say "These things are sacred. I couldn't touch them! (Anyway, they're too high up.)";

Instead of attacking a stained glass window (called the target) with something:
	try attacking the target instead.

Part 2 - Monk

A monk is a kind of man. Understand "brother", "monk", "man" as a monk.

Part 3 - 'Fake' container

[Fake in that it isn't intended to contain anything, but just represent the presence or absence of its contents.]

A fake container is a kind of container.

A fake container can be empty or full.

A fake container is usually empty.

Report searching an empty fake container:
	say "[The noun] is empty." instead;

Report searching a full fake container:
	say "[The noun] is full." instead.

Part 4 - Clock

A clock is a kind of thing. A clock can be openable. A clock can be open. A clock can be lockable. A clock can be locked. A clock is usually openable, closed, lockable and locked.

A clock has a time called the face value. A clock has a number called the second-hand.

To set (timepiece - a clock) to (t - a time):
	change the face value of the timepiece to t;
	change the second-hand of the timepiece to 0;

The advance clocks rule is listed after the advance time rule in the turn sequence rules.

This is the advance clocks rule:
	repeat with timepiece running through clocks:
		let x be the face value of the timepiece;
		increase the second-hand of the timepiece by 1;
		if the second-hand of the timepiece > 10:
			set the timepiece to x + 1 minute;
			if the timepiece is visible, say "[The timepiece] clunks forward one minute.";

Part 5 - Wax

Chapter 1 - Colors

Wax color is a kind of value. The wax colors are red, blue, yellow, purple, orange, green, brown, and clear.

To decide if (w - a wax color) is primary:
	if w is red, yes;
	if w is blue, yes;
	if w is yellow, yes;
	no;

To decide if (w - a wax color) is secondary:
	if w is brown, no;
	if w is primary, no;
	yes;

Table of wax mixtures
wax1		wax2		result
red		blue		purple
red		yellow		orange
blue		yellow		green
purple		red		purple
purple		blue		purple
orange		red		orange
orange		yellow		orange
green		blue		green
green		yellow		green

To decide what wax color is what you get when you mix (first wax - a wax color) with (second wax - a wax color):
	if first wax is second wax:
		decide on first wax; [first trivial case - e.g. red + red]
	if first wax is brown or second wax is brown:
		decide on brown; [second trivial case - e.g. brown + anything.]
	if first wax is secondary and second wax is secondary:
		decide on brown; [third trivial case - e.g. purple + orange.]
	repeat through the table of wax mixtures:
		if first wax is wax1 entry and second wax is wax2 entry:
			decide on result entry;
		if first wax is wax2 entry and second wax is wax1 entry:
			decide on result entry;
	decide on brown;

Chapter 2 - Wax lumps

Wax lump is a kind of thing.
A wax lump has a wax color called the color.
A wax lump has a number called the size.

The indefinite article of a wax lump is usually "a". [We need to set a default value, because later in the game - as an easter egg - we change the article. If we don't specify a default, we can't do this.]

Understand the color property as describing a wax lump.

Understand "pool" as a wax lump when the item described is molten.
Understand "lump" as a wax lump when the item described is not molten.

Understand "plum", "stone", "plum-stone" as a wax lump when the size of the item described is 2.
Understand "fist sized", "fist-sized", "size", "sized", "fist" as a wax lump when the size of the item described is 3.
Understand "orange", "orange sized", "orange-sized", "size", "sized" as a wax lump when the size of the item described is 4.
Understand "bread", "roll", "roll-sized", "bread-roll", "bread-roll-sized", "sized", "size" as a wax lump when the size of the item described is 5.
Understand "small", "little" as a wax lump when the size of the item described is less than 6.
Understand "colossal", "enormous", "huge", "big", "large" as a wax lump when the size of the item described is greater than 5.
Understand "single", "wealth", "church's" as a wax lump when the size of the item described is greater than 5.

Rule for printing the name of a wax lump (called the lump):
	let n be the size of the lump;
	if n is greater than 10:
		say "single lump of [color of lump] wax";
	otherwise if n is greater than 5:
		say "colossal lump of [color of lump] wax";
	otherwise:
		if n is:
			-- 5: say "lump of [color of lump] wax the size of a small bread roll";
			-- 4: say "lump of [color of lump] wax the size of an orange";
			-- 3: say "fist-sized lump of [color of lump] wax";
			-- 2: say "plum-stone of [color of lump] wax";
			-- 1: say "lump of [color of lump] wax";

The description of a wax lump is "[An item described].";

Instead of squeezing a wax lump: say "Squishy and warm."

Section 2 - Grouping wax lumps

The plural of wax lump is wax lumps.

Before listing contents: group wax lumps together.

Before grouping together wax lumps:
	say "[listing group size in words] wax lumps: ";

Before printing the name of a wax lump when grouping together:
	say "a ";

Chapter 3 - The Wax Factory

The Beehive is a container. In the Beehive are 24 wax lumps.

To melt together (lump A - a wax lump) and (lump B - a wax lump):
	let the new color be what you get when you mix the color of lump A with the color of lump B;
	let the new size be the size of lump A + the size of lump B;
	move lump B to the Beehive;
	change the color of lump A to the new color;
	change the size of lump A to the new size;

Section 2 - mixing lumps together by hand

[ I'd like to add the following, but the syntax is messy to build: "Squeeze blue and red lumps together". What we need is a multiple action that's not treated as one. One for later, maybe? ]

[Instead of squeezing a wax lump (called lump A) into a wax lump (called lump B):
	say "I squish and squirm and squiff the two lumps together, ending up with ";
	melt together lump A and lump B;
	say "[a lump A]."

Instead of squeezing a wax lump into a candle:
	try squeezing the second noun into the noun.

Instead of squeezing a candle into a wax lump:
	say "I'd need to melt down [the noun] first somehow, it's not soft enough as [it-they] [is-are]."

Instead of squeezing a candle into a candle:
	say "I'd need to melt down the candles first somehow; they're not soft enough as they are."
]

Part 6 - Candles

A candle is a kind of thing. A candle has a wax color called the wax. The description of a candle is usually "The candle is long and thin with a thin string wick. The wax is [candlecolor of the item described]."

Understand "candle" as a candle.
Understand "wax candle" as a candle.
Understand "wax" as a candle when the location does not enclose a wax lump.
Understand the wax property as describing a candle.

[Before printing the name of a candle (called c):
	if the wax of c is not clear:
		say "[wax of c] ";]

Rule for printing the name of a candle (called c):
	if the wax of c is not clear:
		say "[wax of c] ";
	say "candle";

To say candlecolor of (c - a candle):
	if the wax of c is:
		-- red: say "strawberry-red";
		-- blue: say "sky-blue";
		-- yellow: say "daffodil-yellow"; 
		-- otherwise: say the wax of c;

Understand "strawberry", "strawberry-red" as a candle when the wax of the item described is red.
Understand "sky", "sky-blue" as a candle when the wax of the item described is blue.
Understand "daffodil", "daffodil-yellow" as a candle when the wax of the item described is yellow.

Instead of squeezing or attacking a candle:
	say "I crumble the thin candle to dust in my hand[one of]. (And that's all I can do - if I want to melt it down, I'd need more than just brute force.)[or].[stopping]";

Instead of burning a candle:
	say "There's nothing around to light it on."

Instead of burning a candle when in the Calendar Shrine:
	try inserting the noun into the brazier.

Section - plurals and groups

The plural of candle is candles.

Before listing contents: group candles together.

Before grouping together candles:
	say "[listing group size in words] candles: ";
Rule for printing the name of a candle (called c) when grouping together:
	say "[wax of c]";

Part 7 - Candle Dispensers

A candle dispenser is a kind of thing.
A candle dispenser has a wax color called the wax.
A candle dispenser has a candle called the representative item.
A candle dispenser is scenery.

The description of a candle dispenser is usually "There is a cluster of [wax] candles on the stand, between the [otherwax of the item described] candles."

To say otherwax of (c - a candle dispenser):
	let first-done be false;
	repeat with N running through candle dispensers enclosed by the holder of c:
		if c is not N:
			say "[wax of N]";
			if first-done is false:
				say " and ";
				let first-done be true;
	
Rule for printing the name of a candle dispenser:
	say "[wax] candles";

Part 8 - Pews

A pew is a kind of supporter. A pew is always enterable. A pew is usually scenery, plural-named. The printed name is usually "pews". Understand "pew/pews/seat/seats/bench/benches" as a pew.

Instead of going when the player is on a pew (called the perch) (this is the auto-exit pews rule):
	try getting off the perch;
	if the player is not on a pew, continue the action;

Before exiting when the player is on a pew (called the perch):
	try getting off the perch instead.

Instead of entering a pew when the player is lying:
	say "This isn't the time to catch forty winks!"

Report entering  a pew:
	say "I perch myself down on the wood, and bow my head a little."
Report standing on  a pew:
	say "I perch myself down on the wood, and bow my head a little."


Section 1 - Hymnal

A hymnal is a kind of thing. Understand "prayer", "book", "hymn", "hymns", "hymnal", "pocket", "small", "leather", "bound", "leather-bound" as a hymnal.

Does the player mean doing something with a hymnal: it is unlikely.

Every pew incorporates a hymnal.

After examining a pew:
	say "In a pocket behind [if player is not on a pew]each of the pews[else]the pew in front[end if] is a hymnal."

Instead of taking a hymnal:
	say "I don't need one: I know all the hymns by gear."

Rule for printing the description of a hymnal:
	say "The hymnal is a small leather-bound prayer book printed on one of the Abbey duplicators. It lists all the words for the hymns. I don't know why, since most people in this city can't read, but I suppose it must make them feel better to know there [i]are[r] words."

Instead of searching, reading or opening a hymnal:
	say "I open the page to a random hymn: [i][one of]All Springs Bright and Beautiful[or]Onward, Machinist Solders[or]The Third Law is my Shepherd[or]Gracious Grease, Oil in Me[or]When a Knight Wound his Spurs[or]Let All the World Rejoin[or]Where Angels Fear to Thread[stopping][r]."

Instead of reading or opening a hymnal for at least the eighth time:
	say "Wren, come on. You can't waste all your time reading hymns, you've got to do something about that Figure!"

Understand "sing [hymnal]" as a mistake ("I don't think the monks would appreciate my joining in.").

Part 9 - Cartesian controls

Chapter 1 - Coordinate system

A Cartesian Coordinate is a kind of value.
9.9 specifies a Cartesian Coordinate with parts tens and units.

Chapter 2 - Controls

A Cartesian Control is a kind of thing.
A Cartesian Crank is a kind of thing.
A Cartesian Meter is a kind of thing.

A Cartesian Control has a Cartesian Coordinate called the coordinate.

A Cartesian Meter has a Cartesian Control called the model.

A Cartesian Crank has a Cartesian Control called the model.
A Cartesian Crank has a Cartesian Meter called the meter.

A Cartesian Control has a text called the metal.
A Cartesian Control has a text called the letter.

Rule for printing the name of a Cartesian Crank (called c):
	let mod be the model of c;
	say "[metal of mod] crank".

Rule for printing the description of a Cartesian Crank (called c):
	let mod be the model of c;
	[ let metal be the metal of mod; ]
	say "The [metal of mod] crank is connected by a system of mobile rods to [the meter of c], which reads [i][value of mod][r]. I could turn it either clockwise or anticlockwise.";

To say value of (C - a Cartesian Control):
	say "[tens part of coordinate of C][units part of coordinate of C]";

Rule for printing the description of a Cartesian Meter (called m):
	let mod be the model of m;
	say "A glass cylinder capped with steel and engraved with a letter [letter of mod]. Inside are two revolving tumblers engraved with numerals (reading [i][value of mod][r]). Two piston-arms lead back to the [metal of mod] crank.";

Understand "cylinder" as a Cartesian Meter.

Does the player mean doing something with a Cartesian Meter: it is unlikely.
[ we can't fix overeager disambiguation properly, there are too many verb permutations and the parser is highly dim when it comes to this issue. Hmph. ]  

Part 10 - Heavy Things

A thing can be heavy. A thing is usually not heavy.

Printing the take event of something is an activity.
Printing the drop event of something is an activity.

After taking something heavy:
	begin the printing the take event activity with the noun;
	if handling the printing the take event activity with the noun:
		say "Taken.[paragraph break]";
	end the printing the take event activity with the noun;
	if the number of heavy things carried by the player is at least two:
		let the deadweight be the noun;
		while the deadweight is the noun
			repeatedly let the deadweight be a random heavy thing held by the player;
		carry out the printing the drop event activity with the deadweight;
		try silently dropping the deadweight;

Part 11 - Pointers

[Well, more 'spinners' really - anything with a settable pointer, such as the compass on the telescope mechanism.]

A pointer is a kind of thing.
A pointer has a direction called the way.

Part 12 - Action controls 

Chapter 1 - Model

A difference-engine model is a kind of thing. 
A difference-engine model has a number called the stored value.
A difference-engine model has an indexed text called the stored meaning.
A difference-engine model has a table-name called the word-table.

A difference-engine model can be phrase-viewed. A difference-engine model is usually not phrase-viewed.

A difference-engine model can be correctly set. A difference-engine model is usually not correctly set.

Chapter 2 - Controller

An abacus is a kind of thing. Understand "abacus", "steel", "gears", "beads", "tiny", "thin", "keyhole", "lock", "key hole", "hole" as an abacus.

Some fine chains are a kind of thing. Some fine chains are a part of every abacus. Understand "fine", "chains" as fine chains. The description of fine chains is "The chains are like woven silver. It's hard to believe they could serve any function, they're so delicate and small.".

Instead of taking or pulling or tying or touching fine chains:
	say "The chains are so delicate it might break them if I spoke too loudly in here!".

The printed name of an abacus is usually "abacus".

An abacus can be lockable. An abacus is usually lockable.
An abacus can be locked. An abacus is usually locked.

An abacus has a difference-engine model called the controlled model. 

Rule for printing the description of an abacus (called a):
	let n be the stored value of the controlled model of a;
	say "[one of]The abacus is fitted with tiny gears for beads, that interlock and lace with small teeth set into the frame. Fine chains run from the back and away into the Engine, as well as up to the signboard overhead. If I remember my Mathematik right the current number is [n]. There’s also a thin keyhole right at the top of the abacus.[or]The number of the abacus reads [n]. At the top of the abacus is a thin keyhole.[stopping]";

Check unlocking an unlocked abacus with something:
	say "The abacus is already unlocked. I wouldn’t want to shatter the key by turning it too hard." instead;

After unlocking an abacus with something:
	say "[one of]The abacus emits a series of tiny clicks as I turn the key: one by one, the gears are released from the frame. They tick themselves off, reporting for work.[or]The gears unlock themselves, one by one, in clockwork procession.[stopping]";

Chapter 3 - View

A display board is a kind of thing. Understand "painted", "display", "board", "words", "sign", "signboard" as a display board.
A display board has a difference-engine model called the viewed model.

Rule for printing the description of a display board (called db):
	let m be the viewed model of db;
	now m is phrase-viewed;
	say "[one of]Suspended over the abacus is a painted board, a little like the one they use for recording field-Canasta scores in the summer. Painted across its surface is the following unlikely message: [or]The board above the abacus reads [stopping]";
	say italic type;
	if db is the actor-display:
		say "ACTOR";
	else:
		say "ACTION";
	say " - '[stored meaning of m]'";
	if db is the action display:
		say roman type, paragraph break;
	else:
		say "[r].";

Before reading a display board:
	try examining the noun instead.

Instead of doing something when a display board is physically involved:
	say "It's well out of reach.";

Chapter 4 - Special action

Section 1 - Definition

Abacus-setting it to is an action applying to one thing and one number.
 
The abacus-setting it to action has a difference-engine model called the model being adjusted.

Understand "set [abacus]" as a mistake
	("I could set the abacus to a 5 digit number.");
Understand "turn [abacus]" as a mistake
	("I could set the abacus to a 5 digit number.");
Understand "push [abacus]" as a mistake
	("I could set the abacus to a 5 digit number.");
Understand "pull [abacus]" as a mistake
	("I could set the abacus to a 5 digit number.");
Understand "move [abacus]" as a mistake
	("I could set the abacus to a 5 digit number.");
Understand "change [abacus]" as a mistake
	("I could set the abacus to a 5 digit number.");

Understand "set [abacus] to [number]" as abacus-setting it to.
Understand "turn [abacus] to [number]" as abacus-setting it to.
Understand "push [abacus] to [number]" as abacus-setting it to.
Understand "move [abacus] to [number]" as abacus-setting it to.
Understand "change [abacus] to [number]" as abacus-setting it to.

Understand "set [abacus] to [text]" as a mistake
	("The abacus can only handle 5 digit numbers.").
Understand "turn [abacus] to [text]" as a mistake
	("The abacus can only handle 5 digit numbers.").
Understand "push [abacus] to [text]" as a mistake
	("The abacus can only handle 5 digit numbers.").
Understand "move [abacus] to [text]" as a mistake
	("The abacus can only handle 5 digit numbers.").
Understand "change [abacus] to [text]" as a mistake
	("The abacus can only handle 5 digit numbers.").

Setting action variables for abacus-setting something to:
	now the model being adjusted is the controlled model of the noun;

Section 2 - Verification

Check setting an abacus to: [the second noun has been parsed as an object in scope!]
	say "The abacus can only handle 5 digit numbers." instead;

Check abacus-setting an abacus to:
	if the number understood is less than 10000 or the number understood is greater than 99999:
		say "The abacus has five rows exactly, one for each digit." instead;

Check abacus-setting an abacus to:
	if the number understood is the stored value of the model being adjusted:
		say "The abacus is already set to [number understood]." instead;

Check abacus-setting a locked abacus to:
	say "[one of]I try moving the beads on the abacus but they’re all firmly fixed in place. Surely an abacus where you can’t move the beads is as much use as a clock where you have to move the hands?[or]The gears on the abacus won’t move.[stopping]";
	provide key-hint;
	stop the action;

Check abacus-setting an abacus to:
	if the model being adjusted is correctly set:
		say "I’ve got this part as good as it’s going to get, I think." instead;

Check abacus-setting an abacus to:
	unless "[the number understood]" exactly matches the regular expression "<1-9>{5}",
		say "The abacus doesn't have a setting for zero." instead;

Section 3 - Implementation

Carry out abacus-setting an abacus to:
	update the model being adjusted to the number understood;

To update (dm - a difference-engine model) to (n - number):
	change the stored value of dm to n;
	change the stored meaning of dm to the meaning calculated by dm;

To decide which indexed text is the meaning calculated by (dm - a difference-engine model):
	[we do so arithmetically rather than by converting to indexed text]
	let the meaning be indexed text;
	let n be the stored value of dm;
	assert that n is at least 11111 and n is at most 99999 issuing "Difference engine value out of range.";
	repeat with i running from 1 to 5:
		let l be the remainder after dividing n by 10;
		[l is now the least significant digit of n]
		choose row l in the word-table of dm; 
		if i is:
			-- 1: let the meaning be "[p5 entry]";
			-- 2: let the meaning be "[p4 entry] [meaning]";
			-- 3: let the meaning be "[p3 entry] [meaning]";
			-- 4: let the meaning be "[p2 entry] [meaning]";
			-- 5: let the meaning be "[p1 entry] [meaning]";
		let n be n minus l;
		let n be n divided by 10; [ -- hence dropping the final digit from n]
	decide on the meaning; 



Section 4 - Report

The correctness appraisal rules are an object-based rulebook.

Report abacus-setting an abacus to:
	say "[one of]I set the gears carefully, one by one, trying not to snap any of the tiny teeth along the bars of the frame. It’s a bit like teasing a comb through knotted hair and I don’t get much practice at that. [or]I set the gears quickly and carefully. [stopping]With a clatter, the words on the signboard overhead change. Now they read '[stored meaning of the model being adjusted]'[paragraph break]";
	now the model being adjusted is phrase-viewed;
	consider the correctness appraisal rules for the model being adjusted;
	if the rule succeeded:
		now the model being adjusted is correctly set;

Part 13 - Great Seals

A Great Seal is a kind of thing. A Great Seal is scenery.

Understand "great", "seal" as a Great Seal.

Instead of taking a Great Seal:
	say "It's enormous: so wide that if I lay down on it, I couldn't touch fingers and toes to its circumference."

Instead of entering a Great Seal:
	say "I'm already standing on the seal: it's hard not to."

Instead of entering a Great Seal when the player is lying:
	say "If I lay down I couldn't touch all the sides of it - but I'm not going to, I'd look silly."

Instead of examining the backdrop-floor when the player can see a Great Seal (called the seal nearby):
	say "([The seal nearby])[command clarification break]";
	try examining the seal nearby;

part 14 - Glimpse backdrops

A glimpse backdrop is a kind of backdrop. The description of a glimpse backdrop is usually "I can't see [the item described] right now."

Section 1 - Glimpses identify real objects

Identification relates various glimpse backdrops to one thing (called the true representation). The verb to identify (he identifies, they identify, he identified, it is identified, he is identifying) implies the identification relation.

Definition: a glimpse backdrop is matched-up if there is something identified by it.

A glimpse backdrop is usually privately-named. 

Rule for printing the name of an matched-up glimpse backdrop (called the image):
	say "[true representation of the image]";

[Understand "[something related by identification]" as a glimpse backdrop.]

[The Refectory-Glimpse is a glimpse backdrop, in the Kitchen, identifying the East Refectory. Instead of smelling the Refectory-Glimpse: say "It doesn't smell anything like as much as the kitchen does."]

[ This doesn't work because "matched-up" tests for things not rooms.... ]

Section 2 -  Interaction

Instead of doing something when a glimpse backdrop (called the far-off thing) is physically involved and the action is physical:
	say "I can't reach [the far-off thing] from where I am."

Instead of smelling a glimpse backdrop (called the far-off thing):
	say "I can't smell [the far-off thing] from here."

Instead of listening to a glimpse backdrop (called the far-off thing):
	say "I can't hear [the far-off thing] from here."

Section 3 - Approaching

Instead of approaching an matched-up glimpse backdrop (called the far-off thing):
	let N be a random thing identified by the far-off thing;
	let N be the location of N;
	if N is a room:
		let the way be the best route from the location to N, using doors;
		if the way is a direction, try going the way instead;
	continue the action;

Check approaching a glimpse backdrop (called the far-off thing):
	say "I can't see how to get to [the far-off thing]." instead;

Section 4 - Animate Glimpse Backdrops

An animate glimpse backdrop is a kind of glimpse backdrop.

Include (- has animate, -) when defining an animate glimpse backdrop.

Instead of asking an animate glimpse backdrop (called the far-off guy) about:
	say "I can't talk to [the far-off guy] from here." instead;

Section 5 - Does the player mean doing something with a glimpse backdrop - no

Does the player mean doing something with a glimpse backdrop: it is unlikely.


Section 6 - Locative Glimpse Backdrops

An locative glimpse backdrop is a kind of glimpse backdrop.

Localisation relates various locative glimpse backdrops to one room (called the true location). The verb to localise (he localises, they localise, he localised, it is localised, he is localising) implies the localisation relation.

Definition: a locative glimpse backdrop is matched-to if there is a room localised by it.

Rule for printing the name of an matched-to locative glimpse backdrop (called the image):
	say "[true location of the image]";

Understand "[something related by localisation]" as a locative glimpse backdrop.

Instead of approaching or entering an matched-to locative glimpse backdrop (called the far-off thing):
	let the way be the best route from the location to the true location of the far-off thing, using doors;
	if the way is a direction, try going the way instead;
	continue the action;

Instead of examining a matched-to locative glimpse backdrop (called far-off thing):
	let the way be the best route from the location to the true location of the far-off thing, using doors;
	if the way is a direction, say "[The far-off thing] [is-are] [way] from here." instead;
	continue the action;

Instead of doing something when a glimpse backdrop (called the far-off thing) is physically involved and the action is physical:
	say "I could hardly do that."

Part 15 - Brass rods on table

[ hardly worth a kind, but I've done it anyway .]

A brass rod is a kind of thing.  Understand "brass", "rod", "long", "pole", "metal" as the brass rod.

Instead of examining a brass rod: say "The rod runs the length of the table, and is punctuated by hourglasses at Holy Intervals along its length."

Instead of doing something when the brass rod is physically involved:
	say "The brass rod is fixed securely into the tabletop."

Book C - New Relations

Chapter 1 - Clustering

Clustering relates things to each other in groups.

The verb to be clustered with implies the clustering relation.

Chapter 2 - Pointing

Pointing relates a pointer (called the arrow) to a direction (called target) when the way of the arrow is the target.

The verb to point (he points, they point, he pointed) implies the pointing relation.

Instead of pushing a pointer to a direction:
	try direction-setting the noun to the second noun;

Instead of pushing a pointer:
	try turning the noun forwards;

Instead of pulling a pointer:
	try turning the noun backwards;

Chapter 3 - Inspection of Clutter

[What we're really keeping track of here is who was first to examine which items of clutter -- the player, or Covalt?]

Knowledge relates one person to various things.

The verb to remember (he remembers, they remember, he remembered) implies the knowledge relation. 

The verb to be remembered by implies the reversed knowledge relation.

Definition: a thing is inspected:
	if someone remembers it, yes;
	no;

Definition: a thing is uninspected:
	if it is inspected, no;
	yes;

Last after printing the description of an uninspected clutter thing (called junk):
	now the player remembers the junk;

Chapter 4 - Mirror rooms

[An unexpectedly awkward implementation.]

Section 1 - Mirroring Relation

The natural hemisphere is a direction that [never!] varies. The natural hemisphere is west.
[If a room has a hemisphere other than this, then the appearances of directions in the room description are horizontally mirrored.]

Mirroring relates one room to another (called the reflection).
The verb to mirror (he mirrors, they mirror, he mirrored) implies the mirroring relation.
The verb to be mirrored by implies the mirroring relation.

Section 2 - Mirrored rooms

A mirror-room is a kind of room.

A mirror-room has a direction called the hemisphere.
The hemisphere of a mirror-room is usually west.

A mirror-room can be first seen or second seen.
A mirror-room can be major or minor. A mirror-room is usually minor. [An untidy way of solving the problem of not duplicating the room descriptions, but no more untidy than the alternatives I tried. The 'major' version of the room is responsible for supplying both halves of the room description.]

A mirror-room has a text called the first description.
A mirror-room has a text called the second description.

Section 3 - Implementation

Before printing the description of an unvisited mirror-room (called m): 
	if the reflection of m is unvisited:
		now m is first seen;
		now the reflection of m is second seen;

Rule for printing the description of a mirror-room (called the room entered):
	let the controlling room be the room entered;
	if the room entered is minor, change the controlling room to the reflection of the room entered;
	if the room entered is first seen:
		say the first description of the controlling room, paragraph break;
	otherwise:
		say the second description of the controlling room, paragraph break;

Chapter 4 - Mirror items

Section 1 - Pairing Relation

Pairing relates one thing to another (called the partner).
The verb to pair (he pairs, they pair, he paired) implies the pairing relation.
The verb to be paired with implies the pairing relation.

Section 2 - Mirrored rooms

A mirror-thing is a kind of thing.

A mirror-thing has a direction called the hemisphere.
The hemisphere of a mirror-thing is usually west.

A mirror-thing can be examined or unexamined. A mirror-thing is usually unexamined.
A mirror-thing can be first seen or second seen.
A mirror-thing can be major or minor. A mirror-thing is usually minor.

A mirror-thing has a text called the first description.
A mirror-thing has a text called the second description.

Section 3 - Implementation

Before printing the description of an unexamined mirror-thing (called the item):
	now the item is examined;
	if the partner of the item is unexamined:
		now the item is first seen;
		now the partner of the item is second seen;

Rule for printing the description of a mirror-thing (called the item):
	let x be the item;
	if the item is minor, change x to the partner of the item;
	if the item is first seen:
		say the first description of x, paragraph break;
	otherwise:
		say the second description of x, paragraph break;

Book D - New actions

Part 1 - Polishing

Understand the command "rub" as something new.
Understand the command "polish" as something new.
Understand the command "clean" as something new.
Understand the command "dust" as something new.
Understand the command "scrub" as something new.
Understand the command "shine" as something new.
Understand the command "sweep" as something new.
Understand the command "wipe" as something new.

Polishing it with is an action applying to one thing and one carried thing and requiring light.

Understand "polish [something] with [something]" as polishing it with.
Understand "rub [something] with [something]" as polishing it with.
Understand "buff [something] with [something]" as polishing it with.
Understand "clean [something] with [something]" as polishing it with.
Understand "wipe [something] with [something]" as polishing it with.
Understand "dust [something] with [something]" as polishing it with.


Check polishing the player with:
	say "I'm not [i]that[r] dirty, and clock polish isn't going to get me clean!" instead;

Check polishing someone with:
	say "I don't suppose [the noun] would care for that." instead;

Check polishing something with:
	say "[The noun] seem[s] clean enough as [it-they] [is-are]." instead;


Part 1b - Cleaning

Cleaning is an action applying to one touchable thing and requiring light.

Understand "rub [something]" as cleaning.
Understand "dust [something]" as cleaning.
Understand "clean [something]" as cleaning.
Understand "wipe [something]" as cleaning.
Understand "polish [something]" as cleaning.
Understand "buff [something]" as cleaning.

Understand "wash [something]" as cleaning.
Understand "wash [something] with/in [something]" as polishing it with.

Understand "me/myself/you/yourself/wren/hair/hands/hand/self", "your/my hands/face/feet/self/hair" as "[myself]".

Understand "wash" as cleaning.
Understand "wash [myself]" as cleaning.
Understand "clean [myself] " as cleaning.

Rule for supplying a missing noun when cleaning:
	change the noun to the player;

Check cleaning:
	say "[The noun] seem[s] clean enough as [it-they] [is-are]." instead.

Check cleaning yourself:
	say "I'm not that dirty, and anyway, wash day isn't long now."


Part 2 - Hiding

Chapter 1 - Hiding Under

Hiding under is an action with past participle hidden, applying to one visible thing.

Understand "hide under/underneath/beneath/below [something]" as hiding under.

Carry out hiding under:
	do nothing;

Report hiding under:
	say "There's no need to hide right now.";

Chapter 2 - Hiding Inside

Hiding inside is an action with past participle hidden, applying to one thing.

Understand "hide in/inside [something]" as hiding inside.

Check hiding inside:
	if the noun is not an enterable container and the noun is not a door,
		say "There's no hiding in that!" instead;

Carry out hiding inside:
	do nothing;

Report hiding inside:
	say "There's no need to hide right now.";

Chapter 3 - Hiding Behind

Hiding behind is an action with past participle hidden, applying to one thing.

Understand "behind/under/underneath/below" as "[under]".

Understand "hide [under] [something]" as hiding behind.
Understand "walk [under] [something]" as hiding behind.
Understand "stand [under] [something]" as hiding behind.
Understand "go [under] [something]" as hiding behind.
Understand "get [under] [something]" as hiding behind.
Understand "crouch [under] [something]" as hiding behind.
Understand "creep [under] [something]" as hiding behind.

Carry out hiding behind:
	do nothing;

Report hiding behind:
	say "There's no need to hide right now.";

Chapter 4 - Hiding from view

Hiding from view is an action applying to nothing.

Understand "hide" as hiding from view.

Carry out hiding from view:
	do nothing;

Report hiding from view:
	say "There's no need to hide right now."

Understand "cower" as hiding from view.
Understand "shrink" as hiding from view.
Understand "shrink back/away" as hiding from view.

Chapter 5 - hiding from something

Hiding from is an action applying to one visible thing.

Understand "hide from [something]" as hiding from.
Understand "cower from [something]" as hiding from.
Understand "shrink from [something]" as hiding from.
Understand "shrink away/back from [something]" as hiding from.

Check hiding from someone:
	try hiding from view instead.

Check hiding from something:
	say "Some kind of wimp you are, hiding from [a noun]." instead.


Part 3 - Listening at and Listening with

Understand "listen at [something]" as listening to.

Listening with it to is an action applying to one thing and one visible thing.

Understand "listen to/at [something] with/using [something]" as listening with it to (with nouns reversed).
Understand "listen with/using [something]" as listening with it to.
Understand "listen with/using [something] to/at [something]" as listening with it to.

Rule for supplying a missing second noun when listening with something to:
	change the second noun to the location;

Report listening with it to:
	say "I hear nothing unexpected.";

Part 4 - Emptying / Pouring away

Emptying is an action applying to one thing.
The emptying action has a list of objects called the emptied items.

Understand "pour [something]" as emptying.
Understand "empty [something]" as emptying.
Understand "pour [something] out/away" as emptying.
Understand "pour out/away [something]" as emptying.

Emptying away something is an activity.

Setting action variables for emptying:
	change the emptied items to { };

Check emptying:
	if the noun is not a container,
		say "That doesn't contain anything." instead;

Check emptying:
	if the noun is closed and the noun is openable:
		say "(first opening the noun)[command clarification break]";
		try opening the noun;
		if the noun is closed, rule fails;

Check emptying:
	if the noun does not contain a thing,
		say "[The noun] is empty." instead;

Carry out emptying:
	repeat with x running through things held by the noun begin;
		begin the emptying away activity with x;
		if handling the emptying away activity with x begin;
			add x to the emptied items;
		end if;
		end the emptying away activity with x;
	end repeat;
	repeat with x running through emptied items begin;
		move x to the location;
	end repeat;

Report emptying:
	if the number of entries of emptied items is not 0 begin;
		say "I pour [emptied items with definite articles] onto the floor.";
	end if;

Part 5 - Filling

Filling is an action applying to one thing.
Understand "fill [something]" as filling.
Understand "fill up [something]" as filling.
Understand "fill [something] up" as filling.
Understand "fill [something] with [other things]" as inserting it into (with nouns reversed).
Understand "fill [something] up with water" as filling.
Understand "fill up [something] with water" as filling.
Understand "fill [something] with water" as filling.

Check filling:
	if the noun is not a container,
		say "That can't contain anything." instead;
	
Check filling:
	if the noun is closed and the noun is openable begin;
		say "(first opening the noun)[command clarification break]";
		try opening the noun;
		if the noun is closed, rule fails;
	end if;

Check filling:
	say "I've got nothing to put into [the noun]." instead;

Part 5b - Inflating

Inflating is an action applying to one thing.
Understand "inflate [something]" as inflating.
Understand "blow up [something]" as inflating.
Understand "blow into [something]" as inflating.
Understand "blow [something] up" as inflating.
Understand "inflate [something] with [something]" as inserting it into (with nouns reversed).

Check inflating:
	say "That doesn't seem to readily inflate." instead;

Part 6 - Looking through

[LOOK THROUGH usually generates the "search" action, as in "look through pile of books." But mostly in this game we want to "look through window" or "look through keyhole"... ]

Looking through is an action applying to one visible thing.
Understand "look through [door]" as looking through.
Understand "look through [container]" as looking through.
Understand "look through [eyeable thing]" as looking through.
Understand "look out through [door]" as looking through.
Understand "look out through [container]" as looking through.
Understand "look out through [eyeable thing]" as looking through.
[ ...And anything else is "search" as normal. ]

Carry out looking through:
	try examining the noun instead.

Part 7 - Climbing

Understand "climb over/through [something]" as climbing.

Climbing down is an action applying to one thing.
Climbing up is an action applying to one thing.

Understand "climb up [something]" as climbing up.
Understand "ascend [something]" as climbing up.
Understand "climb down [something]" as climbing down.
Understand "descend [something]" as climbing down.

[Handle "climb up" and "climb down" by themselves as attempts to go up / down] 
Before climbing:
	if the noun is up, try going up instead.
Before climbing:
	if the noun is down, try going down instead.

[In the general case, convert to straightfoward 'climbing'.]
Carry out climbing down something: try climbing the noun instead.
Carry out climbing up something: try climbing the noun instead.

Part 8 - Lying (down) on 

Understand "lie on/across/over [supporter]" as entering.
Understand "lie down on [supporter]" as entering.
Understand "sprawl on/across/over [supporter]" as entering.

Part 9 - Reading

A thing has some text called the reading matter. The reading matter of a thing is usually "". 

The conditional redirect reading to examining rule is listed instead of the redirect reading to examining rule in the check reading rulebook.

This is the conditional redirect reading to examining rule:
	if the reading matter of the noun is "",
		try examining the noun instead;

Carry out reading:
	do nothing;

Report reading: 
	say "[reading matter of the noun][line break]";

Part 10 - Repairing

Repairing is an action applying to one thing.

Understand the command "fix" as something new. [rather than as a synonym for "tie"]

Understand "repair [something]" as repairing.
Understand "fix [something]" as repairing.
Understand "mend [something]" as repairing.

Check repairing:
	say "That doesn't need to be repaired." instead;

Part 10B - Replacing

Understand "replace [something] with [something]" as putting it on (with nouns reversed).


Part 12 - Clock-setting

["Setting it to" is the fallback case for this action.]

Clock-setting it to is an action applying to one thing and one time. The clock-setting it to action has a time called the adjusted time understood.
Understand "set [clock] to/at [time]" as clock-setting it to.
Understand "turn [clock] to/at [time]" as clock-setting it to.
Understand "turn [clock] to/at [text]" as setting it to.

Setting action variables for clock-setting:
	if the time understood is before 12:00 PM or the time understood is after 11:59 PM begin;
		change the time understood to 12 hours after the time understood;
	end if;

Check clock-setting a clock to:
	if the face value of the noun is the time understood + 1 minute,
		say "The clock's already on [time understood in words], thankfully enough." instead;

Carry out clock-setting a clock to:
	set the noun to the time understood;

Report clock-setting a clock to:
	say "I turn the clock hands to [the time understood in words].";

Check setting a clock to:
	say "I didn't understand that time." instead;

Part 13 - Direction-setting

[Again, "setting it to" is the fallback case.]

Understand the command "flip" as "turn".

Direction-setting it to is an action applying to one thing and one visible thing.
Understand "set [pointer] to/at [planar direction]" as direction-setting it to.
Understand "set [pointer] [planar direction]" as direction-setting it to.
Understand "turn [pointer] to/at [planar direction]" as direction-setting it to.
Understand "turn [something] to/at [text]" as setting it to.
Understand "turn [pointer] [planar direction]" as direction-setting it to.
Understand "turn [something] [text]" as setting it to.
Understand "point [pointer] to/at [planar direction]" as direction-setting it to.
Understand "point [something] to/at [text]" as setting it to.
Understand "point [pointer] [planar direction]" as direction-setting it to.
Understand "point [something] [text]" as setting it to.
Understand "spin [pointer] to/at [planar direction]" as direction-setting it to.
Understand "spin [something] to/at [text]" as setting it to.
Understand "rotate [pointer] to/at [planar direction]" as direction-setting it to.
Understand "rotate [pointer] [planar direction]" as direction-setting it to.
Understand "rotate [something] to/at [text]" as setting it to.
Understand "move [pointer] to/at [planar direction]" as direction-setting it to.
Understand "move [pointer] [planar direction]" as direction-setting it to.
Understand "move [something] to/at [text]" as setting it to.

Carry out direction-setting to:
	now the way of the noun is the second noun;

Report direction-setting to:
	say "I rotate [the noun] until it points [second noun].";

Part 13 B - Number-setting

Number-setting it to is an action applying to one thing and one number.

Understand "set [thing] to/at [number]" as number-setting it to.
Understand "turn [thing] to/at [number]" as number-setting it to.
Understand "dial [thing] to/at [number]" as number-setting it to.
Understand "change [thing] to/at [number]" as number-setting it to.
Understand "point [thing] to/at [number]" as number-setting it to.
Understand "move [thing] to/at [number]" as number-setting it to.

Check number-setting it to:
	say "I can't set [the noun] to anything!" instead.

Part 14 - Ringing

Ringing is an action applying to one thing.

Understand "ring [something]" as ringing.

Check ringing:
	say "I can't see how to make that ring." instead;

Part 15 - Using

[Ganked from Example 257, 'Alpaca Farm'. ]

Using is an action applying to one thing.

Check using:
	say "You will have to be more specific about what you want me to do." instead.

Using it with is an action applying to two things.

Check using something with something:
	say "You will have to be more specific about what you want me to do." instead.

Understand "use [an edible thing]" as eating. 
Understand "use [a wearable thing]" as wearing. 
Understand "use [something preferably held] on/with [a locked lockable thing]" as unlocking it with (with nouns reversed).
Understand "use [something preferably held] on/with [an unlocked lockable thing]" as locking it with (with nouns reversed). 
Understand "use [a switched off device]" as switching on. 
Understand "use [a door]" as entering. [Automatically opening it as necessary.]
Understand "use [something] on/with [something]" as using it with.
Understand "use [something]" as using.

[Change 'use <something> to foo' into 'foo with <something>'

e.g.
USE TARPAULIN TO WRAP PIPE becomes WRAP PIPE WITH TARPAULIN
USE TUMBLER TO LISTEN AT KEYHOLE becomes LISTEN AT KEYHOLE WITH TUMBLER
]

After reading a command: 
	let N be indexed text;
	let N be the player's command; 
	replace the regular expression "\buse (.+?) to (.+)" in N with "\2 with \1", case insensitively; 
	change the text of the player's command to N. 

Understand the command "try" and "employ" as "use".

Part 16 - Scraping

Chapter 1 - Scraping

Scraping is an action applying to one thing, and requiring light.

Understand "scrape [something]" as scraping.
Understand "scrape [something] up/off/away" as scraping.
Understand "scrape up/off/away [something]" as scraping.

Understand the command "scratch" as "scrape".

Check scraping:
	say "I can't see a need to scrape [if the noun is plural-named]those[otherwise]that[end if]." instead;

Chapter 2 - Scraping with

Scraping it with is an action applying to one thing and one carried thing, and requiring light.

Check scraping something with something unsuitable for scraping:
	say "That's not much use for scraping things with." instead;

Check scraping something with:
	say "I can't see a need to scrape [if the noun is plural-named]those[otherwise]that[end if]." instead;

Understand "get [something] with [something preferably held]" as scraping it with.
Understand "scrape [something] with [something preferably held]" as scraping it with.
Understand "scrape [something] up/off/away with [something preferably held]" as scraping it with.
Understand "scrape up/off/away [something] with [something preferably held]" as scraping it with.

Understand "take [something] with [something]" as scraping it with.

Part 17 - Cutting it with

Understand the command "cut" as something new.

Slicing it with is an action applying to one thing and one carried thing, and requiring light.

Understand "cut [something] with [something preferably held]" as slicing it with.

First check slicing:
	if the second noun is not the knife,
		say "There's no cutting edge on that!" instead;
	continue the action;

Check slicing the player with something:
	say "I'm not going to hurt myself!" instead.

Check an actor slicing (this is the block slicing rule):
	stop the action with library message cutting action number 1 for the noun;

Part 18 - Turning backwards and forwards

Turning it forwards is an action applying to one thing, and requiring light..

Understand "turn [something] [clockwise]" as turning it forwards.

Turning it backwards is an action applying to one thing, and requiring light..

Understand "forward/forwards/clockwise/right" as "[clockwise]".
Understand "back/backward/backwards/anticlockwise/counterclockwise/counter-clockwise/widdershins/left"  as "[widdershins]".

Understand "turn [something] [widdershins]" as turning it backwards.

[In most cases we aren't worried about handedness, even if the player does specify:]

Carry out turning something forwards:
	try turning the noun instead;

Carry out turning something backwards:
	try turning the noun instead;

Turning something is rotating.
Turning something forwards is rotating.
Turning something backwards is rotating.

Section 2 - Turning repeatedly

[ We don't create a new action for this unless it has a number specified: rather, we allow the player to add" junk" on the end of the command, which we pick up using "player's command includes" later on. ]

Understand "once/twice/thrice" or "a lot" or "repeatedly" or "several/many time/times/turn/turns" as "[repeatedly]".
Understand "[number] time/times/turn/turns" as "[n-repeatedly]".
Understand "[number] time/times/turn/turns round/around/over" as "[n-repeatedly]".

Understand "turn [something] [repeatedly]" as turning it forwards.
Understand "turn [something] [clockwise] [repeatedly]" as turning it forwards.
Understand "turn [something] [widdershins] [repeatedly]" as turning it backwards.

Turning it forwards repeatedly is an action applying to one thing and one number, and requiring light.
Turning it backwards repeatedly is an action applying to one thing and one number, and requiring light.

Understand "turn [something] [n-repeatedly]" as turning it forwards repeatedly.
Understand "turn [something] [clockwise] [n-repeatedly]" as turning it forwards repeatedly.
Understand "turn [something] [widdershins] [n-repeatedly]" as turning it backwards repeatedly.

First before turning something forwards repeatedly:
	now the number of turns to make is the number understood;
	try turning the noun forwards instead.

First before turning something backwards repeatedly:
	now the number of turns to make is the number understood;
	try turning the noun backwards instead.

The number of turns to make is a number that varies.
Every turn: now the number of turns to make is 0.

The first before turning something forwards:
	assign the number of turns.
The first before turning something backwards:
	assign the number of turns.
The first before turning something:
	assign the number of turns.

To assign the number of turns:
	if the player's command includes "once":
		now the number of turns to make is 1;
	else if the player's command includes "twice":
		now the number of turns to make is 2;
	else if the player's command includes "thrice":
		now the number of turns to make is 3;
	else if the player's command includes "lot/repeatedly/several/many":
		now the number of turns to make is a random number between 2 and 5;
[	say "***Setting the number of turns to make to [the number of turns to make]***.";		]

Part 19 - Knocking

Knocking on is an action applying to one thing, and requiring light..
Understand "knock [something]" as knocking on.
Understand "knock on [something]" as knocking on.
Understand "knock over [something]" as pushing.
Understand "tap [something]" as knocking on.
Understand "tap on [something]" as knocking on.


Carry out knocking on:
	do nothing;

Report knocking on a closed thing:
	say "Knock, knock!" instead;

Report knocking on a closed door:
	say "Knock, knock!" instead;

Report knocking on:
	say "Nothing obvious happens." instead;

Part 20 - Waking

Check waking an awake person:
	say "That seems unnecessary." instead;

Check waking an asleep person:
	say "Better not disturb [if male]him[otherwise if female]her[otherwise]it[end if]." instead;

The block waking rule is not listed in any rulebook.




Part 22 - Jumping off, jumping on                

Jumping off is an action applying to one thing, and requiring light.
Jumping on is an action applying to one thing, and requiring light.
Jumping over is an action applying to one thing, and requiring light.

Understand "jump off [something]" as jumping off.
Understand "jump out of [something]" as jumping off.

Understand "jump on/onto/to [something]" as jumping on.
Understand "jump on to [something]" as jumping on.

Understand "jump through [something]" as jumping over.
Understand "jump [something]" as jumping over.
Understand "jump over [something]" as jumping over.
Understand "swing over [something]" as jumping over.

Understand "jump in to [something]" as entering.

Check jumping off:
	say "That would seem foolish.";

Check jumping on:
	say "That would seem foolish.";

Check jumping over:
	say "That would seem foolish.";

Part 23 - Falling

Falling is an action applying to nothing.

Understand "fall" as falling.
Understand "fall down" as falling.
Understand "fall over" as falling.

Check falling:
	say "I'd rather stay standing!";

Part 24 - Screwing and Unscrewing

Chapter 1 - Screwing

Understand the command "screw" as something new.
Understand the command "unscrew" as something new.

Screwing it in with is an action applying to one thing and one carried thing.

Understand "screw [something] in with [something preferably held]" as screwing it in with.
Understand "screw in [something] with [something preferably held]" as screwing it in with.
Understand "screw [something] with [something preferably held]" as screwing it in with.
Understand "tighten [something] with [something preferably held]" as screwing it in with.
Understand "screw [something]" as screwing it in with.
Understand "screw in [something]" as screwing it in with.
Understand "screw [something] in" as screwing it in with.
Understand "tighten [something]" as screwing it in with.

Check screwing something in with something unsuitable for screwing:
	say "That's not much use for tightening things with." instead;

Check screwing something in with something:
	say "That doesn't need tightening." instead;

Chapter 2 - Unscrewing

Unscrewing it with is an action applying to one thing and one carried thing.

Understand "unscrew [something] with [something preferably held]" as unscrewing it with.
Understand "untighten [something] with [something preferably held]" as unscrewing it with.
Understand "loosen [something] with [something preferably held]" as unscrewing it with.
Understand "undo [something] with [something preferably held]" as unscrewing it with.
Understand "unscrew [something]" as unscrewing it with.
Understand "untighten [something]" as unscrewing it with.
Understand "loosen [something]" as unscrewing it with.
Understand "undo [something]" as unscrewing it with.

Understand "turn [something] with [something preferably held]" as unscrewing it with.

Check unscrewing something with something unsuitable for screwing:
	say "That's not much use for loosening things with." instead;

Check unscrewing something with something:
	say "That doesn't need to be loosened." instead;

Part 25 - Untying

Untying it from is an action applying to two things.

Understand "untie [something]" as untying it from.
Understand "unfasten [something]" as untying it from.
Understand "release [something]" as untying it from.
Understand "loose [something]" as untying it from.
Understand "launch [something]" as untying it from.
[ Understand "remove [something]" as untying it from. ]

Understand "untie [something] from [something]" as untying it from.
Understand "unfasten [something] from [something]" as untying it from.
Understand "release [something] from [something]" as untying it from.
Understand "loose [something] from [something]" as untying it from.
Understand "launch [something] from [something]" as untying it from.
[ Understand "remove [something] from [something]" as untying it from. ]

Check untying something from:
	say "[The noun] [is-are]n't tied up." instead;

Rule for supplying a missing second noun when untying something from:
	if the noun is the player, say "I'm not ";
	else say "[The noun] [is-are]n't ";
	say "tied to anything."

Part 26 - Wrapping

Wrapping it with is an action applying to two things.

Understand "wrap [something] with [something]" as wrapping it with.
Understand "wrap [something] around [something]" as wrapping it with (with nouns reversed).
Understand "cover [something] with [something]" as wrapping it with.

Check wrapping something with something unsuitable for wrapping:
	say "[The second noun] [is-are] not much use for wrapping things with." instead;

Check wrapping something with something:
	say "[The second noun][s-are] good for covering things, but there's no reason to cover what doesn't need covering." instead;

Part 27 - Putting Against

Putting it against is an action applying to one carried thing and one thing.

Understand "put [something preferably held] up to/against/at [something]" as putting it against.
Understand "put [something preferably held] to/against/at [something]" as putting it against.

Understand "hold [something preferably held] up to/against/at [something]" as putting it against.
Understand "hold [something preferably held] to/against/at [something]" as putting it against.

Understand "place [something preferably held] up to/against/at [something]" as putting it against.
Understand "place [something preferably held] to/against/at [something]" as putting it against.

Check putting something against something:
	say "That doesn't seem to achieve anything.";

Part 28 - Ask / Tell about objects in the game world

[We only use this for 'clutter' - that is to say, items in the Clock Shop.]

Enquiring of it about is an action applying to two things.

Understand "tell [someone] about [something worthy of inspection]" as enquiring of it about.
Understand "ask [someone] about [something worthy of inspection]" as enquiring of it about.

Understand "tell [someone] [something worthy of inspection]" as enquiring of it about.
Understand "ask [someone] [something worthy of inspection]" as enquiring of it about.

Understand "tell [someone] [text]" as telling it about.
Understand "explain [text] to [someone]" as telling it about (with nouns reversed).
Understand "explain about/that [text] to [someone]" as telling it about (with nouns reversed).
Understand "explain to [someone] that/about [text]" as telling it about.
Understand "explain to [someone] [text]" as telling it about.
Understand "ask [someone] [text]" as asking it about.

Report enquiring of someone about something:
	say "There is no reply.";

Part 29 - Lying Down

[No detailed model of posture is required, merely the ability to distinguish between 'stand on', 'sit down on', 'lie down on' and 'enter'.]

Lying down on is an action applying to one thing.

Understand "lie on/in [something]" as lying down on.
Understand "lie down on/in [something]" as lying down on.

Carry out lying down on something:
	now the player is lying;
	try entering the noun instead;

Instead of lying on something:
	try lying down on the noun.

Part 30 - Attacking it with

Attacking it with is an action applying to one thing and one carried thing.

Understand "attack [something] with [something preferably held]" as attacking it with.
Understand "bash [something]" as attacking.
Understand "bash [something] with [something preferably held]" as attacking it with.
Understand "kick [something]" as attacking.
Understand "kick [something] with [something preferably held]" as attacking it with.
Understand "wallop [something]" as attacking.
Understand "wallop [something] with [something preferably held]" as attacking it with.
Understand "strike [something]" as attacking.
Understand "strike [something] with [something preferably held]" as attacking it with.
Understand "batter [something]" as attacking.
Understand "batter [something] with [something preferably held]" as attacking it with.
Understand "batter down/through [something]" as attacking.
Understand "batter down/through [something] with [something preferably held]" as attacking it with.
Understand "batter [something] down" as attacking.
Understand "batter [something] down with [something preferably held]" as attacking it with.
Understand "stop [something]" as attacking.
Understand "stop [something] with [something preferably held]" as attacking it with.
Understand "beat [something] with [something preferably held]" as attacking it with.
Understand "beat down [something] with [something preferably held]" as attacking it with.
Understand "beat [something] down with [something preferably held]" as attacking it with.
Understand "break [something] with [something preferably held]" as attacking it with.
Understand "break down/up [something] with [something preferably held]" as attacking it with.
Understand "break [something] down/up with [something preferably held]" as attacking it with.
Understand "destroy [something] with [something preferably held]" as attacking it with.
Understand "hit [something] with [something preferably held]" as attacking it with.
Understand "pound [something] with [something preferably held]" as attacking it with.
Understand "pummel [something] with [something preferably held]" as attacking it with.
Understand "punch [something] with [something preferably held]" as attacking it with.
Understand "smash [something] with [something preferably held]" as attacking it with.
Understand "smash down/up/through [something] with [something preferably held]" as attacking it with.
Understand "smash [something] down/up with [something preferably held]" as attacking it with.
Understand "thump [something] with [something preferably held]" as attacking it with.

Understand "beat up [person] with [something preferably held]" as attacking it with.
Understand "beat [person] up with [something preferably held]" as attacking it with.
Understand "kill [person] with [something preferably held]" as attacking it with.
Understand "murder [person] with [something preferably held]" as attacking it with.
Understand "maim [person] with [something preferably held]" as attacking it with.

Check attacking something with:
	say "Violence breaks clocks, but rarely fixes them." instead;



Part 31 - Running

[For the sake of a quick gag in North Side of the Warehouse:]

Understand the command "run" as something new.

Running is an action applying to one visible thing.

Understand "run" as running.
Understand "run [direction]" as running.

[ Otherwise, "run" means "out". ]

Rule for supplying a missing noun when running:
	change the noun to outside.

Carry out running:
	try going the noun instead;

Part 32 - Swimming & Diving

Understand "swim [direction]" as going when the location is an underwater room.

Part 33 - Breathing 

Understand "breathe" as smelling.
Understand "breathe [something]" as smelling.
Understand "breathe in" as smelling.
Understand "breathe in [something]" as smelling.
Understand "breathe [something] in" as smelling.

Part 33b - Flying

Flying is an action applying to nothing.
Understand "fly" as flying.
Check flying:
	say "They called me Wren, but that's only what they called me." instead.

Part 34 - Tying it to is called Fastening

Fastening it to is an action applying to one carried thing and one thing.

Understand the command "tie" as something new.
Understand the command "attach" as something new.
Understand the command "fasten" as something new.

Understand "tie [something preferably held] to [something]" as fastening it to.
Understand "attach [something preferably held] to [something]" as fastening it to.
Understand "fasten [something preferably held] to [something]" as fastening it to.

Carry out fastening something to something:
	do nothing;

The block tying rule is listed last in the report fastening it to rulebook.

Part 35 - Standing it up

Standing it up is an action applying to one thing.

Understand "stand [something]" as standing it up.
Understand "stand [something] up" as standing it up.
Understand "stand up [something]" as standing it up.

Understand "erect [something]" as standing it up.

Understand "prop [something]" as standing it up.
Understand "prop [something] up" as standing it up.
Understand "prop up [something]" as standing it up.

Check standing something up:
	say "That doesn't seem to achieve anything.";

Part 36 - Making the sign of

Making the sign of is an action applying to one visible thing.

Understand "make the sign of [any clock-sign]" as making the sign of.
Understand "make sign of [any clock-sign]" as making the sign of.

Understand "make the sign of [text]" as a mistake ("That's not a Holy Sign: to do that might get me struck by a counterweight.").
Understand "make sign of [text]" as a mistake ("That's not a Holy Sign: to do that might get me struck by a counterweight.").

Check making the sign of something when the noun is not a clock-sign:
	say "That's not a Holy Sign: to do that might get me struck by a counterweight." instead.

Carry out making the sign of a clock-sign:
	do nothing.

Report making the sign of a clock-sign:
	say "I quietly make the sign of the [i][noun][r]." instead;

Report making the sign of a clock-sign when the player can see Doric and the faith flag of Doric is false:
	say "I quietly make the sign of the [i][noun][r]. Doric looks unimpressed." instead;

Understand "pray" as making the sign of.
Understand "kneel" as making the sign of.
Understand "bow" as making the sign of.
Understand "genuflect" as making the sign of.


Rule for supplying a missing noun for making the sign of:
	change the noun to a random clock-sign.

Chapter 1 - Signs the player can make

A clock-sign is a kind of thing. Understand "sign" as a clock-sign.

The winding-key-sign is a clock-sign. Understand "winding key", "key" as the winding-key-sign. The printed name of the winding-key-sign is "winding key".
The sad-depreciation-sign is a clock-sign. Understand "sad depreciation", "depreciation" as the sad-depreciation-sign. The printed name of the sad-depreciation-sign is "sad depreciation".
The winding-gear-sign is a clock-sign. Understand "winding gear", "gear" as the winding-gear-sign. The printed name of the winding-gear-sign is "winding gear".
The penduluum-sign is a clock-sign. Understand "pendulum/penduluum" as the penduluum-sign. The printed name of the penduluum-sign is "penduluum".
The lever-sign is a clock-sign. Understand "lever" as the lever-sign. The printed name of the lever-sign is "lever".
The screw-sign is a clock-sign. Understand "screw" as the screw-sign. The printed name of the screw-sign is "screw".


Part 38 - Sharpening

Sharpening is an action applying to one thing.

Understand "sharpen [something]" as sharpening.

Check sharpening:
	say "That doesn't need to be sharpened." instead;

Part 39 - Entering - lying down, standing on

Yourself can be lying, clambering, sitting or entering-normally.

Understand "go out of [something]" as entering.
Understand "sit down on [something]" as entering.
Understand "climb out of [something]" as getting off.

Before reading a command:
	now the player is entering-normally;

Before entering:
	if the player's command includes "lie on/down":
		now the player is lying;
	if the player's command includes "sit on/down":
		now the player is sitting;
	if the player's command includes "stand on/in":
		now the player is clambering;


Part 40 - Kind of action - making to leave

[ used for exit/go out ]

Exiting is making to leave.
Going outside is making to leave.


Part 41 - Shouting at

Shouting at is an action applying to one visible thing.

Understand "shout at/to [someone]" as shouting at.
Understand "call to/at/over [someone]" as shouting at.
Understand "shout at/to [something]" as shouting at.
Understand "call to/at/over [something]" as shouting at.

Understand the command "yell" as "shout".
Understand the command "scream" as "shout".
Understand the command "cry" as "shout".
Understand the command "bellow" as "shout".
Understand the command "wail" as "shout".
Understand the command "yelp" as "shout".

Check shouting at something which is not a person:
	say "There's no use shouting at [a noun]." instead.

Check shouting at yourself:
	say "[i]Idiot, Wren[r]." instead;

Check shouting at someone:
	say "My shout is more like a squeak." instead;

Part 42 - Jamming

Understand "jam [something] with [something preferably held]" as inserting it into (with nouns reversed).
Understand "stop [something] with [something preferably held]" as inserting it into (with nouns reversed).
Understand "jam [something]" as attacking.
Understand "stop [enormous penduluum]" as attacking.

Part 43 - Typing

Typing on is an action applying to one thing.

Understand "type on [something]" as typing on.

Check typing on:
	say "That's not something I could type on." instead.

Part 44 - Melting

Melting it on is an action applying to two things.

Understand "melt [something] on [something]" as melting it on.
Understand "light [something] from/on/with [something]" as melting it on.
Understand "burn [something] on/with [something]" as melting it on.

Check melting it on:
	say "I can't melt [the noun]!" instead.

Part 48 - Asking with no NPC

Asking no-one in particular about is an action applying to one topic.
Telling no-one in particular about is an action applying to one topic.

Understand "ask about [text]" as asking no-one in particular about.
Understand "a [text]" as asking no-one in particular about.
Understand "a about [text]" as asking no-one in particular about.
Understand "tell about [text]" as telling no-one in particular about.
Understand "t [text]" as telling no-one in particular about.
Understand "explain [text]" as telling no-one in particular about.
Understand "explain about [text]" as telling no-one in particular about.
Understand "t about [text]" as telling no-one in particular about.
Understand "quote [text]" as telling no-one in particular about.
Understand "talk about [text]" as telling no-one in particular about.

Definition: a person is a human if they are a man or they are a woman.

Definition: a person is conversationally available if they are visible and they are enclosed by the location and they are not the player.

Check asking no-one in particular about:
	if the number of conversationally available people is zero:
		say "I'm not mad enough yet to talk to myself." instead;
	if the number of conversationally available people is one:
		[ ask a person or animal if there's only one ]
		try asking a random conversationally available  person about the topic understood instead;
	if the number of conversationally available human people is one:
		[ otherwise, if there's a human and an animal, go for the human ]
		try asking a random conversationally available human person about the topic understood instead;
	[otherwise, list the humans only ]
	say "I'll have to decide who to say that to: [the or-separated list of visible human people]." instead;

Check telling no-one in particular about:
	try asking no-one in particular about the topic understood instead.

Understand "talk to [someone] about [something worthy of inspection]" as enquiring of it about.
Understand "talk to [someone] about [text]" as telling it about.
Understand "quote [text] to/at [someone]" as telling it about (with nouns reversed).

Check answering it that (this is the divert to just asking rule):
	try asking the noun about the topic understood instead.

Part 48b - Talk To Someone

[ we implement Talk To as TELL ABOUT <a topic>, where the topic steps through a preset list of simple topics - what a dull interlocutor Wren is! Ideally, this list might be slightly randomised and/or pulled from the conversation tables, but this will probably do. In the end, anyway, we encourage the player to make their own suggestion. 

The clunky implementation comes from not finding a variable type that would let me do this more generally!
]

A person has a number called the standard conversation position.

Check talking to someone (called the NPC):
	increase the standard conversation position of the NPC by 1;
	if the standard conversation position of the NPC is:
		-- 0:
			say "(about clockwork)[command clarification break]";
			try telling the NPC about "clockwork" instead;
		-- 1:
			say "(about me)[command clarification break]";
			try telling the NPC about "my story" instead;
		-- 2:
			say "(about [him or her for the NPC]self)[command clarification break]";
			try asking the NPC about "themselves" instead;
		-- 3:
			say "(about the Figure in Grey)[command clarification break]";
			try telling the NPC about "figure" instead;
	say "You'll have to tell me what to talk to [him or her for the NPC] about. I'm out of ideas!" instead;	
	

Part 49 - Go To Something, go

[ currently, we implement this only for glimpsed backdrops. Ideally we extend to cover locations in the currently vicinity, however the hell we define that! ]

Approaching is an action applying to one visible thing.

Understand "go near/to/after/toward/for/towards [something]" as approaching.
Understand "follow [something]" as approaching.
Understand "jump after [something]" as approaching.
Understand "approach [something]" as approaching.
Understand "chase [something]" as approaching.
Understand "close on [something]" as approaching.
Understand "close in on [something]" as approaching.
Understand "walk near/after/towards/to/for [something]" as approaching.
Understand "walk near/over to/toward/towards [something]" as approaching.
Understand "go near/over to/toward/towards [something]" as approaching.

Understand "go along/across/over [something]" as entering.
Understand "walk along/over/across [something]" as entering.

Understand "jump [direction]" as going.


Understand "go the same way as [something]" as approaching.
Understand "go in the direction of [something]" as approaching.
Understand "go in direction of [something]" as approaching.

Check approaching something (this is the block approaching rule):
	say "[The noun] [is-are] right here already!" instead.

First for supplying a missing noun when going (this is the vaguely going is going out rule):
	change the noun to outside.

Part 50 - Looking up without a catalogue

Researching is an action applying to one topic.

Understand "research [text]" as researching.
Understand "look up [text]" as researching.
Understand "read about [text]" as researching.

Check researching:
	say "There's nowhere to look that up in."


Part 51 - Extinguishing

[ This is purely because people type it - the game never needs it to work. We use "lit" to decide if the player has asked something stupid or not. ]

Extinguishing it with is an action applying to two touchable things and requiring light.

Understand "extinguish [something]" as extinguishing it with.
Understand "extinguish [something] with [something]" as extinguishing it with.
Understand the command "douse", "dowse" as "extinguish".
Understand "put out [something]"  as extinguishing it with.
Understand "put out [something] with [something]"  as extinguishing it with.
Understand "blow out [something]"  as extinguishing it with.
Understand "blow out [something] with [something]"  as extinguishing it with.

Rule for supplying a missing second noun when extinguishing something with:
	change the second noun to the player.

Check extinguishing something with:
	say "[The noun] [is-are]n't on fire." instead.

Check extinguishing a lit thing with:
	say "I don't want to put out [the noun]." instead.

Part 52 - Undressing

[ Another action purely for colour .]

Undressing is an action applying to nothing.

Understand "disrobe" as undressing.
Understand "disrobe [me]" as undressing.
Understand "remove clothes/clothing" as undressing.
Understand "remove my/your clothes/clothing" as undressing.
Understand "take off my/your clothes/clothing" as undressing.
Understand "take my/your clothes/clothing off" as undressing.
Understand "take clothes/clothing off" as undressing.

Check undressing:
	say "No thanks[one of]. These clothes are the best I've got (and pretty much the only, too.)[or].[stopping]" instead.

Book D2 - Synonyms


Part 1 - Winding and setting are synonyms for turn

Understand the command "wind" as "turn".
Understand "wind up [something]" as turning.
Understand "set [something]" as turning.

Part 2 - Add something to

Understand "add [something preferably held] to [container]" as inserting it into.
Understand "add [something preferably held] to [supporter]" as putting it on.
Understand "add [something preferably held] to [something]" as inserting it into.
Understand "extend [something] with [something preferably held]" as putting it on (with nouns reversed).

Part 3 - Covering

Understand the command "cover" as something new.

Understand "cover [something]" as closing.
Understand "cover up [something]" as closing.
Understand "cover [something] up" as closing.

Understand "hand/hands", "my/your/one/both hand/hands" as "[hands]".

Understand "cover [something] with [hands]" as touching.

Understand "cover [something] with [something]" as putting it on (with nouns reversed).

Understand "put [hands] on/over [something]" as touching.

Understand "put [something] over [something]" as putting it on.



Part 4 - Synonyms for drink

Understand "drink from [something]" as drinking.

Part 5 - Synonyms for getting off

Understand "leave [something]" as getting off.
Understand "get out of [something]" as getting off.
Understand "depart [something]" as getting off.



Part 6 - Synoynms for squeeze


Understand the command "crush" as "squeeze".

Understand "pulverise [something]" as squeezing.
Understand "pulverize [something]" as squeezing.

Part 7 - Synonyms for put

Understand "on", "on top of", "onto" as "[onto]".

Understand "load [something] [onto] [something]" as putting it on.
Understand "weigh down [something] with [something]" as putting it on (with nouns reversed).
Understand "balance [something] with [something]" as putting it on (with nouns reversed).
Understand "counterbalance [something] with [something]" as putting it on (with nouns reversed).
Understand "counterweight [something] with [something]" as putting it on (with nouns reversed).
Understand "counter [something] with [something]" as putting it on (with nouns reversed).


Part 8 - Synonyms for take

Understand "on to", "onto", "hold of" as "[on to]".

Understand "grip [something]" as taking.
Understand "grab [something]" as taking.
Understand "grab [on to] [something]" as taking.
Understand "hold [on to] [something]" as taking.
Understand "cling to/onto [something]" as taking.
Understand "cling on to [something]" as taking.

Understand the command "catch" as "take".
Understand the command "collect" as "take".
Understand the command "pluck" as "take".

Part 9 - Synonyms for drop

Understand "let go of [something]" as dropping.

Part 10 - Synonyms for push

Understand "push [something] out of the/my way" as pushing.
Understand "push [something] out of way" as pushing.
Understand "push through [something]" as pushing.

Understand the command "poke" as "push".

Part 10b - synonyms for Pull

Understand the command "yank" as "pull".
Understand the command "tug" as "pull".
Understand the command "haul" as "pull".
Understand the command "heave" as "pull".

Part 11 - Synonyms for Jump

Understand the commands "bound", "leap", "spring" as "jump".

Part 12 - Synonyms for Look

Understand "look around" as looking.

Part 13 - Synonyms for Search

Understand "look on [supporter]" as searching.
Understand "look on [something]" as searching.


Understand "dig in/through/under/up [something]" as searching.
Understand "dig around in [something]" as searching.
Understand "reach in/into/inside [something]" as searching.
Understand "reach in/into/inside of [something]" as searching.
Understand "reach in to [something]" as searching.

Part 14 - Synonyms for Wait

Understand "do nothing" as waiting.
Understand "keep waiting" as waiting.


Waiting for is an action applying to one topic.

Understand "wait until/for/till/til [text]" as waiting for.

Check waiting for: try waiting instead.

Part 15 - Synonyms for Enter

Understand "hop in/into/inside [something]" as entering.
Understand "slip past/by [something]" as entering.
Understand "go past [something]" as entering.
Understand "dodge past [something]" as entering.

Understand "slide down [something]" as entering.
Understand "slide on [something]" as entering.
Understand "slide down on [something]" as entering.


Part 16 - Synonyms for Show

Understand "wave [something] at [someone]" as showing it to.
Understand "threaten [someone] with [something]" as showing it to (with nouns reversed).
Understand "intimidate [someone] with [something]" as showing it to (with nouns reversed).

Part 17 - Synonyms for Exit

Understand the command "escape" as "go".

Part 18 -Synonyms for Consulting

Understand "research [text] in [something]" as consulting it about (with nouns reversed).

Part 19 -Synonyms for Burn

Understand the command "scorch" as "burn".

Part 20 -Synonyms for Ask for

Understand "ask for [something] from [someone]" as asking it for (with nouns reversed).

Part 21 - Synonyms for Looking under

Understand "look behind [something]" as looking under.

Part 22 - Synonyms for unlocking

Understand "lever [something]" as pulling.
Understand "pry [something]" as pulling.
Understand "lever [something] with [something]" as unlocking it with.
Understand "pry [something] with [something]" as unlocking it with.

Part 23 - Synonyms for opening

Understand "unfold [something]" as opening.
Understand "unroll [something]" as opening.

Understand "throw open [something]" as opening.
Understand "pull open [something]" as opening.



Part 24 - Synonyms for attack

Understand "stab [someone]" as attacking.
Understand "stab [someone] with [something]" as attacking it with.


Book E - New Properties

Part 1 - Wakefulness

A person can be awake or asleep. A person is usually awake.

Part 2 - Hollowness

[Just the telescope, here. I considered making the definition 'A thing can be tubular', but that rather unfortunately invites the opposite term, 'grody'; so I decided otherwise. It's used for the 'looking through' action, defined above, and intended for keyholes, lenses, magic mirrors and other such apertures.]

A thing can be eyeable. A thing is usually not eyeable.

Part 3 - Clutter

A thing can be clutter. A thing is usually not clutter.

Part 4 - Known knowns, known unknowns, unknown unknowns, etc

[This is for subtleties involving names: an indistinct figure who we later find out is named the Duchess Du Mer, for example, begins life unknown and later becomes known. "Understand" lines and "printing the name of" rules can be written to take this into account.]

A thing can be known or unknown. A thing is usually known.

Book F - General changes to the world model

Last unlocking rule when the player has Horloge's keys:
	rule succeeds with result Horloge's keys;

Last unlocking rule when the player has my lucky clock key:
	rule succeeds with result my lucky clock key;

Part 1 - Unexamined / Examined

A thing can be examined or unexamined. 

Carry out examining something: 
	now the noun is examined.

Part 2 - Upstairs and downstairs

Understand "upstairs" as up.
Understand "downstairs" as down.

Part 3 - Cant Go message

[ Definition: a direction (called that way) is viable if the room that way from the location is a room and that way is not inside and that way is not outside. ]

After assembling available exits:
	remove {inside, outside} from the viable directions, if present;

The last instead of going nowhere:
	try listing exits instead;

[ The last instead of going nowhere when the number of viable directions is 1:
	say "The only way to go from here is [random viable direction].";

The last instead of going nowhere when the number of viable directions is at least 2:
	say "The only ways to go from here are [list of viable directions]."; ]

The replacement listing exits rule is listed instead of the Textfyre standard listing exits rule in the Report listing exits rules.

This is the replacement listing exits rule:
	if the viable directions is not empty:
		if the number of entries in the viable directions is 1:
			say "The only way to go from here is [viable directions].";
		otherwise:
			say "The only ways to go from here are [viable directions].";
	otherwise:
		say "There are no obvious exits from here.";

Book G - Conversation Tokens

Understand "calvin", "drake", "calvin and drake", "drake and calvin" as "[calvinanddrake]".
Understand "figure", "figure in grey/gray", "grey/gray figure" as "[figure]".

Understand "abbot", "abbott", "gubbler" as "[abbot]".

Understand "bishop", "archbishop", "arch-bishop", "steelspring", "steel-spring", "steel spring" as "[archbishop]".

Understand "cathedral", "cathedral of time", "church" as "[cathedral]".
Understand "abbey", "abbey of time" as "[abbey]".

Understand "reloh", "brother reloh" as "[reloh]".
Understand "sa'at", "brother sa'at", "saat", "brother saat" as "[sa'at]".
Understand "horloge", "brother horloge" as "[horloge]".

Understand "cook", "[calvinanddrake]", "[reloh]", "[horloge]" as "[abbeyfolk]"

Understand "clockwork", "clock-work", "klockwerk", "clock work", "clocks" as "[clockwork]".
Understand "saints" or "saint" or "ykea" or "maxwell" or "newton" or "babbage" or "breguet" or "st maxwell" or "st newton" or "st ykea" or "st babbage" or "st breguet" or "designers" or "inventors" or "euclid" as "[saints]".

Understand "me" or "myself" or "yourself" or "you" or "self" or "Wren" or "story" or "my story" as "[me]".
Understand "themselves", "themself" as "[himself]".
Understand "him" or "himself" as "[himself]".
Understand "her" or "herself" as "[himself]".
Understand "[himself]" as "[herself]". [in the interests of full equality] 

Understand "perpetuum" or "mobile" as "[perpetuum]".
Understand "stealing" or "theft" or "robbery" or "plan" or "plot" or "vault" or "vaults" or "crypt" as "[plot]".

Book 0 - Prologue

Part 1 - Introduction

When play begins:
	select the prologue channel;
	say "[my description][line break]";	
	say "'[i]HEY WREN![no line break][r]'[paragraph break]Uh-oh.[paragraph break]'We've got a job for you!'[paragraph break]'Yeah, a promotion!'[paragraph break]This, coming from Drake and Calvin, means something horrible is about to happen.[paragraph break]'You've got your rag, don't you?'[paragraph break]'And your polish?'[paragraph break]'Yes,' I bleat, holding up the glass tumbler they've given me.[paragraph break]'Course you do. Well, we've got something for you to do.'[paragraph break]'Yeah,' chimes Calvin.[paragraph break]One on each arm, they march me down the hall, towards the Abbot's door. Am I in trouble? Going to be thrown out of the Cathedral?[paragraph break]'On three!' shouts Drake.[paragraph break]'Tick!' Calvin counts. 'Tick! [i]Tock![no line break][r]'[paragraph break]They shove me through the door. I fall into the Abbot's personal chamber. I might not know much about the Abbey but I do know that I [i]really[r] shouldn't be in here.[paragraph break]";
	select the main channel;

Part 2 - Wren

Chapter 1 - Description of Wren

Rule for printing the description of the player:
	say "[my description]".

To say my description:
	say "When the monks took me, aged six months, into their care, they named me Wren. Maybe because I was small, insignificant, and happy to eat any crumbs they threw my way. But these days I'm Wren, 2nd Assistant Clock Polisher... and that's a role that's about as important in the workings of the Cathedral of Time as the large deaf man who re-stretches the worn-out springs."

Chapter 2 - Wren's Possessions

A thing called my lucky clock key is privately-named, worn by the player. The description is "The one thing I've had all my life. It's been there, on a string around my neck, for as long as I can remember. I keep hoping that it's a last gift from my [i]true[r] family, and one day it'll open a treasure-chest or the door of one of the Great Houses. But then again, maybe it's just something I tried to eat as a baby. Either way, I've yet to find a lock it'll turn or a clock it'll wind." The printed name is "my lucky clock key". Understand "my", "lucky", "clock key", "key", "string" as the lucky clock key.

Instead of dropping the lucky key:
	say "What? Lose my lucky clock key? And then what would I have left?";

Instead of putting the lucky key on something:
	try dropping the lucky key instead;

Instead of inserting the lucky key into a container:
	if the container is not held by the player:
		try dropping the lucky key instead;

Instead of throwing the lucky key at something:
	try dropping the lucky key instead;

Does the player mean doing something with the lucky key:
	it is unlikely;

A rag is carried by the player. The description is "The tool of the polisher's trade. And this old rag looks like it's been the tool of several polishers before me, too."

Instead of wearing the rag:
	say "Maybe I was small enough for that once, but now the rag would barely cover my face."

Understand "old", "dirty", "polishing" as the rag.
A tumbler is a container, open, carried by the player. The description is "A small glass with all that's left of my daily wood polish ration. How I'm supposed to do all the rest of my chores after this I don't know, but Drake and Calvin didn't seem too worried about that." Understand "glass" as the tumbler. The printed name of the tumbler is "glass tumbler".

Understand "cup" as the tumbler when the player cannot see the teacup.

Rule for deciding whether all includes the small amount of polish: it does not.

Rule for emptying away the small amount of polish when in Inside Clock Case:
	remove the small amount of polish from play;
	say "Oh... well, then. I tip out the last of the polish onto the floor of the clock. At least that part will shine.";

Instead of emptying the empty tumbler:
	say "The tumbler's empty already."


Instead of emptying the tumbler when Heading for the Cathedral has happened:
	remove the small amount of polish from play;
	say "I tip out the polish. I'm done with clock-faces for the day, that's for certain."

Instead of emptying the tumbler when not in Inside Clock Case:
	say "I'll need to save every last drop. There's twenty more clocks to do today at least!";

Instead of attacking the tumbler:
	say "I need it. Can't be a clock polisher if you don't have anywhere to carry your clock polish!"

Inside the tumbler is a small amount of polish. Understand "wood", "ration", "daily ration" as the small amount of polish.

Before examining the small amount of polish: try examining the tumbler instead.

Before drinking or tasting the small amount of polish:
	say "No way. (They say Brother Reloh did that as a boy and that's why he ended up like he did.)" instead.

Before doing something when the small amount of polish is physically involved:
	redirect the action from the small amount of polish to the tumbler, and try that instead;

Before polishing something with the tumbler when the player carries the rag:
	redirect the action from the tumbler to the rag, and try that instead;
	
Part 3 - First scene

Introduction is a scene. Introduction begins when play begins. Introduction ends when the player is taken to the attic.

When Introduction ends:
	move Abbot Gubbler to Abbot's Quarters;
	now the Grandfather Clock is scenery; [suppressing initial appearance] 
	now the Grandfather Clock is closed;

Definition: a room is in the Introduction if it is the Abbot's Quarters or it is Inside Clock Case.

Book 1 - The Abbot's Quarters

Part 1 - The Abbot's Room

Chapter 1 - Description

The Abbot's Quarters is a room. "The Abbot's Quarters again. Gubbler is here, standing by his desk (no chair, remember?). He's looking right at me, waiting for me to explain why I'm interrupting him, and why I haven’t run away back west yet."

Rule for printing the description of the Abbot's Quarters during the Introduction:
	say "If I thought Abbots lived in luxury, then I was dead wrong. Even my attic's cozier than this. The Abbot's got no furniture at all, except a desk and a cot, and no decoration except for a bust of St. Newton. None of the axle-mounted, bevelled mobiles I was expecting. There's barely even any sunlight: one thin window to catch the sun-rise, opposite the door to the hallway back west.";

Rule for printing the description of the Abbot's Quarters when Clock Case has been hidden in during the Introduction:
	say "I need to get out of this place as fast as I can and without attracting any more attention. The door to the hallway is back west and as for polishing the Grandfather clock - well, forget it!";

Check listening to the Abbot's Quarters:
	say "The clock-gears are chanting quietly to themselves." instead;

Instead of making to leave when the player is in the Abbot's Quarters:
	try going west instead.

Instead of facing outside when in the Abbot's Quarters:
	try facing west instead;

Chapter 2 - Grandfather Clock

Section 1 - The Clock Itself

Gubbler's Grandfather clock is a closed door, in the Abbot's Quarters. "[if in Abbot's Quarters]St. Newton is staring at the Abbot's unpolished Grandfather clock with a severe frown.[otherwise]A little light shines in through the keyhole, which is almost covered by the Abbot's spare robe.[end if]".

The description is "No wonder Calvin and Drake didn't want to do this. Abbot Gubbler's Grandfather clock is enormous: the face is the size of a dinnerplate and the cabinet below is big enough to be a wardrobe. Even just polishing the doors will take half an hour. The whole thing might take all day." 

Understand "Abbot Gubbler's", "Abbot's" as the Grandfather Clock.
Understand "face", "cabinet", "doors", "case" as the Grandfather Clock.

The Grandfather Clock is inside from Abbot's Quarters, outside from Inside Clock Case.

Instead of inserting something into the Grandfather Clock:
	say "I'm not here to litter his clock up with things.";
	
Instead of unlocking the Grandfather Clock with something:
	say "The door's not locked."

Instead of locking the Grandfather Clock with something:
	say "I don't have the key for it (and of course I don't, it's the Abbot's clock and I'm a Second Assistant Polisher. I shouldn't even be [i]near[r] his clock, let alone fiddling with it.)";

Instead of pushing or pulling or turning the Grandfather Clock:
	say "It's massive - much bigger than me!"

Instead of attacking the Grandfather Clock:
	say "Heresy. I'd be struck down by a counterweight where I stand!"

Section 2 - Actions - Polishing

Instead of polishing the Grandfather Clock with the rag:
	say "I whisper the correct mantra against the evils of Friction and Dust, and start polishing. This'll take forever!";

Instead of polishing the Grandfather Clock with the rag when Voices have been Heard during the Introduction:
	say "If you think the Abbot will come in here, and say, 'Oh, good, young Wren's polishing my clock,' then you must have come unsprung. If he finds me here doing Calvin and Drake's work he'll have me declared unmechanistical and maybe even throw me out of the Abbey!";

Before cleaning the Grandfather Clock:
	if the rag is carried:
		say "(with [the rag])[command clarification break]";
		try polishing the noun with the rag instead;
	otherwise:
		say "I can't polish anything without a cloth." instead.


Section 3 - Actions - opening

[This was dreadfully buggy, and the cause was implicit opening... well, just poor door handling here. ]

[Rule for implicitly opening the Grandfather Clock when in Abbot's Quarters and Clock Case has not been hidden in and Voices have not been Heard:
	do nothing;]

After opening the Grandfather Clock when in Abbot's Quarters and the implicitly opening activity is not going on:
	say "I open the clock door and peek inside. [run paragraph on]";
	try searching the Grandfather Clock instead;

Instead of opening the Grandfather Clock when in the Abbot's Quarters and AB_QUART4 is fired and the implicitly opening activity is not going on and Inside Clock Case is not visited: [only auto-enter when the player hasn't auto-entered before ]
	try entering the Grandfather Clock instead.

Instead of searching the closed Grandfather Clock when in Abbot's Quarters:
	try opening the Grandfather Clock instead;

Before entering the closed Grandfather Clock when in Inside Clock Case during Hiding In The Clock:
	try opening the Grandfather Clock instead; [fails]

Before entering the closed Grandfather Clock when in Inside Clock Case:
	now the Grandfather Clock is open;
[	try silently opening the Grandfather Clock; [succeeds]]

Instead of searching the Grandfather Clock:
	say "For a big clock it's got a pretty small [i]penduluum[r], about the size of Calvin's fist and not as big as Drake's. There's even enough space in front of it for the Abbot to hang up one of his spare robes."

Instead of opening the Grandfather Clock when Hiding in the Clock has ended and the implicitly opening activity is not going on and the player is in Inside Clock Case:
	now the Grandfather Clock is open;
	try exiting instead.

Instead of opening the Grandfather Clock during Hiding in the Clock:
	say "You've got a spring missing if you think I can slip out, unnoticed, or come up with a decent excuse as to why I've been hiding in the Abbot's grandfather. No, I'm staying put and hoping nothing happens to make the old man need to change his clothes.";

After going through the Grandfather Clock from Inside Clock Case to Abbot's Quarters during Introduction:
	now the player is casually overhearing;
	say "[one of]I spill gratefully out of the clock, gasping for breath as though I've been underwater. I've just been holding it in, of course. As for what I've heard – well, I probably shouldn't have, and the quicker I can get out of here, the better.[or][stopping]";
	continue the action;

Instead of making to leave when in Inside Clock Case:
	try entering the grandfather clock;



Section 4 - Actions - entering

Instead of going through the Grandfather Clock from Abbot's Quarters when Voices have not been heard:
	say "I should polish the outside of the clock first, and that'll probably take more than long enough."

Instead of going through the Grandfather Clock when in Abbot's Quarters and Voices have been heard and Hiding in the Clock has not happened:
	repeat with x running through the current script begin;
		now x is fired;
	end repeat;
	change the current script to { CCASE1 };

Instead of hiding inside the Grandfather Clock when in Abbot's Quarters and Voices have been heard and Hiding in the Clock has not happened:
	try entering the noun instead;

Instead of hiding behind the Grandfather Clock when in Abbot's Quarters and Voices have been heard and Hiding in the Clock has not happened:
	say "No space behind - but plenty inside. [run paragraph on]";
	try entering the noun instead;

Instead of hiding from view when Voices have been heard and the Grandfather Clock is not visited and the Introduction is happening:
	say "Where? There's the cot, the table, but none of those seem too good..."

Section 5 - Components - Clock Door and Keyhole

The clock-door is privately-named, part of the Grandfather Clock. The description is "The clock door is smooth lacquered wood, finest quality: no knotholes or splinters here! It's covered with the usual springs and levers, and a nice gear-train motif around the keyhole."

Understand "usual", "springs", "levers", "smooth", "lacquered", "wood", "wooden" as the clock-door.

The printed name is "door of the clock".
Understand "[something related by reversed incorporation] door" as the clock-door.
Understand "door of [something related by reversed incorporation]" as the clock-door.
Understand "door" as the clock-door when the location is Inside Clock Case.

Instead of opening the clock-door: try opening the Grandfather Clock;
Instead of closing the clock-door: try closing the Grandfather Clock;
Instead of entering the clock-door: try entering the Grandfather Clock;

Instead of unlocking the clock-door with something:
	try unlocking the Grandfather Clock with the second noun instead.

Instead of locking the clock-door with something:
	try locking the Grandfather Clock with the second noun instead.

Instead of polishing the clock-door with something:
	try polishing the Grandfather Clock with the second noun;

Instead of cleaning the clock-door:
	if the player is carrying the rag:
		try polishing the Grandfather Clock with the rag;
	else:
		say "I can't polish anything without my cloth."

Instead of pushing the clock-door in Inside Clock Case:
	try opening the clock-door instead;

Instead of pulling the clock-door in Abbot's Quarters:
	try opening the clock-door instead;

A keyhole is part of the clock-door. The description of the keyhole is "[if the location is the Abbot's Quarters or the Grandfather Clock is open]It's just a keyhole. It might be only ornamental.[otherwise if Hiding in the Clock is happening]I can make out the Abbot's hands, which are shaking badly. But I can see nothing of the Figure.[otherwise]Through the keyhole I can see the corner of the Abbot's desk, but the Abbot and the Figure have gone."

Understand "conversation" as the keyhole when Hiding in the Clock is happening.
Understand "gear-train", "gear", "train", "motif" as the keyhole.

Instead of inserting something into the keyhole:
	try unlocking the clock-door with the noun instead.

Instead of unlocking the keyhole with something:
	try unlocking the Grandfather Clock with the second noun instead.

Instead of locking the keyhole with something:
	try locking the Grandfather Clock with the second noun instead.

Instead of polishing the keyhole with something:
	try polishing the Grandfather Clock with the second noun;

Instead of cleaning the keyhole:
	if the player is carrying the rag:
		try polishing the Grandfather Clock with the rag;
	else:
		say "I can't polish anything without my cloth."


Instead of searching the keyhole:
	try examining the keyhole instead;

Section 6 - Scoping and Reaching into the Clock

After deciding the scope of the player when the location is Abbot's Quarters and the Grandfather Clock is open:
	place the contents of Inside Clock Case in scope;

Rule for reaching inside Inside Clock Case when the Grandfather Clock is open:
	allow access;

Chapter 3 - Exits

Instead of going through the Abbot's Door when AB_QUART1 is unfired:
	say "I'm not staying here. I walk straight out again... but Drake's waiting to push me back.[paragraph break]'Polish the clock, loose-screw!' he clangs. 'And don't come out till it's shining!'";
	remove AB_QUART1 from the current script, if present;
	add AB_QUART1A at entry 1 in the current script;

Instead of going through the Abbot's Door when Voices have not been heard:
	say "Curses to counterweights! It's not on my rota, this clock, so why should I finish off my polish on it? I head for the doorway – then freeze. Voices, coming down the hall. It's the Abbot Gubbler himself, coming this way!";
	remove AB_QUART2 from the current script, if present;
	remove AB_QUART_PAUSE from the current script, if present;
	remove AB_QUART3 from the current script, if present;
	add AB_QUART3A at entry 1 in the current script; [dummy event for good timing]

Instead of going through the Abbot's Door when Clock Case has not been hidden in:
	say "The Abbot's voice is getting nearer... If he sees I've been in here, he'll have me turning the paddles in the laundry room for a month! There's nothing for it, I'll [i]have[r] to escape, and some other way than the door!";

After going west through the Abbot's Door when Hiding in the Clock has ended during Introduction:
	say "I'm going to have to tell someone what I just heard. A theft, from the Vaults! But if the Abbot's involved – who else might be? After all, the figure he was talking to could have been [i]anyone[r] in the Abbey!";
	continue the action;

Rule for implicitly opening the Abbot's Door:
	[no command clarification message]
	try silently opening the Abbot's Door; 

After going through the Abbot's Door from the Corridor of Contemplation when Introduction has ended:
	say "I knock before entering the Abbot's study.";
	continue the action;

Rule for printing the description of the Abbot's Door:
	if Hiding in the Clock has ended and Introduction is happening:
		say "That's the way I need to go to get out of here.";
	otherwise if Hiding in the Clock is happening:
		say "I can't see the door from here. I wish I could do [i]more[r] than see it.";
	otherwise if Voices have been heard:
		say "People are coming this way!";
	otherwise:
		say "It's a heavy oak door.";

[Rule for implicitly opening the closed Abbot's Door when Hiding in the Clock has ended:
	try opening the Abbot's Door;
	consider the scene changing rules;
	rule fails;]

[ The point of the following rule is to force a one move gap between exiting the clock and exiting the Abbot's Quarters, to spread out the reaction messages. Yes, this means that going out will just open the door, but I think that's okay. ] 

 Before going through the closed Abbot's Door when Hiding in the Clock has ended:
	try opening the Abbot's Door instead; 

Report opening the Abbot's Door when Hiding in the Clock has ended:
	say "I haul open the door." instead.

Chapter 4 - Scenery Items
	
Section 1 - Cot

The Abbot's cot is scenery, in the Abbot's Quarters. "The Abbot's cot is a hard wooden pallet, with no pillow and one small blanket. 'Mustn't sleep,' I can hear him saying. 'Time doesn't sleep. Sleep is our great weakness.'" Understand "bed", "pallet", "blanket" as the cot.

Instead of taking the cot:
	say "Why would I want to go wandering off with the Abbot's bed-things?"

Instead of entering the cot:
	say "No thanks. It looks horribly uncomfortable. And coming from me, considering where [i]I[r] sleep, that's really saying something."

Instead of hiding under the cot when Voices have been heard during Introduction:
	say "The space under the cot is too small for me! Somewhere else, and quick!" instead;

Instead of looking under the cot when Voices have been heard during Introduction:
	try hiding under the cot;

Instead of looking under the cot:
	say "There's nothing of interest under the Abbot's cot. No spare polish, for example." instead;

Instead of cleaning the cot:
	say "I'm having nothing to do with it. The Abbot probably sheds his dead skins there every night."

Section 2 - Desk

The Abbot's desk is scenery, in the Abbot's Quarters. "Gubbler's desk is bare and old. The surface is scratched a little with geometric designs." Understand "table" as the desk.

Instead of polishing the desk with the rag:
	say "But I'm going to need all the polish I've got for the clock!";

Instead of cleaning the Abbot's desk:
	say "But I'm going to need all the polish I've got for the clock!";

Instead of hiding under the desk when Voices have been heard during Introduction:
	say "The space under the desk is too small for me! Somewhere else, and quick!" instead;

Instead of looking under the desk when Voices have been heard during Introduction:
	try hiding under the desk instead;

Instead of looking under the desk:
	say "There's nothing of interest under the Abbot's desk. No spare polish, for example." instead;

Instead of opening the desk:
	say "I'm not here to go rummaging around in the Abbot's papers. They'd have be thrown into prison for spying!";

Instead of searching the desk:
	try examining the geometric designs.

Some geometric designs are part of the Abbot's desk. Understand "scratch", "surface", "table's/desk's/table/desk surface/top", "scratches", "design" as the geometric designs.

Rule for printing the description of the geometric designs: say "Years of designers have imprinted the footprints of their thoughts into the surface of the wood itself. In another hundred years, the desk itself will be a Relic in the Cathedral Reliquary." 

Instead of polishing the geometric designs with the rag:
	say "They might be important: I shouldn't just fill them over."

Instead of cleaning the geometric designs:
	say "But they might be important!"

Section 3 - Bust of St Newton

The Bust of St Isaac Newton is a man, scenery, in the Abbot's Quarters. "I can feel the well-fitted eyes of St. Newton gazing right down into my workings. Quickly, I make the sign of [i]penduluum[r] and look away." The printed name is "bust of St. Newton". Understand "icon", "head", ["face", [removed - conflict with the clock face] ]"eyes", "frown", "severe", "of" as the Bust.
Understand "saint", "st", "isaac", "newton", "the", "thinker" as the Bust.

Before doing something when the bust of St Newton is physically involved and the action is physical:
	say "It's clear from his expression that St. Newton disapproves of that idea." instead;

Rule for speaking with the bust of St Isaac Newton:
	say "You're losing your marbles, Wren, if you think you can talk to [i]that[r]."

Section 4 - Window

A window called the barred window is scenery, in the Abbot's Quarters. "The narrow-barred window catches the morning sunshine. The same sunshine that Drake and Calvin are out enjoying while I'm stuck in here." Understand "bar", "bars", "sun", "sunshine", "sun-rise", "sun rise", "sun shine", "narrow-barred", "morning" as the window.

Instead of entering the barred window:
	try opening the barred window;

Instead of opening the barred window:
	say "The bars are too narrow to slip through, and too firm to break.";

Section 5 - Door

An open door called the Abbot's Door is scenery. The Abbot's Door is west of the Abbot's Quarters. The Abbot's Door is east of the Corridor of Contemplation.

Rule for printing the description of the Abbot's Door when in the Corridor of Contemplation during Introduction:
	say "There's no-one in the Abbot's Quarters now.";

Rule for printing the description of the Abbot's Door when in the Corridor of Contemplation:
	say "It sounds like there's someone inside.";

Chapter 5 - Scripted Events

Section 1 - Intro

AB_QUART1 is a scripted event. The display text is "'And don't come out till that clock's shining!' shouts Drake from the hall.[paragraph break]'Yeah,' Calvin says. 'It's got to look as good as if we did it!'[paragraph break]'Idiot,' Drake mutters. 'Come on.'[paragraph break]Their voices disappear down the hall."

AB_QUART1A is a scripted event. The display text is "'Yeah,' Calvin says. 'It's got to look as good as if we did it!'[paragraph break]'Idiot,' Drake mutters. 'Come on.'[paragraph break]Their voices disappear down the hall."

AB_QUART_PAUSE is a scripted event. The display text is "This isn't fair. I'm just a Second Assistant Clock Polisher. I should be watching someone else polishing a clock. And I've only got one glass tumbler half full of polish: it'll take a miracle to do the whole thing."

After firing AB_QUART1A:
	now AB_QUART1 is fired;

AB_QUART2 is a scripted event. The display text is "The grandfather clock ticks off a minute with a stately [i]thunk[r]. Quickly, I make the sign of the winding gear."

Section 2 - Voices heard

AB_QUART3 is a scripted event. The display text is "From the hallway outside comes the echo of voices. Too shaky to be Calvin or Drake. More like – oh, no. It's the Abbot, coming back to his room. And if he finds me here, then my springs won't be worth the spindles they're sprung to..."

AB_QUART3A is a scripted event. [A dummy 'Voices heard', for cases where the player directly triggers the event.] 

After firing AB_QUART3:
	move the glimpsed-Abbot backdrop to all rooms that are the Abbot's Quarters;

After firing AB_QUART3A:
	now AB_QUART3 is fired;

To decide if Voices have been Heard:
	if AB_QUART3 is fired, yes;
	no;

To decide if Voices have not been Heard:
	if Voices have been heard, no;
	yes;

AB_QUART4 is a scripted event. The display text is "The Abbot's voice is getting closer. The old man may move slower than a short hand, but he's definitely coming this way."

AB_QUART4B is a scripted event. The display text is "Oh, no! I shouldn't [i]be[r] here!"

AB_QUART5 is a scripted event. The display text is "Oh, widdershins! Abbot Gubbler is right outside the door! I'd better hide [i]somewhere[r]!"

Chapter 6 - Glimpses of people

Section 1 - Glimpsed-Abbot

Glimpsed-Abbot is an animate glimpse backdrop. Understand "[abbot]" as the glimpsed-Abbot. The printed name is "Abbot Gubbler". "[if Inside Clock Case is unvisited]He's coming this way![else]He's gone - for now, at least![end if]"

Instead of approaching the glimpsed-Abbot when in the Abbot's Quarters:
	try going west instead;

Every turn when in the Corridor of Contemplation:
	remove the glimpsed-Abbot from play;

Section 2 - Glimpsed-Figure

Intro-glimpsed-Figure is an animate glimpse backdrop. Understand "[figure]" as the Intro-glimpsed-Figure. "I didn't see the Figure clearly." The printed name is "figure in grey".

Instead of approaching the Intro-glimpsed-Figure:
	say "No thanks. I hope I never run into that Figure again.";

Every turn when in the Corridor of Contemplation:
	remove the Intro-glimpsed-Figure from play;

Section 3 - Glimpsed-Calvin and Drake

Intro-glimpsed-CandD is an animate glimpse backdrop in the Abbot's Quarters, in Inside Clock Case, in Corridor of Contemplation. Understand "[calvinanddrake]" as the Intro-glimpsed-CandD. The printed name is "Calvin and Drake". "Calvin and Drake are bigger than me, meaner, and I could do a lot better without them."

Instead of approaching Intro-glimpsed-CandD:
	try going west instead;

Every turn when in the Attic Room:
	remove the Intro-glimpsed-CandD from play;


Part 2 - Inside the Clock

Chapter 1 - Description

There is an unceilinged, aerial room called Inside Clock Case.

The description of Inside Clock Case is "I'm wedged inside the Abbot's Grandfather Clock, penduluum at my back. Time to go, I think!"

Rule for printing the description of Inside Clock Case when the keyhole-Abbot is visible and the player is casually overhearing:
	say "As the phrase goes, I'm stuck between a rack and a gear-trace; except here I'm in the narrow gap between the clock case door and the heavy swinging [i]penduluum[r] behind. And if I get in the way of that, and disrupt the clock's holy timings... well, there's no way they wouldn't notice when the clock-hands stopped moving, let's just say.";

Rule for printing the description of Inside Clock Case when the keyhole-Abbot is visible:
	say "I'm leaning up against the door of the clock, with my ear pressed against the glass tumbler. The penduluum behind is like someone breathing in my ear. If I'm caught in here, I'm dead."

Index map with Inside Clock Case mapped east of Abbot's Quarters.

Index map with Abbot's Quarters mapped east of Corridor of Contemplation.

Instead of shouting at someone when in Inside Clock Case:
	say "[one of]What? Pretend to be a ghost and hope to scare them away?[or]No chance. That would be madness.[stopping]";

Chapter 2 - Scenery

Section 1 - Robe

A spare robe is scenery, in Inside Clock Case. "It's a thick black woollen habit, with a long deep hood and sleeves big enough to fit a five-and-a-quarter transmission with room to spare. Being the Abbot's robe means it has a softer lining, and a little sewn-in pocket for his tissues, spectacles, and that sort of thing." The printed name is "robe".
Understand "Abbot's", "robes", "hood", "sleeve", "sleeves", "soft/softer", "lining" as the spare robe.

Before wearing the spare robe:
	say "One day, maybe, once I've worked my way up to the status of clock-watcher and can start learning the Twelve Devotions. But not yet." instead;

Before searching the spare robe when in Inside Clock Case:
	say "I peek into the pockets looking for an ear-trumpet to use on the door... but don't find one there." instead.

Before searching the spare robe:
	say "I can't go peeking into the Abbot's things!";

Before doing something when the spare robe is physically involved:
	say "Better not. My fingers are all greasy with polish." instead;

The little sewn-in pocket is a container, open, not openable, part of the spare robe. Understand "pockets", "pockets/pocket of [something related by reversed incorporation]" as the sewn-in pocket.

Instead of doing something when the little sewn-in pocket is physically involved:
	say "Better not. My fingers are all greasy with polish.";

Instead of examining or searching the little sewn-in pocket:
	try searching the spare robe instead;

Section 2 - Penduluum

The penduluum is scenery in Inside Clock Case. "The [i]penduluum[r] is a large amount of Holy Brass, properly blessed and bevelled. It swings back and forth, raising the weight of Precision against the counterweight of Slapdashery."

Understand "mechanism", "workings", "brass", "holy", "blessed", "bevelled", "beveled", "weight", "counterweight", "precision", "slapdashery", "pendulum" as the penduluum.

Instead of doing something when the penduluum is physically involved and the current action is physical:
	say "To stop a clock is murder. To shift the balance... that's something worse still.";
	
Instead of listening to the penduluum:
	say "A steady ticking: the heartbeat of the World."

Instead of smelling the penduluum:
	say "A smell of flax oil and brass."

Section 2b - Weights

A clock-weight is a kind of thing.

The weight of Precision is scenery, clock-weight in Inside Clock Case. "The weight of Precision falls in delicate steps, moving - the Abbot says - like a dancer across a ballroom floor. Not something I've seen myself."

The counterweight of Slapdashery is scenery, clock-weight in Inside Clock Case. "The counterweight of Slapdashery climbs its chain in fits and jerks."

Understand "weights" as the plural of clock-weight.

Instead of pushing or pulling or taking a clock-weight:
	say "Interfering with the internal mechanisms of a clock is unthinkable!"

Section 3 - Abbot Gubbler (through the keyhole)

The keyhole-abbot is a man, privately-named, proper-named, scenery. [initially out of play] "I can't see much through the keyhole, except the Abbot's stout waist and shaking hands. Not much good for winding anything now, but if I said as much to anyone then I'd be in real trouble." The printed name is "Abbot Gubbler".

Understand "man", "men", "old", "person", "people", "abbot", "gubbler", "hands" as the keyhole-abbot.

Instead of doing something when the keyhole-abbot is physically involved:
	say "Draw attention to myself? I may be honest, but I'm not stupid. If I get kicked out of the Abbey I'll be nothing but a street urchin for the rest of a very short life."

Section 4 - Figure in Grey (through the keyhole)

The keyhole-figure is a man, privately-named, scenery. [initially out of play] "The glimpse I caught earlier was a tall – man? – wearing a suit of grey leather and a long flowing cape. Now I can't see him at all – it's almost as though he knows I'm hiding, and he's avoiding the keyhole's line of sight." The printed name is "figure in grey".

Understand "man", "men", "person", "people", "figure", "in", "grey", "gray", "cape", "leather", "suit" as the keyhole-figure.

Instead of doing something when the keyhole-figure is physically involved:
	say "Draw attention to myself? I may be honest, but I'm not stupid. If I get kicked out of the Abbey I'll be nothing but a street urchin for the rest of a very short life."

Section 5 - Monk (through the keyhole)

The keyhole-monk is a man, privately-named, scenery. "I can't see him." Understand "monk", "third voice" as the keyhole-monk. The printed name is "monk".

Instead of doing something when the keyhole-monk is physically involved:
	say "The monk is outside, and wouldn't help me anyway.";

Chapter 4 - Listening puzzle

Yourself can be casually overhearing or eavesdropping. Yourself is casually overhearing.

Instead of listening with the tumbler to the clock-door when the player is casually overhearing during Hiding in the Clock:
	if the tumbler contains something:
		try emptying the tumbler;
	now the player is eavesdropping;
	say "I put the glass tumbler carefully against the door, then lean down to press my ear against it. Fantastic! I can hear much more clearly now!";

Instead of listening with the tumbler to the clock-door when the player is eavesdropping during Hiding in the Clock:
	say "The tumbler is already fast against the door.";

Instead of listening [without the tumbler] to the keyhole during Hiding in the Clock:
	say "I put one ear to the keyhole but the Figure's voice is still too faint. I try cupping one hand around my ear, to the keyhole. Still no good[one of]. If I had something I could use to listen better then maybe I'd at least have some warning before they open the clock and skin me alive[or][stopping].";

Before putting the tumbler on the clock-door:
	try listening with the tumbler to the clock-door instead;

Before putting the tumbler on the keyhole:
	try listening with the tumbler to the clock-door instead;

Before putting the tumbler against the clock-door:
	try listening with the tumbler to the clock-door instead;

Before putting the tumbler against the keyhole:
	try listening with the tumbler to the clock-door instead;

Instead of listening with the tumbler to the keyhole:
	try listening with the tumbler to the clock-door instead;

Instead of using the tumbler with the keyhole:
	try listening with the tumbler to the clock-door instead;

Instead of using the tumbler with the clock-door:
	try listening with the tumbler to the clock-door instead;
	
Instead of listening to Inside Clock Case:
	[eg > LISTEN with no objects]
	if the player is casually overhearing:
		try listening to the keyhole instead;
	otherwise if the current script is not empty:
		stop the action; [allow the scripted message to appear directly]
	continue the action;

Instead of listening with the tumbler to Inside Clock Case:
	[eg > LISTEN WITH TUMBLER with no second noun]
	try listening with the tumbler to the clock-door instead;

Instead of listening to clock-door:
	try listening to the keyhole instead;

Chapter 5 - Scripted Events

Hiding in the clock is a scene. Hiding in the clock begins when the player is in Inside Clock Case. Hiding in the clock ends when the clock event is finished.

When Hiding in the Clock begins:
	carry out the firing activity with CCASE2;
	change the current script to { CCASE3, CCASE4, CCASE5, CCASE5B, CCASE6, CCASE6B };
	move the keyhole-figure to Inside Clock Case;
	move the keyhole-abbot to Inside Clock Case;
	now the Grandfather Clock is closed;

When Hiding in the Clock ends:
	remove the keyhole-abbot from play;
	remove the keyhole-figure from play;

Section 1 - Clock Case Event

CCASE1 is a scripted event. The display text is "'We'll talk in here,' I hear the Abbot saying, from right outside the door. 'More private. More quiet. Much better.' The old man steps inside the room, followed by a tall figure in grey. In the last tick before his old eyes can see me, I dive inside the gigantic clock case and pull closed the door.";
 
After firing CCASE1:
	now the Grandfather Clock is closed;
	move the Intro-glimpsed-Figure backdrop to all rooms that are the Abbot's Quarters;
	move the player to Inside Clock Case;

To decide if Clock Case has been hidden in:
	if CCASE1 is fired, yes;
	no;

To decide if Clock Case has not been hidden in:
	if Clock Case has been hidden in, no;
	yes;

Section 2 - Scripted dialogue

CCASE2 is a scripted event. The display text is "Oh, no... That click outside was the sound of the Abbot closing the door. Looks like he – and the grey figure I glimpsed with him – are going to be here for a while... And if they find me here, I'm toast!"

After firing CCASE2:
	now the Abbot's Door is closed;

CCASE3 is a scripted event. The display text is "'I told you now didn't I tell you?' old Abbot Gubbler is saying, plaintively. 'Here? Why here? You shouldn't have come here.'[paragraph break][if the player is eavesdropping]The Figure says something in reply. With the glass, I can hear quite clearly. That was a good idea. 'We have been disappointed with your failure. The cause and effect principle, Abbot. Such failure must bring consequences.'[otherwise]The Figure says something in reply. I can only hear two words, but they're enough to stop my heart. 'Failure,' and 'Consequences.' I'm straining to hear more. Something awful is going on here, but what?[end if]"

CCASE4 is a scripted event. The display text is "'But these things, these things are not always tick-tock, they never are,' the old man replies. His voice is quivering, quite different from the steady drone he has when intoning in Chapel. 'The – item you asked about – it's in the Vaults, you see? The Vaults. Even if I could get in, I ...'[paragraph break][if the player is eavesdropping]'Your excuses we find disappointing. Very disappointing. More of this and, Abbot, we may need to unslip your gears completely.'[otherwise]I still can't hear anything properly! The Figure is too far from the keyhole and speaks too quietly. 'Disappointing,' he says; something else, then 'unslip your gears.'[end if]"

CCASE5 is a scripted event. The display text is "The Abbot is spluttering and choking. I've seen him like this only once, when as a young foundling I dropped and smashed an altimeter right before the Archbishop was due to visit.[paragraph break][if the player is eavesdropping]The Figure continues. 'Clearly you're too old to steal the item for us. We have a better mechanism for obtaining it. But you must provide us with the opportunity. Is that understood?'[otherwise]The Figure's quiet voice continues. I can make out; 'too old to steal', 'a better mechanism', 'the opportunity.'[end if][paragraph break]The Abbot nods violently, shaking out agreement the way I might beat dirt from a duster. 'My money?' he asks."

CCASE5B is a scripted event. The display text is "For a moment, there's nothing more. Then the Figure says, all too clearly: 'You understand what you're doing? The Church will never recover from this.'[paragraph break]Maybe the Abbot replies: just a badly-oiled squeak."

CCASE6 is a scripted event. The display text is "There's the clink, of a pouch of golden minutes. A heavy pouch. The Figure, paying the Abbot...? Then suddenly, there's a third voice. 'Sorry, Father, to interrupt, but you said...'[paragraph break]It's a monk of the Abbey. 'Get out!' the Abbot screeches. His bearing's lost its oil, it seems. 'Get out, get out!'";

CCASE6B is a scripted event. The display text is "'But Father,' the monk continues, 'it's [i]time[r], you know. You told me to tell you when it was [i]time[r].'[paragraph break]'Oh! Of course of course,' he mumbles. 'I'll... We'll continue this discussion later, then,' he says, to the Figure.[paragraph break][if the player is eavesdropping]'We certainly will,' the Figure replies.[otherwise]The Figure intones something in reply.[end if][paragraph break]The Abbot leaves, and that leaves me alone, inside this clock, with the stranger outside. He's coming nearer... I can hear his fingers on the door of the case! I must have nudged the [i]penduluum[r], he must have seen the clock-hands quiver... but then, there's the swish of his cloak as he moves away, and the click as the door closes. Phew."

To decide if the clock event is finished:
	if CCASE6B is fired, yes;
	no;

To decide if the clock event is not finished:
	if the clock event is finished, no;
	yes;

After firing CCASE6:
	move keyhole-monk to the location;

After firing CCASE6B:
	remove keyhole-monk from play;
	move the Intro-glimpsed-Figure backdrop to all rooms. [ dangerous, but we'll remove it from play again in a moment. ]

Section 3 - After the clock scene

Heading for the Cathedral is a scene. Heading for the Cathedral begins when the location is the Abbot's Quarters and the Abbot's Door is open and the Inside Clock Case has been visited. Heading for the Cathedral ends when the location is the Cathedral Yard.

When Heading for the Cathedral begins:
	say "I can't stop thinking about that Figure in Grey. Stealing from the Vaults... I always knew Gubbler was a rat, even if he [i]is[r] the Abbot! But whatever they're up to, I'm probably the only one who knows about it - which means I'm the only one who can stop it. Cog's Teeth! I might get made a novice for it! Even better, a 1st Assistant Clock Polisher - then I'd outrank Calvin and Drake!"

Book 2 - The Abbey Of Time

A thing can be Drake-hideable. A thing is seldom Drake-hideable.

Part 1 - Corridor of Contemplation

Before making to leave in the Corridor of Contemplation: try going west instead.

Chapter 1 - Description

The Corridor of Contemplation is a room. "The ancient stones of the Abbey rise to about shoulder-height before arching over, forcing me to bow my head in supplication before the Abbot's door, back east. To the west, I can hear the gentle echo of ticks and tocks coming from the Abbey's main hall.[paragraph break]Carved into the walls are a series of pious engravings, depicting the long path from initiate to Abbot."

Check listening to the Corridor of Contemplation: 
	say "Ticks and tocks to the west that all say one thing. Hurry up!" instead.

Chapter 2 - Scenery

Section 1 - Engravings

Some engravings are scenery, in the corridor of contemplation. "The carvings start with a young child, polishing and smoothing brass under the eye of some old monk. I don't remember them ever smiling at me that nicely. Then a bit along and further up than I am there are older children at the benches, placing cogs onto spindles. Then there's a long period of study, learning the Twelve Devotions of the Greater Rotation; then the monk's habit, the clock-face hair-cut and hours spent doing incision with the stylus... And beyond that takes me closer to the Abbot's door than I'd like. I don't want him to think I'm eavesdropping, do I?"

Understand "pious", "path", "initiate", "Abbot" as the engravings.

Rule for printing the description of the engravings during Introduction:
	say "If someone comes, that's what I'll do, to explain why I'm here. But no-one's coming, and that means I'd better get away, fast.";

Chapter 2 - Exits

Instead of going west from the Corridor of Contemplation during Introduction:
	carry out the firing activity with ATTIC1;

ATTIC1 is a scripted event. 

Rule for firing ATTIC1 when Attic Room is unvisited:
	say "I dart out of the tunnel only to be stop-clocked by a depressing sight. It's Calvin and Drake, hurrying in through the Abbey's Great Entry. Their mouths are white with sugar.[paragraph break]'Hey, you!' Drake shouts. In a moment he's got me by the ear. 'What were you doing in the Abbot's room? That's not on your rota!'[paragraph break]'Yeah!' Calvin adds. 'And why are you slipping away when we told you to stay there?'[paragraph break]'Idiot,' Drake hisses. Louder – for the benefit of any passing monks – he says, 'That's it, Wren. You're consigned to your room.' For good measure, he punches me on the arm, then the two of them drag me away, heels over flagstones, right to the bottom of the ladder.[paragraph break]'Up you go,' Calvin says. 'And you're not to come down till dark!'[paragraph break]'What about dinner?' I ask.[paragraph break]'Should have thought of that, shouldn't you?' Drake says.[paragraph break]'More for us,' Calvin adds. 'Only two hours to go. I'm starved.'[paragraph break]With that, they punch me again until I scurry out of reach up the ladder.";
	end the chapter;

Rule for firing ATTIC1 when the caretaker's ladder is carried by the player:
	say "[one of]'Wren!' Drake exclaims. 'Where are you going with that? Think I can't send you back to your room without it, do you?' [or]'Wren!' Drake's face is boiling. 'I can't believe you've tried to steal that again? Turn it into firewood, would you?' He spells out the last few words with punches. [or]'I should take that ladder away while you're up there!' Drake exclaims, in irritation. [stopping]Then he [if the location is not the Rickety Stair][one of]marches[or]hauls[at random] me back to the corner of the hall, [end if][one of]props up[or]puts down[at random] the ladder, and [one of]punches[or]whallops[or]whackes[at random] [one of]me[or]my arm[at random] [one of]till I climb it[or]until I climb[at random].";
	move the caretaker's ladder to the Rickety Stair;

Rule for firing ATTIC1 when the caretaker's ladder is carried by Drake:
	say "'There you are!' Drake exclaims. He's carrying my ladder. 'I don't know how you got down without this, but [i]both[r] of you are going back!' With that, he [if the location is not the Rickety Stair] marches me to the corner of the hall,[end if] props up the ladder, and punches me till I climb back up.";
	move the caretaker's ladder to the Rickety Stair;



Rule for firing ATTIC1:
	say "[one of]'Wren!' Drake exclaims. He wallops me on the arm. 'I thought I told you to stay in your room?' He doesn't wait for an excuse before I'm dragged off to the ladder. Then he waits – and wallops me – until I give in and climb all the way back up.[or]Drake looks like he's swallowed a bee. Not only have I disobeyed him, but I've done it [i]twice[r]. 'I'm going to have your skin,' he hisses into in my ear. 'I'm going to use it as a cloak come winter. Understand?' With that he drags me back off to my attic. This time, I can barely climb the stairs.[or]Oh, no, not again... Drake storms in and grabs me by the nose. I'm pulled off to the ladder base. 'Please,' I beg. 'I'm too tired to climb it again.' He looks at me as if I'm stupid. 'Then don't climb back down this time!' he says.[or][final attic trip][stopping]";


To say final attic trip:
	say "Drake [one of]wallops[or]punches[or]hits[or]kicks[at random] me, [one of]boiling[or]shaking[or]simmering[at random] with [one of]rage[or]anger[or]fury[or]irritation[at random]. Back to the ladder, and up I go...";

After firing ATTIC1:
	move the player to Attic Room;
	say "[one of]Through my window I can see the Cathedral across the yard outside. If I was a bird, I could escape easily, and tell someone what I've overheard. Someone at the Cathedral would listen: I could tell the Archbishop himself, maybe. He might remember me from the time he visited, when he helped me repair an altimeter I'd broken. If only I could fly.[paragraph break]But perhaps I can escape on foot. If I'm clever. [i]Clockwise[r].[or]That was careless, getting caught. But I can still make it to the Cathedral. I'll just have to be more cunning this time. Remember, Wren, it's easy: the whole world runs on clockwork. Just a matter of staying ahead of the biting teeth.[or]A quick pause for breath and... right then. I'm ready. I'm going to get out of the Abbey somehow, and warn the Archbishop. And I won't give up till I've got there![stopping]"

To decide if the player is taken to the attic:
	if ATTIC1 is fired, yes;
	no;

To decide if the player is not taken to the attic:
	if the player is taken to the attic, no;
	yes;

Part 2 - Attic Bedroom

Chapter 1 - Description  

The Attic Room is a room. "[if the player is in the Attic Room for more than the first time]Back in the attic. The Cathedral is still just as far away, visible through the hole in the ceiling above my cot. But the ladder's the only way out of here.[otherwise]This isn't really an attic. It isn't really a room either. It's a couple of floorboards laid across some roof rafters right in the ceiling of the Abbey. There's enough floor-space for a cot and a laundry crate, but I have to be careful not to roll out of bed, because if I do, the thick cobwebs all around aren't going to stop me from falling...[paragraph break]A little hole in the ceiling provides some sunlight: and when it rains, it means I can wash my hair, too. It's right above the rickety ladder down to the ground (and that means the ladder is starting to rot and bend)."

Understand "cobwebs", "floorboards/boards/board" and "rafters/rafter" as the backdrop-floor when in the Attic Room.

Rule for printing the description of the backdrop-floor when in the Attic Room:
	say "[one of]There isn't a floor here, just a few rafters and a long drop on either side![or]Really. I don't have a floor, just some beams and a bed.[stopping]"

Instead of searching the backdrop-floor when in the Attic Room:
	say "There's nothing there except a long way down."

Instead of cleaning the backdrop-floor when in the Attic Room:
	say "There's nothing I can do about the floor. The dirt is all that's holding it together."
	
Instead of touching or smelling or tasting or eating the backdrop-floor when in the Attic Room:
	say "I get enough dirt on me normally without going looking for more."

Instead of jumping when in the Attic Room:
	say "Doesn't sound like a good idea to me!"
	
Before swinging the backdrop-floor when in the Attic Room:
	try jumping instead.

Instead of sleeping when in the Attic Room:
	say "No time for that now!"

Instead of approaching or entering the backdrop-floor when in the Attic Room:
	say "I'm certainly not going to step off them!"

Chapter 2 - Scenery

Section 1 - Cot

A supporter called my cot is enterable, scenery, in the Attic Room. "My cot is made of pinewood – flimsy stuff that you'd never make a clock from. At least the bedframe has edges, so I can find it in the dark. I'd love to have a more solid bed – a horsehair mattress and everything – but it'd be so heavy it'd go straight through my floorboards. 'You'd better not grow,' Drake's told me before. 'Or you'll go straight through yourself.'[paragraph break]Beside the cot is a pencil sketch of my family." Understand "pine", "pinewood", "bedframe", "frame", "wood", "wooden", "bed" as my cot.

Instead of entering my cot:
	say "[one of]Stretching out on the cot gives me a good view through my window. I can see the spires of the Cathedral, tipping with Time's Arrows and flocked with birds. The Archbishop would listen, I'm thinking. If only I could reach him.[or]There's no time for that, Wren![stopping]"

Instead of looking under my cot:
	say "There's a long, long way down there."
	
Instead of pushing or pulling or taking my cot:
	say "Where would it go? Down?"
	
Instead of attacking my cot:
	say "Why? It's my only real friend round here."

Instead of cleaning my cot:
	say "It'll do. I don't mind."

Understand "make [something]" as cleaning when the player's command matches the text "bed", case insensitively.
Understand "make [something]" as cleaning when the player's command matches the text "cot", case insensitively.

Section 2 - Crate

A crate is a container, scenery, in the Attic Room. "A laundry crate containing my spare clothes. Or my spare clothe, anyway."
Understand "laundry" as the crate.

Instead of opening or searching or taking the crate:
	say "Laundry day's not for at least three weeks.";

Instead of taking or pushing or pulling the crate:
	try taking my cot instead.

Instead of looking under the crate:
	try looking under my cot instead.
	
Instead of attacking the crate:
	say "It'll fall and break itself one of these days; I don't need to do anything."


A spare clothe is in the crate.  Understand "clothes", "clothing" as the spare clothe. The description is "That's my other top."

Instead of smelling the spare clothe:
	say "Clean."

Instead of taking the spare clothe:
	say "Leave it. I'll need it soon enough, when they take this top away forcibly on wash day."


Section 3 - Picture

A pencil sketch is scenery, in the Attic Room. The description is "It's a pencil sketch of my family, or at least, that's what the monks say it is. Really, the mother and father don't look a thing like me, and the swarm of children around them don't either. But still, they'd explain why I was donated to the Abbey. Too many mouths to feed already." The printed name is "picture".

Understand "picture", "family", "children", "mother", "father", "drawing" as the pencil sketch.

Instead of taking the pencil sketch: 
	say "I wouldn't want to lose it, or damage it. It's really the only thing I've got, apart from the clock key round my neck."

Section 4 - Window

A window called my window is scenery, in the Attic Room. "On tiptoes, I can see right across the city of St Philip. It's a maze of rooftops like a tangle of thorn bushes. If people could only see this view, then they might not be so strict about Precision and Good Order... Or maybe they would, because looming over all the houses are the great spires of the Cathedral of Time, its great clock keeping time for the whole city.[paragraph break]And the Cathedral is where I would find the Archbishop. I've got to tell him what I heard!". Understand "hole", "tile", "roof tile", "missing roof tile", "missing tile" as my window.

Instead of entering or getting off my window:
	say "The window is too small for me to climb through, and anyway, despite my name, I'm no bird. If I'm going to get to the Cathedral, I'm going to have to go through the Abbey.";

Instead of going up when in the Attic Room: try entering my window instead.

Instead of opening my window:
	say "I call it a window. It's really just a missing roof tile.";

Section 5 - Distant city

The distant city of St Philip is scenery, in the Attic Room. 
Understand "city", "rooftops", "view", "houses", "St Philip", "city of St Philip" as the distant city of St Philip.

Instead of examining the distant city:
	try examining my window;

Instead of doing something when the distant city is physically involved:
	say "It's outside the window.";

Section 6 - Cathedral Spires

The cathedral spires are scenery, in the Attic Room. "Birds flit between the twelve spires of the Great Dome of the Cathedral. The spires mirror the Twelve Devotions of the Greater Rotation[one of]. Rumour among initiates has it that the Cathedral was once a sundial that marked the time by casting shadows on numerals scattered about the city, but then St Newton abolished that, tore up the numerals and hid them away.[paragraph break]They say there are twelve different numbers that used to be the first twelve but now no-one is allowed to use them. I don't believe a word of it, of course[or][stopping]." The printed name is "Cathedral"

Understand "twelve spires", "dome", "great dome", "birds", "church", "time's arrows", "arrows", "time's arrow", "times arrow", "times arrows" as the cathedral spires.

Before doing something when the cathedral spires are physically involved:
	say "It's right across the city from me!" instead;

Understand "Cathedral of Time", "clock", "great clock" as the Cathedral.

Section 7 - Ladder (StaircaseTop / StaircaseBottom)

The old construction ladder is an open door, scenery, down from the Attic Room. Through it is [, up from] the Rickety Stair. "One of the old construction ladders left over from the building of the Abbey. It's a real antique. Some rungs are missing and the middle bends inwards. I can still climb it in my sleep, of course. [if in Attic]The ladder leads down all the way to ground level.[otherwise]The ladder leads up to my room.[end if]". The printed name is "ladder".

Understand "rungs", "rung" as the old construction ladder.

Understand "top", "top of" as the old construction ladder when the location is the Attic Room.
[Understand "bottom", "bottom of" as the old construction ladder when the location is the Attic Room.]

Before climbing up the old construction ladder in Attic Room:
	say "The ladder only goes down from here." instead;

Before climbing down the old construction ladder in Rickety Stair:
	say "The ladder only goes up from here." instead;

Instead of climbing the old construction ladder:
	try entering the old construction ladder;

Instead of taking the old construction ladder:
	say "The ladder's pretty long. I couldn't carry it on my own.";

[After going up through the old construction ladder:
	say "I scramble up the ladder. It's a long way, and pretty exhausting.";
	continue the action;]

After going down through the old construction ladder:
	say "I scramble quickly down the ladder.";
	continue the action;

Chapter 3 - Exits

Instead of going east through the Abbot's Door during Introduction:
	say "No fear. I'm not going back in there.";

Part 3 - Rickety Stair

Chapter 1 - Description                                                                                           

The Rickety Stair is a room. The description is "I'm in the western corner of the Great Hall[if caretaker's ladder is in location], just by the foot of the ladder up to my room (the rest of the hall is east). There's a note attached to the third rung asking Amble the caretaker not to put the ladder back in the garden just yet.[else]. My bedroom is somewhere overhead.[end if]"

After assembling available exits of the Rickety Stair:
	if the caretaker's ladder is in the Rickety Stair:
		add up to the viable directions, if absent;

The printed name of Rickety Stair is "Corner of the Great Hall".

Chapter 2 - Ladder 

The caretaker's ladder is a thing in the Rickety Stair.

Understand "caretakers", "amble's", "ambles", "rung", "rungs", "bottom of", "wooden" as the caretaker's ladder.

Before climbing down the caretaker's ladder:
	say "The ladder only goes up from where I'm standing." instead;

Instead of pushing or pulling or turning the caretaker's ladder when the caretaker's ladder is in the Rickety Stair:
	say "It wobbles, a little wave up towards the ceiling."
	
Instead of looking under the caretaker's ladder:
	if the player is carrying the caretaker's ladder:
		say "I'm there." instead;
	say "Under the ladder is Bad Luck, whether the Abbot agrees with such beliefs or not."

Before hiding behind the caretaker's ladder:
	say "Standing under a ladder is like asking for the sky to fall. Bad luck." instead.

Instead of attacking the caretaker's ladder:
	say "'To break something useful is to suck the stars from the sky,' so the Abbot says."

Instead of touching the caretaker's ladder:
	say "The wood is old, dry, frail - all the things you wouldn't want ladder wood to be."

Section - In the Rickety Stair

Rule for writing a paragraph about the caretaker's ladder when in the Rickety Stair:
	now the caretaker's ladder is mentioned.
	
Instead of entering or jumping on or climbing the caretaker's ladder in the Rickety Stair:
	try going up;

Instead of going up in the Rickety Stair when the caretaker's ladder is not in location:
	if the caretaker's ladder is carried:
		try dropping the caretaker's ladder;
		continue the action;
	say "I'd need my ladder for that!"

Instead of going up in Rickety Stair:
	say "I scramble up the ladder. It's a long way, and pretty exhausting.";
	move the player to the Attic Room;


Section 1 - Taking

Instead of taking the caretaker's ladder when the Herb Garden is unvisited:
	say "[one of]Sure. Wandering around with a twelve foot ladder is going to help me slip through the Abbey unnoticed.[or]I think Drake might catch me, stuck in an archway somewhere.[or]How is a ladder going to help me get past Calvin?[stopping]";

Report taking the caretaker's ladder:
	say "Taken[one of]. Might just do the trick, I think...[or].[stopping]" instead;

Section 2 - Dropping

Instead of putting the caretaker's ladder against something portable:
	say "I can't lean the caretaker's ladder on [the second noun]!"

Instead of putting the caretaker's ladder against a person:
	say "I don't think [the second noun] would want to hold it for me."

Instead of putting the caretaker's ladder against a door:
	say "It'd just fall through."

Instead of putting the caretaker's ladder against something:
	try dropping the caretaker's ladder;

[
Instead of dropping the caretaker's ladder when the player is carrying the caretaker's ladder and the location is not the Herb Garden and the location is not the Rickety Stair:
	say "There's nowhere to lean the ladder here.";
]

Report dropping the caretaker's ladder when in the Rickety Stair:
	say "I put the ladder back into position." instead;

Report dropping the caretaker's ladder when in the Herb Garden:
	say "I lean the ladder up against the wall. It clears the top by a few feet." instead;

Report dropping the caretaker's ladder:
	say "I put the ladder down on the floor and rest my arms." instead;

Section 3 - Carrying between rooms

A room can be too-small-for-a-ladder. A room is seldom too-small-for-a-ladder.

The Scriptorium, the Kitchen, Corridor of Contemplation, the Library are too-small-for-a-ladder.

Instead of going to a too-small-for-a-ladder room when the caretaker's ladder is carried:
	say "[one of]I can't fit through that doorway with this ladder![or]The archway is too small for the ladder.[or]I'd need to get rid of this rust-riven ladder first.[or]If I'm going to cart the ladder around I'd better stick to the main hallways where I'll fit.[cycling]";

After going when the caretaker's ladder is carried:
	if the location is the Herb Garden:
		say "I slip the ladder awkwardly through the doorway.";
	else:
		say "[one of]I stumble along with the ladder.[or]If anyone catches me running around with this ladder, I'm dead.[or]I troop onward with the ladder.[or][run paragraph on][stopping]";
	continue the action.

Section 4 - idle actions

Every turn when the player is carrying the caretaker's ladder and not going and a random chance of 1 in 4 succeeds:
	say "[one of]This ladder's getting really heavy.[or]I'm sure my arm is getting longer by the second.[or]I'm still carrying this ladder, you know.[or][run paragraph on][stopping]";

Chapter 3 - Scenery

Section 1 - LadderNote

The note is part of the caretaker's ladder. The reading matter is "'Please leave. Needed for initiate until a cell is freed up by older brother. – Gubbler.'"

Understand "sign", "writing", "notice" as the note.

Instead of examining the note:
	try reading the note;

Instead of taking the note:
	say "I'll leave the sign be. Last time Amble took the ladder away guess where I was?";

Part 4 - Upper Hall

Instead of making to leave when in the Upper Hall: try going southwest.
Understand "crane neck" as a mistake ("Honestly: I spend my whole life looking up anyway.") when the location is the Upper Hall.

Chapter 1 - Description

A room called the Upper Hall is east of the Rickety Stair. "[one of]The Great Hall of the Abbey is the biggest room I've seen in my life, running from this end all the way southwest (and it is all the way, I'm never allowed any further than the Great Doors and the Yard outside). [or][stopping]If I crane my neck I can see the dark square of the floorboards of my room[if caretaker's ladder is in Rickety Stair] – the ladder snakes down from one side[else] above the darkest corner of the hall[end if], west of here. Lights move in and out overhead, from the candles moving on their Holy Tracks. Strong smells float through an archway to the east.[paragraph break]From their niches, the Three Major Saints are watching sternly, keen that I should [one of]get[or]head southwest[stopping] out of the Cathedral and see the Archbishop as quickly as possible."

Chapter 2 - Scenery

Section 1 - Statues

Some statues are scenery, in the Upper Hall. The description is "The Three Major Saints examine me right back, their faces shining with Holy Precision. St Breguet, the Maker; St Newton, the Thinker; and St Babbage, the Calculatrometrist. They're only statues, of course, but they're still quite creepy here in the half-light of the moving candles[one of].[paragraph break]They all stare southwest, towards the doors and beyond, the Cathedral. Home of the Archbishop[stopping]."

Understand "three", "major", "saints", "st", "saint", "statue", "of", "the", "niche", "niches" as the statues.
Understand "isaac", "newton", "thinker" as the statues.
Understand "charles", "babbage", "calculometrist" as the statues.
Understand "abraham", "breguet", "maker" as the statues.

Instead of taking or pushing the statues:
	say "The Saints quite clearly disapprove."

Chapter 3 - Hall Backdrops

Section 1 - Buttresses

Some buttresses are a backdrop, in the Upper Hall, the Central Hall and the Lower Hall. "The stone pillars supporting the roof are like trees."

Understand "stone", "pillars" as the buttresses.

Instead of climbing the buttresses:
	say "The buttresses are too tall, too wide and too smooth for me to climb, even if I wanted to."

Section 2 - Candle-tracks

Some candle-tracks are a backdrop, in Upper Hall, Central Hall and Lower Hall. "The candles move in the space between floor and ceiling, the way the stars move between Earth and the Great Darkness of Heaven. They're follow winding metal tracks that cross and recross along the length of the Great Hall, and as they move, pools of light form and then dissolve, so that some parts of the chamber are brightly lit at times whilst others are quite dark. The candles move day and night, with automatic systems to replace those that burn down to the stub."

Understand "candle", "candles", "track", "tracks", "patterns", "holy" as the candle-tracks.

Before doing something when the candle-tracks are physically involved:
	say "They're high above me, out of reach." instead.

Section 3 - Floorboards

Some floorboards_glimpse is a glimpse backdrop in the Upper Hall. Understand "floorboard", "floorboards", "floor board/boards", "rafter", "rafters" as the floorboards_glimpse. The printed name is "floorboards". The description is "That's my room up there."

Understand "ladder" as the floorboards_glimpse when the caretaker's ladder is in the Rickety Stair.

Instead of approaching the floorboards_glimpse:
	try going west.

Part 5 - Kitchen

Instead of going inside when in the Kitchen:
	try going north instead.

Instead of making to leave when in the Kitchen:
	say "I leave the Kitchen by the west door.";
	try going west instead.

Understand "make tea" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "make a cup of tea" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "make cup of tea" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "make a brew" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "brew tea" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "brew a cup of tea" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "brew cup of tea" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.
Understand "brew a brew" as a mistake ("That's exactly what the tea maker's for.") when the location is the Kitchen.

Chapter 1 - Description

The Kitchen is east of the Upper Hall. "[if Gong Sounding is not happening]If there was ever a proof of the perfection of Clockwork over Nature, it's that the dirtiest and most hectic room in the whole Abbey is its Kitchen. Shelves, walls and floor are covered by machines belching, slicing, steaming, chopping, stirring, boiling, broiling, frying, pureeing ... the list goes on. The noise, smell and heat is almost overpowering, and the Cook, who controls this madhouse, can only stand it because he's stone deaf. [otherwise]The Cook is working like a double-escapement all of a sudden, probably trying to get dinner ready two hours too soon! [end if][if Quest for Tea is happening][paragraph break][tea machine details][end if][paragraph break]The cool of the Hall is west. South, through a broad arch, is the Refectory[if Gong Sounding is happening], where the Refectory Clock is throwing up a wall of sound[end if]. North is the dark recess of the Pantry."

To say tea machine details:
	say "In one corner is the only machine I'm allowed to use: the Tea Maker. [if the bracket contains the empty teacup]In the bracket of the machine is a teacup. [otherwise if the bracket contains the full teacup]In the bracket of the machine is a steaming cup of tea. [end if]";

Instead of inserting the teacup into the tea-machine:
	try inserting the teacup into the bracket;

Instead of putting the new gear on the tea-machine:
	try inserting the new gear into the gear train;

Instead of inserting the new gear into the tea-machine:
	try inserting the new gear into the gear train;

Instead of putting the small gear on the tea-machine:
	try inserting the small gear into the gear train;

Instead of inserting the small gear into the tea-machine:
	try inserting the small gear into the gear train;

Instead of inserting the handful of tea leaves into the tea-machine:
	try inserting the handful of tea leaves into the basket;

Chapter 2 - The Cook

Section 1 - Description

The Cook is a man, scenery, in the Kitchen. "[if Gong Sounding is not happening]The story goes that the Cook lost his hearing while setting rat-traps inside the great Refectory Clock. He'd been late about his chores and so instead of being there at 4.30 like his rota told him to, he was there at 5.00. When the gongs rang for dinner, he was still inside the case. If it's true, then never mind his ears, it's a wonder he can still [i]see[r] or [i]think[r]. That clock is [i]seriously[r] loud.[otherwise]The Cook has gone into double-time.[end if]"

Rule for speaking with the cook:
	say "The Cook doesn't waste time trying to lip-read. He picks me up, puts me to one side, and gets back to [one of]walloping the toaster[or]scooping soot from the grill[or]injecting steam through a waxed cloth pipe into a pot[or]cooking[or]plugging holes in a hot-water pipe with bread dough[or]setting dials on the furnaces[or]stirring a pan using a three-foot spoon[at random]." instead.

Section 2 - Idle actions

Every turn when the player can see the Cook and a random chance of 1 in 3 succeeds:
	if the slice of lemon was off-stage and the slice of lemon is in the teacup:
		do nothing;
	otherwise:
		say "The cook [one of]pushes[or]bustles[or]scurries[or]knocks[at random] past me, to [one of]unclip[or]wind[or]respring[or]tighten[or]thump[at random] the [one of]whisker[or]grater[or]steamer[or]masher[or]broiler[or]oven[or]crumb-sucker[at random].";

Chapter 3 - Scenery

Section 1 - Machines

Some machines are scenery, in the Kitchen. The description is "Pipes run like cobwebs between a hundred fantastic devices. One entire corner is given over to automatic egg-boiling: 'A Holy Problem of Timing,' Gubbler once said. Other wires, pulleys, ducts and cog-teeth cross the floor and ceiling, and the Cook is constantly sweeping muck and crumbs out from the mechanisms in a desperate attempt to keep them in good order.[paragraph break]The one machine I'm allowed to use is the Tea Maker, which is a whole world of gears and baskets and spigots in itself."

Understand "pipes", "devices", "wires", "pulleys", "ducts", "cog-teeth", "whisker", "grater", "cooker", "boiler", "crumb sucker", "steamer", "masher", "broiler", "oven", "crumb-sucker" as the machines.

Instead of doing something when the machines are physically involved:
	say "[one of]The Cook hurtles over and beats me away with a towel.[or]The Cook scowls and slaps me away.[or]I might lose a finger if I tried that![at random]";

Section 2 - a pantry to hide in

A pantry-ghost is scenery, privately-named, in the Kitchen. The description is "The pantry is a dark recess to the north[one of]. Strong smells wander out like labourers from a beer break[or][stopping]."

Understand "pantry" as the pantry-ghost.

Instead of smelling the pantry-ghost:
	say "I pop my head inside...";
	try going north;
	say "...and take a good sniff. Mmm...";
	try smelling instead.

Before hiding inside the pantry-ghost:
	if the location is not Drake's future destination and the location is not Drake's next destination:
		say "I can't hear Drake coming so I'm clock-on for now." instead;
	otherwise:
		say "I duck into the pantry.";
		try going north instead;

Instead of searching or entering the pantry-ghost:
	try going north instead;

Instead of hiding from view when the location is the Kitchen and Drake's Patrol is happening:
        try hiding inside the pantry-ghost;

Part T - The Tea Machine

An internal gubbin is a kind of thing.

Instead of doing something when an internal gubbin (called the bit) is physically involved:
	say "[The bit] is central to the machine, literally. Well out of reach." instead;

The tiny sail is an internal gubbin, part of the tea-machine.
The thread is an internal gubbin, part of the tea-machine.
The gauze is an internal gubbin, part of the tea-machine.
The thin metal strut is an internal gubbin, part of the tea-machine.
The pin is an internal gubbin, part of the tea-machine.
The belly spring is an internal gubbin, part of the tea-machine. The printed name of the belly spring is "spring".
The flint-iron is an internal gubbin, part of the tea-machine. Understand "flint", "iron", "striker", "match" as the flint-iron.

Rule for printing the description of the tiny sail:
	say "The sail is used to lift the flint-iron and strike the light."

Rule for printing the description of the thread:
	say "The thread pulls the flint-iron up."

Rule for printing the description of the gauze:
	say "The gauze collects steam from the kettle. When there's enough steam, the gauze tilts and the kettle is taken off the heat."

Rule for printing the description of the thin metal strut:
	say "The thin metal strut is how the gauze is attached to the kettle."

Rule for printing the description of the pin:
	say "The pin is a small switcher for closing off the gas pipe."

Rule for printing the description of the belly spring:
	say "The spring is the heart of the machine. Every machine must have one - even you!"

Rule for printing the description of a flint-iron:
	say "The flint-iron is the traditional clockwork part for making flame."

Rule for printing the description of an internal gubbin:
	say "It's part of the tea machine's Holy Workings."

Definition: a thing is tea-critical:
	if it is the tea-machine lever, no; [can be pulled even when the machine is on]
	if it is part of the Tea-Machine, yes;

Instead of doing something to a tea-critical thing when the Tea-Machine is switched on:
	say "Don't interfere. The machine is making its right and proper supplications.";

Instead of opening the Tea-Machine:
	say "I'm a Second Assistant Clock Polisher. I'm not allowed to go poking around inside Tea Machines, their insides are far too Holy."

Chapter 1 - Machine 'Chassis'

The Tea-Machine is a privately-named device, scenery, in the Kitchen. The description is "[if switched off]Very complex, but robustly built and able to perform its functions a few thousand times without needing oil. It consists of a framework of arms and struts, most of which move, though there's a plate at the front to hold the primary gear-train that's between the lever and the winding key.[paragraph break]Inside the machine I can make out a kettle, a spigot, and a basket suspended over a semi-circular bracket. There's a burner somewhere, too.[otherwise]The machine is clanking, spinning, whirring and generally doing its thing.[end if]"

Instead of taking the Tea-Machine:
	say "The machine is plumbed, weighted, counter-balanced, sprung and assembled with all the Holy Engineering that the Abbey can spare for its kitchens. I can't just walk off with it even if I [i]could[r] pick it up."

The printed name of the tea-machine is "Tea Maker".
Understand "machine", "maker", "tea machine", "tea maker" as the tea-machine.

Before switching on the switched off tea-machine:
	say "It does no good to talk to a machine so casually, as Gubbler would say. Each sacred part must be treated as an individual operating within a larger purpose. Keys must be wound, levers pulled, spigots opened... that sort of thing." instead;

Instead of switching on the switched on tea-machine:
	try pulling the tea-machine lever instead;
	[ resulting in 'The machine is working already.' ]

Chapter 2 - Spigot

The spigot is a device, part of the tea-machine. The description is "[one of]The spigot is a short tube [if the tea-machine is switched off]above the kettle [end if]with a hook-shaped valve halfway up that can be opened. Somewhere in the other corner of the Kitchen it's plumbed into the water tank, which in turn is fed by ducts from the ceiling, into which water is loaded by thirsty initiates – and so on it goes; a Great Rotation.[or]Basically, it's a tap over the kettle.[stopping]".

Understand "valve", "tube", "tap", "faucet" as the spigot.

Instead of turning or opening the spigot:
	try switching on the spigot;

Before switching on the spigot when the kettle is full:
	say "There's plenty of water in the kettle, thanks." instead;

Instead of switching on the spigot:
	now the kettle is full;
	say "The spigot releases a steady dribble of water into the kettle, filling it nicely. Across the room, the clouds coming from the steamer suddenly thin out.[paragraph break]The Cook stops and gives me the most evil of evil stares. I turn the spigot closed again." instead;

Chapter 3 - Kettle

The kettle is a fake container, open, openable, part of the tea-machine. The description is "The brass kettle is suspended from an arm-brace under the spigot and near the burner. [if full]It's full of water.[end if]"

Rule for printing the description of the kettle when the tea-machine is switched on:
	say "The kettle is steaming away.";

Understand "brass", "brace" as the kettle.
Understand "empty" as the kettle when the kettle is empty.
Understand "full", "water" as the kettle when the kettle is full.

Before closing, opening or emptying the kettle:
	say "The kettle is set in the middle of the machine, over the burner, safely out of reach.";

Instead of filling the kettle:
	try switching on the spigot;

Instead of taking or pulling or pushing the kettle:
	say "The kettle is a fixed part of the machine, built into place underneath the spigot."

Chapter 4 - Burner

The burner is an internal gubbin, part of the tea-machine.
The description is "The burner is a little spout for the gas which is pumped in from the cow-sheds in the countryside, or so Drake says. It's currently unlit but on one side is the flint-iron, ready to spark should the gear-train connected to it be put in motion."

Rule for printing the description of the burner when the tea-machine is switched on:
	say "The burner is [if the burner is lit]firing[otherwise]cooling[end if].";

Understand "spout", "gas", "pipe" as the burner.

Understand "lit", "fire", "flame", "firing" as the burner when the burner is lit.

Understand "unlit" as the burner when the burner is unlit.


Chapter 5 - Flint-Iron

The flint-iron is an internal gubbin, part of the tea-machine. The description is "An iron slice set over a flint block. Eventually the flint will wear down and some lowly machinist will have to take the whole Tea Maker apart to change it. Given how long flint lasts – and how lowly I am now – that machinist might still end up being me."

Understand "flint", "iron", "block", "slice" as the flint-iron.

Chapter 6 - Basket

The basket is an open fake container, not openable, part of the tea-machine. The description is "A fine-mesh wire basket positioned near the front of the machine, right over the circular bracket[if full]. It's filled with fresh tea leaves[end if]."

Understand "wire", "mesh", "fine-mesh", "fine" as the basket.

Understand "tea", "leaves", "tealeaves", "leaf", "tealeaf" as the basket when the basket is full.

Before opening or closing the basket:
	say "The basket has no lid. It's just waiting to be filled.";

Instead of filling the basket when the player carries the handful of tea leaves:
	try inserting the handful of tea leaves into the basket;

Instead of inserting the handful of tea leaves into the empty basket:
	abide by the check inserting it into rules;
	now the basket is full;
	remove the handful of tea leaves from play;
	say "The basket's now filled with tea leaves.";

Instead of inserting the handful of tea leaves into the full basket:
	say "The basket's full already."

Instead of inserting something into the basket:
	abide by the check inserting it into rules;
	let the first word be the printed name of the noun in sentence case;
	say "[first word]-tea wouldn't go down well with anybody." instead;

Instead of taking the basket:
	say "The basket is firmly fixed to the machine by two long struts, designed to shake out the last drops towards the end of the process. 'No cog left unturned,' as Gubbler would say.";

Instead of searching the full basket:
	say "The basket contains a handful of tea-leaves.";

Before removing something from the tea-machine when the noun is enclosed by the tea-machine:
	try taking the noun instead.

Chapter 7 - Bracket

The bracket is an open container, part of the tea-machine. The description is "Just below the main gear train is a semi-circular bracket made of silver[if the teacup is not in the bracket], unsurprisingly about the size of a teacup.[otherwise if the teacup is empty], in which is a tea cup waiting for tea.[otherwise] in which is a nice full cup of tea.[end if]"

Understand "silver", "semicircle", "semi-circle", "semi circle" as the bracket.

Instead of opening or closing the bracket:
	say "The bracket has no lid. It's a kind of metal pincer.";

Instead of inserting something into the bracket when the noun is not the teacup:
	say "The bracket's right and proper function is to hold a teacup only.";

Instead of inserting the full teacup into the bracket:
	say "The bracket's meant for empty cups, not full ones.";

Before putting something on the bracket:
	try inserting the noun into the bracket instead.

Chapter 8 - Gear Train

Section 1 - Description

The gear train is part of the tea-machine.

The description is "[if the tea-machine is switched on]The gears are whirring quite happily.[otherwise if the new gear is part of the gear train]The gear train forms a perfect snake from the lever, over the semi-circular bracket and into the innards of the machine.[otherwise if the small gear is part of the gear train][one of]I can't help but notice a worn down gear in the middle of the train, no longer catching teeth with its fellows. I make the sign of Sad Depreciation.[or]One small central gear is too worn to mesh with the others. 'The weak ones removed and replaced by better,' Gubbler might intone.[stopping][otherwise]The gear train is most sadly broken by the lack of one small cog. If the Cook sees this, he'll get very upset.[end if]"

Understand "gears", "cogs", "cog" as the gear train.

Does the player mean doing something with the gear train:
	it is unlikely;

Section 2 - Small, worn-down gear

The small gear is part of the gear train. The description is "Half the teeth have rounded, like those of an old man, the kind that eats nothing but cabbage[if new gear is not handled]. I'm going to need to find a new one from somewhere[end if]."

Understand "worn", "worn down", "worn-down", "teeth", "cog", "old gear/cog" as the small gear.

Understand "central" as the small gear when the small gear is part of the gear train.

Instead of taking the small gear when the small gear is part of the gear train:
	now the player carries the small gear;
	say "While the Cook is distracted – the Cook is [i]always[r] distracted – I pluck the out the worn down gear. Not the sort of repair a clock polisher should be doing!";

Instead of sharpening the small gear:
	say "I don't have the skills or grace to sharpen a cog probably. I'm going to need to find a new one instead.";

Instead of repairing the small gear:
	say "It's worn. There's nothing anyone can do to change that.";

Section 3 - Making repairs

Instead of putting the new gear on the small gear when the small gear is part of the gear train:
	try inserting the new gear into the gear train instead.

Instead of inserting the new gear into the gear train when the small gear is part of the gear train:
	try taking the small gear;
	if the small gear is not part of the gear train:
		continue the action;

Instead of inserting the new gear into the gear train:
	remove the new gear from play;
	now the new gear is part of the gear train;
	say "I slip the new gear into place. [run paragraph on]";
	try examining the gear train;

Chapter 9 - Tea Maker Key

The tea-machine key is privately-named, part of the tea-machine. The description is "A steel key, used to wind the belly spring of the Tea Machine." The printed name is "tea maker key".

Understand "key", "winding", "winding-key", "steel key" as the tea-machine key.
Understand "tea machine", "tea maker", "machine", "winding", "key", "winding-key" as the tea-machine key when the player's command matches the text "key", case insensitively.

The tea-machine key can be wound or unwound. The tea-machine key is unwound.

After turning the tea-machine key:
	now the tea-machine key is wound;
	say "A few turns and the spring is fully wound.";

Instead of turning the wound tea-machine key:
	say "It's already wound as far as it will go.";

Instead of taking the tea-machine key:
	say "The key is fixed deep inside the device.";

Instead of turning the belly spring [ > WIND SPRING ]:
	try turning the tea-machine key.

Chapter 10 - Tea Machine Lever

Section 1 - Description

The tea-machine lever is privately-named, part of the tea-machine. The description is "A large steel lever set between the gear train and the Tea Maker's key. This is the Tea Maker's main control." The printed name is "lever".

Understand "main", "control", "steel", "lever" as the tea-machine lever.
Understand "main", "tea machine", "tea maker", "machine", "steel", "lever" as the tea-machine lever when the player's command matches the text "lever", case insensitively.

Section 2 - Actions

Instead of pushing the lever,
	try pulling the lever;

Instead of switching on the lever,
	try pulling the lever;

Instead of pulling the lever:
	abide by the tea-making rules;
	change the current script to { TEA1, TEA2, TEA3, TEA4 };

Section 3 - Implementation

The tea-making rules is a rulebook.

A tea-making rule:
	if the tea-machine is switched on,
		say "The machine is working already." instead;

A tea-making rule:
	if the teacup is full,
		say "I don't have another empty tea cup." instead;

A tea-making rule:
	if the kettle is empty,
		say "The Cook gawps, then troops over and belts me around the head. He points firmly at the kettle in the middle of the machine – the [i]empty[r] kettle in the middle of the machine – then stalks back over to his chopping machine." instead;

A tea-making rule:
	if the basket is not full,
		say "Don't you think the tea would be rather bland if I don't put some [i]tea[r] in? The machine is clockwork but it's not [i]magic[r], you know!" instead;

A tea-making rule:
	if the teacup is not in the bracket,
		say "Everything's set, certainly, except there's nowhere for the tea to go – except out of the basket, through the semi-circular bracket where the tea-cup's supposed to go, and then all over my feet." instead;

A tea-making rule:
	if the tea-machine key is unwound,
		say "The lever moves without resistance. It's been long enough since breakfast, clearly, that the spring has wound down." instead;

A tea-making rule:
	if the small gear is part of the gear train:
		say "[one of]The lever locks down and sets the first few gears in motion. But it doesn't seem to be carrying over correctly[or]The lever doesn't do anything[stopping]. [run paragraph on]";
		try examining the gear train;
		say "I release the lever and it springs back up." instead;

A tea-making rule:
	if the new gear is not part of the gear train,
		say "The lever locks down but there's a gear missing on the front of the machine, so the train of cogs can't connect. I release the lever again and it springs back up." instead;

Section 4 - Tea making script

TEA1 is a scripted event. The display text is "The gear train whirrs into life, swinging the kettle across inside the machine. Its base knocks open the gas-pipe tap. A jet of gas hisses out, blowing up a tiny sail attached by thread to the flint-iron. The burner is quickly alight."

After firing TEA1:
	now the tea-machine is switched on;
	now the burner is lit;

TEA2 is a scripted event. The display text is "After a minute or so, steam begins to rise from the kettle. This steam collects on a fine gauze over the kettle, which slowly weighs down on a thin metal strut. Eventually, the pressure is enough to flip a counterweight, and the gauze tilts, pushes the kettle onto its side. Boiling water pours from the spout and into the basket of tea leaves. As the kettle empties, its weight shifts and it swings back. A pin on one side knocks closed the gas pipe."

After firing TEA2:
	now the kettle is empty;
	now the burner is unlit;

TEA3 is a scripted event. The display text is "The basket on the tea-maker slowly filters tea into the waiting cup. Meanwhile, the slowing gears move the kettle back to its original position below the spigot, and the water on the gauze sheet evaporates away. All is restored: 'Every cog comes full circle,' as they say."

After firing TEA3:
	do nothing;

TEA4 is a scripted event. The display text is "The lever springs back. The tea is finished. In a final convulsion, the machine spits the used tea leaves out the back and into a composter duct, ready to be fed to the cows that provided the gas... It's certainly neat."

After firing TEA4:
	now the basket is empty;
	now the teacup is full;
	now the tea-machine is switched off;

TEA1 is clustered with TEA2, TEA3 and TEA4.

Rule for firing a scripted event (called the happening) that is clustered with TEA1:
	if the player can see the tea-machine,
		say "[display text of the happening][paragraph break]";
	otherwise do nothing;

Instead of taking the teacup when the tea-machine is switched on:
	say "The cup's locked into place inside the machine."

Section 5 - - - And a slice of lemon

The slice of lemon is a thing. The description is "A slice of lemon."

Instead of doing something when the slice of lemon is physically involved:
	say "Don't. That would spoil the tea.";

After taking the full teacup when the teacup was in the bracket:
	move the slice of lemon to the teacup;
	say "I lift the cup carefully from the machine. The Cook turns and for the first time seems to notice me. He looks furious. 'And where you thin['] you go wi['] tha[']?' he demands. 'Wait. Wa['].'[paragraph break]After a bit of tidying, he finds a button to press. A machine coughs and wheezes, and eventually a small half-slice of lemon squeezes from a slot. The Cook snatches it and drops it into my tea cup. 'Ri['] you are,' he says, and then waves me away.";

Instead of drinking the full teacup:
	say "After all that? No way. I prefer milk anyway.";

Instead of emptying the full teacup:
	say "After all that? No way.";

Instead of inserting something into the full teacup:
	say "Don't. That would spoil the tea."

Part P - The Pantry

Instead of making to leave when the player is in the Pantry:
	try going south instead.

Chapter 1 - Description

The Abbey Pantry is a room. It is north of the Kitchen. "The Pantry is as tiny as a clock-case and filled with shelves that smell of herb and oil - but it's dark enough to hide someone like me..."

Section 1 - Using your nose

SMELLPANTRY is a trigger.

Instead of smelling in the Abbey Pantry:
	say "The strongest smell comes from the jar of tea leaf on the shelves.";
	fire SMELLPANTRY;

Section 2 - Giving it away for players who don't notice

Instead of going south from the Pantry when SMELLPANTRY is unfired:
	say "I'm distracted for a moment by a strong smell from one of the jars. It's only tea but it makes my stomach turn circles. [i]How[r] long till five o'clock and dinner time?";
	fire SMELLPANTRY;

Chapter 2 - Scenery

Some pantry-shelves are a supporter, in the Abbey Pantry. The printed name is "pantry shelves".

Rule for writing a paragraph about the pantry-shelves when SMELLPANTRY is fired:
	say "The strongest smell in the room comes from a jar of tea leaf on the shelves." instead;

Rule for writing a paragraph about the pantry-shelves:
	now the pantry-shelves are mentioned instead;

Understand "shelf/shelves", "jars", "canisters", "containers", "herb", "herbs", "spice", "spices" as the pantry-shelves.

Instead of putting something on the pantry-shelves:
	say "I'm an Assistant Clock-polisher, not a shelf-stacker!";

Instead of examining the pantry-shelves:
	try searching the pantry-shelves.

Instead of searching the pantry-shelves:
	fire SMELLPANTRY;
	say "The shelves are cluttered with all sorts of things, including a jar of tea leaf.";

Section 1 - Jar of tea leaf

A jar of tea leaves is a container, privately-named, portable, on the pantry-shelves. The description is "A glass apothecary jar of tea leaves, that come shipped in by Zepplin from the Asynchronous Continent." The printed name is "tea leaves". 

Understand "tea", "leaf", "leaves" as the jar of tea leaves when the location does not enclose the handful of tea leaves.

Understand "glass", "apothecary", "jar", "jar of", "tea", "leaves", "leaf" as the jar of tea leaves when the player's command matches the text "jar", case insensitively.

Instead of taking the jar of tea leaves:
	now SMELLPANTRY is fired;
	if the player carries the handful of tea leaves:
		say "I take a couple more leaves.";
	otherwise:
		move the handful of tea leaves to the player;
		say "I scoop up a handful of tea leaves.";

[Before inserting the jar of tea leaves into something when the player does not carry the handful of tea leaves:
	say "(first taking some tea from the jar)[command clarification break]";
	now the player carries the handful of tea leaves;
	try inserting the handful of tea leaves into the second noun instead; ]

Before printing the name of the jar of tea leaves when asking which do you mean:
	say "jar of ";

Instead of inserting something into the jar of tea leaves:
	say "I'd be in big trouble if I messed up the tea in this place. It's the sacred drink of the workshop men, and it's pretty expensive too.";

Instead of opening or closing the jar of tea leaves:
	say "The jar doesn't have a stopper.";

[ Some dummy tea leaves are privately-named, inside the jar of tea leaves. The printed name is "tea leaves". Understand "loose" as the dummy tea leaves.

Instead of taking the dummy tea leaves: try taking the jar of tea leaves;
Instead of examining the dummy tea leaves: try examining the jar of tea leaves;

Before printing the name of the dummy tea leaves when asking which do you mean:
	say "loose ";

After printing the name of the dummy tea leaves when asking which do you mean:
	say " (inside the jar)"

Does the player mean doing something with the dummy tea leaves:
	it is very unlikely; ]

Section 3 - Handful of tea leaves

A handful of tea leaves is a thing. The description is "A handful of tea leaves." Understand "leaf" as the handful of tea leaves.

Instead of inserting the handful of tea leaves into the jar of tea leaves:
	remove the handful of tea leaves from play;
	say "I put the tea leaf back into the jar.";

Instead of dropping the handful of tea leaves:
	remove the handful of tea leaves from play;
	say "I scatter the tea leaves. They quickly disintegrate and are gone.";

Instead of putting the handful of tea leaves on something:
	try dropping the handful of tea leaves instead;

Instead of inserting the handful of tea leaves into something:
	try dropping the handful of tea leaves instead;

Instead of inserting the handful of tea leaves into the kettle:
	say "Come off it, Wren! There's this whole mechanism built with Holy Precision just to stop bits of tea-leaf ending up in the tea, and you want to just dunk the whole lot it?"

Instead of putting the handful of tea leaves on the kettle:
	try inserting the handful of tea leaves into the kettle.

Part 6 - Library

Chapter 1 - Description

The Library is a room. "The Abbey's library is small compared to the one in the Cathedral. There's nothing on the shelves but the key texts: the Principia, the Mechanistica and the Determininium. Only Brother Horloge, the Abbey's Primary Reader ever seems to use them – he's here at the moment, studying at his desk by the poor light coming through the stained glass windows. [if Horloge's keys are on the wheeled table]By his elbow is a fat bunch of keys. [otherwise if Horloge's keys are in the location]On the floor by his feet is a fat bunch of keys. [end if]On his shoulder is his mechanical owl, wings folded.[paragraph break]An archway leads east back into the hall. From the southwest comes the clatter of Writing hammers and the sharp smell of burnt ink.[if Gong Sounding is happening][paragraph break]Brother Horloge doesn't seem to notice the ringing gongs. He's too engrossed in the smells from his teacup.[end if]"

Chapter 2 - Scenery

Section 1 - Shelves

Some shelves are scenery, in the Library. "The shelves have a lean to them because the [i]Determininium[r] by St Babbage is such a weightier tome than the [i]Principia[r] of St Newton. 'Truly blessed are the smaller and most intricate,' as they say."

Understand "shelf", "shelving" as the shelves.

Instead of putting something on the shelves:
	say "The shelves are only for the holiest of texts.";

Instead of climbing the shelves:
	say "They'd collapse in a moment.";

Section 2 - Books

Some books are scenery, in the Library. "Old leather bound tomes."

Understand "leather", "bound", "tomes", "holy", "texts", "determinium", "principia", "mechanistica", "leather-bound" as the books.

Instead of taking the books:
	say "[one of]A 2nd Assistant Clock Polisher isn't even allowed to dust the Holy Texts. Besides, I only read Latin and these books are all in Mathematik.[or]Really, these books are in Mathematik. I barely speak my own language.[or]I can't read these books! They're all Holy Gibberish![stopping]";

Instead of reading the books:
	try taking the books;

Instead of researching when in the Library:
	try taking the books.

Instead of consulting the books about when in the Library:
	try taking the books.

Section 3 - Stained Glass Window

The library astrolabe window is a stained glass window, scenery, in the Library. "The glass panels are stained to depict a watch escapement, an astrolabe and below them both, the wide-spread arms of a beatific orrey. Not much light gets through them at all."

Understand "windows", "panels", "panel", "watch", "escapement", "astrolabe", "orrey" as the library astrolabe window.

Section 4 - Table

A wheeled table is fixed in place, Drake-hideable, in the Library. The description is "The table is set on little brass castors to allow Brother Horloge to follow the feeble patch of sunlight around the room."

Understand "castor", "caster", "castors", "casters", "wheel", "wheels" as the wheeled table.

Rule for writing a paragraph about the wheeled table:
	[we suppress any "on the wheeled table is..." style messages:]
	now the wheeled table is mentioned;

Section 5 - Manuscript

A manuscript is scenery, in the Library. "Horloge is poring over a complex diagram, depicting the inner works of a [i]fusee[r]."
Understand "fusee", "diagram", "complex diagram" as the manuscript.

Instead of taking the manuscript:
	say "Brother Horloge is busy with it.";

Chapter 3 - Horloge

Section 1 - Description

Horloge is a monk, scenery, in the Library. "Horloge's eyes are screwed up behind the most complicated pair of spectacles I've ever encountered. They make it hard to even see his eyes – or rather what's left of them. He's read in the darkness here in the Library for so long he's basically blind. On his shoulder sits his pet owl. Same as Brother Horloge it looks more fearsome than it actually is.[if Horloge's keys are on the wheeled table][paragraph break]By his elbow is a fat bunch of keys.[otherwise if Horloge's keys are in the location][paragraph break]On the floor by his feet is a fat bunch of keys.[end if][paragraph break][if Horloge is sipping his tea]He's sipping his tea, quite content, eyes half-closed.[otherwise]He's poring over a page of manuscript, muttering quietly to himself.[end if]"

Horloge's spectacles are carried by Horloge. "Horloge was probably born wearing spectacles. They're made of bottle-glass, ground to the right thickness.  'Spectacles are either expensive,' as he's told me, 'or simply not very good.'"

Before doing something when Horloge's spectacles are physically involved:
	say "I'd better leave them be[one of]. He's blind without them[or][stopping]."

Section 2 - Idle Actions

The HorlogeCounter is a counter. The top end is 4. The internal value is 2. [We have the 'quest for tea' event on the first turn we enter.]

Every turn when the player can see Horloge:
	increment the HorlogeCounter;

Rule for firing the HorlogeCounter:
	say "[if Horloge is not sipping his tea][one of]Brother Horloge mumbles as he traces over the sheet of manuscript.[or]The sun shifts a little, and the Brother nudges the table to follow the pool of light.[or]Horloge's finger shakes terribly as he traces the Holy Lines across the sheet.[or]Horloge reaches up to pet his owl. The bird is motionless.[or]Horloge chucks his pet owl under its beak. There is no reaction.[at random][otherwise][one of]Brother Horloge leans back in his chair and sips his tea with eyes closed.[or]Horloge is clearly enjoying his cup of tea.[or]Horloge reaches up to stroke his owl. The bird is motionless.[at random][end if]";

Section 2b - Asking for

[ In future though, we might consider removing the "asking it for" action altogether, and have instead:
	[ Understand "ask [someone] for [text]" as asking it about. ]

...And dealing with whatever (hopefully lesser) problems that brings. ]

Instead of asking Horloge for Horloge's keys:
	if Horloge's keys are carried:
		say "I don't need to!";
	else:
		try taking Horloge's keys.

Instead of asking Horloge for the mechanical owl:
	say "He'd never give me his owl. It'd be like giving me his lungs, or one of his arms."

Instead of asking Horloge to try turning or switching on the mechanical owl:
	say "I think the Brother knows how to wind a clockwork. He doesn't need [i]me[r] to tell him."

Section 3 - Conversation

TRIG_WHOTSIT is a trigger.

Rule for firing unfired TRIG_WHOTSIT:
	say "I open my mouth to speak.[paragraph break]'Look here, Whotsit,' he interrupts. 'I've been at these books all day. Grappling with the Mysteries of the Whotsit. A cup of whotsit, that's all I want.'[paragraph break]";

Rule for speaking with Horloge when TRIG_WHOTSIT is unfired during the Quest For Tea:
	fire TRIG_WHOTSIT;

After speaking with Horloge when Horloge's keys are on the wheeled table:
	move Horloge's keys to the location;
	say "[one of]He's so enthusiastic as he talks that he knocks his keys onto the floor, though he doesn't seem to notice.[or]He knocks his keys back onto the floor.[or]He knocks his keys onto the floor again.[stopping]";

The conversation table of Horloge is the Table of Horloge's Conversation.

Table of Horloge's Conversation
topic					conversation
"drink" or "a drink"			CT_HOR1_DRINK
"tea"					CT_HOR1_TEA
"whotsit/wotsit/whatsit/watsit"		CT_HOR1_WHOTSIT

CT_HOR1_DRINK is a conversation topic. The enquiry text is "'A drink?' I ask." The response text is "'A good cup of that whotsit, yes. Now run.' He waves a finger vaguely. 'Run along.'".

CT_HOR1_TEA is a conversation topic. The enquiry text is "'A cup of tea?' I ask.". The response text is "'Of course a cup of whotsit!' Horloge replies hotly. 'Do I have to say everything twice? Do I have to...' He pauses, appearing to have forgotten what he was saying. 'Say everything twice?' he finishes, uncertainly. 'Good.'" 		

CT_HOR1_WHOTSIT is a conversation topic. The enquiry text is "'A whotsit?' I ask.". The response text is "'Yes, quite right,' he replies, shaking a finger. 'Nice and hot.'"

The default topic of Horloge is CT_HOR1_DEFAULT.

CT_HOR1_DEFAULT is a conversation topic. The enquiry text is "I open my mouth to speak." The response text is "[one of]'Don't stand there babbling,' Horloge interrupts. 'I mean, really, very simple. Just a cup of... a cup of... you know. Yes.'[or]'What kind of scullery maid are you?' he interrupts. Blinder than I thought, clearly. Any monk should know a 2nd Assistant Polisher when they see one.[or]'A cup of whotsit, whotsit,' he insists. 'And don't spare the horses.'[stopping]"

Section 4 - Owl

Horloge's mechanical owl is carried by Horloge. The description is "Horloge's mechanical owl sits on his shoulder. It seems to be asleep, its spring unwound." The printed name is "Owl". Understand "rachael", "spring" as the mechanical owl.

Instead of turning Horloge's mechanical owl:
	say "The owl seems to have lost its key somewhere. It's probably on Horloge's keyring.";

Instead of unscrewing Horloge's mechanical owl with the lucky clock key:
	say "My clock key would never fit Horloge's bird: it's far too delicate a mechanism.";

Instead of turning Horloge's mechanical owl when Horloge's keys are carried:
	say "I don't want Horloge to see I've got his keys.";

Instead of taking or touching or pushing or attacking Horloge's mechanical owl:
	say "Most of the monks have an animal of some kind - it's the height of rudeness to play with them, however. I don't touch."

Section 5 - Further Conversation

Table of Horloge's Further Conversation
topic						conversation 
"keys" or "key"					CT_HOR2_KEYS
"[calvinanddrake]"				CT_HOR2_CALVINDRAKE
"[abbey]"						CT_HOR2_ABBEY
"light" or "window" or "windows"			CT_HOR2_LIGHT
"[cathedral]"					CT_HOR2_CATHEDRAL
"[abbot]"					CT_HOR2_ABBOT
"[figure]"					CT_HOR2_FIGURE
"tea"						CT_HOR2_TEA
"cook"						CT_HOR2_COOK
"owl" or "rachael" or "his owl"			CT_HOR2_OWL
"books" or "book" or "texts" or "key texts"		CT_HOR2_BOOKS
"[clockwork]"					CT_HOR2_CLOCKWORK
"[saints]"								CT_HOR2_SAINTS
"[himself]" or "[horloge]"				CT_HOR2_HORLOGE
"gong" or "gongs" or "dinner"			CT_HOR2_GONG
"[reloh]" 							CT_HOR2_RELOH
"[me]"							CT_HOR2_ME

CT_HOR2_KEYS is clustered with CT_HOR2_CALVINDRAKE, CT_HOR2_ABBEY, CT_HOR2_LIGHT, CT_HOR2_CATHEDRAL, CT_HOR2_ABBOT, CT_HOR2_FIGURE, CT_HOR2_TEA, CT_HOR2_COOK, CT_HOR2_OWL, CT_HOR2_BOOKS, CT_HOR2_CLOCKWORK, CT_HOR2_SAINTS, CT_HOR2_HORLOGE, CT_HOR2_GONG, CT_HOR2_RELOH, CT_HOR2_ME.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_HOR2_KEYS:
	say "I've already asked about that." instead;

CT_HOR2_KEYS is a conversation topic. The enquiry text is "[if Horloge's keys are in the location]'Where are your keys?' I ask politely.[otherwise]'What are your keys for?' I ask him.[end if]". The response text is "[if Horloge's keys are in the location]'Oh, they're around here somewhere, I'm sure,' he replies, dismissively.[otherwise]'Oh, keys are everything,' he replies, with enthusiasm. 'Every whotsit with diagrams in, at any rate.'[end if]"

CT_HOR2_ME is a conversation topic. The enquiry text is "'Do you know anything about me?' I ask." The response text is "'Well, young whosit.' He looks momentarily embarrassed - of course he knows the circumstances of my being found, assuming he remembers who I am at all. 'I know you make a jolly good cup of whotsit, don't you?'"

CT_HOR2_CALVINDRAKE is a conversation topic. The enquiry text is "'What do you think of Calvin and Drake? I ask.". The response text is "'Hmm? I don't know them,' he says, brow furrowing. 'We only stock the core texts, you see. You'd have to look in the library at the Cathedral for that.'"

CT_HOR2_ABBEY is a conversation topic. The enquiry text is "'Do you like it here in the Abbey?' I ask.". The response text is "'A fine old place,' he replies, despite the poor light and the constant noise from the Scriptorium. 'Could do with better heating, perhaps.'"

CT_HOR2_LIGHT is a conversation topic. The enquiry text is "'Don't you need more light?' I ask.". The response text is "'Whatever for?' he replies, peering dimly at you."

CT_HOR2_CATHEDRAL is a conversation topic. The enquiry text is "'How do I get to the Cathedral from here, Brother Horloge?' I ask.". The response text is "He claps me on the shoulder in reply. 'Years of careful study,' he says."

CT_HOR2_ABBOT is a conversation topic. The enquiry text is "'What do you think about the Abbot?' I begin. Maybe I can tell Horloge what I overheard.". The response text is "'The Abbot,' he replies distantly. 'I don't think I've seen old Whotsit in a while. Not seen much, actually. Funny thing.' He takes off his spectacles and wipes them on his sleeve.[paragraph break]No good, clearly. I'm going to have to tell the Archbishop; no-one round here is going to lift a finger."

CT_HOR2_FIGURE is a conversation topic. The enquiry text is "'What do you know about a Figure in Grey?' I ask.". The response text is "'Grey?' he asks. 'I don't know Grey. Now St. Newton and St. Breguet, they drew excellent figures. Absolute perfection.'"

CT_HOR2_TEA is a conversation topic. The enquiry text is "'You like your tea?' I ask.". The response text is "'Young Whotsit, it's about as fine as it could be,' he replies cheerfully."

CT_HOR2_COOK is a conversation topic. The enquiry text is "'What can you tell me about the Cook?' I ask.". The response text is "'There's a cook here?' he replies, surprised. 'Well, I never. I never. No? No, I didn't.'"

CT_HOR2_OWL is a conversation topic. The enquiry text is "'I like your owl,' I tell him. 'It's artificial?'". The response text is "'Of course it is,' he says. 'Her name's Rachael.'"

CT_HOR2_BOOKS is a conversation topic. The enquiry text is "'Have you read all these books, Brother Horloge?' I ask.". The response text is "'Many times,' he replies, smiling calmly. 'They have filled me with much peace and calm. The best thing about them,' he confides, 'is the way they [i]smell[r].'"

CT_HOR2_CLOCKWORK is a conversation topic. The enquiry text is "'How does clockwork work?' I ask.". The response text is "Brother Horloge looks confused. 'That's a whotsit, young Whotsit. A statement that makes no sense. Clockwork [i]is[r] working. Like,' he waves at the window, 'light [i]is[r] illumination. Perhaps what I mean is,' he finishes, with a triumphant tap of a finger on the table. 'Clockwork works like clocks work.'"

CT_HOR2_SAINTS is a conversation topic. The enquiry text is "'What can you tell me about the Saints?' I ask.". The response text is "He waves a hand toward the bookshelves. 'Find out for yourself,' he says. 'None of it's a whotsit. They wrote it all down.'"

CT_HOR2_HORLOGE is a conversation topic. The enquiry text is "'How are you, Brother Horloge?' I ask.". The response text is "'Perfectly well. Can't complain.' He looks very content, in fact, holding his cup and petting his owl. 'Abbey life is very fine.'"

CT_HOR2_GONG is a conversation topic. The enquiry text is "'Isn't that the gong for dinner?' I ask.". The response text is "'No, can't be,' Horloge replies calmly. 'See where the sun is? If it was 5 o'clock now, I'd have pushed the table right over against that wall.'"

CT_HOR2_RELOH is a conversation topic. The enquiry text is "'What do you make of Brother Reloh?' I ask.". The response text is "'If anyone can make anything of Brother Reloh I'll be terribly surprised,' Horloge replies, with surprising ferocity."

CT_HOR2_DEFAULT is a conversation topic. The response text is "I can't think of anything important to say about that."

Rule for firing CT_HOR2_GONG when Gong Sounding is not happening:
	fire CT_HOR2_DEFAULT instead;

Last after firing CT_HOR2_GONG when Gong Sounding is not happening:
	now CT_HOR2_GONG is unfired;

Chapter 4 - Horloge's keys

Horloge's keys are a plural-named thing, on the wheeled table. The description is "A thick bunch of keys, to most of the Abbey's locks and clocks alike."

Horloge's keys unlock the Refectory Clock.

Understand "keyring", "key" as a Horloge's keys.

Instead of taking Horloge's keys when Horloge's keys are on the wheeled table:
	if Horloge is not sipping his tea:
		say "Brother Horloge puts out a worn-out old hand. 'Now don't you wander off with my keys,' he says. 'They're very important.'" instead;
	otherwise:
		move Horloge's keys to the location;		
		say "His eyes are only half-closed. They're half-open as well. He bats my hand away firmly. 'Leave them be,' he says. Of course, he knocks them to the floor in the process and he doesn't notice [i]that[r].";

Instead of taking Horloge's keys when Horloge's keys are in the Library and Horloge is not sipping his tea:
	now Horloge's keys are on the wheeled table;
	say "[one of]I wait for old Horloge to lose himself in his manuscript and then snaffle the keys from the ground. But he notices me, of course. 'Thank-you, young Whotsit,' he says. 'Just put them down on the table, there's a whotsit.' I do as I'm told.[or]Just as before: he sees me pick the keys up, and takes them back.[stopping]";

After taking Horloge's keys when in the Library:
	say "Very quietly, I pick the keys up off the ground. With his eyes half-shut, Horloge doesn't notice."

Chapter 5 - Event on Entering - Quest for Tea Scene 

The Quest for Tea is a scene. The Quest for Tea begins when the location is the Library.

When the Quest for Tea begins:
	say "Horloge looks up as I enter. 'Ah, young – young Whotsit!' he bellows, pointing a fat finger in my general direction, though through his thick multi-lensed spectacles I don't think he can quite see where I am. 'Look here!' he demands. 'Young Whotsit-whoever-you-are! I need some – some of that, you know. Some of that whotsit. A good... of whotsit? Uh-huh? Good? Good.' He smiles, then looks back down to his studies, muttering."

The Quest for Tea ends when Horloge is sipping his tea.

When the Quest For Tea ends:
	change the default topic of Horloge to CT_HOR2_DEFAULT;
	change the conversation table of Horloge to the table of Horloge's Further Conversation;

Instead of giving the full teacup to Horloge:
	try putting the noun on the wheeled table;

After putting the full teacup on the wheeled table:
	say "I set the cup down beside Brother Horloge's elbow. 'Excellent, there,' he says, beaming, nostrils twitching. 'Such a smell! The finest!' He lifts the cup, takes a sip and smacks his lips. 'It's the slight metallic tang that really gives it the [i]whotsit[r],' he adds. His eyes half-close in calm delight. 'Now,' he adds. 'Was there anything?'";

Definition: Horloge is sipping his tea:
	if the full teacup is on the wheeled table, yes;
	no;

Definition: Horloge is not sipping his tea:
	unless Horloge is sipping his tea, yes;
	no;

Part 7 - Central Hall

Instead of making to leave in the Central Hall: try going southwest.
Instead of going inside in the Central Hall: try going northeast.

Chapter 1 - Description

The Central Hall is east of the Library, southwest of the Upper Hall. "[if Gong Sounding is not happening]I'm standing in the very centre of the Abbey's Great Hall. [one of]It's impossible not to crane my neck at the ceiling held aloft by buttresses the size of gigantic oak trees. To think, people built this in the days before real pulley-transmissions! It must have taken [i]weeks[r]! The hall continues northeast into shadow, and southwest, towards the sunlight, the Yard and above all, the Archbishop.[paragraph break][or][stopping]The vast empty space is filled by the muttering and echo of Holy Mechanisms, and the hiss of the candles as they sweep around their Tracks, providing a little light everywhere but rarely ever enough. I can just make out archways both east and west.[otherwise]The archway at the end of the hall, to the southwest, is clear. I can almost see the Cathedral beyond.[end if]"

Part 8 - West Refectory

Chapter 1 - Description

A room called the West Refectory is east of the Central Hall. "[if Gong Sounding is not happening]I spend some of my time here, eating at one of the two long tables. I spend even more serving the monks. Each of them has their own seat, marked by a little brass hourglass, and if the twenty or so I can see here weren't enough (which they aren't), there's more to the east, where the Refectory continues. Back west is the archway to the Great Hall.[otherwise]The Hall is back west. In a few minutes, this room will be full of confused monks. I need to not be here when that happens...[end if]"

Chapter 2 - Scenery

Section 1 - Long Table and Benches

Some long tables are a supporter, Drake-hideable, enterable, in the west refectory. The description of the long tables is "Two long oak tables flanked by benches. Each monk's place is marked by an hourglass, fixed to a brass rod along the centre of the table." Understand "table", "bench", "benches", "dining", "chair", "chairs", "seat", "seats" as the long tables.

Instead of putting something on the long tables:
	say "I shouldn't clutter the table. I only cleaned up here a few hours ago.";

Instead of entering the long tables:
	say "It's not time to eat yet. At 5pm, the gong will ring next door, and then it'll be time.";

Rule for writing a paragraph about the long tables:
	if the teacup is on the long tables,
		say "On the table is a single empty [teacup], left over from breakfast.";
	now the long tables are mentioned;
	
Instead of looking under the long tables:
	say "There's a lot of space there, easily enough to - say - hide from Drake."

The long tables incorporate a brass rod. 


Section 2 - Hourglasses

Some hourglasses are part of the long tables. The description is "Little polished hourglasses, each with a name inscribed at the base. They run on a metal bar so they can be easily flipped. 'There is time for eating,' so they say, 'but only the right amount of time.'[if the teacup is on the long tables] Next to Horloge's hourglass is an empty tea cup.[end if]"

Understand "brother horloge's", "horloge's", "hourglass", "glasses" as the hourglasses.

Instead of turning the hourglasses: say "The hourglasses tell the monks how long they have to eat before prayer. It's a holy Measure and not something I should play with."

Section 3 - Tea Cup

A porcelain teacup is a fake container, on the long tables. The description is "[if empty]A porcelain teacup. The edges are a little chipped from overuse.[otherwise]A steaming cup of freshly-brewed tea.[end if][if not handled] It's next to Brother Horloge's hourglass.[end if]". The printed name is "teacup".
The printed name is "teacup". Understand "chipped", "porcelain", "edges", "cup", "tea cup" as the teacup.
Understand "steaming", "full" as the teacup when the teacup is full.
Understand "fresh", "freshly", "brewed", "freshly-brewed", "hot", "tea" as the teacup when the teacup is full.
Understand "of tea" as the teacup when the teacup is full.

Rule for printing the name of the full teacup:
	say "cup of tea"

After taking the teacup for the first time:
	say "I pick up the empty cup from its place beside by Brother Horloge's hourglass." instead;

Instead of giving the empty teacup to Horloge:
	say "Horloge peers at the cup - peers at me - peers at the cup again. His brow creases like scrumpled paper.[paragraph break]'Well, what good's that?' he demands. 'That's whotsit without the whotsit, like a whotsit with no whotsit!' He seem positively enraged.";

Instead of drinking or tasting the empty teacup:
	say "I mime sipping tea, like I was a real monk and not just a two-tooth initiate."

Instead of drinking or tasting the full teacup:
	say "I can't. It's not [i]for[r] me.";

Instead of dropping the full teacup:
	say "I didn't go to all that hassle to just put it down and have some hurrying monk knock it over!"

Section 4 - Refectory Clock Glimpse

The Ref_clock_glimpse is a glimpse backdrop in the West Refectory, identifying the Refectory Clock. Understand "refectory clock", "clock" as the Ref_clock_glimpse. The description is "The Refectory Clock is at the other end of the refectory."

Part 9 - East Refectory

Chapter 1 - Description

A room called the East Refectory is east of the West Refectory, south from the Kitchen. "[if Gong Sounding is not happening]The eastern end of the long Refectory is given over in part to the tables lined with brass hourglasses, but in the other half there's nothing but the enormous Refectory Clock. It's an impressive thing, so big because it only needs winding once a year, despite all the gongs, cymbals, tubes and bells that strike when dinner time comes around. Right now, the clock is showing the time at just after [the face value of the refectory clock to the nearest five minutes in words].[otherwise]The refectory booms with the sound of the clock, striking the dining hour on a hundred bells, cymbals and organ pipes. I can retreat down the length of the dining tables to the west, or north into the kitchen.[end if]"

Instead of smelling the location when the location is the Upper Hall or the location is the East Refectory:
	say "Food, rot, cheese, mould, damp and the ever-present scent of grease-oil, coming through the archway to [the best route from the location to the Kitchen].";

Section 1 - Constrained Entry

Instead of going to East Refectory during Gong Sounding:
	say "No way. The coast is clear to get out of the Abbey and over to the Cathedral, but only so long as Calvin and Drake are distracted in there.";

Section 1b- Constrained Exit

Instead of going to the Abbey Herb Garden during Gong Sounding:
	say "I've made my distraction. Time to get out of here the quick way - the front door!"

Chapter 2 - Scenery

[Not faffing trying to make the long tables a combination supporter / backdrop - just repeat the object definitions instead.]

[Many moons later, and I wish I'd done this properly in the first place. Never mind.]

Section 1 - Long Table and Benches

Some long benches are a supporter, Drake-hideable, enterable, in the east refectory. The description of the long benches is "Two long oak tables flanked by benches. Each monk's place is marked by an hourglass, fixed to a brass rod along the centre of the table." Understand "table", "tables", "bench", "dining", "chair", "chairs", "seat", "seats" as the long benches.

The printed name of the long benches is "long tables".

Instead of putting something on the long benches:
	say "I shouldn't clutter the table. I only cleaned up here a few hours ago.";

Instead of entering the long benches:
	say "It's not time to eat yet. At 5pm, the gong will ring next door, and then it'll be time.";

Rule for writing a paragraph about the long benches:
	now the long benches are mentioned;

Instead of looking under the long benches:
	say "There's a lot of space there, easily enough to - say - hide from Drake."


The long benches incorporate a brass rod. 

Section 2 - Hourglasses

Some polished hourglasses are part of the long benches. The description is "Little polished hourglasses, each with a name inscribed at the base. They run on a metal bar so they can be easily flipped. 'There is time for eating,' so they say, 'but only the right amount of time.'"

The printed name of the polished hourglasses is "hourglasses".

Understand "glasses" as the polished hourglasses.

Instead of turning the polished hourglasses: say "The hourglasses tell the monks how long they have to eat before prayer. It's a holy Measure and not something I should play with."

Section 3 - Garden Door

The garden door is a locked door, east of the East Refectory and west of the Abbey Herb Garden. The description is "A low door leading out into the garden."

Instead of unlocking the locked garden door with the lucky clock key:
	say "My clock key is a clock key. It's only the right size for clocks. (And no clocks I've ever found, either.)"

Understand "low", "green", "small", "herb" as the garden door.

Rule for writing a paragraph about the garden door:
	say "Pungent smells drift in from the kitchen to the north. On the east wall is the small green door to the Abbey's herb garden[if garden door is open]. It's wide open[end if]."

Instead of opening the locked Garden Door when Horloge's keys are not carried:
	say "It's locked.";
	fire HORLOGEWALKTHROUGH1;

[ Instead of opening the locked Garden Door when Horloge's keys are carried:
	try unlocking the Garden Door with Horloge's keys. ]

An unlocking rule for the Garden Door:
	rule fails;

Horloge's keys unlock the garden door.

Section 4 - Refectory Clock

The Refectory Clock is a clock, scenery, in the East Refectory. 

Rule for printing the description of the Refectory Clock when Gong Sounding is happening:
	say "The Refectory Clock is pounding out a colossal amount of noise!";

The description is "[one of]Housed in a case made of oak and glass, the inner workings of the Refectory Clock are visible, for the purpose of contemplation over dinner. In one corner is the colossal spring, about the size of an Oliphant, which powers the clock for over a year and reminds us that we need little to do much. Almost all the rest of the clock is given over to bells, hammers, whistles, gongs, organ pipes, cymbals, and other devices designed to bring even the deafest monk to dinner.[paragraph break][or]It's mostly bells. [stopping]The clock is currently set to [the face value of the refectory clock in words][if the face value of the refectory clock is before 5:00 PM]. Still a while till five o'clock, and dinner[end if].".

Understand "case/oak/wood/wooden/glass/inner/workings/spring/bells/hammers/whistles/gongs/pipes/organ/cymbals" as the Refectory Clock.

The matching key of the refectory clock is Horloge's keys.

Instead of ringing the Refectory Clock during Gong Sounding:
    say "It's doing that itself already[one of]! I SAID, IT'S DOING THAT ITSELF ALREADY!![run paragraph on][or][stopping]!"

Instead of ringing the refectory clock:
	say "The gongs can't be rung by hand. There's an extremely complicated system of piston-powered hammers for that, all ready to go off at five o'clock to call the monks for dinner.";
	if the Refectory Clock is locked and CALVINIDEA is fired and HORLOGEWALKTHROUGH1 is unfired:
		say "...And that's controlled by the hands, and the hands are inside the clockface and the clockface is locked...";
		fire HORLOGEWALKTHROUGH1;

Before attacking the Refectory Clock:
	try ringing the Refectory Clock instead.

Before attacking the Refectory Clock with something carried by the player:
	try ringing the Refectory Clock instead.

First before clock-setting the refectory clock to when the Refectory Clock is locked:
	say "Resetting a clock is heresy of a pretty high order: but even if the situation is desperate enough to require it, the case is still locked.";
	fire HORLOGEWALKTHROUGH1 instead;

Before turning the Refectory Clock when the Refectory Clock is locked and Horloge's keys have not been handled:
	say "Resetting a clock is heresy of a pretty high order: but even if the situation is desperate enough to require it, the case is still locked.";
	fire HORLOGEWALKTHROUGH1 instead;

Before turning the Refectory Clock:
	say "If I want the clock to ring I'd better set it to dinner-time." instead.
	
Instead of opening the locked Refectory Clock when Horloge's keys have not been handled:
	say "One of the monks in the Abbey will have keys. Probably lying around, too[one of]. I've had to pinch them before when they've made me get things from the cellar[or][stopping].";
	fire HORLOGEWALKTHROUGH1;

Instead of opening the locked Refectory Clock when Horloge's keys are carried by the player:
	try unlocking the Refectory Clock with Horloge's keys;
	if the Refectory Clock is unlocked, continue the action.

Instead of unlocking the locked Refectory Clock with the lucky clock key:
	say "Don't you think I've tried that before? Whatever this key opens, it's not the Refectory Clock[if Horloge's keys have not been handled] ... and the key that [i]does[r] open the Refectory Clock will belong to one of the monks. I should explore the Abbey and see what I can find[end if].";
	fire HORLOGEWALKTHROUGH1;

Before clock-setting the refectory clock to during Gong Sounding:
	say "I'm not going anywhere near the clock now it's ringing. You know what happened to the Cook when he did." instead;

Last before clock-setting the refectory clock to when the Refectory Clock is closed:
	carry out the implicitly opening activity with the refectory clock;

WARN_ABOUT_SETTING_CLOCK is a trigger.

Instead of clock-setting the refectory clock to when the refectory clock is open and WARN_ABOUT_SETTING_CLOCK is unfired:
	fire WARN_ABOUT_SETTING_CLOCK;

Rule for firing WARN_ABOUT_SETTING_CLOCK:
	say "Resetting a clock is a sacred matter, part of a ritual that considers the endless push of Sad Depreciation and the holy act of Maintainance that man must perform. The Abbot has a whole sermon for it. So to do it, just like this, on a [i]whim[r]... I can feel in my stomach that it's not right, that if Clockwork is Clockwork then there must be a better way."

After clock-setting the refectory clock to:
	say "[one of][if WARN_ABOUT_SETTING_CLOCK has been fired for less than three turns]But the[else]The[end if] thought of that Figure in Grey spurs me on. So I make the sign of the Winding Key - maybe that'll buy me some forgiveness when I wind down - and then I push the hands around to [the time understood in words].[or]It's horrible to be making a habit of this. Flinching, I push the hands round to [the time understood in words].[stopping]";
	consider the scene changing rules;

Instead of setting the refectory clock to when the topic understood matches "[dinner]":
	try clock-setting the refectory clock to 5:00 PM.

Understand "dinner/lunch", "time", "dinner-time", "lunch-time" as "[dinner]".

Section 5 - We see Horloge and his Keys

HORLOGEWALKTHROUGH1 is a trigger.

Rule for firing unfired HORLOGEWALKTHROUGH1:
	if Horloge's keys are not handled:
		Horloge walks through in one turn from now;
		[ we aim to prevent the player getting collared before Horloge has appeared. This may fail. ]
		now the do-pause flag of Drake is true;

At the time when Horloge walks through:
	if the location of Horloge is visited:
		say "Skip a tooth! [i]Didn't Brother Horloge have some keys? [r]In the [location of Horloge]?";
	else:
   		if the location is the East Refectory:
			say "There's a loud clunking sound and not from the clock. Then";
		else if the location is the West Refectory:
			say "At the other end of the Refectory,";
		else if the location is the Kitchen:
			say "From the south:";
		else:
		[ This last line shouldn't be possible, but more-or-less covers us against bizarre outcomes. ]
			say "I catch a glimpse from the Refectory as";
		move the Horloge-backdrop backdrop to all near-to-garden rooms;
		say " the garden door opens. A hooded figure comes through and locks the door again with a [i]fat bunch of keys[r]. It's Brother Horloge! He paces away, back to his place in the [location of Horloge].";


Section 6 - A backdrop object of Brother Horloge

A room can be near-to-garden. A room is seldom near-to-garden. The East Refectory, West Refectory and Kitchen are near-to-garden.

Horloge-backdrop is a backdrop. The printed name of Horloge-backdrop is "Brother Horloge". The Horloge-backdrop is privately-named, proper-named. Understand "brother", "horloge", "keys" as the Horloge-backdrop.

Before doing something with the Horloge-backdrop:
	if approaching:
		say "I head for the Library.";
		let the way be the best route from the location to the Library, using doors;
		if the way is a direction, 	try going the way instead;
	say "Brother Horloge will have gone back to the Library." instead.

After going to the Library:
	remove Horloge-backdrop from play;
	continue the action;

[ A quick hack to allow us to ask the non-existent brother horloge questions without triggering a parser error: ]

Include (- has animate, -) when defining Horloge-backdrop.

Chapter 3 - Gong Sounding

Gong sounding is a scene.

Gong sounding begins when the face value of the Refectory Clock is 5:00 PM. 

When Gong Sounding begins:
	now the Refectory Clock is closed;
	remove Calvin from play;
	change the current script to { SE_CLOCK0, SE_CLOCK1, SE_CLOCK2 };

Section 1 - Gong sounding script

SE_CLOCK0 is a scripted event. The display text is "The clash of metal on metal: the Refectory Clock leaps into life like an advancing army, with bells, gongs and organ pipes ringing and chiming and clanging away! Very, very quickly, I slam shut the clock case door and, covering my ears, rush over to the other side of the room. It's still horribly loud."

SE_CLOCK1 is a scripted event. The display text is "[if the location is East Refectory]Calvin and Drake have raced into the West Refectory. 'Wren?' Drake shouts. 'Turn that thing off! It's not dinner yet!'[paragraph break]I put one hand to my ear, as if I couldn't hear him at all.[otherwise if the location is West Refectory]Calvin and Drake explode into the room and barge me out of the way as they race over to the East Refectory.[end if]";

Rule for firing SE_CLOCK1:
	move CalvinAndDrake to the West Refectory;
	if the location is West Refectory or the location is East Refectory,
		say the display text of SE_CLOCK1, paragraph break;
	otherwise do nothing;

SE_CLOCK2 is a scripted event. The display text is "Calvin and Drake race over to the clock and start struggling with the case. Both are hampered by keeping their hands over both their ears at the same time.";

Rule for firing SE_CLOCK2:
	if the location is West Refectory or the location is East Refectory or the location is Kitchen,
		say the display text of SE_CLOCK2, paragraph break;
	otherwise do nothing;

After firing SE_CLOCK2:
	remove CalvinAndDrake from play;
	if the player can see the refectory clock begin;
		say "I slip away quietly into the Kitchen.";
		move the player to the Kitchen;
	end if;

Section 2 - Dummy Calvin and Drake

CalvinAndDrake are a man. CalvinAndDrake are privately-named, proper-named, and plural-named. The printed name is "Calvin and Drake". The description is "Calvin and Drake are too busy to pay any notice of me now." Understand "Calvin", "Drake", "Calvin and Drake", "Drake and Calvin" as CalvinAndDrake.

Rule for writing a paragraph about CalvinAndDrake:
	say "Calvin and Drake are here, leaping with distraction at the sight of the booming clock." instead.

Instead of doing something when CalvinAndDrake are physically involved:
	try examining CalvinAndDrake instead;

Section 3 - Atmospheric events

Last every turn when in the Abbey Region and a random chance of 1 in 4 succeeds during Gong Sounding:
	say "[one of]The stonework resounds with the sounds of gongs.[or]The Abbey has turned into a giant trumpet, echoing the sound of bells.[or]The ringing of the Refectory Clock makes the very walls shake.[or]Gongs, bells and all manner of noises are echoing around the walls.[at random]";

Part 10 - Scriptorium

Chapter 1 - Description

A room called the Scriptorium is southwest of the Library. "The Scriptorium is where the Copying takes place, though it's hard to believe that Copying once meant a team of monks working with carved rubber stamps. It's all done by mechanisms now, of course, like everything else except my chores. There's the massive Gutenberg press on the west wall, and everywhere else is Brother Reloh's Duplicator. Twenty-three Typewriters, all clattering away as though operated by ghosts, all connected by a single Carriage Arm that curves the length of the wall. To leave the room east or northeast I'll have to duck under it."

Instead of listening when in the Scriptorium:
	say "The noise of the Duplicator is deafening - like two hundred cooks banging saucepans."

Chapter 2 - Reloh

Brother Reloh is a monk, in the Scriptorium. "Reloh works on one of the keyboards of [the Duplicator], typing furiously. The hammering and punching is almost overwhelming." The printed name is "Reloh".

The description of Reloh is "Brother Reloh is unusually young. He's also unusually pious, firm and committed to work. The only time I've ever seen him smile was when Brother Horloge sat on his spectacles right before he was supposed to read Grace. Reloh works here in the Scriptorium night and day, replicating the Proper Texts 'for the edification of...', well, pretty much everyone."

The default topic of Reloh is CT_RELOH_DEFAULT.

CT_RELOH_DEFAULT is a conversation topic. The response text is "[one of]'Be quiet,' Reloh squawks. So I'm quiet.[or]'Close your mouth,' Reloh snipes. So I close my mouth.[or]'Say nothing,' Reloh instructs. So I say nothing.[or]'I'm busy,' Reloh interrupts. So he's busy.[or]'I'm working,' Reloh snaps. So he's working.[or]'Don't make noise,' Reloh says, oblivious to the incredible thundering of all his machines.[at random]"

Chapter 3 - Duplicator

The Duplicator is a device, in the Scriptorium. The description is "The Typewriters were designed and shipped in from the North, where they weave the finest ribbons known to man. The Carriage Arm is Reloh's own invention, however, that allows him to work here, alone.[paragraph break]The Duplicator is currently producing a long and complicated document."

Understand "carriage", "arm", "typewriters", "ribbon", "ribbons" as the Duplicator.

Instead of taking or switching on or switching off or typing on the Duplicator:
	say "'Don't,' Reloh snaps. So I don't.";
	
Instead of slicing the Duplicator with the knife:
	say "I think Reloh might do something similar to [i]me[r] if I tried that."

Instead of attacking the Duplicator with the knife:
	say "I think Reloh might do something similar to [i]me[r] if I tried that."

Instead of reading or searching the Duplicator:
	say "[one of]The sheets coming out of the Writers of the Great Duplicator are titled [i]'A Defense of the Faith Against the Strange Motions of the Unsettled Masses'[r]. I read a bit.[paragraph break][i]'But for the Irony, that it is Consequentialism which causes Wronged People to accept such Heresy and Bad Thought, I would declare these Bad Thinkers to be Agents of Rust itself. However, it is their Debauchery, their lacks of Precision, both in Morality and Productivity. These things have Led them into Terrible Indecision. [']When the teeth of the flock cannot chew, they shall Slip and Spin in most Lonely Individualism.['] So sayeth...'[r][line break]It doesn't half go on.[or]I'm not reading them again.[stopping]"

Some duplicated sheets are part of the Duplicator. Understand "sheet", "paper", "papers", "document", "complicated/complex" as the duplicated sheets.

Instead of examining the duplicated sheets, try searching the Duplicator.

Instead of taking the duplicated sheets: say "Reloh would eat my head in seconds if I interfered."

Instead of researching when in the Scriptorium:
	try reading the Duplicator.
Instead of consulting the duplicated sheets about:
	try reading the Duplicator.



Chapter 4 - Gutenberg Press

The Gutenberg Press is a device, in the Scriptorium. The description is "A massive Gutenberg press, the source of all the city of St Philip's holy texts and condemnations. The recent spate of pamphlets advising against 'heretical new ideas' - whatever they might be - has run the press down rather severely. I make the sign of Sad Depreciation. Reloh sees, and nods his approval."

Rule for writing a paragraph about the Gutenberg:
	say "The Gutenberg seems to be in the midst of a repair. [The Cabinet of Relics] next to it is open.";

Instead of taking or switching on or switching off the Gutenberg:
	say "'Stop that,' Reloh barks. So I stop.";

Chapter 5 - Cabinet of Relics

Section 1 - Description

The Cabinet of Relics is a container, Drake-hideable, open, openable, scenery, in the Scriptorium. The description is "The Cabinet of Relics is open, which it shouldn't be, but presumably whichever monk was in the middle of consecrating the Gutenberg needed a three-quarter inch screw and slipped out to buy one. Inside the cabinet are typesets, spare gears, ink rollers – many objects of the Copying."

Instead of searching the Cabinet of Relics:
	try examining the press materials;

Instead of closing the Cabinet of Relics:
	say "'Leave that,' Reloh scowls. So I leave it.";

Section 2 - Press Materials

Some press materials are in the Cabinet of Relics. The description is "Typesets and other items, including a full set of new brass gears[if we know about the broken gear and the new gear is in the Cabinet of Relics]. One stands out; the same cut and bearing as the worn-down cog on the Tea Maker in the Kitchen[end if].".

Instead of taking or searching the press materials:
	say "'Don't touch those,' Reloh demands. So I don't touch."

Understand "new", "cogs", "gears", "relics", "typesets", "typeset", "brass", "items", "other", "roller", "rollers" as the press materials

Understand "gear", "cog" as the press materials when the player can not see the new gear and the player can not see the small gear;



Section 3 - New Gear

The new gear is in the cabinet of relics. The description is "A small brass gear, new cut and freshly blessed by the Filers."

Understand "brass", "cog", "fresh", "shiny", "clean", "sharp", "teeth", "new cut" as the new gear.

First for deciding the concealed possessions of the cabinet of relics:
	if the particular possession is the new gear and we do not know about the broken gear,
		yes;
	otherwise no;

To decide whether we know about the broken gear:
	if we have examined the gear train, yes;
	if we have examined the small gear, yes;
	if the small gear has been handled, yes;
	no;

To decide whether we do not know about the broken gear:
	unless we know about the broken gear, yes;
	no;

After taking the new gear:
	say "'Put that back,' Reloh snaps, without looking up. But I don't put it back.";

Does the player mean doing something with the small gear when the player can see the new gear:
	it is very unlikely.

Does the player mean doing something with the new gear:
	it is likely.

Part 11 - Lower Hall

Instead of going inside in the Lower Hall: try going northeast.
Instead of making to leave in the Lower Hall: try going southwest.

Chapter 1 - Description

Lower Hall is east of the Scriptorium, southwest of the Central Hall, west of the Corridor of Contemplation. The description is "[if Gong Sounding is not happening]Looking northeast, the Great Hall of the Abbey stretches away like the belly of some big beast, laid out ready to have its mouth stuffed with an apple. The walls are lit in Holy Patterns by candles on Sacred Tracks suspended in the air. There's just enough light to make out the Corridor of Contemplation to the east and the wider archway to the Scriptorium to the west.[paragraph break]But more importantly, the great Entry – and exit – of the Abbey is to the southwest. And if I'm going to get out of here and talk to the Archbishop that's the only way to go.[otherwise]The exit to the Abbey is clear to the southwest. Quickly, now, before someone turns that clock off and starts looking for someone to blame![end if]"

Index map with the Corridor of Contemplation mapped east of Lower Hall.

Chapter 2 - Scenery

Calvin is a man in Lower Hall. "[one of]But maybe you're starting to see what kind of luck I have. [or][stopping]Right there, in the Entry, is Calvin, working on a clock." The description of Calvin is "He's hard at work – or he is whenever a monk goes past, anyway. The rest of the time he's fiddling with his hair in the reflection of the bits he's polished so far. I'm not going to be able to slip past him like that. I'm going to need to get him out of there somehow.[fire CALVINIDEA]"

Instead of going southwest from the Lower Hall in the presence of Calvin:
	say "What, just waltz past Calvin, stop. Ask the time? He'd have me by the hair in moments. No, I need some kind of plan to get him away from there.[fire CALVINIDEA]";

Instead of going southwest from the Lower Hall in the presence of Calvin when the player is carrying the caretaker's ladder:
	say "What, just slip past and pretend to be a workman? I don't think that's going to work. And it's certainly not the best use for this ladder!"


Understand "clock" as Calvin when the location of Calvin is the Lower Hall.
[Understand "entry", "arch" as Calvin when the location of Calvin is the Lower Hall.]

Instead of examining the southwest when the location of Calvin is the Lower Hall and the location is the Lower Hall:
	try examining Calvin instead.

Before attacking Calvin when the location is the Lower Hall:
	say "I've tried that before. [i]Lots[r] of times. I always lose." instead.

Instead doing something when Calvin is physically involved and the location is the Lower Hall:
	if we are searching, try examining Calvin instead;
	say "I don't want to attract his attention, do I? I want to get rid of him!"

Instead of giving something to Calvin when in the Lower Hall:
	try asking Calvin about "tea" instead.

CALVINIDEA is a trigger.

Rule for firing unfired CALVINIDEA:
	if Gong Sounding has not happened:
		Wren has an idea in one turn from now;

At the time when Wren has an idea:
	say "[i]Calvin will be guarding that door till dinner time[r], I think, angrily. So either I find a way to get him out of there, or I find some back way out of this place!"

Part 12 - Abbot's Quarters

Chapter 1 - Gubbler

Abbot Gubbler is a monk, scenery. The description is "Gubbler's staring right at me, or maybe just past my shoulder. He doesn't look very happy. His mechanical salamander is [if the mechanical salamander is working]climbing restlessly over his shoulders[otherwise]sitting motionless on the desk[end if]." The printed name is "Gubbler".

Section 2 - Salamander

The mechanical salamander is an animal, carried by Abbot Gubbler. The description is "The salamander is a wind-up pet of Gubbler's. It ratchets a little as it scurries, and near anything steep – like his upper arms – it waggles its feet uselessly and slides back down."

The mechanical salamander can be working or dormant. The mechanical salamander is working. 

Instead of doing something when the salamander is physically involved:
	say "It's not mine";

Instead of turning the mechanical salamander:
	say "I don't have the right key.";

Chapter 2 - Conversation

The conversation table of Abbot Gubbler is the Table of Gubbler's Conversation.

Table of Gubbler's Conversation
topic					conversation
"[me]"		CT_ABBOT_WREN
"[calvinanddrake]"		CT_ABBOT_CALVINDRAKE
"[abbey]"					CT_ABBOT_ABBEY
"[cathedral]"				CT_ABBOT_CATHEDRAL
"[abbot]" or "[himself]" 		CT_ABBOT_ABBOT
"[figure]"				CT_ABBOT_FIGUREINGREY
"tea" or "cup of tea"			CT_ABBOT_TEA
"cook"					CT_ABBOT_COOK
"salamander"				CT_ABBOT_SALAMANDER
"books"					CT_ABBOT_BOOKS
"[clockwork]"				CT_ABBOT_CLOCKWORK
"[saints]"					CT_ABBOT_SAINTS
"[horloge]" 				CT_ABBOT_HORLOGE
"[reloh]" 					CT_ABBOT_RELOH


Instead of asking the Abbot Gubbler about "money":
	say "I could never ask the Abbot about that. He'd have me polishing the floor in the stables in seconds."

CT_ABBOT_WREN is a conversation topic. The enquiry text is "'My name's Wren,' I say.". The response text is "'One of the initiates,' he replies. 'I know you. I recognize you by your height.'".
CT_ABBOT_CALVINDRAKE is a conversation topic. The enquiry text is "'I wanted to ask about Calvin and Drake, Father,' I begin.". The response text is "'Hmph. Meant to clean my clock today, I think.' He peers at it. 'Looks clean enough to me. They must have done a splendid job. I'll commend them.'".
CT_ABBOT_ABBEY is a conversation topic. The enquiry text is "'How long have you been in the Abbey, Father?' I ask.". The response text is "'That's a strange question,' he replies tersely. 'All my life. Same as you will be.'".
CT_ABBOT_CATHEDRAL is a conversation topic. The enquiry text is "'I need to permission to go to the Cathedral,' I say.". The response text is "'Nonsense. You need to get back to chores,' he snaps.".
CT_ABBOT_ABBOT is a conversation topic. The enquiry text is "'I wondered if there was anything you needed, Father,' I say, trying to get into his good books.". The response text is "He looks at me, touched by the kindness. 'Why thank you, young... yes, well. Thank you. No.' He grimaces. 'There's nothing you can do to help me.'".
CT_ABBOT_FIGUREINGREY is a conversation topic. The enquiry text is "'I thought I saw a figure earlier,' I begin, nervously.". The response text is "'A figure? Nonsense,' Gubbler replies, unhappily. 'You've got too much imagination. Do your chores, you'll soon be fixed.'".
CT_ABBOT_TEA is a conversation topic. The enquiry text is "'Should I get you some tea?' I ask.". The response text is "'Tea? I'm not one for tea,' he says. 'Horloge is the great addict around here.'".
CT_ABBOT_COOK is a conversation topic. The enquiry text is "'I was talking to the Cook...' I begin.". The response text is "'Don't lie to me,' Gubbler snaps, distractedly. 'No-one talks to the Cook. The Cook doesn't talk.'".
CT_ABBOT_SALAMANDER is a conversation topic. The enquiry text is "'Is your salamander real?' I ask.". The response text is "'Of course not. What a horrible idea,' Gubbler replies. 'What would I be doing with a real animal in my room?'".
CT_ABBOT_BOOKS is a conversation topic. The enquiry text is "'Why don't you have any books?' I ask.". The response text is "Gubbler looks at me, almost shaking. 'With a perfectly good Library so nearby? Covetous child.'".
CT_ABBOT_CLOCKWORK is a conversation topic. The enquiry text is "'Please, Father. How does clockwork work?' I ask.". The response text is "'The Great Law of the Universe,' Gubbler replies. 'All things must work this way.' He looks quite downcast. 'All things.'".
CT_ABBOT_SAINTS is a conversation topic. The enquiry text is "'Tell me about the Saints, please,' I ask the Abbot.". The response text is "The Abbot looks at his bust of St Newton. 'The Saints lived in simpler times,' he says finally. 'So they saw things more clearly than us.'".
CT_ABBOT_HORLOGE is a conversation topic. The enquiry text is "'Tell me about Brother Horloge,' I ask.". The response text is "'When the time comes for you to start Reading,' the Abbot says firmly, 'then you'll get to know Brother Horloge. Till then, you've got your chores to do. This Abbey won't clean itself.'".
CT_ABBOT_RELOH is a conversation topic. The enquiry text is "'Tell me about Brother Reloh,' I ask.". The response text is "'He does good work,' the Abbot says firmly. 'Excellent work.'".

CT_ABBOT_WREN is clustered with CT_ABBOT_CALVINDRAKE, CT_ABBOT_ABBEY, CT_ABBOT_CATHEDRAL, CT_ABBOT_ABBOT, CT_ABBOT_FIGUREINGREY, CT_ABBOT_TEA, CT_ABBOT_COOK, CT_ABBOT_SALAMANDER, CT_ABBOT_BOOKS, CT_ABBOT_CLOCKWORK, CT_ABBOT_SAINTS, CT_ABBOT_HORLOGE, CT_ABBOT_RELOH.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_ABBOT_WREN:
	say "I've already asked about that." instead;

Chapter 2 - Scripted events

ABBOT_SE1 is a scripted event. The display text is "Gubbler coughs into a fist. 'Well, yes?' he demands.".

ABBOT_SE2 is a scripted event. The display text is "The salamander buzzes up and down and around Gubbler's arms, using its tail to keep balance.".

ABBOT_SE3 is a scripted event. The display text is "Gubbler looks like a man disturbed from work, or possibly from sleep. But I can't see any work on his desk.".

ABBOT_SE4 is a scripted event. The display text is "The salamander is moving more sluggishly now as it crawls over Gubbler's back.".

ABBOT_SE5 is a scripted event. The display text is "The salamander creeps down off Gubbler's hand and onto the desk, where it eventually grinds to a halt.".

ABBOT_SE6 is a scripted event. The display text is "Gubbler fishes in a pocket, produces a key and stabs the creature in the side. A moment later it's frisking about as before.".

ABBOT_SE7 is a scripted event. The display text is "Gubbler shivers a little. The sun has moved away from his window.".

The cycle of Gubbler is a list of objects that varies.

The cycle of Gubbler is { ABBOT_SE1, ABBOT_SE2, ABBOT_SE3, ABBOT_SE4, ABBOT_SE5, ABBOT_SE6, ABBOT_SE7 }.

The Gubblercounter is a counter. The top end of the Gubblercounter is 4.

Every turn when the player can see Abbot Gubbler:
	increment the Gubblercounter;

Rule for firing the Gubblercounter:
	fire entry 1 of the cycle of Gubbler;
	rotate the cycle of Gubbler backwards;

After firing ABBOT_SE5:
	now the mechanical salamander is dormant;

After firing ABBOT_SE6:
	now the mechanical salamander is working;

Section 4 - Preventing the clock doing stuff

Before opening or entering the Grandfather Clock when Drake's Patrol has happened:
	say "I don't want to give him ideas about what I've been up to!" instead.

Part 13 - Entry

Chapter 1 - Description

The Abbey Entry is southwest of the Lower Hall. "Sunlight and the sound of the city of St Philip pour in from the west through the Abbey's great doors. At last! I can get away and see the Archbishop!... before whatever happens, happens![paragraph break]To the east, a cloister runs towards the cells of the monks, novices, initiates, unaffiliated staff – really, of everyone apart from me." The printed name is "Entry".

Instead of making to leave when in the Abbey Entry: try going west instead.
Instead of going inside when in the Abbey Entry: try going east instead.

The Abbey Doors are a door, open, scenery, west of the Entry, east of the Cathedral Yard.

The description is "Ornately carved with planets, their orbits planned and plotted out for them in advance. Everything on its correct path... just as I should be!" Understand "door" as the Abbey Doors.

Instead of opening or closing the Abbey Doors:
	say "The doors would take ten men to shift easily, or one clever system of pulleys. Either way, I can't do a thing on my own.";

The Entry Clock is scenery, in the Entry. The description is "The great Entry Clock is tall and thin and just about visible from the street. It's half-polished. A shoddy job, but I don't have time to fix it."

The Cloisters is a room. [Except we never go there.]

The Cloister is an open door, scenery, east of the Entry, west of the Cloisters.
The description is "That way lies the cells where everyone else sleeps."
Understand "cloisters", "cells" as the Cloister.

Instead of going through the Cloister,
	say "No time to waste here. Calvin will be back as soon as they turn that clock off.";

Chapter 1 - Leaving and Finishing Chapter 2

After going from the Entry to the Cathedral Yard for the first time:
	say "I race through the doors. No-one's going to stop me now! The Archbishop, and my reward - here I come!";
	end the chapter;
	continue the action;

Part 14 - Drake

Chapter 1 - Description

Drake is a man. Drake is in Upper Hall.
[ And for now that's all there is to it. ]

Section 1 - Drake can be briefly in scope

After deciding the scope of the player when the location is Drake-threatened or the location is soon to be Drake-threatened during Drake's Patrol:
	place Drake in scope.

Before examining Drake during Drake's Patrol:
	say "He looks mean, and like he's doing the loop hoping to look busy enough not get a clip round the ear, which is what I'm about to get..." instead.

Before doing something when Drake is physically involved during Drake's Patrol:
	say "He's far away and I want to keep it that way." instead.

Instead of approaching Drake during Drake's Patrol:
	say "No thanks. I don't want to run into him!"

Chapter 2 - Route

Section 1 - Patrol scene

Drake's Patrol is a scene.
Drake's Patrol begins when Introduction ends.
Drake's Patrol ends when Gong Sounding has happened or the Cathedral Yard is visited.

When Drake's Patrol ends:
	remove Drake from play;

Last Instead of listening during Drake's Patrol:
	say "[one of]I strain my ears, hoping [i]not[r] to catch the sound of footsteps[or]The stones echo tiny noises - and some not so tiny ones too, like my breathing[or]I hold my breath and listen for Drake[cycling]."

Section 2 - Route Implementation

Drake has a list of objects called the route.

The route of Drake is { Central Hall, Lower Hall, Scriptorium, Library, Central Hall, West Refectory, East Refectory, Kitchen, Upper Hall, Rickety Stair, Upper Hall }.

Drake has a truth state called can-pause flag.
Drake has a truth state called please-move flag.
Drake has a truth state called do-pause flag.
Drake has a truth state called escaped flag.


Every turn during Drake's Patrol:
	[ we give Drake a 40% chance of loitering in his location for a single turn  ]
	[  except in "dead-end" locations, where frankly, the sooner he passes by the better ]	
	if can-pause flag of Drake is true and a random chance of 4 in 10 succeeds and the location is not the Abbey Pantry and the location is not the Abbey Herb Garden and the location is not the Corridor of Contemplation and the location is not the Rickety Stair and the please-move flag of Drake is false:
		now can-pause flag of Drake is false;
	else if the do-pause flag of Drake is true:
		now the do-pause flag of Drake is false;
	else if escaped flag of Drake is true:
		now escaped flag of Drake is false;
		follow the warn of Drake's approach rule;
	else:
		move Drake one place along;
	now the please-move flag of Drake is false;

To move Drake one place along:
	now the can-pause flag of Drake is true;
	let d be the best route from the location of Drake to Drake's next destination;
	rotate the route of Drake backwards;
	try Drake going d;

Section 3 - Definitions

To decide which room is Drake's next destination:
	decide on entry 1 of the route of Drake;

To decide which room is Drake's future destination:
	decide on entry 2 of the route of Drake;

To decide which room is Drake's previous location:
	let N be the number of entries in the route of Drake - 1;
	decide on entry N of the route of Drake;

Definition: a room is Drake-occupied:
	if it is the location of Drake, yes;
	no;

Definition: a room is Drake-threatened:
	if it is Drake's next destination, yes;
	no;

Definition: a room is soon to be Drake-threatened:
	if it is Drake's future destination, yes;
	no;

Chapter 3 - Player Interactions

Before going to a Drake-occupied room during Drake's Patrol:
	if the location of the player is Drake's next destination:
		[ doesn't make sense if we "hang back" and then get caught anyway, so we catch that here. ]
		say "I walk right into Drake - no time to run away.[paragraph break]";
		carry out the firing activity with ATTIC1 instead;
	now the please-move flag of Drake is true;
	say "Just in time, I see Drake's there. I hang back. He'll move on in a moment." instead;

Automatically-dodging-Drake is a truth state that varies.

Before going to a Drake-threatened room when automatically-dodging-Drake is false during Drake's Patrol (this is the keep the player from entering Drake's path voluntarily rule):
	now the can-pause flag of Drake is false;
	now the please-move flag of Drake is true;
	say "[one of]I catch the sound of hobnailed boots from that direction. Drake's heading this way[or][one of]Drake! I'll keep out of his sight here[or]I spy Drake and pull back[cycling][stopping]. ";
	if the location of the player is Drake's future destination:
		now the do-pause flag of Drake is true;
		say paragraph break;
		stop the action;
	else:
		say "I'll [one of]wait and [or][stopping]let him pass." instead;

After Drake going:
	deal with Drake and the ladder;
	abide by the warn of Drake's approach rule.

To deal with Drake and the ladder:
	if the location of Drake is the Rickety Stair and Drake is carrying the caretaker's ladder and the player is not in the Rickety Stair:
		move the ladder to the Rickety Stair;
	if the location of Drake is not the Rickety Stair and Drake can see the caretaker's ladder and the player is not carrying the caretaker's ladder:
		move the caretaker's ladder to Drake;


This is the warn of Drake's approach rule:
	if the location is the Herb Garden:
		do nothing instead;
	if the location of the player is Drake's future destination:
		let dir be the direction Drake is coming from;
		say "[one of]Distantly - but not distantly enough - I can hear the Refectory Clock and clatter of Drake's boots. The sound's coming from [the dir].[or][sound of footsteps from dir][stopping]" instead;
	otherwise if the location of the player is Drake's next destination:
		let dir be the direction Drake is coming from;
		say "[one of]Drake's coming! [or]Looking [dir], I can see Drake. He's coming this way! [or]Drake's just off to [the dir], and he's coming this way! [or]I've got a moment before Drake spots me: he's just appeared, to [the dir]. [as decreasingly likely outcomes]";
		if the location is the Rickety Stair:
			if the caretaker's ladder is in the location:
				say "The only way out, is up!";
			else:
				say "There's nowhere to run and nowhere to hide!";
		else:
			say "[one of]I can escape[or]Escape lies[or]I'd better disappear[or]Time to leave: I can go[at random] [or-separated list of Drake-viable directions]." instead;
	otherwise if the location of the player is the location of Drake:
		[ sometimes, we let the player escape ]
		if a random chance of 40 in 100 succeeds:
			let the way be a random Drake-viable direction;
			if the way is a direction:
				say "Drake [one of]appears[or]enters[or]comes into the room[as decreasingly likely outcomes]: I [one of]dive[or]hurry[or]dash[or]scamper[or]almost crawl[as decreasingly likely outcomes] away [way].";
				now automatically-dodging-Drake is true;
				try going the way;
				now the escaped flag of Drake is true;
				now automatically-dodging-Drake is false;
				rule succeeds;
		carry out the firing activity with ATTIC1 instead;
	otherwise if the number of moves from the location to the location of Drake is greater than 1 and the number of moves from the location to Drake's previous location is 1:
		[so he's moving away from you, and you're waiting behind him]
		say "[one of]I hear footsteps, moving away into the Abbey[or][one of]Footsteps[if location is Attic Room], downstairs[end if] - moving away[or]I hear footsteps, receding[or]The stones echo departing footsteps[as decreasingly likely outcomes][stopping]." instead;
	continue the action;

To say sound of footsteps from (d - a direction):
	say "[one of]Drake, approaching from [the d]![or]Drake's footsteps echo in from [the d].[or]Drake's clattering boots are audible to [the d].[or]Drake's on patrol, and I can hear him heading this way, from [the d].[as decreasingly likely outcomes]";

To decide which direction is the direction Drake is coming from:
	let x be the Attic Room;
	if the location of the player is Drake's next destination begin;
		now x is the location of Drake;
	otherwise if the location of the player is Drake's future destination;
		now x is the Drake's next destination;
	end if;
	decide on the best route from the location of the player to x;

Definition: a direction (called the way) is Drake-viable:
	[ We find directions that Drake isn't at, ignoring inside and outside, up and down because they're ugly ]
	if the way is outside or the way is inside or the way is up or the way is down, no;
	let the new place be the room the way from the location;
	if the new place is not a room, no;
	[ is it through the garden door - specific, I know, but it'll do ]
	if the way is east and the location is the East Refectory and the garden door is locked, no;
	[ is he there? ]
	if the new place is the location of Drake, no;
	[ was he there? - stops the player swapping rooms with him ]
	if the location of Drake is the location and the new place is Drake's previous location, no;
	yes;

Chapter 4 - Hiding from Drake

Section - Times you can't hide

Instead of hiding under something Drake-hideable when the location is not Drake's next destination and the location is not Drake's future destination during Drake's Patrol:
	say "I don't need to hide. Drake's not on me quite yet.";
	now the do-pause flag of Drake is true;

Instead of hiding inside something Drake-hideable when the location is not Drake's next destination and the location is not Drake's future destination during Drake's Patrol:
	say "I don't need to hide. Drake's not on me quite yet.";
	now the do-pause flag of Drake is true;

Instead of hiding behind something Drake-hideable when the location is not Drake's next destination and the location is not Drake's future destination during Drake's Patrol:
	say "I don't need to hide. Drake's not on me quite yet.";
	now the do-pause flag of Drake is true;

Before hiding under or hiding behind or hiding inside or hiding from view when the caretaker's ladder is carried by the player: 
	now the do-pause flag of Drake is true;
	say "How I'm supposed to hide when I'm carrying this stupid ladder around?" instead.

Section - Hiding and moving Drake on

Instead of hiding from view when Drake's Patrol is happening:
	say "There's nowhere to hide here.";

Instead of hiding from view when Drake's Patrol is happening and something Drake-hideable is visible:
	try hiding inside a random Drake-hideable visible thing;

Instead of hiding under something Drake-hideable during Drake's Patrol:
	hide from Drake inside the noun;

Instead of hiding inside something Drake-hideable during Drake's Patrol:
	hide from Drake inside the noun;

Instead of hiding behind something Drake-hideable during Drake's Patrol:
	hide from Drake inside the noun;

To hide from Drake inside (t - a thing):
	say "[one of]Good thinking![paragraph break][or][stopping]I duck behind [the t], just in time! Drake marches through the room. Once he's gone, I slip back out";
	move Drake away;
	if Drake was not carrying the caretaker's ladder and Drake is carrying the caretaker's ladder:
		say ", to find the ladder's gone";
	say ".";

To move Drake away:
	while Drake's previous location is not the location:
		move Drake to Drake's next destination;
		rotate the route of Drake backwards;
		deal with Drake and the ladder;
	now the do-pause flag of Drake is true;

Section - Places you can't hide

Instead of hiding behind something during Drake's Patrol:
	say "[one of]I can't hide there![or]That's no good![or]That would never work![cycling]"

Instead of hiding inside something during Drake's Patrol:
	say "[one of]I can't hide in there![or]That's no good![or]That would never work![cycling]"

Instead of hiding under something during Drake's Patrol:
	say "[one of]I can't hide there![or]That's no good![or]That would never work![cycling]"

Part 15 - The Abbey, as a region

The Abbey Region is a region. The Abbot's Quarters, Corridor of Contemplation, Attic Room, Rickety Stair, Upper Hall, Kitchen, Library, Central Hall, West Refectory, East Refectory, Scriptorium, Lower Hall, Abbey Pantry, Abbey Herb Garden and Abbey Entry are in the Abbey Region.

The Abbey of Time is a backdrop in the Abbey Region. Understand "stones" as the Abbey of Time. "The Abbey is where I've lived all my life. It's not big when you've been around it as often as I have - but it's full of small corners."

Before doing something when the backdrop-walls are involved and the Abbey of Time is visible:
	redirect the action from the backdrop-walls to the Abbey of Time, and try that instead.

Before climbing the Abbey of Time:
	say "I'm pretty desperate to get out right now, it's true!" instead;

Before doing something when the Abbey of Time is physically involved and the action is physical:
	say "The Abbey has been here for longer than anyone can remember, and will be here for longer again." instead.





Part 16 - The Herb Garden

The Abbey Herb Garden is a room. "[one of]Standing in the garden is a bit like walking on tilting floorboards: every step you take has an unexpected spring to it. That's because where the ground should be there's a large metal disc with a large glass lens at its centre, on which all the soil beds are laid out like numbers on a clock. As the day goes on, the disc revolves so that the plants can follow the sunlight until at night, they've covered by the metal hood built into the south wall[or]Right now, [if the plants are day-plants]the lens in the centre of the great disc of the garden is bathed in light and the day-plants are out: basil, thyme, potatoes, other vegetables. The mushroom beds are under the metal hood on the south wall[else]the night-plants are out: mushrooms and nightcaps and fungi, and the day-plants are under the metal hood, safe from snails and birds[end if][if there is something on the large lens]. The lens is covered by [the list of things on the large lens][end if][stopping].[paragraph break]Otherwise, there are tall walls on three sides and only one door, back into the Abbey, to the west."

Instead of going inside when in the Abbey Herb Garden: try going west instead.
Instead of making to leave when in the Abbey Herb Garden: try going up instead.

Instead of facing west when in the Abbey Herb Garden:
	try examining the garden door instead.

Rule for printing the description of the garden door when in the Abbey Herb Garden:
	if the garden door is closed:
		say "The garden door is closed.";
	else:
		say "The interior of the Abbey is shadowy: too dark to see."

Rule for writing a paragraph about the garden door when in the Abbey Herb Garden:
	now the garden door is mentioned;

Every turn when in the Abbey Herb Garden and a random chance of 1 in 3 succeeds:
	say "[one of]The garden underfoot ticks slowly around.[or]The plants are glowing under the beautiful sunshine.[or]The sunlight makes my back prick with sweat.[or]Butterflies flit between the flowers.[or]A few insects buzz through the leaves.[or]Smells lift from the plants.[or]Birds flit by overhead.[or]Sunlight gleams off [if plants are day-plants]the lens in the centre of the garden[else]the metal floor of the garden, but doesn't hit the covered lens[end if].[at random]";

Instead of jumping in the Abbey Herb Garden:
	say "The floor rocks a little when I land."

Instead of going nowhere when in the Abbey Herb Garden:
	say "There's a high wall that way."

Instead of going down when in the Abbey Herb Garden:
	say "I can't dig my way out of the Abbey! (I don't think I can, anyway. Not through a solid metal plate, anyway.)"

Section 2 - scenery - walls

Some garden walls are scenery in the Herb Garden. "The walls are nine or ten feet of smoothed-down stone, to stop climbers and creepers, human and vegetable alike. (Shame, since on the other side of the wall is the side of the Abbey, and that means a quick run to the Cathedral.)" Understand "wall" as the garden walls.

Instead of jumping over or climbing the garden walls: 
	say "[one of]Over the walls would get me round the side of the Abbey and straight to the Cathedral... but the walls to smooth to climb and much too high to jump.[or]Getting over them - great idea[one of]. Getting over them without spring-loaded boots or a grappling line - not so likely[or][stopping].[stopping]"

Instead of jumping when in the Abbey Herb Garden:
	try jumping over the garden walls.

Instead of attacking or pushing or pulling the garden walls: 
	say "They've been built to withstand cannonfire. There's not much I can do to change that."

The herb garden is exterior. [This hides the usual interior walls.]

Section - The Ladder in the Herb Garden

Rule for writing a paragraph about the caretaker's ladder when in the Herb Garden:
	say "The caretaker's ladder is propped up against the garden wall."

Instead of going up in Herb Garden when the ladder is in the Herb Garden:
	try climbing the ladder.

Instead of going up in Herb Garden when the ladder is not in the Herb Garden:
	if the ladder is carried:
		try dropping the ladder;
		try climbing the ladder instead;
	try climbing the garden walls;

Instead of climbing the ladder when in the Herb Garden:
	say "In a flash, I'm up and over! It's a short fall to the alley behind the wall, then I scamper along a shadowy alleyway and out into the Cathedral Yard. I'm clear! Time to go see the Archbishop!";
	end the chapter;
	move the player to the Cathedral Yard;

Instead of climbing the garden walls when the caretaker's ladder is visible:
	try going up.

Instead of pushing or pulling or turning the caretaker's ladder when the caretaker's ladder is in the Herb Garden:
	say "The ladder is firmly in place, its toes dug a little into the soil."


Section 3 - background animals

Some creatures are scenery, animals, in the Abbey Herb Garden. Understand "birds/bird/insect/insects/bee/bees/butterfly/butterflies" as the creatures. "The garden is alive with small things."

Instead of taking the creatures: say "They're busy. So, remember, am I."

Part 17 - Locative glimpse backdrops to navigate by

The Refectory-Glimpse is a locative glimpse backdrop, in the Kitchen, localising the East Refectory. 

Instead of smelling the Refectory-Glimpse: say "It doesn't smell anything like as much as the kitchen does."

The CC_glimpse is a locative glimpse backdrop in the Lower Hall, localising the Corridor of Contemplation.

The UHALL_glimpse is a locative glimpse backdrop in the Kitchen, localising the Upper Hall.

The HALL_glimpse is a locative glimpse backdrop in the Library, in the Rickety Stair, in the Attic Room, in the East Refectory, in the West Refectory, in the Abbey Herb Garden, in the Entry, in the Corridor of Contemplation, in the Abbot's Quarters, localising the Central Hall.

The LHALL_glimpse is a locative glimpse backdrop in the Scriptorium, localising the Lower Hall.

The KITCHEN_glimpse is a locative glimpse backdrop in the Library, in the Scriptorium, in the Central Hall, in the Lower Hall, in the Upper Hall, in the Rickety Stair, in the Attic Room, in the East Refectory, in the West Refectory, in the Abbey Herb Garden, in the Entry, in the Corridor of Contemplation, in the Abbot's Quarters, localising the Kitchen.

The SCRIPT_glimpse is a locative glimpse backdrop in the Library, in the Kitchen, in the Central Hall, in the Lower Hall, in the Upper Hall, in the Rickety Stair, in the Attic Room, in the East Refectory, in the West Refectory, in the Abbey Herb Garden, in the Entry, in the Corridor of Contemplation, in the Abbot's Quarters, localising the Scriptorium.

The ABBEYLIBRARY_glimpse is a locative glimpse backdrop in the Kitchen, in the Scriptorium, in the Central Hall, in the Lower Hall, in the Upper Hall, in the Rickety Stair, in the Attic Room, in the East Refectory, in the West Refectory, in the Abbey Herb Garden, in the Entry, in the Corridor of Contemplation, in the Abbot's Quarters, localising the Library.

The ENTRY_glimpse is a locative glimpse backdrop  in the Library, in the Scriptorium, in the Central Hall, in the Lower Hall, in the Upper Hall, in the Rickety Stair, in the Attic Room, in the East Refectory, in the West Refectory, in the Abbey Herb Garden, in the Kitchen, in the Corridor of Contemplation, in the Abbot's Quarters, localising the Entry.

Chapter 2 - The Machinery

The revolving metal plate is scenery in the Herb Garden. "The entire garden floor is one revolving metal plate, set on castors, that ticks slowly round to follow the motion of the sun around the garden. There's even a low cover at one end, to shield the plants from interested birds at four in the morning.[paragraph break]In the centre is the large lens that drives the mechanism." 

Understand "disc", "floor", "garden" as the revolving metal plate.

Instead of taking or pushing or attacking the metal plate: say "It's enormous: would take four men just to roll it into place. The garden walls were probably built around it."

Instead of looking under the metal plate: say "There are castors there - I can't see them, but I'm a believer in clockwork - I don't have to see it to know it's there."

Instead of setting or turning the metal plate: say "It doesn't have any levers or pulleys. The whole plate is powered by the rays of the sun, focused through the lens at its centre."

Understand  "castors/castor" as the revolving metal plate.

Section 2 - giant lens

The large lens is a supporter, part of the revolving metal plate. The description of the large lens is "The lens drives the mechanism, by collecting sunlight and using it to heat a spring of copper underneath the plate. The spring then winds and unwinds as it extends and shrinks, and the plate turns around - keeping the day-plants, herbs and vegetables, in the best sunshine possible, and at night, letting the mushrooms come out to collect the dew[if there is something on the large lens].[paragraph break]On the lens is [the list of things on large lens][end if].";

Instead of looking through the large lens:
	say "Peering through the lens I can just see the outline of the gigantic copper spring that drives the garden round and around."

Instead of entering the large lens:
	say "I can't pass through glass. Only springs of light can go through glass!"

Instead of standing on the large lens:
	say "I might break the glass. (Or get it really muddy.)";

To revolve into daytime:
	now the plants are day-plants;
	remove the short stake from play;
	say 	"[one of]The garden revolves back as light hits the lens once more. The herbs and vegetables come out of hiding into the sunshine! [or]The lens lights up and the day-beds revolve back out from the under the cover. [stopping][one of]The movement almost knocks me over.[or]I have to balance to stay upright as the plate turns.[or]I'm pointing [one of]north[or]south[or]east[or]west[cycling] now.[at random]";

To revolve into nighttime:
	now the plants are night-plants;
	if the knife is not handled, move the short stake to the Abbey Herb Garden; 
	say "[one of]There's a pause, and then the whole garden begins to revolve! The day-plants move under the shade of the metal hood, and the night-plants - mushrooms and fungi - emerge in their place[or]The garden revolves once more, bringing the night-plants back into view[stopping][if knife is not handled]. Stuck in the beds amongst them is a short stake[end if].";

Instead of closing or touching the large lens when the plants are day-plants:
	say "I put both hands over the lens. ";
	revolve into nighttime;

Definition: something is away from the lens if it is not the large lens and it is not enclosed by the player.

Before doing something in the Abbey Herb Garden when something away from the lens is physically involved or going west: 
	if there is no thing on the large lens and the plants are night-plants:
		say "I lift my hand away from the lens. ";
		revolve into daytime;
		if the short stake is physically involved or the plants are physically involved, stop the action;
	continue the action;

Before putting the tumbler on the large lens:
	say "The glass wouldn't block the light. Glass doesn't block light-springs, the Abbot says so." instead.

Before putting something on the large lens:
	if the noun is not the rag:
		say "The [noun] is tiny compared to the size of the lens." instead;

After putting something on the large lens:
	say "I cover the lens with [the noun]. ";
	if the plants are day-plants:
		revolve into nighttime instead;

Instead of taking something when the noun is on the large lens:
	say "I remove [the noun] from the lens. ";
	now the noun is carried by the player;
	revolve into daytime instead;

Section 3-  the Hood

The metal hood is scenery, in the Herb Garden. Understand "cover" as the hood. "The metal hood comes up to my knees, and is snugly built for the plants to slide in underneath without being hurt. It keeps the mushrooms shady (and warm) during the day, and the vegetables protected from snails at night."

Instead of hiding under or entering or hiding behind the metal hood: 
	say "The hood is filled with flowerbeds. There's no room for me in there!"

Instead of looking under the metal hood:
	say "Under the hood is the other half of the revolving garden."

Instead of standing on the metal hood:
	say "[one of]I clamber onto the top of the hood - slippery, and rounded, and I soon slide off again. If I'm looking for a way over the walls, I'll have to try something else.[or]I can't climb onto the hood - and even if I could, the walls are twelve feet tall and the hood's only up to my knees![or]The hood's not going to do me any good.[stopping]"

The copper spring is scenery, part of the revolving plate. "There's a spring somewhere underneath, that expands and contracts in the heat from the lens, and drives the whole garden around."

Instead of doing something when the copper spring is physically involved:
	say "I can't see the spring, it's underneath the garden floor.";

Chapter 3 - the Plants

Section 1 - Soil Beds

Some soil beds are scenery in the Herb Garden. Understand "flowerbed/bed", "flower bed/beds", "tub", "tubs", "ceramic", "earth" as the soil beds. "The soil beds are ceramic tubs, deep enough for growing tubers and wide enough to hold a good range of plants. The metal plate they're set on revolves them to follow the sun around the garden, so each plant gets exactly what it needs.[paragraph break]In the visible tubs are [if plants are night-plants]mushrooms and nightcaps[else]herbs and vegetables[end if]." 

Understand "day-beds", "day bed/beds", "day-bed" as the soil beds when the plants are day-plants.
Understand "night-beds", "night bed/beds", "night-bed", "mushroom bed/beds" as the soil beds when the plants are night-plants.

Instead of putting something on the soil beds: 
	try taking the plants.

Instead of inserting something into the soil beds:
	try taking the plants.

Instead of searching the soil beds:
	say "I'm not a dog!"

Instead of cleaning the soil beds:
	say "Soil is pretty clean already, or so the gardener always says."

Section 2 - plants

Some plants are scenery in the Herb Garden. The plants can be day-plants or night-plants. The plants are day-plants.

Rule for printing the description of the day-plants plants:
	say "The day-plants are lush and verdant, thanks to the metal plate that keeps them out of the shadows of the walls."

Rule for printing the description of the night-plants plants:
	say "The night-plants look dry and withered, like old men, or the oldest of the old monks, the ones who need straws to eat."

Understand "herb/herbs/plant/flower/flowers/basil/potatoes/vegetables" or "day-plants" or "day plants" as the plants when the plants are day-plants. 
Understand "mushroom/mushrooms/fungi/fungus/nightcap/thyme" or "night-plants" or "night plants" as the plants when the plants are night-plants. 

Instead of taking or pulling or attacking the day-plants plants:
	say "I don't think Brother Saffron would appreciate me messing with his plants."

Instead of eating or tasting the day-plants plants:
	say "Some need cooking before they're edible: some the leaves are tough as leather and only what's below the surface is any good. And I'm a 2nd Assistant Clock Polisher, so I certainly don't know tick from tock."

Instead of eating or tasting or touching or taking or pulling or attacking the night-plants plants:
	say "Plenty of these mushrooms are grown for the Apothecary. Some might drive you mad, or blind, or worse. I'm not touching any."

Instead of smelling in the Herb Garden:
	say "There's a whole range of smells, from sweet to spicy."

Instead of searching the night-plants plants when the short stake is in the location:
	say "In amongst the plants is this short wooden stake."

Instead of searching or looking under the plants:
	say "There's nothing but soil under the [if plants are day-plants]leaves[else]caps[end if]."

Section 3 - Hidden plants

Some hidden plants are scenery in the Herb Garden. 

Understand "herb/herbs/plant/flower/flowers/basil/potatoes/vegetables" or "day-plants" or "day plants" as the hidden plants when the plants are night-plants. 
Understand "mushroom/mushrooms/fungi/fungus/nightcap/thyme" or "night-plants" or "night plants" as the hidden plants when the plants are day-plants. 

Before doing something when the hidden plants are involved:
	say "Those plants are out of the daylight, under the metal hood." instead.

Section 5 - the stake in the ground

The short stake is a thing. "Sticking from one of the beds newly emerged from the cover is a short stake."

Instead of taking or pulling or looking under or pushing the short stake:
	[ we reward the player with a knife, and remove the Tome in the library where the player would otherwise pick this up in Chapter 3. ]
	remove the gigantic Tome from play;
	remove the short stake from play;
	move the knife to the player;
	now the knife is handled;
	now the knife is a garden-knife;
	say "I pull the stake free of the soil, only to find it's the handle of a gardener's knife! Someone must have left it here by accident. Still, could be useful if I meet any Grey Figures..."

Understand "short", "stake" as the knife when the knife is a garden-knife.
Understand "handle" as the knife.

Book 3 - The Cathedral Of Time

The Cathedral Space is a region.

Part 1 - Cathedral Yard

Chapter 1 - Description

The Cathedral Yard is a room, exterior, in the Cathedral Space. "The Yard is where we go on Saturdays for exercise, cleaning up the muck left behind by the market (worse once a month when the horse-traders from the south come up and leave their presents for the Abbey gardens). Today it's quiet, at least, with the space between the Abbey to the east and the Cathedral to the west empty but for the usual collection of beggars, unfortunates, wretches and the disadvantaged poor.[one of][paragraph break]The Cathedral really is enormous – but it doesn't have many rooms, so finding the Archbishop shouldn't take too long. Which is lucky, because I don't know how long I've got before Gubbler – and the mysterious Figure – put their plan into action. If I warn the Archbishop too late it'll be no good. He might just blame me for whatever it is they're planning to steal![or][stopping]"

Instead of going east in the Cathedral Yard:
	say "No, I need to find the Archbishop, not get rounded up by Calvin and Drake and set to work polishing again[if Gong Sounding is happening]. Besides, by the sound of the clock, it's 5pm in there, which would be far too late![else].[end if]"

Instead of entering the Abbey Doors in the Cathedral Yard:
	try going east.

Rule for printing the description of the backdrop-sky when in the Cathedral Yard:
	say "Clouds are turning around, but only slowly."

Rule for printing the description of the backdrop-floor when in the Cathedral Yard:
	say "The yard is dusty underfoot."

Understand "dust" as the backdrop-floor when in the Cathedral Yard.


Instead of going inside in the Cathedral Yard: try going west.
Instead of making to leave in the Cathedral Yard: try going west.

Chapter 1b - Wretches

Section - Description


Some poor wretches are men in the Cathedral Yard. Understand "beggar/beggars", "unfortunates", "disadvantaged", "leper/lepers" as the poor wretches.  The description of the poor wretches is "In a civilised city like St Philip there's no reason for anyone to beg. That's what the Abbot says. There's always a spring that needs winding somewhere, so no-one need be short of a coin unless they're too Vice-ridden to work... But then, I did just see the Abbot taking money for no work at all..."

Rule for writing a paragraph about the poor wretches:
	if BEGGAR_YARD1 is unfired:
		now the poor wretches are mentioned;
	else:
		say "Two beggars are either side of me, close enough to grasp at my arm!";

Instead of giving something to the poor wretches:
	try dropping the noun;

Instead of touching or pushing or attacking the poor wretches:
	say "I don't want to go near them. Who knows what I'll catch.";

After dropping something in the Cathedral Yard when BEGGAR_YARD2 is unfired:
	remove the noun from play;
	say "I drop [the noun] and the beggars fall on it like hungry wolves, scrabbling and fighting. One gets hold and soon both are gone in a cloud of dust.";
	now BEGGAR_YARD2 is fired;

Report dropping something in the Cathedral Yard:
	say "I drop [the noun] but the beggars don't seem interested." instead;

Section 2 - Blocking your way

Instead of going west when BEGGAR_YARD1 is fired and BEGGAR_YARD2 is unfired and BEGGAR_WONT_MOVE is unfired:
	fire BEGGAR_WONT_MOVE;

Rule for firing unfired BEGGAR_WONT_MOVE:
	say "The beggars are in my way! I'm staying clear.";

Instead of going west when BEGGAR_YARD1 is fired and BEGGAR_YARD2 is unfired:
	now BEGGAR_YARD2 is fired;
	say "Time to wind my courage, Wren: I put my elbows out and push my way between the grasping hands.";
	continue the action;

Instead of touching or pushing or attacking the poor wretches when BEGGAR_YARD1 is fired and BEGGAR_YARD2 is unfired:
	now BEGGAR_WONT_MOVE is fired;
	try going west instead;

Section 2 - Beggars get in the way

BEGGAR_YARD1 is a trigger. BEGGAR_YARD2 is a trigger. BEGGAR_WONT_MOVE is a trigger.

Rule for firing unfired BEGGAR_YARD1:
	say "A couple of beggars shuffle over to me, their hands held out pitifully. They're diseased, like rats, and covered in sores. I hang back, pretty disgusted."

Every turn when BEGGAR_YARD1 is fired and BEGGAR_YARD2 is unfired and a random chance of 1 in 2 succeeds:
	if going west or entering the Cathedral of Time or going inside:
		do nothing;
	else if BEGGAR_YARD1 has been fired for at least 6 turns:
		fire BEGGAR_YARD2;
	else if ABBOT_BEGGAR is unfired:
		fire ABBOT_BEGGAR;
	else:	
		say "[one of]The beggars[or]The diseased wretches[or]The unfortunates in front of me[at random] [one of]moan and grumble[or]plead and beg[or]hold out diseased hands[or]scratch towards my clothes[at random][one of] pitifully[or], looking ill[or] with agonising slowness[at random].";

ABBOT_BEGGAR is a trigger. 

Rule for firing unfired ABBOT_BEGGAR:
		say "'Think of a spring,' the Abbot would say, talking about the likes of these beggars. 'Put something in, and you will receive. But Mechanics declares that only nothing can come of no work.'";

[This rule comes here so that the rule above won't fire when this one fires.]

Every turn when in the Cathedral Yard and BEGGAR_YARD1 is unfired:
	fire BEGGAR_YARD1;	

Rule for firing unfired BEGGAR_YARD2:
	now the poor wretches are scenery;
	say "Without a word, the creeping beggars lose interest in me and move away across the yard.";

Every turn when in the Cathedral Yard and BEGGAR_YARD2 is fired and a random chance of 1 in 3 succeeds:
	say "[one of]The beggars are baying and moaning softly.[or]One of the wretches is muttering about 'clockwerk men'. Poor man.[or]The wretches are tussling amongst themselves[cycling]";

Chapter 2 - The Cathedral object

The Cathedral of Time is backdrop, in the Cathedral Space.  Understand "church" as the Cathedral of Time.

Understand "door/doors" as the Cathedral of Time when in the Cathedral Yard.
Understand "choir" as the Cathedral of Time when not in the Cathedral Choir.
Understand "nave" as the Cathedral of Time.
Understand "clerestory" as the Cathedral of Time when not in the Choir.


Before doing something when the backdrop-walls are involved and the Cathedral of Time is visible:
	redirect the action from the backdrop-walls to the Cathedral of Time, and try that instead.

Rule for printing the description of the Cathedral of Time when in the Cathedral Yard:
	say "The Cathedral door is open to the west, like a big mouth ready to swallow me whole."

Rule for printing the description of the Cathedral of Time:
	say "The Cathedral walls rise all around me."	

Instead of entering the Cathedral of Time: 
	try going inside.

Instead of getting off the Cathedral of Time:
	try going outside.

Instead of listening when in the Cathedral Space:
	say "The soft sound of chanting drifts down the length of the Cathedral.";

Instead of listening when in the Cathedral Space during Return To The Cathedral:
	[[JON]: Up to you to provide some eerie quiet... ]
	say "The Cathedral is soft eerie quiet and nothing more.";

Part 2 - Great Door

Chapter 1 - Description

The Cathedral Entrance is west of the Cathedral Yard,  in the Cathedral Space. "Imagine an ant crawling up inside a daffodil trumpet. That's what it's like to stand in here, and this is just the Entry to the massive Cathedral further north (I guess in there you'll need to imagine an ant inside a church bell).[paragraph break]Let me try and do better. The main doors south are about as tall as the Abbey itself, so they need a lot of space just to fit the hinges in (those are about as big as me, I think). I came in from the Yard by the east door; there's another similar door west but it's locked right now. The Cathedral is closed to the public most of the time.[paragraph break]Looking northwards I can see the long Nave, and the altar beyond. Carved on the floor just by my feet is the first of the aisle's Great Seals." The printed name is "Great Door".

Instead of making to leave when in the Cathedral Entrance: try going east instead.
Instead of going inside in the Cathedral Entrance: try going north instead.

Chapter 2 - Scenery

Section 1 - Great Seal


The entry seal is a Great Seal, in the Cathedral Entrance. "The first seal is made of steel cast directly onto the stone. It's so big that it's hard to see what it is, but – a long rod, tilting a large boulder – it's got to be a lever." Understand "lever", "steel", "boulder", "rod", "first", "great" as the entry seal. The printed name is "Great Seal".

Instead of pulling the entry seal:
	say "It's a carved lever. It doesn't [i]do[r] anything[one of]. (But is a lever that doesn't do anything a lever? I'm too young for philosophy!)[or].[stopping]";



Section 2 - Great Doors

Some Great Doors are a closed door, scenery, south of the Cathedral Entrance. "The doors are covered in carvings and inscriptions, some of the Mechanists, but ever a few from the older faiths of smoke and fire. The doors lead to the city but are rarely open (Last Newtonmass I was part of a parade of children that troop to get the homeless to do some proper work, but I'll be too old for that this year.)" Understand "door", "carving", "hinge", "hinges", "inscription", "carvings", "inscriptions" as the Great Doors.

Instead of opening the Great Doors:
	say "You're joking, I suppose.";

Instead of going south when in the Cathedral Entrance: try entering the Great Doors.

Instead of entering the Great Doors:
	say "I'd have to open the Great Doors. [run paragraph on]";
	try opening the Great Doors;

Section 3 - West Door

The West Door is a closed door, locked, scenery, west of the Cathedral Entrance, east of the Public Yard. "A smaller door leading west to another yard, and the city. It's locked, of course."

Instead of opening the locked West Door:
	say "It's locked.";

First before going through the locked West Door:
	try opening the West Door instead;

Section 4 - East Door

The East Door is scenery, in the Cathedral Entrance. "That's the door back to the Cathedral Yard."

Instead of opening or entering the East Door when the implicitly opening activity is not going on:
	try going east;

Instead of opening the East Door when Upper Nave is not visited:
	say "The East Door is open already - I just came in that way, remember?"

Instead of entering the East Door:
	try going east instead;

Instead of closing the East Door:
	say "It's not for me to go round shutting doors in this place.";

Section 5 - Glimpse of Altar

The glimpsed Altar is a glimpse backdrop, in Cathedral Entrance, in the Lower Nave, in the Upper Nave, in the East Apse, in the West Apse, in the North Clerestory, in the Cathedral Choir, in the East Clerestory, in the West Clerestory. "The altar is surrounded by monks, softly singing." Understand "altar" as the glimpsed Altar.

The glimpsed Altar identifies the iron altar.

The glimpsed Perpetuum is a glimpse backdrop, in Cathedral Entrance, in Lower Nave, in Upper Nave, in East Apse, in West Apse, in North Clerestory, in Cathedral Choir, in East Clerestory, in West Clerestory. "I can't make out much of the gleaming object from here, except it's gold - and it's moving." Understand "object", "perpetuum", "mobile", "clock", "gleaming", "gold", "mechanism", "gleaming object" as the glimpsed Perpetuum.

The glimpsed Perpetuum identifies the Perpetuum Mobile.

Part 3 - Lower Nave

Chapter 1 - Description

The Lower Nave is north of the Cathedral Entrance, in the Cathedral Space. "The Nave of the Cathedral is a quiet place, quieter than the Abbey because the Archbishop only allows study here and no workshops. Pews on either side are enough to seat a thousand easily, with more further north. I can't look at the ceiling (it's so high) without lying down across the Second Great Seal, and the last time I did that a monk tripped up on me and had me thrown out.[paragraph break]East and west are smaller shrines, and back south are the Cathedral's Great Doors."

Instead of making to leave when in the Lower Nave: try going south instead.
Instead of going inside in the Lower Nave: try going north instead.

Instead of smelling in the Lower Nave:
	say "There's a smell of burning oil from the west.";

Section 2 - Idle actions

Every turn when in the Lower Nave and a random chance of 1 in 3 succeeds and not smelling:
	say "A little heat licks in from the west.";

Instead of sleeping in the Lower Nave:
	say "I'm not trying that again."

Chapter 2 - Scenery

Section 0 - Heat

The heat is scenery in the Lower Nave. Understand "little/gentle heat", "warmth", "hot/warm air/gust/wind" as the heat. "The heat licks in from the west."

Before doing something when the heat is physically involved and the action is physical:
	say "It's just a wisp of heat." instead.

Before touching the heat:
	say "It's only gentle, almost nothing at all."

Before approaching the heat:
	try going east instead.

Before smelling the heat:
	say "The hot air smells of wax and oil." instead.


Section 1 - Lower Seal

The Lower Seal is a Great Seal, in the Lower Nave. "This one is made of brass, all wound up into a coil. It's either a spring or one of Reloh's mechanical serpents."

Understand "spring", "brass", "coil", "second", "great" as the lower seal. The printed name of the Lower Seal is "Great Seal".

Section 2 - Pews

Some lower pews are a pew, in the Lower Nave. "Rows of varnished oak pews. I'm glad I'm not a Cathedral Wood Polisher! That'd take [i]forever[r]!" The printed name is "pews".

Part 4 - Upper Nave

Chapter 1 - Description

The Upper Nave is north of the Lower Nave, in the Cathedral Space. "This is the north end of the Nave, where the more important people sit during services – you can tell that because the pews either side are wider and have more legroom, and each has a little cup-holder carved into its armrest. Of course, it's also closer to the Altar to the north (and further from the draught coming up from the doors to the south).[paragraph break]A group of monks are standing around the altar, singing softly[if East Clerestory is not visited]. The Archbishop's office will be beyond and up the stairs, I think[end if].[paragraph break]The floor is taken up with the Third Great Seal."

Instead of making to leave when in the Upper Nave: try going south instead.
Instead of going inside in the Upper Nave: try going north instead.

Chapter 2 - Scenery

Section 1 - Upper Seal

The Upper Seal is a Great Seal, fixed in place, in the Upper Nave. The description is "This one is a fine gold gilt, depicting an enormous ornate head with stone-block teeth. A winding-key."

Understand "third", "gold", "golden", "gilt", "ornate", "enormous", "head", "teeth", "winding key", "winding-key", "key", "great" as the upper seal. The printed name is "Great Seal".

Section 2 - Pews

Some upper pews are a pew, in the Upper Nave. "Rows of varnished oak pews. I'm glad I'm not a Cathedral Wood Polisher! That'd take [i]forever[r]!" The printed name is "pews". Understand "cupholder", "cup holder", "cup-holder" as the upper pews.



Part 5 - Altar

Chapter 1 - Description

The Cathedral Altar is north of the Upper Nave, in the Cathedral Space. "On a dais is the main altar, representing the Celestial Workbench itself. Hanging over it as large as the setting sun is the incredible machinery of the Cathedral Clock itself.[paragraph break]Around the dais, a group of monks are celebrating and blessing something on the altar. I can slip away – quickly, please! – in any of the four main directions, although I might have to scurry to get around the dais[if East Clerestory is not visited] (the Archbishop's room is north of here, I think, above the Choir.)[else].[end if]"

Instead of making to leave when in the Cathedral Altar: try going south instead.
Instead of going inside in the Cathedral Altar: say "I'm in the heart of the Cathedral right here."

Instead of singing when in the Cathedral Space:
	say "I don't think the monks would appreciate my joining in."
	
Instead of hiding from view when in the Cathedral Altar:
	say "I'm already crouched as low as I can go."

Chapter 2 - Scenery

TRIG_NOINTERFERE is a trigger.

Rule for firing TRIG_NOINTERFERE:
	say "[one of]There's no way I'm interfering with a ceremony as serious as this.[or]I'm serious. I'll look, but I won't touch.[stopping]"

Section 1 - Altar

The iron altar is scenery, in the Cathedral Altar. "The altar is a fine workbench of iron, with gold tracings to mark out the Measures and Main Angles of work. But that's nothing compared to what's on the Altar – a mechanism of fine gold and shimmering brass. It's not a clock but it's restlessly moving – to what end I can't see, though, because of all the monks clustered around." The printed name is "altar".

Instead of doing something when the iron altar is physically involved:
	say "[fire TRIG_NOINTERFERE]";

Section 2 - Dais and Canopy

The dais is scenery, in the Cathedral Altar. "The dais is the fourth seal, raised up from the stone floor. It's right below the Cathedral Clock and the light from above bathes the iron trim in dull light." Understand "canopy" as the dais.

Instead of doing something when the dais is physically involved:
	say "[fire TRIG_NOINTERFERE]";

Section 3 - Clock Machinery

The cathedral clock machinery is a backdrop, in the Cathedral Altar and the Choir. "The machinery of the Clock disappears out of sight overhead. It's hard to see in detail because of the light that streams through, cut to ribbons as it comes by the enormous cog-teeth. I can just about see a gear the size of a horse and an escapement like the mast of tall ship. And both are moving, with eternal slowness."

Instead of doing something when the cathedral clock machinery is physically involved:
	say "It's far too far above me.";

Section 4 - Monks

Some chanting monks are men, scenery, in the Cathedral Altar. "This is why the Abbey is so quiet, then. All the brothers are here, singing and chanting at the altar." Understand "monk", "lead" as the chanting monks.

Instead of doing something when the chanting monks are physically involved:
	say "[fire TRIG_NOINTERFERE]";

Some glimpsed monks are a glimpse backdrop, in Cathedral Entrance, in Lower Nave, in Upper Nave, in East Apse, in West Apse, in North Clerestory, in Cathedral Choir, in East Clerestory, in West Clerestory. "The monks are gathered around some gleaming object on the altar." Understand "monk/monks", "chanting", "singing" as the glimpsed Monks.

The glimpsed monks identifies the chanting Monks.

Instead of listening to something when the player can see the glimpsed Monks:
	say "The monks['] song echoes off the walls, one syllable at a time, one second at a time.";

Section 5 - Perpetuum Mobile

The real Perpetuum Mobile is scenery, portable, privately-named, on the iron altar. The description is "The machine on the altar is a finely-wrought case of dark wood topped by a tilting board. Standing on tip-toes I can see a ball-bearing, wearily wending its way along a grooved path in the surface of the board. As it reaches one side, there is a loud cheer from the monks – the board tilts – and the ball continues back the other way. The effect is mesmerizing and the mechanism almost totally silent.[paragraph break]I think it's the most beautiful – most expensive thing – that I've ever seen. This isn't just a relic, clearly. This is something else."

The printed name of the real perpetuum mobile is "Perpetuum Mobile".

Understand "case", "dark", "wood", "tilting", "board", "ball-bearing", "groove", "grooved", "path", "track", "gold", "brass", "ball", "ball bearing", "mechanism", "machine", "gleaming", "object" as the real Perpetuum Mobile.

Understand "perpetuum", "mobile" as the real perpetuum mobile.

Understand "real", "one" as the real perpetuum mobile when the player has handled the decoy perpetuum mobile.


Rule for printing the name of the real Perpetuum Mobile when the Bishop's Library is unvisited:
	say "gleaming object"

Instead of doing something when the real Perpetuum Mobile is physically involved and the location is the Cathedral Altar:
	say "[fire TRIG_NOINTERFERE]";

Section 6 - Perpetuum Mobile Ceremony

Every turn when the player can see the Chanting Monks:
	say "[one of]The monks gather in close to the Altar, as the mechanism they watch makes a sudden movement. 'In Perpetuum, we Observe,' a lead monk cries.[or]'In Perpetuum, we Observe,' the other monks reply, raising their hands and making the sign of the Penduluum in the air. 'A-tempus, a-fugit,' they chant.[or]'A-tempus, a-fugit,' repeats the lead monk. He steps up to the dais, and reaches with one finger to touch the side of the mechanism. All is quiet.[or]The machine makes an almost imperceptible [i]click[r]. The lead monk steps down and is lost in the crowd of monks. A great chant goes up: 'In Perpetuum, In Mobilis, Forever and Ever, Happen! Happen!'[or]A new monk steps up from the group. He looks a tiny bit younger than the previous lead monk. 'In the name of the Lever,' he declares.[or]'The Lever!' cry the other monks.[or]'In the name of the ...' the lead monk continues. Whatever he's about to say is smothered by a booming [i]clonk[r] from the Cathedral clock machinery above. The other monks seemed unfazed by this.[or]'And in the presence of the Winding Key,' the monk finishes, before making the sign of Winding. The other monks repeat the gesture. 'In Perpetuum, we Observe,' they chant.[cycling]"

Instead of listening to the location when the player can see the Chanting Monks:
	say "The monks are working through their ritual.";

Part 6 - Choir

Chapter 1 - Description

The Cathedral Choir is north of the Cathedral Altar, in the Cathedral Space. "To the north of the altar, this is a semi-circular space with staircases to east and west leading up to the gallery overhead. When they sing from up there – I've only heard it once – they fill the whole Cathedral with their beating rhythmic music: songs that echo round and around the dome overhead like the movement of the Greater Rotation itself." The printed name is "Choir".

Instead of making to leave when in the Cathedral Choir: try going south instead.

First before going inside in the Cathedral Choir:
	unless the player can see the open secret panel:
		try going south instead;
	continue the action;

Rule for implicitly opening the secret panel:
	do nothing;

Instead of going up in the Cathedral Choir:
	say "East or west?"

Chapter 2 - Scenery

Section 1 - Windows

Some window panels are scenery, in the Cathedral choir. "There are windows here and more above in the Clerestory. What those show I can't make out from down here, but around this space are a series of panels depicting the Twelve Devotions, as visited upon St. Newton in pursuit of his great discoveries.[paragraph break]The last shows an object much like the one on the altar back south: beneath it is written 'In Infinituum, Momentuum Grant Motion Infinituum.'"

Understand "stained-glass", "stained glass", "stained", "windows" as the window panels.

The printed name is "windows".

Understand "windows", "devotions", "twelve", "colour", "colours", "color", "colors", "brilliant" as the window panels.

Section 2 - East and West Stairs

The East Stairs are an open door, not openable, scenery, east from the Cathedral Choir, down from the East Clerestory. "[if the location is the Cathedral Choir]A winding stone staircase up to the east side of the Clerestory above.[otherwise]Stone stairs leading down.[end if]"

The West Stairs are an open door, not openable, scenery, west from the Cathedral Choir, down from the West Clerestory. "[if the location is the Cathedral Choir]A winding stone staircase up to the west side of the Clerestory above.[otherwise if Doric is awake]The stairs spiral downwards.[otherwise]A spiral stone staircase leading down.[end if]"

Understand "stair", "staircase", "staircases", "spiral" as the East Stairs.
Understand "stair", "staircase", "staircases", "spiral" as the West Stairs.

Instead of climbing the East Stairs:
	try going the East Stairs;

Instead of climbing the West Stairs:
	try going the West Stairs;

After going through the east stairs from the Cathedral Choir:
	say "Two rotations to reach the top. Everything in this place is designed to be correct, as carefully set as new teeth on a dog-screw.";
	continue the action;

After going through the east stairs from the East Clerestory when BISH_DOOR_EVENT1 is fired and EAST_STAIR_EVENT1 is unfired:
	fire EAST_STAIR_EVENT1;
	continue the action;

After going to the North Clerestory from the East Clerestory when BISH_DOOR_EVENT1 is fired and EAST_STAIR_EVENT1 is unfired:
	fire EAST_STAIR_EVENT1;
	continue the action;

EAST_STAIR_EVENT1 is a trigger. 

Rule for firing unfired EAST_STAIR_EVENT1:
	if Bishop's Library is unvisited:
		say "'I'll be back,' I promise the guard.[paragraph break]'Sure you will. With an Army, I suppose,' he laughs.";

Instead of going through the east stairs from the East Clerestory when Archbishop's Meeting has happened:
	unless Calvin's Patrol has happened:
		say "There's definitely something happening on the balcony to the northwest. I'd better investigate, hadn't I?" instead;
	otherwise:
		continue the action;

After going through the east stairs from the East Clerestory when Calvin's Patrol has not happened:
	say "I climb downstairs. The guard watches me closely, on the lookout for any tricks.";
	continue the action;

After going through the west stairs from the Cathedral Choir when Calvin's Patrol has not happened:
	say "Two rotations to reach the top. Everything in this place is designed to be correct, as carefully set as new teeth on a dog-screw.";
	continue the action;

After going through the west stairs from the West Clerestory when Calvin's Patrol has not happened:
	say "I climb back down.";
	continue the action;

Section 3 - Choir Stalls

Some choir stalls are a supporter, enterable, in the Cathedral Choir. "During normal services the choir sit in the stalls on the ground level by the east staircase. They're covered in carvings just like those on the Abbey doors, but lit up in brilliant colours from the stained glass all around."

Understand "carving", "carvings" as the choir stalls.

The description is "The stalls are several levels deep and covered in carvings, of everything from the file-makers craft to the really dull business of picking enough potatoes to feed the Watchmaker's Guild."

Instead of standing on, sitting on, or entering the choir stalls:
	say "I'm no chorister!";

Instead of pushing, pulling, opening or turning the choir stalls:
	say "The stalls are a massive wooden construction. Bit big for me to move, I think.";

Instead of singing in the Cathedral Choir:
	say "I doubt the monks would want to hear me. I doubt I want them to.";

Instead of touching the choir stalls:
	say "The wood is soft and old."

Section 4 - Balcony above

The balcony-Clerestory is a glimpse backdrop in the Cathedral Choir. "The balcony is overhead, encircling this space."

Understand "balcony", "gallery", "clerestory" as the balcony-Clerestory. The printed name is "Clerestory".

Instead of approaching or entering the balcony-Clerestory:
	try going up.


Part 7 - Shrine Of The Saints

Chapter 1 - Description

The Shrine of the Saints is east from the Lower Nave, in the Cathedral Space. "A small shrine but a packed one. Where the Abbey's got three niches for the Major Three Saints, the Cathedral has about a hundred niches for the Minor Everybody Else. Little busts and statuettes, some holding the tools of their trade, and all glaring at me for skulking around in here. The Nave is back west.[paragraph break]In one corner is a stand of candles, for use in devotions (and for the poor to pinch for lighting)."

Instead of making to leave when in the Shrine of the Saints: try going west instead.
Instead of going inside in the Shrine of the Saints: try going west instead.

Chapter 2 - Scenery

Section 1 - Statuettes

Some statuettes are scenery, in the Shrine of the Saints. The printed name is "statues". Understand "statue", "statues", "niche", "niches", "bust", "busts", "saint", "saints" as the statuettes.

Rule for printing the description of the statuettes:
	let x be a random miniature statuette;
	say "There's one: [The x], with his [tool of x].";

Instead of taking or pushing the statuettes:
	say "The statues are firmly bolted into place. The Church don't want parishioners feeling tempted. Or Clock Polishers, either.";

A miniature statuette is a kind of thing. Some miniature statuettes are defined by the table of minor saints.


Table of minor saints
miniature statuette	tool (indexed text)	stance		expression
Wainwright		"compasses"		"brandishes"	"magnificently"
Maxwell			"electronia"		"ponders"	"glumly"
Cauchy			"dividing rod"		"considers"	"with fascination"
Descartes		"set square"		"studies"	"inscrutably"
Allan			"hexagonal key"		"clutches"	"earnestly"
Ykea			"design manuals"		"seems to glare at"	"in frustration"

When play begins:
	now every miniature statuette is part of the statuettes;

Before printing the name of a miniature statuette:
	say "St ";

Understand the tool property as describing a miniature statuette.

[Carefully avoiding a disambiguation message for 'examine saint']
Understand "st/saint wainwright", "compass" as Wainwright.
Understand "st/saint maxwell" as Maxwell.
Understand "st/saint cauchy", "rod" as Cauchy.
Understand "st/saint descartes" as Descartes.
Understand "st/saint allan", "allan key" as Allan.
Understand "st/saint ykea", "manuals" as Ykea.

Rule for printing the description of a miniature statuette:
	say "[The item described] [stance of the item described] his [tool of the item described] [expression of the item described].";

Instead of doing something when a miniature statuette is physically involved:
	say "These holy relics are not to be interfered with.";

Section 2 - Brass Stand

The brass stand is scenery, in the Shrine of the Saints.

The description is "The stand holds dozens of candles for devotions by laymen. They come in three colours: red for metal-workers and craftsmen, blue for fishermen and market-trades, and yellow for architects and draughtsmen. None are lit."

Understand "stand of candles" as the brass stand. 

Understand "candle" as the brass stand when the player's command matches the text "stand", case insensitively.

Instead of searching the brass stand:
	say "There are three colours of candle on the stand: red, blue and yellow."

Instead of taking the brass stand:
	say "I'd look pretty conspicious walking around with it: it's easily as big as I am.";

Section 3 - Many different-colored candles

The single-red-candle is a candle. The wax is red.
The single-blue-candle is a candle. The wax is blue. 
The single-yellow-candle is a candle. The wax is yellow.

Some red-candles are a candle dispenser, part of the brass stand. The wax is red. The representative item is the single-red-candle.
Some blue-candles are a candle dispenser, part of the brass stand. The wax is blue. The representative item is the single-blue-candle.
Some yellow-candles are a candle dispenser, part of the brass stand. The wax is yellow. The representative item is the single-yellow-candle.

[ Does the player mean examining the yellow-candles: it is likely. ]

Understand "cluster", "cluster of", "red", "candle", "candles" as the red-candles.
Understand "cluster", "cluster of", "blue", "candle", "candles" as the blue-candles.
Understand "cluster", "cluster of", "yellow", "candle", "candles" as the yellow-candles.

Understand "red candle" as the red-candles when the player can not see the single-red-candle.
Understand "blue candle" as the blue-candles when the player can not see the single-blue-candle.
Understand "yellow candle" as the yellow-candles when the player can not see the single-yellow-candle.

Rule for asking which do you mean when at least two candle dispensers are matched by the parser:
	say "There are red, blue and yellow candles here - which do you mean?";

Instead of taking a candle dispenser:
	if the representative item of the noun is on-stage:
		say "I've already got [a representative item of the noun].";
	otherwise:
		move the representative item of the noun to the player;
		say "I pluck [a representative item of the noun] from the stand.";

Check melting a candle on:
	say "I can't melt [the noun] on [the second noun]!" instead.

Instead of removing a candle dispenser from the brass stand:
	try taking the noun instead.

Instead of removing a candle from the brass stand:
	if the noun is carried:
		say "I've already got [the noun].";
	else:
		try taking the noun instead.

Part 8 - East Apse

Chapter 1 - Description

The East Apse is east of the Cathedral Altar, in the Cathedral Space. "More pews, facing the altar back west. This is the women's corner, because they aren't allowed to sit with the men (especially women with children, who have to sit at the back). Much more interesting, is the iron grate to the northeast that covers – so they say – the door to the Cathedral crypt.[paragraph break][if the Orrey Hall is not visited]There's also a door to the southeast, and in the corner of my eye, I keep catching movement from somewhere inside[otherwise]The door to the southeast leads back to the Orrey Hall and strange Brother Sa'at[end if]."

Instead of making to leave when in the East Apse: try going west instead.
Instead of going inside in the East Apse: try going southeast instead.

Chapter 2 - Crypt Grate

The crypt grate is a door, closed, locked, scenery, northeast of the East Apse, southwest of the Crypt Stairs. "The iron grate is made of metal a foot thick and it's locked with a gigantic padlock. I doubt I could manage to turn the lock even if I had the key for it, which I don't. Behind this is the Cathedral Vault: the one Gubbler was talking about breaking into! I guess they haven't tried yet..."

Understand "metal", "iron", "padlock", "lock", "chain", "blackened", "black" as the crypt grate.

Instead of opening the crypt grate when the player does not have the old iron crypt key:
	say "The grate is locked with a blackened chain and padlock that's about the size of my head.";

Instead of unlocking the crypt grate with something when the second noun is not the old iron crypt key:
	say "The grate is locked with a blackened chain and padlock that's about the size of my head. And believe it or not, [the second noun] [is-are] not the right key.";

Before going through the crypt grate from the East Apse when Return To The Cathedral has not happened:
	if the crypt grate is examined:
		say "Did you read the bit about the padlock?" instead;
	else:
		try examining the crypt grate instead.

Chapter 3 - Orrey Hall Door

The hall door is a door, open, scenery, southeast of the East Apse. "A heavy door, carved over with ellipses and stars." Understand "ellipse", "ellipses", "star", "stars" as the hall door.

Chapter 4 - Pews

The woman's pews are a pew, in the East Apse. "The women's pews have armrests all along, partly so they're more comfortable, and partly to stop them talking to each other during the services. (So Drake says)."

Part 9 - West Apse

Chapter 1 - West Apse

The West Apse is west of the Cathedral Altar, in the Cathedral Space. "There are more pews, though there's clearly one row missing, which Drake says is the one they took and chopped up to make the floorboards of my room. I don't believe it – why would anyone waste such a good bit of wood on me?[paragraph break]Anyway, the altar is back east and there's another archway in the southwest corner of the room. Silence emerges through it like noise from Calvin's mouth when he's eating. It must be a library."

Instead of making to leave when in the West Apse: try going east instead.
Instead of going inside in the West Apse: try going southwest instead.

Instead of listening when in the West Apse:
	say "Chanting from the east meets silence from the southwest."

Chapter 2 - Archway

The library archway is an open door, scenery, not openable, southwest of the West Apse. "[if in the West Apse]Through the archway I can see the grand library.[otherwise]The archway leads back to the body of the Cathedral.[end if]".

Chapter 3 - Pews

The pews for the elderly are a pew, in the West Apse. "These pews are reserved for the elderly and infirm. Why they get the ones furthest from the Cathedral's doors I don't know."

Part 10 - Calendar Shrine

Chapter 1 - Description

The Calendar Shrine is west of the Lower Nave, in the Cathedral Space. "[if we have not examined the Calendar]This shrine is centred around a big brass table with a glass top, which doesn't seem nearly important enough for the Cathedral of St Philip! Perhaps the important thing is the brazier in the corner: a shallow dish held over a low, flickering flame. The Nave is back east, should any of this prove dull.[otherwise]This shrine contains the Calendar Unlimited, which I'm pretty sure is the thing St Philip built to get a city a named after him. It's ticking away quietly next to the brass brazier. The Nave is back east.[end if][if the number of things in the brazier is not zero][paragraph break]In the brazier, bubbling slightly, [is-are a list of things in the brazier].[end if]"

Instead of making to leave when in the Calendar Shrine: try going east instead.
Instead of going inside in the Calendar Shrine: try going east instead.

Chapter 2 - Scenery

Section 1 - Calendar

The Calendar Unlimited is scenery, in the Calendar Shrine. "[one of]The top of the table is glass, beneath which is a mess of dials and pointers filling the whole surface. This is the [i]Calendar Unlimited[r]! The ultimate device that declares where in Time we are. Right now, for instance, the date is the 11th, the season is Autumn, the political climate is Restless, the next major disaster is Bakery Fire, the person currently looking is Wren – good Grease! IT CAN SEE ME![or]Somewhere on the panels of this horrible thing is marked the day I was born and the day I'll die. I hope it isn't too soon, that's all, and has nothing to do with any Figures in Grey.[stopping]"

Understand "top of the", "top of", "case", "dome", "brass", "table", "glass", "dials", "pointers", "device", "ultimate", "panels", "top", "device" as the Calendar Unlimited.

Instead of doing anything when the Calendar Unlimited is physically involved:
	say "They don't want dust getting in. They certainly don't want me getting in. So the whole case is tightly sealed.";

Instead of looking under the Calendar Unlimited:
	say "If you're hoping to see a short man curled up operating the dials you'd be disappointed. The whole thing is just one box (full of very, very small cogs)."
	

Chapter 3 - The Brazier

Section 1 - Description

The brazier is a container, open, not openable, scenery, lit, in the Calendar Shrine. "A brass dish set over a little tripod, in the centre of which a quiet flame burns. It's meant for incense and holy oils, that kind of thing. Doesn't seem very mechanistic to me: must be a hangover from the past, like shoelaces and Laundry."

Understand "tripod", "dish", "brass dish", "flame", "quiet flame" as the brazier.

Instead of touching the brazier:
	say "It's not [i]too[r] hot. Perhaps the fire underneath is like the spring in the Refectory Clock: delivering a tiny amount of power for a very very long time.";

Instead of melting a candle on the brazier:
	try inserting the noun into the brazier instead.

Before putting something on the brazier:
	try inserting the noun into the brazier instead.

Instead of taking or pushing or pulling or turning the brazier:
	say "It's an iron tripod the size of me; I can't lift it!"

Instead of extinguishing the brazier with:
	say "[one of]I think dowsing a Holy Flame is the sort of thing that makes them throw you down a well to see how [i]you[r] like it[or]I don't think that's a good idea[stopping]."

Section 2 - Wax Mixing

Before inserting something into the brazier:
	if the noun is not a candle and the noun is not a wax lump,
		say "The brazier's pretty hot. I don't want to damage [the noun]." instead;

Instead of inserting something into the brazier:
	consider the wax-mixing rules for the noun;

The wax-mixing rules are an object-based rulebook.

A wax-mixing rule for a candle (called c) when the brazier does not contain a wax lump:
	let color be the wax of c;
	remove c from play;
	let r be a random wax lump in the Beehive;
	change the color of r to the color;
	change the size of r to 1;
	change the indefinite article of r to "a"; [in case we get a colossal one]
	move r to the brazier;
	say "The candle melts in seconds, leaving a thick pool of [color] wax in the brazier.";
	rule succeeds;

A wax-mixing rule for a candle (called c) when the brazier contains a wax lump:
	let r be a random wax lump in the brazier;
	let color be the wax of c;
	remove c from play;
	change the color of r to what you get when you mix color with color of r;
	increment the size of r by 1;
	if the size of r is greater than 10,
		now the indefinite article of r is "probably about half the church's wealth's worth of wax melted down into a";
	move r to the brazier;
	say "The candle melts in seconds, leaving a thick pool of [color of r] wax in the brazier.";
	rule succeeds;

A wax-mixing rule for a wax lump (called w) when the brazier does not contain a wax lump:
	move w to the brazier;
	say "The lump of wax re-melts in seconds.";
	rule succeeds;

A wax-mixing rule for a wax lump (called w) when the brazier contains a wax lump:
	let r be a random wax lump in the brazier;
	change the color of r to what you get when you mix color of w with color of r;
	increment the size of r by the size of w;
	if the size of r is greater than 10,
		now the indefinite article of r is "probably about half the church's wealth's worth of wax melted down into a";
	move w to the Beehive;
	say "The lump of wax re-melts in seconds, mixing and swirling together with what's already in the brazier, to form a larger pool that's [color of r]-coloured.";
	rule succeeds;

Section 3 - Knife-scraping

Instead of scraping a molten wax lump when the player carries the knife:
	say "(using the knife)[command clarification break]";
	try scraping the noun with the knife instead;

Instead of taking or scraping a molten wax lump:
	say "I try to scrape up the wax but the brazier's too hot for my fingers. I'll need some kind of tool to scrape the wax with.";

Instead of scraping a molten wax lump with something unsuitable for scraping:
	say "That's hardly a good tool for getting the wax off the brazier!";

Instead of scraping a molten wax lump with something suitable for scraping:
	let r be a random wax lump in the brazier;
	move r to the player;
	say "I scrape the wax up into a ball using [the second noun].";

Section 4 - Wax-squishing

After taking a wax lump:
	let c be the color of the noun;
	repeat with lump running through wax lumps carried by the player begin;
		if the lump is not the noun and the color of the lump is the color of the noun begin;
			increment the size of the noun by the size of the lump;
			move the lump to the Beehive;
			if the size of the noun is greater than 10,
				now the indefinite article of the noun is "probably about half the church's wealth's worth of wax melted down into a";
			say "I squidge the two lumps of [color of the noun] wax together to make a larger lump." instead;
		end if;
	end repeat;
	continue the action;
	
Part 11 - Orrey Hall

Chapter 1 - Description

The Orrey Hall is southeast of the hall door, in the Cathedral Space. "[one of]Something metal clicks and whirrs past my head, like a slow metal wasp. I barely notice it in time to dodge because of all the other levers and rods and wires and lines. Each has a little ball on the end and the whole thing is called an Orrey - I've seen pictures of it in books, but never a real life-size one like this[or]This hall is mostly filled by a huge machine, of perfect bearing and a spooky silent grace[one of] (it reminds me of the candle tracks in the Abbey.) [or]. [stopping]It's called the 'Orrey' and it's meant to depict the movements of the heavens, though to me it looks more like the badly-mangled bicycles they dredge from the river and sell on Saturday's for scrap, and how anyone's meant to read the whirls of discs, balls, wire hoops and spindles is beyond me[stopping]. The door is past a whipping meteorite to the northwest."

Instead of making to leave when in the Orrey Hall: try going northwest instead.
Instead of going inside in the Orrey Hall: try going northwest instead.

Section 2 - Event on Entry

SAATEVENT1 is a trigger.

Rule for firing unfired SAATEVENT1:
	say "The brother's attention twitches toward me.[paragraph break]'Ah, [i]good[r]! Someone's come along, I knew [i]someone[r] would, in the [i]end[r].' As he speaks, he winds his hands together as if washing them under a tap. 'A [i]job[r]. I need this [i]map from the Society of Astronomers. [i]Tight-fisted[r] ogres, they always demand a sheet of my parchment in return for [i]every one[r] of theirs.'[paragraph break]He grins, as if he's just made a joke, and holds up a sheet of paper – it's a work order of some description, but I can't read more before he flaps it down on the table again. 'Run along with it, then.' He returns his gaze to the orrey.";

After firing SAATEVENT1:
	move the work order to Brother-Sa'at's Desk;

Every turn when the player has been in the Orrey Hall for at least one turn and SAATEVENT1 is unfired:
	fire SAATEVENT1;

Rule for speaking with Brother Sa'at when SAATEVENT1 is unfired:
	say "I open my mouth a little: maybe five degrees. [run paragraph on]";
	fire SAATEVENT1 instead.

After looking in the Orrey Hall when the tome is uncut and we have examined the tome and the knife is off-stage:
	move the knife to the Cyclical Library;
	now the tome is cut open;
	continue the action;

Chapter 2 - Brother Sa'at

Section 1 - Description

Brother Sa'at is a monk, in the Orrey Hall. "[if sat at his desk]Sat behind a desk in the corner, only just out of the way of a particularly far-off comet, is strange Brother Sa'at. He watches his machine with unblinking eyes.[otherwise if inspecting his Orrey]Sa'at paces restlessly around the rim of the machine, looking to fix whatever it was I did.[end if]". Understand "saat" as Brother Sa'at.

The description of Brother Sa'at is "Sa'at is the oldest-looking monk I've ever seen and there's not a lot of him left to base that on. His body seems to be made of the same thin wires as the Orrey he's obsessed by. His skin is so pale I'm not sure he's ever been outside.[paragraph break]He's wearing a ring, bearing the Cathedral's seal, though it's too small to see what the seal is. As Drake once said to me, 'That ring gives him the right to demands things off monks same as I demand things off [i]you[r].'[paragraph break][if sat at his desk]Sa'at sits behind his desk, regarding the orrey through cool eyes.[otherwise]Sa'at paces around the orrey, trying to work out what needs fixing.[end if]"

Brother Sa'at can be sat at his desk or inspecting his Orrey. Brother Sa'at is [initially] sat at his desk.

Brother Sa'at has a number called the letter state. The letter state of Brother Sa'at is 0.

Brother Sa'at wears a ring. Understand "sa'at's/saats/saat's/sa'ats ring", "seal", "bronze", "nugget", "small ring/nugget" as the ring. The description of the ring is "Sa'at's ring is a small bronze nugget stamped with a seal." 

Instead of doing something when the ring is physically involved and the action is physical:
	say "Sa'at snatches his hand away[one of]. 'Don't touch me,' he snaps. 'Don't even pretend to touch me!'[or].[stopping]"

Section 2 - Conversation

CT_SAAT_CREED is a conversation topic. The enquiry text is "[one of]'Brother Sa'at,' I ask. 'What's the creed of the Church?'[or]'Please, Brother Sa'at. I really need to know the creed.'[or]'The creed?' I ask.[stopping]". The response text is "[one of]'Creed? Who has time for creeds? Creeds and passwords are the same thing, that's all a creed is. In the name of the Radish, the Cartwheel and the Winding Key, or something like that, it's all hopelessly out of date.' He shrugs. 'You'll probably hear them chanting about it. Back [i]there[r].'[or]'[one of]Maybe it was[or]Or was it[or]Then again[or]How about[or]You could try[at random]... in the Name of,' Brother Sa'at begins, '[one of]the Radish[or]the Rabbit[or]the Lever[or]the Monkey[or]the Lion[or]the Lighthouse[at random], [one of]the Cartwheel[or]the Carpet[or]the Spring[or]the Serpent[or]the Shipwreck[at random] and [one of]the Winding Key[or]the Whistling Womble[or]the Whittering William[or]the White Wallaby[at random].'[stopping]"

CT_SAAT_ALTAR is a conversation topic. The enquiry text is "'The monks singing around the altar,' I ask. 'What's that thing they've got?'" The response text is "'That thing?' he snaps. 'That thing is only the Perpetuum. And all those idiots can do with it is dogma and ritual! Checking to see it's still going, isn't that pathetic? Like they've not seen the best Perpetuum is the one they're standing on. Where's their faith, I'd ask? Where? In a ritual? Or in a machine?' He waves an angry hand at the great Orrey, then snatches it back to start winding his fingers together."

CT_SAAT_BUSINESS is a conversation topic. The enquiry text is "'What's this work order for?' I ask." The response text is "'They're not about to let just any old ragamuffin barging into the Society of Astronomers,' Sa'at says, in disbelief. 'It's not a school, you know. It's a Society. Of Astronomers. They don't want just anyone barging in and saying, [']Will my crops fail?['], [']What about little Billy's hypothermia?['] You've no idea what a hassle people are. And they're everywhere! You go outside, you can't [i]move[r] for people!' He stops suddenly, and goes quiet."

CT_SAAT_CATHEDRAL is a conversation topic. The enquiry text is "'Do you like it here?' I ask." The response text is "'Where?' he replies, quite genuinely. 'I could use a cushion, perhaps.'"

CT_SAAT_ABBOT is a conversation topic. The enquiry text is "'I think the Abbot's going to do something dreadful,' I try to tell him." The response text is "'I'm sure he is,' he dismisses. 'They always do.'"

CT_SAAT_FIGURE is a conversation topic. The enquiry text is "'I saw this Figure...' I begin." The response text is "'I'm not interested in your pubescent ramblings!' he exclaims sharply. 'See that or shut up!' A sharp finger points at the Orrey."

CT_SAAT_ARCHBISHOP is a conversation topic. The enquiry text is "'How can I get to see the Archbishop?' I ask." The response text is "'Be more important than you are,' Sa'at snaps. 'And no, I won't take you on as an assistant. I don't need assistants. [if the letter state of Brother Sa'at is 1]Did you get my book yet?[end if]'"

CT_SAAT_MONKS is a conversation topic. The enquiry text is "He's unlikely to know them, I think."

CT_SAAT_DOOR is a conversation topic. The enquiry text is "'The Cathedral doors are very impressive,' I tell him." The response text is "'Oh, yes,' he replies sarcastically. '[i]Very[r] impressive. You pull them and they open. It's hardly great mechanics, is it? Hardly the intricate engineering of the cosmos?'"

CT_SAAT_SAAT is a conversation topic. The enquiry text is "'What's your role here, Brother?' I ask." The response text is "He glares back at me. 'Babysitter, it would seem.'"

CT_SAAT_CLOCKWORK is a conversation topic. The enquiry text is "'But how does Clockwork work?' I ask." The response text is "'Time,' he declares. 'It's all predicated – that means, built on – the Universal solidity of Time. As long as there's no going back, no cutting short-cuts, all this will be quite alright.' Delicately, he pats one wheel of the Orrey. 'I built it, you know,' he adds."

CT_SAAT_SAINTS is a conversation topic. The enquiry text is "'What does one have to do to be a Saint?' I ask." The response text is "'Build one little trinket people think is [i]useful[r],' Sa'at replies bitterly."

CT_SAAT_BOOKS is a conversation topic. The enquiry text is "[if the letter state of Brother Sa'at is 0]'Do you read a lot of books?' I ask.[otherwise if the letter state of Brother Sa'at is 1]'Which book was it again?' I ask.[otherwise]'Is it a good book?' I ask, thinking of Planetaria.[end if]". The response text is "[if the letter state of Brother Sa'at is 0]'No. Books are for looking things up in,' Sa'at says firmly. 'Not for reading. Start-to-finish is best left for writers and writers alone.'[otherwise if the letter state of Brother Sa'at is 1]'Principia Planetaria. Newton. Now get it quickly, before I calcify on the spot,' he says.[otherwise]'The good-est,' he scowls, sarcastically. 'Best thing Newton ever did. All this nonsense with penduluums.' He shakes his head, then rounds on me. 'Now, don't listen to me, or you'll get into a lot of trouble, understand? And you'll only get out of it if you're very, very clever. I was, but I should think you're not. So just don't listen to me at all.'[end if]"

CT_SAAT_COORDINATES is a conversation topic. The enquiry text is "'What are the co-ordinates for this book?' I ask.". The response text is "'Co-ordinates?' Sa'at demands, incredulously. 'For a [i]book[r]? Co-ordinates for a [i]planet[r], yes. For a [i]moon[r]. For a comet anytime between now and next century, then you should be asking me, no-one else knows a thing about it. But a [i]book[r]? You don't find books in the heavens! You find books in [i]catalogues[r] and [i]indices[r]!' He is almost red in the face, except he probably doesn't have the blood in him.".

CT_SAAT_LIBRARY is a conversation topic. The enquiry text is "[if Cyclical Library is not visited]'How do I find the Library?' I ask.[otherwise]'I don't understand how to use the Library,' I tell him.[end if]"

The response text is "[if Cyclical Library is not visited]'You found this place, didn't you?' Sa'at replies, with an impatient wave of his hand. 'Just do the same thing the other way!'[else]'Really!' he exclaims, contemptuously. 'Don't they [i]teach[r] you anything? Well!' He harrumphs. 'I'm certainly not about to, anyway!'[end if]".

CT_SAAT_ORREY is a conversation topic. The enquiry text is "[if Brother Sa'at is inspecting his orrey]'Is the orrey all right?' I ask.[otherwise]'Did you build this orrey?' I ask.[end if]". The response text is "[if Brother Sa'at is inspecting his orrey]'I don't know what you did,' he replies menacingly. 'But when I fix it I don't expect to see it go wrong again. It's most upsetting.' He winds his hands in despair.[otherwise]'Every gear and trace,' he says proudly. 'Years ago now and I still don't fully understand it. It's a marvel. A [i]mystery[r]. I spend night after night,' – his eyes are filling with tears now – 'just contemplating it. You have to look at the right [i]times[r], you see.' He's shaking. 'Have to get the times right otherwise it's no [i]good[r]...'[end if]"

CT_SAAT_WAX is a conversation topic. 

The enquiry text is "'Where can I get wax from?' I ask.".
The response text is "'Where does wax come from?' Sa'at repeats, seemingly absolutely astonished. 'Where do you [i]think[r] wax comes from, idiot? Where else [i]could[r] wax come from? Wax comes out of the back-end of [i]bees[r], obviously!' He scratches his nose. 'Of course, it's not purple yet then. Gets turned into candles and I don't know what else.' Thinks. 'I don't know what else. Hmph. More bees, probably. Typical.'".

CT_SAAT_HELP is a conversation topic. The enquiry text is "'Brother Sa'at,' I ask. 'Can you help me?'" 
The response text is "'I think you'll find [i]you[r] are helping [i]me[r],' Sa'at replies archly. Then he steeples his fingers and adds, 'of course, what goes [i]around[r] often comes [i]back[r], does it not? I'm sure you'll learn a lot running my errands for me.'"

CT_SAAT_WORKORDER is a conversation topic. The enquiry text is "'What needs to be done for this work order to be finished?' I ask."
The response text is "'[i]Bureaucracy[r] is never [i]finished[r]. Oh, no. If it was [i]finished[r] maybe some of us could get on [i]without[r] all this looking-up-coordinates, and stamping-things-with-wax, and all this sort of [i]rot[r]. I mean, what good is a [i]stamp[r]? We've got whole rooms of [i]machines[r] stamping out everything from [i]books[r] to [i]rats[r], it's not like stamping is [i]difficult[r]. It's simply fiddly.' He pokes me in the shoulder. 'When you're bigger, you should do something [i]about[r] it, do you understand?'"

CT_SAAT_NEBULA is a conversation topic. The enquiry text is "'What's this work order for?' I ask Brother Sa'at."
The response text is "'Well, it's so I can [i]work[r],' he explains, with barely-concealed contempt. 'I know it's [i]hard[r] to believe but this orrey of mine isn't [i]complete[r]. How am I supposed to understand the [i]universe[r] when I don't know where everything [i]is[r]?'"

CT_SAAT_ASTRONOMERS  is a conversation topic. The enquiry text is "'Who are the astronomers?' I ask Brother Sa'at."
The response text is "'They're idiots,' he replies, briskly. 'They spend all day staring into telescopes at things far away and never [i]noticing[r], oh no, when someone steals their [i]sandwiches[r]. And they never see the [i]whole[r] picture.' He sighs, and looks at his Orrey with love.";

CT_SAAT_ME is a conversation topic. The enquiry text is "'Do you know who I am?' I ask." The response text is "'Of course I don't,' he snaps. 'I don't have the [ifaintest[r] interest or clue. You're a [i]small[r] one.' Suddenly, a thought seems to strike him. His face pulls back in horror. 'Oh, Good [i]Grease[r], you're no the child of someone [i]important[r], are you, from the Council of [i]Scientists[r]?' He peers. 'Oh, [i]no[r], of course not. Someone like that wouldn't be nearly as [i]dirty[r] as you are. Never mind, then.'";

The conversation table of Brother Sa'at is the table of Brother Sa'at's Conversation.

Table of Brother Sa'at's Conversation
topic							conversation
"help" or "aid" or "assistance"			CT_SAAT_HELP
"faith" or "creed" or "religion" or "church"			CT_SAAT_CREED
"ritual" or "altar" or "song" or "perpetuum" 			CT_SAAT_ALTAR
"business" or "proof"					CT_SAAT_BUSINESS
"[cathedral]" or "[abbey]"					CT_SAAT_CATHEDRAL
"[abbot]"						CT_SAAT_ABBOT
"[figure]"						CT_SAAT_FIGURE
"[archbishop]"				CT_SAAT_ARCHBISHOP
"[abbeyfolk]"						CT_SAAT_MONKS
"door"							CT_SAAT_DOOR
"[sa'at]" or "[himself]" 		CT_SAAT_SAAT
"[clockwork]"						CT_SAAT_CLOCKWORK
"[saints]"									CT_SAAT_SAINTS
"library"									CT_SAAT_LIBRARY
"books" or "book" or "principia" or "planetaria" or "planeteria"		CT_SAAT_BOOKS
"[orrey]"										CT_SAAT_ORREY
"coordinates" or "co-ordinates"					CT_SAAT_COORDINATES
"wax" or "candle/candles" 				CT_SAAT_WAX
"work" or "order" or "paper"				CT_SAAT_WORKORDER
"nebula" or "map"							CT_SAAT_NEBULA
"astronomers" or "cartographers"			CT_SAAT_ASTRONOMERS
"[me]"									CT_SAAT_ME

Understand "orrey" or "planets" or "sky" or "machine" or "mechanism" or "construction" or "comet" or "balls" or "ball" or "rod" or "rods" as "[orrey]".

CT_SAAT_CREED is clustered with CT_SAAT_BUSINESS, CT_SAAT_CATHEDRAL, CT_SAAT_ABBOT, CT_SAAT_FIGURE, CT_SAAT_ARCHBISHOP, CT_SAAT_MONKS, CT_SAAT_DOOR, CT_SAAT_SAAT, CT_SAAT_CLOCKWORK, CT_SAAT_SAINTS, CT_SAAT_BOOKS, CT_SAAT_ORREY, CT_SAAT_ALTAR, CT_SAAT_COORDINATES, CT_SAAT_LIBRARY, CT_SAAT_WAX, CT_SAAT_HELP, CT_SAAT_WORKORDER, CT_SAAT_NEBULA, CT_SAAT_ASTRONOMERS, CT_SAAT_ME.

Rule for firing a fired conversation topic that is clustered with CT_SAAT_CREED:
	say "I've already asked about that." instead;

Last after firing CT_SAAT_CREED:
	now CT_SAAT_CREED is unfired; [We can ask this one multiple times]

Last after firing CT_SAAT_BOOKS:
	now CT_SAAT_BOOKS is unfired; [We can ask this one multiple times]

Section 3 - Idle Actions

The Sa'atCounter is a counter. The top end is 4. The internal value is 2. [We have the 'work order' event on the first turn we enter.]

Every turn when the player can see Brother Sa'at:
	if Brother Sa'at is not inspecting his Orrey:
		increment the Sa'atCounter;

Rule for firing the Sa'atCounter:
	say "[one of]The orrey quietly revolves.[or]Something the orrey does – though I can't see a thing different – makes Sa'at clap his hands in delight.[or]Sa'at's eyes dart across the wheel of his orrey like he was reading a book.[or]The gears on the orrey slowly tug at the distant comets over the doorway.[or]Sa'at jots a note to himself, very quickly, almost without seeing what it says.[at random]"

Chapter 3 - Work Order

A work order is carried by Brother Sa'at. The description is "The order outlines the need for a map of a Nebula, whatever that is[if the letter state of Brother Sa'at is 4]. It's official: stamped in purple wax with the Cathedral icon[end if]."

Understand "sheet", "paper", "of paper" as the work order.
Understand "seal", "sealed", "wax", "icon" as the work order when the work order is sealed.

Definition: the work order is sealed:
	if the letter state of Brother Sa'at is 4, yes;
	no;

Definition: the work order is not sealed:
	if the work order is sealed, no;
	yes;

Before asking Brother Sa'at for the work order:
	try taking the work order instead.

Before asking Brother Sa'at for the Principia Planetaria:
	try taking the Principia Planetaria instead.

Instead of dropping the sealed work order:
	say "Better hang onto it. You never know when something with the seal on it might come in handy." instead;

Instead of putting the sealed work order on something:
	say "Better hang onto it. You never know when something with the seal on it might come in handy." instead;

Instead of inserting the sealed work order into something:
	say "Better hang onto it. You never know when something with the seal on it might come in handy." instead;

Instead of dropping the work order in the Orrey Hall:
	try putting the work order on the desk instead.

Chapter 4 - Desk

The Brother-Sa'at's desk is a supporter, in the Orrey Hall. The description is "The desk is covered in paper, covered in scribbles."

The printed name is "desk".

Rule for writing a paragraph about Brother-Sa'at's desk:
	say "On Sa'at's desk is a pile of papers[if the Work Order is on Brother-Sa'at's Desk], including [a work order][end if].";

Instead of putting something on Brother-Sa'at's desk:
	try giving the noun to Brother Sa'at instead;



Chapter 5 - Papers

Brother-Sa'at's papers are on Brother-Sa'at's desk. The description is "I can't make the slightest sense of any of them."

Understand "pile", "pile of", "note", "Sa'at's papers", "Brother Sa'at's papers" as Brother-Sa'at's papers.

The printed name is "Sa'at's papers".

Instead of taking Brother-Sa'at's papers:
	say "It all looks like junk to me[if BISH_DOOR_EVENT1 is fired] It certainly wouldn't convince a member of the Swiss Watch that I was working for anyone. Anyone sane, anway[end if].";

Instead of putting something on Brother-Sa'at's papers:
	try giving the noun to Brother Sa'at instead;

Instead of inserting something into Brother-Sa'at's papers:
	try giving the noun to Brother Sa'at instead;

Chapter 6 - Orrey

The Orrey Machine is a thing, scenery in the Orrey Hall. "The machine is centred around a large gold ball that's meant to look like the sun (but I've seen the sun, and not only does it change size it changes colour too – much redder after dinner, much like Brother Horloge's cheeks). Around that centre are wide hoops of thin wire which are slowly revolving, sliding and spinning over one another. Fixed to them are coloured balls – planets – and pressed brass discs bearing the symbols of the major constellations. Further off, in the very corners of the chamber, are comets, asteroids and a few galaxies."


Instead of doing something when the Orrey Machine is physically involved and Brother Sa'at is inspecting his Orrey:
	say "'Get away,' Sa'at insists, and pushes me back, so hard that it hurts.";

Instead of doing something when the Orrey Machine is physically involved:
	now Brother Sa'at is inspecting his Orrey;
	Brother Sa'at fixes the problem in three turns from now;
	say "This'll distract the old bat, surely. I grab one of the wheels of the orrey and push it onwards, just a bit.[paragraph break]Sa'at's on his feet in seconds, knowing something's wrong just by the [i]sound[r]. He starts to pace around the edge of the machine, peering at it and fretting. Strangely, he doesn't tell me off. It's like he can't see me at all.";

At the time when Brother Sa'at fixes the problem:
	now Brother Sa'at is sat at his desk;
	if the player can see Brother Sa'at begin;
		say "Sa'at suddenly chortles with delight. With one hand he tweaks one of the wheels of the machine: nothing seems to change, but he's immediately satisfied and returns to his desk, beaming.";
	end if;

Section 2 - Parts of the Orrey machine

Some parts of the Orrey are privately-named, part of the Orrey Machine. The description is "[one of]All the parts of the Orrey are lovingly crafted.[or]Sa'at must have spent a lifetime polishing these.[or]No detail is left undetailed.[cycling]".

Understand "planet", "planets", "sun", "comet", "comets", "meteorites", "meteorite", "meteor", "galaxy", "galaxies", "space", "ball", "balls", "brass", "disc", "discs" as the parts of the Orrey.

Instead of doing something when the parts of the Orrey are physically involved and the action is physical:
	try taking the Orrey Machine instead.


Part B - Bureaucracy puzzle (work order stamping)

Understand "clean ear" as a mistake ("Sa'at watches me. 'No good. Honestly. I mean, honestly.'") when in the Orrey Hall.

Understand "clean out/my/your ear" as a mistake ("Sa'at watches me. 'No good. Honestly. I mean, honestly.'") when in the Orrey Hall.

Instead of taking the work order when the letter state of Brother Sa'at is 0 and Brother Sa'at is sat at his desk:
	change the letter state of Brother Sa'at to 1;
	if BISH_DOOR_EVENT1 is fired, say "A work order, I'm thinking: [i]perfect[r]. I can think of somewhere handy to wave this! But then Brother ";
	say "Sa'at snatches the order back out of my hands.[paragraph break]'Oh, [i]cantilever[r],' he swears, coarsely, looking it over. 'I've [i]forgotten[r] the galactic axis that I want, haven't I?' He begins hunting around for something but evidently can't find it. 'You!' he declares, waving an unruly finger. 'You, go get a Principia, will you? From the [i]library[r]. A Planetaria, mind you now, not one of those Mathematicas, they're no use to me. Good! Well, [i]then[r]! [i]Off[r] you go!' He puts the order back down on his desk and proceeds to ignore me.";

Instead of taking the work order when the letter state of Brother Sa'at is 1 and Brother Sa'at is sat at his desk:
	say "Sa'at snatches it back from me. 'I told you to get my book!' he exclaims. 'This order's no use without the co-ordinates. How would they know which map to provide? Think, child. [i]Think![no line break][r]'[paragraph break]";

Instead of taking the work order when the letter state of Brother Sa'at is 2 and Brother Sa'at is sat at his desk:
	change the letter state of Brother Sa'at to 3;
	say "Sa'at snatches back the order to check it over. 'Coordinates – map – Crab Nebule – yes, yes, we know. As the cog said to the butcher's wife. What? Oh. Oh, [i]cam[r].' He scowls at me. 'Seal and sign. They always say, seal and sign. I've signed, but oh, no, not good enough, is it?' He begins the process of hunting around again.[paragraph break]'Do you need another book?' I ask.[paragraph break]'No. Idiot,' he says. 'I need some wax for sealing with. Official business, has to be purple wax, none of this empty-your-ear business that was perfectly good enough a few years ago. Oh no. The world's gone mad, I tell you.' He winds his hands together quite unexpectedly. 'Mad.'"

Instead of taking the work order when the letter state of Brother Sa'at is 3 and Brother Sa'at is sat at his desk:
	say "'Without a seal,' Sa'at says, 'this parchment you're so busy trying to steal is worse than useless. It's a waste of my time [i]and[r] it's useless.'"

After taking the work order when the letter state of Brother Sa'at is less than 4:
	say "I slip the work order off his desk while he's distracted with the orrey. 'You!' he boils. Not distracted enough. But he doesn't snatch it back. 'Don't do that!' He's too wrapped up watching his machine to actually do anything – just shakes his fist, and then gets back to work." instead;

After taking the work order when the letter state of Brother Sa'at is 4:
	say "Sa'at snatches it back off me, to check it over. 'Sign, seal, coordinates, Crab Nebula, [i]Henric Sa'at[r], that's me, all good. Good!' He seems satisfied and puts the order into my hands again. 'Now run along. The [i]Society[r] is in Paris, as I'm sure you know, so you'll [i]have[r] to get the boat from Port Hauter, it's about three days in one of those [i]wagon-things[r] they let children ride. Take a [i]pigeon[r] and send me a note if... when... you make it. Best of luck!' With a poor attempt at affection, he pats me on the shoulder." instead;

Understand "henric" as Brother Sa'at.

Instead of giving the Work Order to Brother Sa'at when the letter state of Brother Sa'at is not 4:
	move the work order to Brother-Sa'at's desk;
	say "I hand Sa'at back his work order. 'Good for you,' he says. 'And let that be a lesson to you [i]not[r] to steal!' He's grinning, for no reason. Then he returns his [i]attention[r] to the orrey." instead;

Instead of giving the Work Order to Brother Sa'at when the letter state of Brother Sa'at is 4:
	say "'Well, I don't want it back, it's too late for that,' he says. 'You've promised. Now get on with it. To Paris! It'll only take about a month, I don't know what you're worried about.'" instead;

Instead of giving the Principia Planetaria to Brother Sa'at when Brother-Sa'at's desk does not enclose the work order:
	say "'Well, that's very kind,' Sa'at replies testily. 'But I'd like the work order I spent all morning preparing first, I think. How about that? Then you can give me the book I want too.'" instead;

Instead of giving the Principia Planetaria to Brother Sa'at when Brother-Sa'at's desk encloses the work order:
	remove the Principia Planetaria from play;
	change the letter state of Brother Sa'at to 2;
	say "'Is this the book?' I ask, offering the Principia Planetaria to Sa'at.[paragraph break]'Well [r]done[r],' he replies, insincerely. 'Well done. You managed to [i]not[r] bring me the Principia Mechanistica, Principia Mathematica or the Principia Copiomatrix. Or [i]any[r] of the other dubious volumes I'm always pulling down.' He takes the book I have brought and quickly flicks through the pages. Seems he knows exactly what he's after...[paragraph break]'There we are. [i]Coordinates[r]...' He scribbles something down onto the work order on the desk. 'Done. Coordinates to find coordinates, all to find [i]coordinates[r],' he says with a smile. The book he puts away in his desk. 'I'll keep that,' he mutters, winding his hands around one another. 'Yes, why [i]not[r]?'" instead;

To decide if we have provided Sa'at with the book:
	if the letter state of Brother Sa'at is at least 2, yes;
	no.

Instead of putting a wax lump on the work order when the letter state of Brother Sa'at is less than 4:
	say "I've no way of stamping it, even if I could get the wax to stick. Might as well let the Brother do it for me."

Instead of putting a wax lump on the work order:
	say "I don't need to do that any more."

Instead of giving a wax lump to Brother Sa'at when the letter state of Brother Sa'at is less than 3:
	say "'What are you waving that at me for?' Sa'at demands. 'And I hope you didn't steal it from my desk.'";

Instead of giving a candle to Brother Sa'at when the letter state of Brother Sa'at is not 3:
	say "'What are you waving that at me for?' Sa'at demands. 'I'm not a bad smell.'";


Instead of giving a candle to Brother Sa'at when the letter state of Brother Sa'at is 3:
	say "'What am I supposed to do with that?' Sa'at demands. 'Chew it down?'";


Definition: a wax lump is unpurple-colored:
	if the color of it is purple, no;
	yes;

Definition: a wax lump is purple-colored:
	if the color of it is purple, yes;
	no;

Instead of giving an unpurple-colored wax lump to Brother Sa'at when the letter state of Brother Sa'at is 3:
	say "'Purple wax?' Sa'at demands, looking at me like I'm an idiot. 'Did something go wrong with your eyes? Or didn't they teach you colours when they explained the use of your opposable thumb?' He snickers to himself, then returns to his work.";

Instead of giving a purple-colored wax lump to Brother Sa'at when the letter state of Brother Sa'at is 3 and Brother-Sa'at's desk does not enclose the work order:
	say "'Will this do?' I ask, holding out the lump of purple wax. Sa'at doesn't look closely.[paragraph break]'Yes, but I rather [i]think[r] you'll need to give me back my work order [i]first[r], don't you? Before I have the [i]Swiss Watch[r] down here, very angry [i]indeed[r].'";

The wax-task been-and-returned flag is a truth state that varies.

Every turn when the location is not the Orrey Hall and the letter state of Brother Sa'at is 3:
	now the wax-task been-and-returned flag is true;

Instead of giving a purple-colored wax lump to Brother Sa'at when the letter state of Brother Sa'at is 3 and Brother-Sa'at's desk encloses the work order:
	change the letter state of Brother Sa'at to 4;
	remove the noun from play;
	say "'Will this do?' I hold out the lump of purple wax.[paragraph break]He looks at it curiously. 'Did you get this from the Cathedral [i]store cupboard[r]?' he asks. ";
	if wax-task been-and-returned flag is true:
		say "'You took long enough [i]about[r] it, it's hardly far away. And it's";
	otherwise:
		say "'I don't think you did. It's";
	say " a pretty disgusting [i]colour[r], isn't it? Look at all the streaks. Never mind. I'd rather have this done [i]now[r] than in another two months, or however long it'll [i]take[r] you to find a simple cupboard.'[paragraph break]With that he produces a small metal box, into which he drops the wax lump. Winding the box up with a key, it starts to rattle and shake and eventually smoke. Once it's run down, the wax inside has melted enough for Sa'at to dribble a few drops onto the work order and then stamp it with his ring.[paragraph break]'Good,' he announces. 'That's that. [i]Bureaucracy[r] appeased. No need to wax [i]lyrical[r] about it.' He rubs his hands, chortles to himself, then abruptly stops and returns to his work. I'm roundly ignored in all this, of course."

Instead of giving a wax lump to Brother Sa'at when the letter state of Brother Sa'at is 4:
	say "'Yes, very good,' Sa'at says with a sigh. 'It's already sealed, so you can put your nasty wax away.'"

Part 12 - Cyclical Library

Chapter 1 - Description

The Cyclical Library is southwest of the Library Archway, in the Cathedral Space. "[one of]The Library of the Cathedral of Time is about as much like the one in the Abbey as the mould on the floorboards of my room is like the oak tree standing outside the Cathedral gate. [or][stopping]This room is massive, and mechanised. Little blocks of shelving, holding about twenty books each, tile the cylindrical wall in a kind of mosaic, but they're all fixed up to winches, pulleys, and the whole room can revolve, so instead of you going to a find a book... well, you get the idea."

Instead of making to leave when in the Cyclical Library: try going northeast instead.
Instead of going inside in the Cyclical Library: try going northeast instead.

Section 2 - Event on Entry moved to examining shelves and things

LIBRARYEVENT1 is a trigger.

Rule for firing unfired LIBRARYEVENT1:
	say "(You might be wondering where all the power for these big machines comes from. The story goes that when St Philip founded the city, he made sure to build the cathedral on a spring.)";

After examining the contraption when LIBRARYEVENT1 is unfired:
	fire LIBRARYEVENT1;

After examining the bookshelves when LIBRARYEVENT1 is unfired:
	fire LIBRARYEVENT1;

After examining the controls when LIBRARYEVENT1 is unfired:
	fire LIBRARYEVENT1;

Chapter 2 - Scenery

Section 1 - Initiates

Some initiates are scenery, in the Cyclical Library. "Between where I am, and the monks around the altar back in the Cathedral, comes a long period with a shaved head but no dining rights. The boys here are studying hard because they're getting hungry."

Understand "monk", "monks", "reader", "readers", "initiate", "boys", "kids", "guys" as the initiates.

Instead of doing something when the initiates are physically involved:
	say "I'd better not disturb them.";

Before asking the initiates about:
	say "I'm not meant to disturb them. They're deep in study." instead.
Before telling the initiates about:
	say "I'm not meant to disturb them. They're deep in study." instead.
Before shouting at the initiates:
	say "I'm not meant to disturb them. They're deep in study." instead.

Section 2 - Library Tables

Some library tables are a supporter, scenery, in the cyclical library. "A few long tables for working."

Understand "table", "desks", "desk" as the library tables.

Section 3 - Bookshelves

Some bookshelves are scenery, in the Cyclical Library. "The bookshelves form a giant's jigsaw on the wall, right the way around. They're all rigged and pulleyed so the order can be changed at will. The whole process is controlled by an oddly-small contraption in the centre of the room, that dangles down from the ceiling."

Understand "books", "shelf", "shelves" as the bookshelves.

Instead of doing something when the bookshelves are physically involved:
	say "Even the nearest one is far above my reach. They have to be, otherwise anytime a book was ordered using the controls in the centre of the room, someone might be crushed by a flying bookcase.";

Section 4 - Contraption

A contraption is in the Cyclical Library. "This is all controlled by a gold-panelled contraption that dangles from the ceiling like a chandelier they forgot to hoist. It's got three main controls. Occasionally, one of the initiates going through the studying phase of their education goes up and takes a look, but they seem nervous to touch it, for some reason."

Understand "chandelier", "machine" as the contraption.

The description is "Suspended from the centre of the ceiling the contraption is covered in controls. Somehow what you select down here on ground level gets fed into the mechanism that controls the walls. There must be wires running up inside the tubes and turning cogs overhead. "

Instead of doing something when the contraption is physically involved:
	say "You'd need to be specific on which control I should use, and how.";

Instead of entering or climbing the contraption:
	say "[one of]I'd have half the Cathedral down on me in seconds if I tried that![or]No chance. I'm not looking make a distraction, here![cycling]";

Some controls are part of the contraption. The description is "The controls consist of three cranks (one steel, one brass and one gold), beneath which are three rotating cylindrical dials engraved with numerals and the letters X, Y and Z, showing [i][value of X control], [value of Y control], [value of Z control][r]. Next to all this is an iron chain that runs right back up to the ceiling."

Understand "tumblers", "numbers", "values", "numerals", "cranks", "cylindrical", "dials", "meters", "main controls", "three controls" as the controls.

Instead of using or switching on the controls:
	say "If I just mess about at random with these things I'll probably turn the whole library inside out. Best to be specific. Which control, which way?";

The X control is a Cartesian Control. The metal of the X control is "steel". The letter is "X". The coordinate is 5.7.
The Y control is a Cartesian Control. The metal of the Y control is "brass". The letter is "Y". The coordinate is 1.1.
The Z control is a Cartesian Control. The metal of the Z control is "gold". The letter is "Z". The coordinate is 6.8. 

The X meter is a privately-named Cartesian Meter, part of the controls. The model of the X meter is the X control. 
The Y meter is a privately-named Cartesian Meter, part of the controls. The model of the Y meter is the Y control.
The Z meter is a privately-named Cartesian Meter, part of the controls. The model of the Z meter is the Z control.

Understand "steel meter", "x meter" as the X meter.
Understand "brass meter", "y meter" as the Y meter.
Understand "gold meter", "z meter" as the Z meter.

Understand "cylindrical", "control", "dial" as a Cartesian Meter.

The X crank is a privately-named Cartesian Crank, part of the controls. The model of the X crank is the X control. The meter of the X crank is the X meter. 

The Y crank is a privately-named Cartesian Crank, part of the controls. The model of the Y crank is the Y control. The meter of the Y crank is the Y meter. 

The Z crank is a privately-named Cartesian Crank, part of the controls. The model of the Z crank is the Z control. The meter of the Z crank is the Z meter. 

Understand "x crank", "steel crank", "steel" as the X crank.
Understand "y crank", "brass crank", "brass" as the Y crank. 
Understand "z crank", "gold crank", "gold" as the Z crank.

Instead of turning a Cartesian Crank (called the handle):
[we rotate as many times as specified by the player, or by a random amount. We tell the player which we're doing, and the random one will never go past a correct answer! ]
	let the turn-count be the number of turns to make;
	if the turn-count is 0, let the turn-count be a random number between 1 and 4;
	let n be the coordinate of the model of the handle;
	repeat with turn-number running from 1 to the turn-count:
		if the units part of n is 9:
			decrease n by 0.9;
		otherwise:
			increase n by 0.1;
		if the number of turns to make is 0: [ ie. player didn't specify] 
			if units part of n is 3 or the units part of n is 2 or the units part of n is 5:
				let the turn-count be the turn-number;
				break;
	change the coordinate of the model of the handle to n;
	say "I turn [the handle] clockwise [turn-count times][one of], and the second tumbler of [the meter of the handle] slowly winds on, so it now[or]. [The meter of the handle][stopping] reads [tens part of n][units part of n].";

Instead of turning a Cartesian Crank (called the handle) backwards:
[we rotate as many times as specified by the player, or by a random amount. We tell the player which we're doing, and the random one will never go past the tens column of a correct answer! ]
	let the turn-count be the number of turns to make;
	if the turn-count is 0, let the turn-count be a random number between 1 and 4;
	let n be the coordinate of the model of the handle;
	repeat with turn-number running from 1 to the turn-count:
		if the tens part of n is 9:
			decrease n by 9.0;
		otherwise:
			increase n by 1.0;
		if the number of turns to make is 0: [ ie. player didn't specify] 
			if the tens part of n is 4 or the tens part of n is 1 or the tens part of n is 9:
				let the turn-count be the turn-number;
				break;
	change the coordinate of the model of the handle to n;
	say "I turn [the handle] anticlockwise [turn-count times][one of], and the first tumbler of [the meter of the handle] slowly winds on, so it[or]. [The meter of the handle][stopping] now reads [tens part of n][units part of n].";

Instead of number-setting a Cartesian Crank to:
	try number-setting the meter of the noun to the number understood instead

Instead of number-setting a Cartesian Meter to:
	say "I can't turn the numbers directly, but I could turn the cranks clockwise or anticlockwise.";

Section 4b - Plural objects for cranks and dials

Some group-cranks are privately-named, part of the controls. The printed name is "cranks". Understand "cranks" as the group-cranks. 

Before doing something with the group-cranks:
	if examining, say "Three cranks - steel, brass and gold. They're attached by piston-arms to the X, Y and Z meters in that order." instead;
	say "You'll have to pick a crank: steel, brass, or gold?" instead.

Some group-meters are privately-named, part of the controls. The printed name is "meters". Understand "meters", "dials" as the group-meters. 

Before doing something with the group-meters:
	if examining, say "The dials read [value of X control] (attached to the steel crank), [value of Y control] (attached to the brass crank) and [value of Z control] (attached to the gold crank, which I can't help noticing is a little more securely attached)." instead;
	say "You'll have to pick a dial: X, Y or Z?" instead.

Section 5 - Book Pulling

The iron chain is scenery, in the Cyclical Library. "A long iron chain that leads up to the contraption on the ceiling. I shouldn't say this, but it looks a lot like the toilet flush that Brother Armitage has been designing." 

Understand "links" as the iron chain.

Instead of pulling the chain:
	say "I pull hard on the chain[one of] and very slowly, the mechanism overhead comes to life. The walls themselves start to move! Sections of shelf seem to float upwards, creating gaps that others sidle into. It's like a basket of crabs kicked over in a market; all the books scuttling this way and that. Noisy, though. Shelves collide with thumps and groans and scrapes. The initiates look very annoyed indeed.[paragraph break][or]. Shelves move and glide around the walls of the library with colossal noise! [stopping]Eventually, everything comes to a halt, and a metal plate extends down from a position above my head with a single book in place.";
	abide by the book-pulling rules;

The book-pulling rules are a rulebook.

To decide which indexed text is the library code:
	let x be the coordinate of the X control;
	let y be the coordinate of the Y control;
	let z be the coordinate of the Z control;
	decide on "[the tens part of x][the units part of x][the tens part of y][the units part of y][the tens part of z][the units part of z]";

A book-pulling rule:
	if the letter state of Brother Sa'at is not 1 begin;
		say "The book is nothing I want though, so I release the chain and it disappears back into the stacks." instead;
	end if;

A book-pulling rule when the library code is "431295":
	if the Principia Planetaria has been handled:
		say "The book turns out to be a dummy! Just a block of wood with 'BOOK ON LOAN' painted on the cover. It won't come free; and disappears into the shelf once more." instead;
	otherwise:
		now the player carries the Principia Planetaria;
		say "It's the Principia! I snatch it down and the plate slides back into the shelf." instead;

A book-pulling rule when the library code is "930428" or the library code is "951024":
	[Easter egg based on the serial numbers for releases of Curses!.]
	say "Sadly, it's not the Principia. I release the chain and the book disappears into the stacks. Curses!" instead;

A book-pulling rule:
	say "Sadly, it's not the Principia. I release the chain and the book disappears into the stacks." instead;

Section 5 - Card Catalogue

A card catalogue is in the Cyclical Library. "By the door to the northeast is a card catalogue. That'll be gone as soon as they work out how to do something more useful with a keyhole than just type letters onto paper."

Understand "index", "cards" as the card catalogue.

The description is "It's a box of index cards, filed alphabetically. Easy to use, unlike the contraption that controls the shelves! I just need to look up whatever title I'm after."

Before researching when in the Cyclical Library:
	try consulting the card catalogue about the topic understood instead.

Instead of consulting the card catalogue about:
	if the topic understood is a topic listed in the table of index cards begin;
		say "[response entry][paragraph break]";
	otherwise;
		say "I don't find that in the catalogue. It might be listed under a different name or it might not be here at all.";
	end if;

Table of index cards
topic		response
"principia"	"I find one, then another, then a third Principia... seems to be a popular name.[if the letter state of Brother Sa'at is 1] Which one was Sa'at after?[end if]"
"planetaria" or "principia planetaria/planeteria" or "saats/sa'ats/saat's/sa'at's book/volume/request/principia" or "astronomy" or "stars" or "planets" or "planetarium" or "planeteria"	"There are a lot of cards labelled 'Principia', but after a while I pick out Newton's [i]Planetaria[r]. The card reads: '[']Principia Planetaria, the apocryphal astronomical writings of St. Isaac Newton.['] Cartesian Call Number (43, 12, 95).' I put it back in the catalogue."
"newton"	"[one of]Nothing: all the cards are indexed by work name, not author. But can I remember the work name? It was the Participant, or the Particular, or something like that.[or]Still nothing. Looks like they haven't improved the system yet, then.[stopping]"

Section 6 - Tome

The gigantic tome is in the Cyclical Library. "On one of the desks, without a reader, sits a gigantic Tome."

The description is "[if uncut]A large volume, fresh from the Gutenberg in the Abbey. I can tell it's new by the freshness of the leather, and smell of burnt ink and the way some of the pages are still uncut – each leaf is printed double and folded over before being stitched in, so the book needs to be sliced open. Whichever monk was reading it probably went off to find a knife.[otherwise]The book is very new and not very evenly cut.[end if]"

Understand "book", "page", "pages", "leaf", "leaves" as the gigantic tome.
Understand "uncut" as the gigantic tome when the tome is uncut.

The tome can be cut open or uncut. The tome is uncut.

Instead of taking the tome:
	say "The book's out for one of the initiates. I've no good reason to steal it from him.";

Instead of opening the tome:
	try reading the tome;

Instead of reading the cut open tome when the knife is on-stage:
	say "‘On the pattern of flora in the water of shallow ponds. Many investigations have been made into this fascinating subject using the latest close-viewing Opticks and the researches of Maxwell and Newton into the properties of lens-glass. However...'[paragraph break]This doesn't read like a church book at all.";

Instead of reading the uncut tome when the knife is on-stage:
	say "The book isn't readable yet because the pages haven't been cut open.";

Instead of reading the tome when the knife is off-stage:
	move the knife to the Cyclical Library;
	say "A knife falls out from inside the book. Presumably the absent-minded monk had been using it as a bookmark [i]before[r] going off to find a paper knife.";

Instead of slicing the uncut tome with the knife:
	now the tome is cut open;
	say "I slit open the pages of the Tome with the knife. What a helpful child I am!";

Section 7 - Knife

A knife is a thing. The description is "A short steel letter-opener, sharp enough to slice through paper but probably not much good for fending off Calvin."

Understand "short", "sharp", "handle" as the knife.
Understand "letter-opener", "letter opener" as the knife when the knife is not a garden-knife.
Understand "gardener's", "gardeners" as the knife when the knife is a garden-knife.

After taking the knife:
	say "I pick up the knife." instead;

Before dropping the knife:
	say "A knife like this might come in useful. If I run into any Figures... or any Drakes...[paragraph break]" instead.

Before putting the knife on something:
	try dropping the knife instead.

Before inserting the knife into something:
	try dropping the knife instead.

Does the player mean slicing with the knife:
	it is likely.

The knife can be a garden-knife. The knife is not a garden-knife.

Rule for printing the description of the garden-knife knife:
	say "A short gardener's knife, sharp enough for slicing bramble-stems but probably not much good for fending off Calvin."

Section 6b - The Tome disappears and the Knife is left behind

[ If the player fails to find the Knife and has finished with the Planteria puzzle so he won't go back, we drop the knife in his view so he can continue the game ! ]

MONK_DROPS_KNIFE is a trigger.

Every turn when the location is the Upper Nave and the knife is off-stage and the knife is not handled and we have provided Sa'at with the book [so we aren't going back to the Library and we don't have the knife ]: 
	fire MONK_DROPS_KNIFE;

Rule for firing unfired MONK_DROPS_KNIFE:
	move the knife to the location;
	remove the gigantic tome from play;
	move backdrop-initiate to the Upper Nave;
	say "A hassled initiate dashes through the Nave, knocking me to one side with the corner of the gigantic Tome he's carrying in both arms. The collision makes something clatter to the floor, but he doesn't see it - and then he's gone."

Understand "clatter", "something", "thing" as the knife when MONK_DROPS_KNIFE is fired and the knife is not handled.

Rule for printing the description of the backdrop-floor when in the Upper Nave and MONK_DROPS_KNIFE is fired and the knife is not handled:
	say "On the floor is a long paper knife."

The backdrop-initiate is a man, scenery, privately-named. Understand "tome", "gigantic", "initiate", "monk", "hassled" as the backdrop-initiate. The printed name is "hassled initiate". Before doing something with the backdrop-initiate, say "The initiate is long gone." instead.

Section 8 - The Principia Planetaria

The Principia Planetaria is a thing. The indefinite article is "The". The description is "It's a slim volume – surprisingly. The title is 'Principia Planetaria: The Apocryphal Astronomical Writings of St. Isaac Newton.'"

Understand "book", "tome", "tables", "co-ordinates", "apocrypha", "diagrams", "planeteria" as the Principia Planetaria.

Instead of reading the Principia Planetaria:
	say "Why anyone would want to read this is beyond me. After a hundred pages of numerical tables listing the table-co-ordinates of co-ordinates of stars, there follows a hundred pages of diagrams of the night skies and everything beyond, all joined up by watch escapements, rods, springs, levers and releases. [i]Newton's Clock Universalis[r], it's called. It's like someone sketched the Milky Way and their child doodled all over it. (It's an [i]Apocrypha[r]. I'm pretty sure that means it's rubbish).";

Part 13 - West Clerestory

The West Clerestory is a room, in the Cathedral Space. "[if Archbishop's Meeting has not happened]This balcony has a good view down over the choir stalls and the altar where the monks are still clustered. The sun has just come round and I'm standing, bathed in colourful light from the enormous stained glass window. Spiral stairs lead down, and the balcony curves around to the northeast.[otherwise]This is where the Figure went – and it's not hard to see where he went next either. Part of the west wall has disappeared to reveal a ladder built into a space in the brickwork. No problem, though. I'm [i]good[r] with ladders.[end if]"

Instead of making to leave when in the West Clerestory: try going down instead.
Instead of going inside in the West Clerestory: try going down instead.

Instead of facing west in the west clerestory when the player can see the secret construction ladder:
	try examining the secret construction ladder instead;

Chapter 1 - Window of the Lever

The window of the lever is a stained glass window, scenery, in the West Clerestory. "This pane of glass depicts an enormous lever, being operated from very far off by a man wearing a bed-sheet. (Or that's what it looks like to me: he's probably meant to be an angel)." Understand "big", "beautiful", "windows", "enormous", "gigantic", "man", "wearing", "wearing a", "wearing the", "bed-sheet", "bed sheet", "bedsheet", "sheet", "angel" as the window of the lever.

Chapter 2 - Ladder

[Begins life out of play]

A secret construction ladder is scenery. "There's a flue hidden in the wall, with this old construction ladder leading away upwards. One of the Figure's six secret doors!"

Understand "old", "flue", "bricks", "brickwork", "gap", "space" as the secret ladder.

Instead of going up in the presence of the secret ladder:
	try climbing the secret ladder;

Instead of going west in the presence of the secret ladder:
	try climbing the secret ladder;

Instead of going inside in the presence of the secret ladder:
	try climbing the secret ladder;

Instead of climbing the secret ladder:
	say "I scurry up the rungs of the ladder. A few squeak and bend but none of them break.[paragraph break]And then I'm out on a narrow ledge, high up near the Cathedral's roof! Mustn't look down!";
	move the player to Among the Gargoyles;

Instead of closing the secret ladder:
	say "I can't see any mechanism for it (the Figure must have been in quite a hurry not to do it himself. So I've scared him, then!)";

Instead of taking the secret ladder:
	say "The ladder is carved into the wall[if the caretaker's ladder is handled]. There's no wandering off with this one[end if]."

After looking in the West Clerestory when Overheard Conversation has ended:
	move the escaping Figure backdrop to all rooms that are the West Clerestory;

Instead of approaching the escaping Figure in West Clerestory:
	try climbing the secret ladder.
	
Chapter 3 - Balcony

The Clerestory-balcony is a privately-named backdrop. It is in the West Clerestory, East Clerestory and North Clerestory. The printed name of the Clerestory-balcony is "balcony". Understand "balcony", "rail", "railing" as the Clerestory-balcony. 

The description of the Clerestory-balcony is "The balcony curves right around the Clerestory."

Instead of climbing or jumping on or jumping off or jumping over or entering the Clerestory-balcony: say "No thanks. I'd rather take the stairs."

Instead of jumping when the Clerestory-balcony is visible:
	try jumping over the Clerestory-balcony.

Part 14 - North Clerestory

Chapter 1 - Description

The North Clerestory is a room, northeast of the West Clerestory, northwest of the East Clerestory, in the Cathedral Space. "[if Archbishop's Meeting has not happened]To the south the whole cathedral stretches away, all monks and pews and the three Great Seals on the floor. The balcony - which is the only thing to stop me breaking my neck - curves from southwest to southeast.[otherwise]The north end of the cathedral. There's the big stained window overhead and also the enormous statues of Babbage and Breguet. The balcony continues to the southwest.[end if]"

Instead of making to leave when in the North Clerestory: try going southwest instead.
Instead of going inside in the North Clerestory: try going southeast instead.

Section 2 - Glimpses of Great Seals

The great-seals is a glimpse backdrop in the North Clerestory. "The three seals run up the length of the Church: I can see the nearest, depicting the winding key, the others are less clear from here."

Understand "three seals", "seals", "great seals", "three great seals", "seal", "first seal", "second seal", "third seal", "first great seal", "second great seal", "third great seal" as great-seals. 

The printed name of great-seals are "three Great Seals".

Instead of approaching the great-seals:
	try going southeast; 

Chapter 2 - Scenery

Section 1 - Statues

A thing called the statues of St Breguet and St Babbage is plural-named, in the North Clerestory. 
"In one corner stand two enormous statues of St Breguet and St Babbage. They're huddled together like conspirators and Babbage's enormous head gets in the way of the beautiful stained glass behind him."

The description is "[if Archbishop's Meeting has not happened]The statues are twice life-size (probably exactly), and carved down to the tiniest detail. Breguet has fluff on his jacket and Babbage's wig seems to have a few lice. Their enormous faces are turned toward each other, and down, as though they were muttering something about me. In between their feet is a shadowy gap.[otherwise]Between the statues is a pool of deep shadow.[end if]"

The printed name is "statues of St. Breguet and St. Babbage"

Instead of taking the statues of St Breguet:
	say "[if Archbishop's Meeting has not happened]Sure. And when I've done that I'll go play football with the Moon, shall I?[otherwise]They're huge.[end if]";

Section 2 - Shadowy Gap

The shadowy gap is part of the statues of St Breguet. Understand "shadows", "shadow" as the shadowy gap. The description is "Between the toes of St Breguet and St Babbage is a patch of deep shadow, perfect for hiding in!"

Understand "fluff", "lice" as the shadowy gap.

Instead of hiding from view when in the North Clerestory:
	try hiding inside the shadowy gap instead.

Instead of entering the shadowy gap:
	try hiding inside the shadowy gap instead;

Instead of hiding inside the shadowy gap when the number of entries in the current script is not 0 and entry 1 of the current script is CHASE1:
	now Doric is fooled;
	say "I slip into the shadowy gap between the statues['] legs.";

Instead of hiding inside the shadowy gap when Doric is not in the East Clerestory: [ was current script not {} but this doesn't seem to fire. ]
	say "Doric's already passed me by. No need to waste time!";

Instead of hiding inside the shadowy gap:
	say "That'd make a great hiding place, except that nobody's following me.";
	
Instead of searching the shadowy gap:
	say "There's nothing but darkness in there."


Section 3 - Windows

The window of the steel snake is a stained glass window, scenery, in the North Clerestory. "This window depicts a gigantic coiled snake made of steel."

The printed name of the window of the steel snake is "window".

Understand "big", "beautiful", "coiled", "spring", "enormous", "gigantic", "windows" as the window of the steel snake.

Section 4 - Distant Doric

DistantDoric is a man, in the North Clerestory. "Along the balcony to the southeast I can see a guard, standing duty." The description is "A Protectorate, of the Archbishop's personal guard. He'll be tough, strong [i]and[r] stupid." The printed name is "Doric".

Instead of approaching DistantDoric when in the North Clerestory:
	try going southeast;

Understand "guard", "man", "Doric", "protectorate", "watchman", "uniform" as DistantDoric.

Instead of asking DistantDoric about something when in the North Clerestory:
	try shouting at DistantDoric instead;

Instead of shouting at DistantDoric when in the North Clerestory:
	start the chase;
	say "'Hey, Watchman!' I yell. 'How come a man as fat as you isn't on marches?'[paragraph break]'Why, you...' he growls. Quick: he's coming this way!";

Instead of throwing something at DistantDoric when in the North Clerestory:
	say "[The noun] wouldn't make a great missile. There might be something better around here somewhere - for what good making a member of the Swiss Watch angry will do."

Instead of throwing a wax lump at DistantDoric when in the North Clerestory:
	start the chase;
	move the noun to the East Clerestory;
	say "I lob [the noun] squarely at the side of the guard's helmet. He turns around, startled. And spots me.[paragraph break]'Why, you...' he growls. Quick, Wren: he's coming this way!"

Instead of attacking DistantDoric:
	say "He's all the way along the balcony - but I could probably throw something at him, if I dared..."

Before attacking DistantDoric with something:
	try throwing the second noun at DistantDoric instead.


Section 5 - Chase Event

Doric is a man. Doric can be fooled or unfooled. Doric is unfooled.

CHASE0 is a scripted event.
CHASE1 is a scripted event.
CHASE2 is a scripted event.
CHASE3 is a scripted event.
CHASE4 is a scripted event.

CHASE0 is clustered with CHASE1, CHASE2, CHASE3, and CHASE4.	

To start the chase:
	now Doric is not fooled;
	change the current script to {CHASE0, CHASE1, CHASE2, CHASE3, CHASE4};

Rule for firing CHASE1:
	if the player is not in the North Clerestory:
		say "Doric races along the balcony to the North Clerestory.";
	move Doric to the North Clerestory;

Rule for firing CHASE1 when Doric is fooled:
	now Doric is not fooled;
	remove Doric from play;
	remove CHASE2 from the current script, if present;
	say "Doric races along the balcony and straight past my hiding place, and over to the west side! Perfect!";

Rule for firing CHASE2:
	move Doric to the West Clerestory;
	if the player is not in the West Clerestory:
		say "The guard races around the balcony to the west.";

Rule for firing CHASE3:
	if the player is not in the Cathedral Choir:
		say "I can see Doric hurrying past the choir stalls and over to the east staircase. Headed back to his post - he's a smart one.";
	move Doric to the Cathedral Choir;

Rule for firing CHASE4:
	move Doric to the East Clerestory;

First after firing a scripted event that is clustered with CHASE1:
	if the player can see Doric begin;
		move Doric to the East Clerestory;
		clear the current script;
		say "Doric catches up with me, puffing and panting a little. [one of]'Why, in the name of the Lever and...' - then he stops himself short and[or]He[stopping] boxes my ears very skilfully, demanding I apologise. I apologise. [paragraph break]He grunts and returns to his door[one of], muttering, 'almost gave t'away there, Doric, almost gave t'away.'[or].[stopping]";
	end if;

Instead of going to the East Clerestory from the North Clerestory when the current script is  {CHASE1, CHASE2, CHASE3, CHASE4}:
	run straight into Doric;

Instead of going to the North Clerestory from the West Clerestory when the current script is  {CHASE2, CHASE3, CHASE4}:
	run straight into Doric;

Instead of going to the West Clerestory from the Cathedral Choir when the current script is  {CHASE3, CHASE4}:
	run straight into Doric;

Instead of going to the Cathedral Choir when the current script is {CHASE4}:
	run straight into Doric;



To run straight into Doric:
	move Doric to the East Clerestory;
	clear the current script;
	say "I run straight into Doric, who catches me and duffs me a up a little. 'In the name of Lever,' he exclaims, panting. 'You little swine.' Then he turns on a heel and marches back to his post.";

Chapter 3 - Event on Entry - Overheard Conversation

Section 1 - Beginning

Overheard Conversation is a scene. Overheard Conversation begins when the location is the North Clerestory and Archbishop's Meeting has happened. Overheard Conversation ends when SE_NC_FIGUREEVENT3 is fired.

After looking in the North Clerestory when Archbishop's Meeting has happened and SE_NC_FIGUREEVENT2 is unfired:
	change the current script to { SE_NC_FIGUREEVENT2, SE_NC_FIGUREEVENT2B , SE_NC_FIGUREEVENT3 };

Section 2 - Scripted events

SE_NC_FIGUREEVENT2 is a scripted event. The display text is "Gubbler and the Figure, in the shadows between the statues! I duck behind Babbage's coat-tails to listen.[paragraph break]'I'm not, erm, not happy, no,' Gubbler is saying. 'This isn't right.'[paragraph break]'It's vital. Give me the key,' the Figure replies. The voice is a quiet murmur, like the sound of a mead barrel rolling over flagstones. 'You've got your money.'[paragraph break]'Here.' Gubbler sounds reluctant. 'It's an exact copy of, erm, the one, in the desk. Yes. And there's a guard too, but I'll well – I'll – well. It doesn't do to say.'";

SE_NC_FIGUREEVENT2B is a scripted event. The display text is "'And the final lock?' the Figure demands.[paragraph break]'That's your problem,' Gubbler says, sounding almost like an Abbot for once. 'Nothing to do with me, no, oh no. Look: do you even know your way around this Cathedral?'[paragraph break]'Intimately,' the Figure replies smoothly. 'All six secret doors.'[paragraph break]'Six?' Gubbler demands. His voice is sweating. 'The only one I know is the one from the Choir to the Bishop's Library! Where there's a [i]drill[r] and all... Look. I'm going to, erm, go. Good luck. I hope you get caught.'[paragraph break]With that, the Abbot shuffles away southeast."

After firing SE_NC_FIGUREEVENT2:
	move the Figure in Grey to the North Clerestory;
	move the Abbot-in-meeting to the North Clerestory;

After firing SE_NC_FIGUREEVENT2B:
	remove the Abbot-in-meeting from play;
	move the glimpsed-Abbot backdrop to all rooms that are the North Clerestory;

SE_NC_FIGUREEVENT3 is a scripted event. The display text is "The Figure glides out of the shadows – right over to where I'm standing. 'I see you, little one,' he says softly. The face is nothing but darkness below his hood. His tight leather costume makes him look like a snake. 'You should stop turning up where you aren't wanted,' the Figure advises menacingly. 'You're playing with fire. You are warned.'[paragraph break]Then, in a flash of silver like a fish slipping the bait, the Figure wheels and darts away southwest."

After firing SE_NC_FIGUREEVENT3:
	remove the Figure in Grey from play;
	move the escaping Figure backdrop to all rooms that are the North Clerestory;

Instead of approaching the escaping Figure in the North Clerestory:
	try going southwest instead;

Instead of approaching the glimpsed-Abbot when in the North Clerestory:
	try going southeast instead;

Section 3 - The Figure In Grey, Again

The Figure in Grey is a man, scenery. "I take a peek, but can't make out much beyond the smooth grey cloak." The figure in grey wears a smooth grey cloak.

Instead of doing something when the Figure in Grey is physically involved during Overheard Conversation:
	do nothing;

Instead of searching or approaching or entering or examining the statues of St Breguet and St Babbage when the player can see the Figure in Grey:
	do nothing;

Instead of searching or approaching or entering or examining the shadowy gap when the player can see the Figure in Grey:
	do nothing;

Instead of approaching the Figure in Grey:
	do nothing;

Section 3b - The Abbot, in meeting

Abbot-in-meeting is a privately-named, man. Understand "abbot/abbott", "gubbler", "man" as Abbot-in-meeting. The printed name is "Abbot Gubbler". The description is "I can't see him clearly, but I know that voice anywhere. He sounds even more afraid than last time.";

[Understand "hold breath" as listening when in the presence of the Abbot-in-meeting.
Understand "hold my/your breath" as listening when in the presence of the Abbot-in-meeting.]

Instead of listening in the presence of the Abbot-in-meeting:
	say "I hold my breath tight...";

Instead of doing something when the Abbot-in-meeting is physically involved:
	do nothing;

Section 4 - Constrained Exits

Instead of going southeast from the North Clerestory when the player can see the Figure in Grey:
	say "The Figure might see me!";

Instead of going southeast from the North Clerestory when Overheard Conversation has happened:
	say "Look - no-one else is going to stop this. So I better had. I need to get after the Figure, and he went the other way!";
Instead of going down from the West Clerestory when Overheard Conversation has happened:
	say "Look - no-one else is going to stop this. So I better had. I need to get after the Figure, and he went the other way!";
Instead of going the West Stairs in the West Clerestory when Overheard Conversation has happened:
	say "Look - no-one else is going to stop this. So I better had. I need to get after the Figure, and he went the other way!";
Instead of going northwest from the West Clerestory when Overheard Conversation has happened:
	say "Look - no-one else is going to stop this. So I better had. I need to get after the Figure, and he went the other way!";

Instead of going southwest from the North Clerestory when the player can see the Figure in Grey:
	do nothing;

After going southwest from the North Clerestory when Overheard Conversation has happened:
	unless Return To The Cathedral has happened:
		say "I chase after the Figure.";
		try looking instead;
	otherwise:
		continue the action;

Part 15 - East Clerestory

Chapter 1 - Description

The East Clerestory is a room, in the Cathedral Space. "[if Doric is in North Clerestory]I'm legging it from the watchman, who's only a pace behind. I could jump the rail or take the stairs down - I know which I'd prefer![otherwise if Archbishop's Meeting has not happened]This balcony, which curves to the northwest, is built right above the choir stalls. I could probably jump down onto them if I felt really brave, but it'd be easier to take the stairs, built against the east wall, just below the enormous stained glass window.[otherwise]I'm back on the balcony on the east side of the Cathedral, underneath the gigantic window depicting a winding key. Stairs lead down and the balcony curves away to the northwest.[end if]"

Instead of making to leave when in the East Clerestory: try going down instead.
Instead of going inside in the East Clerestory: try going north instead.

Instead of facing east when in the East Clerestory:
	try examining the window of the winding-key.

Section 1 - Glimpse of Choir stalls

The glimpsed Choir is a glimpse backdrop, in the East Clerestory, in the West Clerestory, in the North Clerestory. "The choir stalls are empty." Understand "choir", "stall", "stalls" as the glimpsed Choir.

The glimpsed Choir identifies the choir stalls.

Chapter 2 - Events on Entry

Section 1 - Event on Entry - Doric

DORICEVENT1 is a trigger.

Rule for firing unfired DORICEVENT1:
	say "Excellent. I can get on and warn him about Gubbler's plan to have something stolen from the Vaults!";

After looking in the East Clerestory when DORICEVENT1 is unfired:
	fire DORICEVENT1;

Section 2 - Event on Entry - Figure

FIGUREEVENT1 is a trigger.

Rule for firing unfired FIGUREEVENT1:
	say "What's the point of adults, exactly? They sit around complaining about how rotten everything is – you've heard them – but when a real problem comes along they don't do anything. It's not good. I'll just...[paragraph break]Wait a minute. Noises, to the northwest. Whispers. A glimpse of Grey...[paragraph break]";

After looking in the East Clerestory when Archbishop's Meeting has happened and FIGUREEVENT1 is unfired:
	move the glimpse of the Figure to the East Clerestory;
	fire FIGUREEVENT1;

The glimpse of the Figure is a scenery thing. Understand "grey" as the glimpse of the Figure. "I catch just a glimpse of a Grey in the shadows between the two statues to the northwest. If I crept that way, I might be able to catch what's being said..."

Instead of approaching the glimpse of Figure:
	say "I creep closer.";
	try going northwest instead;
	
Instead of examining the glimpse of the Figure for the second time:
	try approaching the glimpse of the Figure instead.

Instead of facing northwest when the glimpse of the figure is in the location:
	try examining the glimpse of the Figure instead;

Before listening when the glimpse of the Figure is visible:
	say "I can't make it out from here, but there are murmurs... words... perhaps if I snuck up a little closer..." instead;

Chapter 3 - Doric

Section 1 - Description

Doric is a man, in the East Clerestory. "[if Doric is awake]There's another door to the north; solid oak. It may not look like much, but judging by the guard in front, that's the Archbishop's door[one of]. His name-badge declares him to be Doric of the Swiss Watch[or][stopping].[otherwise]Doric is still standing guard, but his eyes seem to be closed.[end if]"

Understand "guard", "man", "Doric", "protectorate", "uniform" as Doric.

Instead of approaching Doric:
	say "The guard isn't going anywhere. I mean, seriously. He's not going [i]anywhere[r]."

The description of Doric is "[DoricDescription]"

To say DoricDescription:
	if Doric is awake:
		say "The Guard is a member of the Protectorate, hired from the ranks of the Swiss Watch and trained specially for Church service. This one wears an elaborate uniform of straps and buckles that clink whenever he moves. More menacingly, he carries a large halberd. ";
	otherwise:
		say "For a highly-trained guard I'm not impressed. He seems to have fallen asleep on his feet. His brain must have wound down... [If CHASE0 is fired]Either that or all the running around has worn him out.[end if] ";

Doric has a truth state called the faith flag.
Doric has a truth state called the business flag.
The faith flag of Doric is false. The business flag of Doric is false.
							  
CHASE_COUNTER is a counter. 

Doric carries a halberd. The description of the halberd is "It's like an axe on a stick.". Understand "large" as the halberd.

Instead of doing something when the halberd is physically involved:
	say "I don't think he'll let me play with it.";

Section 2 - Atmospheric events

The DoricCounter is a counter. The internal value is 2. The top end is 4.

Every turn when the player can see awake Doric:
	if Doric is not the noun [to avoid when we've talked to him, hopefully]:
		increment the DoricCounter;

Rule for firing the DoricCounter when in the East Clerestory:
	say "[one of]Doric stares me down. Not fair: he's trained in this sort of thing.[or]Doric shines his halberd on his sleeve.[or]Doric resolutely does not adjust his feet.[or]Doric glares straight ahead; with a little sideways so he can see me.[at random]"

Section 2b - Interaction

Instead of showing something to Doric:
	say "Doric sniffs. 'Don't mean much to me, rat,' he remarks."

Instead of showing the knife to Doric:
	say "[one of]'What you goin' to do with that?' Doric smirks. 'Pick your nose?'[or]'Put it away, rat,' he says, and very gently taps his halberd on the stone floor.[stopping]"
	
Instead of attacking Doric:
	say "Have you not noticed his halberd?"

Instead of kissing Doric:
	say "No way!"

Instead of attacking Doric with something:
	say "Have you not noticed his halberd?"

Section 3 - Conversation

CT_DOR_FAITH is a conversation topic.
The enquiry text is "[if the faith flag of Doric is false]'I know the creed,' I tell him.[otherwise]'I knew the creed, didn't I?'[end if]".
The response text is "[if the faith flag of Doric is false]'Go on, then.' He waits for me to supply it.[otherwise]'Eventually,' he concedes. 'Like you'd not been in the church a good long while.'[end if]".

Last after firing CT_DOR_FAITH when the faith flag of Doric is false:
	now CT_DOR_FAITH is unfired; [We can ask this one multiple times]
	test the player's creed;

CT_DOR_BUSINESS is a conversation topic.
The enquiry text is "[if the business flag of Doric is false]'What kind of proof do you want?' I ask him.[otherwise]'Looks like I am here on business, doesn't it?' I say, smugly. 'Official Church business.'[end if]".
The response text is "[if the business flag of Doric is false]He shrugs. 'Look, kid. Either you're a tourist, or you're a thief, or you've got some kind of reason to see the Archbishop. If you'll be able to see him over his desk, seeing as you're not that big.'[paragraph break]'I've got a very important reason!' I protest.[paragraph break]'Then show the paper what says so,' Doric replies. 'Else you'll be out here feeling important all day.'[otherwise]'Good for you,' he says, without interest. 'You going to just stand there or are you going to go in?'[end if]".

CT_DOR_ABBEY is a conversation topic. The enquiry text is "'I've come from the Abbey,' I tell him.". The response text is "'Really.' He narrows his eyes suspiciously. 'We've been hearing quite a racket from there just now. Like a pack of wild animals hit the bell room.'[paragraph break]'Really?' I reply, innocently. 'Probably a clock – slipped.'[paragraph break]'Clocks don't slip,' he says firmly. 'And if you're [i]really[r] a good Church kid you'd know that.'".
CT_DOR_CATHEDRAL is a conversation topic. The enquiry text is "'You must get bored of standing around here,' I say.". The response text is "'No chance. No way,' he replies. 'You aren't getting me to go wandering off. No way.'".
CT_DOR_ABBOT is a conversation topic. The enquiry text is "'You don't understand,' I tell him. 'The Abbot's in league with this Figure and they're going to...'". The response text is "'Look, kid,' Doric says, not unkindly. 'Either we'll get you through this door or you can get lost. I don't mind either way. Don't appeal to my better nature because I don't have one. I've just got [i]my[r] nature, and my nature says block the door, Doric, and don't let no kid go slipping by you. Clear on that?'".
CT_DOR_ARCHBISHOP is a conversation topic. The enquiry text is "'Is the Archbishop in?' I ask, cannily.". The response text is "'Oh, he's in,' Doric says. 'If he's in for you – well. That's an open question, as you fear-logians might say.'".
CT_DOR_PEOPLE is a conversation topic. The enquiry text is "He's not likely to know them, standing round here all day.".
CT_DOR_DOOR is a conversation topic. The enquiry text is "'Can I go through your door?' I ask.". The response text is "'Why don't you try?' he sneers in reply.".
CT_DOR_SAAT is a conversation topic. The enquiry text is "'Do you know anything about Brother Sa'at?' I ask.". The response text is "'If he's not trying to come through this door then I don't know a thing,' he says. 'So don't think you can name-drop your way into my confidence.'".
CT_DOR_CLOCKWORK is a conversation topic. The enquiry text is "'Are you interested in clockwork?' I ask.". The response text is "'I'm a pious man,' he says, abruptly, affected by your question. 'Not a holy one, maybe, and not clever enough for mysteries and that. But I pay my duties once a week.'".
CT_DOR_SAINTS is a conversation topic. The enquiry text is "'Who's your favourite saint?' I ask.". The response text is "'I dunno.' He shrugs. 'Newton was a good one, wasn't it? All that slogging around being hit by apples. Good training, they say.'".
CT_DOR_BOOKS is a conversation topic. The enquiry text is "'I need to find a book,' I tell him.". The response text is "'So what y['] asking me for? Like I can read, a Protectorate like me? I ought to chuck you over t' balcony for suggestin' it. But I won't.' He tips his head at the door. 'Boss might hear it. Doesn't like violence inside.' Suddenly he stiffens. 'Less it's necessary, don't think about rushing me neither.'".

CT_DOR_SEAL is a conversation topic. The enquiry text is "'Do I need this proof of yours sealed or stamped?' I ask." The response text is "'First of all,' Doric answers patiently, 'if you was a proper Abbey type, you'd already know. Second of all, without a seal a piece of paper's just a piece of paper. Third of all, you can't get seals just anywhere so you can get your hopes down already. Got it?'"

CT_DOR_ME is a conversation topic. The enquiry text is "'Listen, I'm from the Abbey,' I begin, 'and...'". The response text is "'I don't much care if you're from the Moon,' Doric replies smartly. 'Either you're not comin' in or you're not comin' in, that's how I see it. And in the rare occasion that you [i]are[r] comin' in, you'll have something good enough to make me step aside. Won't you, rat?'"

CT_DOR_DORIC is a conversation topic. The enquiry text is "'So, do you like being a guard?' I ask."
The response text is "Doric puffs out his chest. 'Yeah. I mean, yeah. It's alright. The hours are good. Pension's okay. Good for the soul, all this standing around. Yeah.'[paragraph break]He doesn't look too convinced."

CT_DOR_HALBERD is a conversation topic. The enquiry text is "'What's that you're carrying?' I ask, nonchalantly." The response text is "'Pain in the rear-side of anyone tryin' to slip their way past,' he replies with a toothy smile. 'You get me?'"

The conversation table of Doric is the Table of Doric's Conversation.

Table of Doric's Conversation
topic						conversation
"faith" or "creed" or "creed of the church" or "creed of church"	CT_DOR_FAITH
"work order" or "business" or "proof" or "proof of business" or "paperwork" or "documentation"		CT_DOR_BUSINESS
"seal" or "stamp"				CT_DOR_SEAL
"abbey"						CT_DOR_ABBEY
"cathedral"					CT_DOR_CATHEDRAL
"[abbot]" or "[figure]"				CT_DOR_ABBOT
"archbishop"					CT_DOR_ARCHBISHOP
"[abbeyfolk]"					CT_DOR_PEOPLE
"door"						CT_DOR_DOOR
"[sa'at]"						CT_DOR_SAAT
"[clockwork]" or "time"					CT_DOR_CLOCKWORK
"saints"						CT_DOR_SAINTS
"books" or "library" or "principia" or "planetaria" or "planeteria"	CT_DOR_BOOKS
"[me]"						CT_DOR_ME
"[himself]" or "doric" or "guard/guards" or "swiss" or "watch"		CT_DOR_DORIC
"halberd" or "spear" or "weapon" or "blade"		CT_DOR_HALBERD

CT_DOR_FAITH is clustered with CT_DOR_BUSINESS, CT_DOR_ABBEY, CT_DOR_CATHEDRAL, CT_DOR_ABBOT, CT_DOR_ARCHBISHOP, CT_DOR_PEOPLE, CT_DOR_DOOR, CT_DOR_SAAT, CT_DOR_CLOCKWORK, CT_DOR_SAINTS, CT_DOR_BOOKS, CT_DOR_SEAL, CT_DOR_ME, CT_DOR_DORIC.

Rule for firing a fired conversation topic that is clustered with CT_DOR_FAITH:
	say "I've already asked about that." instead;

Section 4 - The creed of the church

Doric can be inquisitive. Doric is not inquisitive.
Doric can be door-continuing. Doric is not door-continuing.

To test the player's creed, continuing on success:
	now Doric is inquisitive;
	now Doric is not door-continuing;
	if continuing on success,
		now Doric is door-continuing;
	change the command prompt to "What is the creed? >";

[

[ Initial attempt - but the long regular expression proved too slow. ]

After reading a command when Doric is inquisitive:
	let the appraisal be 0;
	now Doric is not inquisitive;
	change the command prompt to ">";
	if the player's command matches the regular expression ".*\blever\b.*\bspring\b.*\bwinding key\b.*" begin;
		now the faith flag of Doric is true;
		say "'Close enough,' Doric agrees. 'I guess y'are an Abbey rat then, like y['] said before.'" instead;
	otherwise;
		if the player's command includes "lever",
			increase the appraisal by 1;
		if the player's command includes "spring",
			increase the appraisal by 1;
		if the player's command includes "winding key",
			increase the appraisal by 1;
		if the appraisal is at least 2 begin;
			say "'That's very close,' Doric says, clearly tempted to let the mistake pass. Then his back stiffens. 'But it's not close enough to let me say you can see the Archbishop. So you'd better rack your brains or rack off. Clear?'" instead;
		end if;
		if the player's command includes "key",
			increase the appraisal by 1;
		if the appraisal is at least 3 begin;
			say "'That's very close,' Doric says, clearly tempted to let the mistake pass. Then his back stiffens. 'But it's not close enough to let me say you can see the Archbishop. So you'd better rack your brains or rack off. Clear?'" instead;
		end if;
	end if;
	say "'Hardly. What sort of creed is that?' he smirks. 'Now, you may have forgotten it, or may you may not know. Not my place to judge. So you have a think and get back to me.' He smiles, smugly. 'I'll be waiting. Right here. In the way.'" instead;
]

After reading a command when Doric is inquisitive:
	[This is actually a third attempt; the second one was not dissimilar to this, but not very fast either. This one runs at a reasonable speed. There appears to be a built-in limit on the size of the player's command, which may cause things to silently fail - or rather, cause the player's input to be silently truncated, thereby causing failure. This can be investigated further...]
	let X be indexed text;
	let X be the player's command in lower case;
	let lever_flag be 0;
	let spring_flag be 0;
	let winding_flag be 0;
	let key_flag be 0;
	let winding_key_flag be 0;
	let perpetuum_flag be 0;
	[turn off 'inquisition mode' --]
	change the command prompt to ">";
	now Doric is not inquisitive; 
	repeat with i running from 1 to the number of words in X:
		let W be word number i in X;
		[ we look for instances of the player quoting the monks, to nudge them around ] 
		if W is "perpetuum" or W is "perpetum" or W is "tempus" or W is "fugit":
			let perpetuum_flag be 1;
		if W is "lever":
			let lever_flag be 1;
		otherwise if W is "spring" or W is "coil":
			if lever_flag is 1:
				let spring_flag be 1;
			otherwise:
				let spring_flag be -1;
		otherwise if W is "winding":
			if spring_flag is 1:
				let winding_flag be 1;
			otherwise:
				let winding_flag be -1;
		otherwise if W is "key":
			if winding_flag is 1:
				let winding_key_flag be 1;
				let winding_flag be 0;
			otherwise if winding_flag is -1:
				let winding_key_flag be -1;
				let winding_flag be 0;
			otherwise if spring_flag is 1:
				let key_flag be 1;
				let winding_flag be 0;
		otherwise if winding_flag is not 0 and winding_key_flag is 0:
			let winding_flag be 0;
	[end repeat]
	if winding_key_flag is 1:
		now the faith flag of Doric is true;
		say "'Close enough,' Doric agrees, with an anticlimactic shrug. 'I guess y'are an Abbey rat then, like y['] said before.'";
		if the business flag of Doric is false:
			say "[line break]But he still doesn't move aside. 'But that doesn't show you've got any business with the Archbishop, though, I'm thinking.'" instead;
		if Doric is door-continuing:
			try entering the Bishop's Door instead;
		stop the action;
	otherwise if lever_flag + spring_flag + winding_key_flag is -1 or key_flag is 1:
		say "'That's very close,' Doric says, clearly tempted to let the mistake pass. Then his back stiffens. 'But it's not close enough to let me say you can see the Archbishop. So you'd better rack your brains or rack off. Clear?'" instead;
	otherwise if lever_flag + spring_flag + winding_key_flag is 2 or lever_flag + spring_flag + winding_key_flag is -2:
		say "'That's very close,' Doric says, clearly tempted to let the mistake pass. Then his back stiffens. 'But it's not close enough to let me say you can see the Archbishop. So you'd better rack your brains or rack off. Clear?'" instead;
	otherwise if lever_flag is 1 AND spring_flag + winding_key_flag is not 0:
		say "'That's very close,' Doric says, clearly tempted to let the mistake pass. Then his back stiffens. 'But it's not close enough to let me say you can see the Archbishop. So you'd better rack your brains or rack off. Clear?'" instead;
	otherwise if lever_flag is 1:
		say "'You can guess words all you like,' he replies smugly, but I've clearly rattled him somehow so I must be close. 'But a creed's got more to it than one thing like that.'" instead;
	otherwise if perpetuum_flag is 1:
		say "Doric shakes his head. [one of]'Them monks might be singing, and you can listen to them all you like, but what they is singing is a ritual for that machine of theirs. That's the Perpetuum Mobile - pretty important piece of kit, they say. Worth a good ritual. But not worth a whole Creed. Your creed has got to be more basic stuff, doesn't it? You know. Levers and ...' He tails off. 'Parts like that.'[or]'You can keep earwigging on them monks all you like but it aint going to teach you the Creed of the Church. That's something you either know, or you don't know.'[stopping]" instead;
	otherwise:
		if business flag of Doric is false:
			say "'No,' he replies curtly. 'But don't matter. If you don't have the paperwork, you aren't coming through. Creed or no creed.' He smiles with satisfaction." instead;
		otherwise:
			say "[one of]'Hardly. What sort of creed is that?' he smirks. 'Now, you may have forgotten it, or may you may not know. Not my place to judge. So you have a think and get back to me.' He smiles, smugly. 'I'll be waiting. Right here. In the way.'[or]'Look, kid,' he grins. 'A Church Creed is a special kind of thing like... like a well-oiled sword, only words, right? And either you got it or you don't. And if you don't...' He shrugs. 'I'll stay right here.'[or]'No,' he replies, shaking his head. 'Not even close.'[stopping]" instead;

	
Section 5 - Proof of business

Instead of showing the work order to awake Doric:
	try giving the work order to Doric;

Instead of giving the work order to awake Doric when the letter state of Brother Sa'at is not 4:
	say "[one of]'Cheeky bugger!' Doric remarks, whistling to himself. He's only taken one glance at this work order of Sa'at's. 'Where d'you go half-inch this from?' he demands. 'Some monk's drawers?'[paragraph break]'Is something wrong?' I ask, innocently.[paragraph break]'I may not read, kid, none of that reading, but even a dumb illiterate can see it doesn't have a seal and a stamp. There's nothing official about an order without a seal and a stamp. So I suggest you just go slip that back wherever it was you taken it from.'[or]'Don't take the mickey, kid,' Doric sighs.[stopping]";

Instead of giving the work order to awake Doric:
	change the business flag of Doric to true;
	say "'Well.' He skims over the work order. 'Looks all in good order to me. I suppose you have business with the Archbishop after all";
	if the faith flag of Doric is true:
		say ".' He nods, and tips his cap. 'Just can't be too careful, you understand.'";
	else:
		say ". But, of course, if you do have business with him you must be a Church bod. And then you'd know the creed.' He shrugs. 'So you see my predicament, of course. I can't let you in unless you let me let you in.' Which means - he's still blocking the doorway!";

Section 6 - Other interaction

Instead of throwing a wax lump at awake Doric:
	say "No way. Doric would beat me to a pulp. I ought to give myself a head-start, at least.";

Instead of throwing something at awake Doric:
	say "[The noun] wouldn't make much of a missile. And he'd have my head beaten in a moment, anyway.";

Instead of waking asleep Doric:
	say "Let him sleep. He won't be any use to me awake, will he? And I'd probably need some order stamped in gold-and-turquoise to get him to open his eyes anyway."

Instead of throwing something at asleep Doric:
	try waking Doric instead;

Rule for speaking with asleep Doric:
	try waking Doric instead;

Chapter 3 - Scenery

Section 1 - Windows

The window of the winding-key is a stained glass window, scenery, in the East Clerestory. "The gigantic window depicts an enormous iron winding key being lowered from the sky by cherubs. Lots of them. (Got to be [i]physical[r], after all, like all good Art. The monks have no doubt computed the correct and proper weight for a cherub's wings to carry)." Understand "windows" as the window of the winding-key.

The printed name is "window".

Understand "big", "beautiful", "key", "winding key", "iron", "cherub", "cherubs", "cherubim", "wings", "window", "windows", "enormous", "gigantic" as the window of the winding-key.

Section 2 - Door

The Bishop's Door is a door, open, not openable, lockable, locked, scenery, north of the East Clerestory, south of the Bishop's Library. The description is "[if Archbishop's Meeting has happened and the location is East Clerestory]The Archbishop's door. It's closed, again.[otherwise]The door is solid oak, and properly double-layered to keep out the sound of choir practice. It's definitely the Archbishop's Door.[end if]"

Understand "archbishop's", "solid", "oak", "door" as the bishop's door when the location is East Clerestory.

Instead of opening or knocking on the Bishop's Door:
	try entering the Bishop's Door;

First instead of going through the Bishop's Door in the presence of awake Doric when BISH_DOOR_EVENT1 is unfired:
	fire BISH_DOOR_EVENT1;

Rule for speaking with awake Doric when BISH_DOOR_EVENT1 is unfired:
	fire BISH_DOOR_EVENT1 instead;

Instead of giving something to awake Doric when BISH_DOOR_EVENT1 is unfired:
	fire BISH_DOOR_EVENT1 instead;

BISH_DOOR_EVENT1 is a trigger.

Rule for firing unfired BISH_DOOR_EVENT1:
	say "I approach the guard, wearing my best Abbey-servant voice. 'Excuse me,' I begin. 'I'm here to see the Archbishop.'[paragraph break]'Are you, Squirt?' the guard replies easily. Ah. Not such a pushover, then. 'Got an appointment, do you? I suppose you must, [']cos you know what a waste of time it'd be to turn up wanting to see a man like the Archbishop with no appointment. Like a bald man at a barbers. Waste of time. So you've an appointment, don't you?'[paragraph break]'I'm on Abbey business,' I say.[paragraph break]'If you were on Abbey business,' the guard replies with a smile, 'and I'm not saying you're not, I aint calling you a liar. But if you were, you'd be carrying one of them documents they give to people to prove they're on Abbey business. Church Accreditation, I believe it's called. And it you [i]were[r] on business and not, say,' – he pauses for effect – 'some scruff of a street-rat fallen in here from the street...'[paragraph break]I start to protest but he cuts me off with a poke of his halberd.[paragraph break]'Then sure as my name's Doric – which it is – sure as that you'd be able to quote me a bit of the creed. Wouldn't you, now? That's how it'd be, I fathom, if you were here on business. Real Church business.' He looks at you firmly. 'So are you going to tell me the creed, then? Go right ahead.' He starts waiting. He's good at that, clearly.";

Instead of going through the Bishop's Door when the player can not see Doric:
	say "The door's unguarded. Excellent! I put my hand on the handle and... it's locked! Not fair!";

Instead of going through the Bishop's Door in the presence of asleep Doric:
	say "What's the use? He wouldn't believe the Vaults were being looted if I walked into his room holding a bunch of the relics myself.";

Instead of going through the Bishop's Door in the presence of awake Doric when the faith flag of Doric is false and the business flag of Doric is false:
	say "[one of]Doric the guard stops me in my tracks. 'You ain't going to just slip by,' he advises me. 'You're little but you're not so little. I want to see proof of your business and if you can't give me that Church creed then I'm going to think you're a street-thief who palmed some documentation from some haphazard monastic type. You understand? And don't you go waiting for me to slope off the toilet or anything. We in the Swiss Watch are trained against that sort of thing. We never leak time.'[or]'Proof of business and creed of the Church,' Doric says flatly, barring the door.[stopping]"

Instead of going through the Bishop's Door in the presence of awake Doric when the faith flag of Doric is true and the business flag of Doric is false:
	say "'You may be an Abbey rat,' Doric says with a smile, 'rather than a street-rat, but if you ain't got business then you ain't got business. Like an umbrella shop in a drought. [']Cept for use as parasols, mind, or sails and that. What I'm saying is, if you don't got, then you're not coming in.'"

Instead of going through the Bishop's Door in the presence of awake Doric when the faith flag of Doric is false and the business flag of Doric is true:
	say "'So you're a church kid, are you?' Doric says conversationally, just happening to block my way into the room with his halberd. 'Prove it, then. Tell me the creed and I'll let you through.'";
	test the player's creed, continuing on success;

After going through the Bishop's Door from the East Clerestory when awake Doric is in the East Clerestory:
	say "'In you go,' Doric says, tipping his head. 'But don't you go tellin['] him how I'm doing anything other than my job, mind. I've got to be careful. These are restless times. The Calendar says so. Always check the Calendar.'[paragraph break]The Bishop's Door – I made it!";
	end the chapter;
	continue the action;

Section 3 - Post Doric Hints

BISH_DOOR_AFTEREVENT1 is a trigger.

Every turn when BISH_DOOR_EVENT1 is fired and BISH_DOOR_AFTEREVENT1 is unfired and the location is not the East Clerestory and the location was not the East Clerestory:
	fire BISH_DOOR_AFTEREVENT1;

Rule for firing unfired BISH_DOOR_AFTEREVENT1:
	if business flag of Doric is false and faith flag of Doric is false:
		say "Out of sight of the guard - I give a shout of frustration. What am I meant to do now? Second Assistant Clock Polishers don't know any creeds. And paperwork? How can I get paperwork around here?[paragraph break]Then, like a slipping escapement, a gentle tick-tock in my mind: ";
		if the Orrey Hall is visited: 
			say "Brother Sa'at. Maybe Brother Sa'at can help.";
		otherwise:
			say "look around, Wren. Look around.";

Part 16 - Locative Glimpse Backdrops to Navigate by

The CSHRINE_glimpse is a locative glimpse backdrop in the Cathedral Entrance, in the Lower Nave, in the Upper Nave, in the Cathedral Altar, in the Cathedral Choir, in the East Apse, in the West Apse, localising the Calendar Shrine.

The SSHRINE_glimpse is a locative glimpse backdrop in the Cathedral Entrance, in the Lower Nave, in the Upper Nave, in the Cathedral Altar, in the Cathedral Choir, in the East Apse, in the West Apse, localising the Shrine of the Saints.

The BLIBRARY_glimpse is a locative glimpse backdrop in the Cathedral Entrance, in the Lower Nave, in the Upper Nave, in the Cathedral Altar, in the Cathedral Choir, in the East Apse, in the West Apse, in the East Clerestory, in the West Clerestory, in the North Clerestory, localising the Bishop's Library.



Book 4 - The Cathedral Of Time (Continued)

Part 1 - Bishop's Library

Chapter 1 - Description

The Bishop's Library is a room. "[one of]I'd been expecting something grander than this! Maybe a long sofa, a little more light, perhaps even his own Tea Maker. But instead there's[or]There's[stopping] nothing but a single desk, some books, and a lot of wrought iron decoration – hooks, candle-brackets, ink-wells – all made from a single sweeping line of iron that curls around the floor and walls like a wandering pen-stroke."


Before making to leave when in the Bishop's Library: try going south instead.


Section 1 - The Archbishop

The Archbishop is a man, in the Bishop's Library. "The Archbishop himself sits behind the desk, his face barely visible in the light through the narrow windows."

The description is "He's a nice old man and looks quite fine dressed in his full ceremonial robes. Around his neck he wears a Symbolic Key on a chain – a bit like mine, I suppose. His hands are quietly folded and he's listening – but I don't think he's taking me very seriously."

Understand "bishop", "arch-bishop", "arch bishop", "steelspring" as the Archbishop.

Rule for clarifying the parser's choice of the Archbishop:
	do nothing;

Instead of going through the Bishop's Door from the Bishop's Library:
	say "But I have to convince him! I can't just give up now!";	

The Symbolic Key is carried by the Archbishop. It has description "The Key is long, thin, and set with twelve teeth around its circumference. What it's a key to I don't know. Office, maybe. Anyway, it's more important than the clock key round [i]my[r] neck."


Chapter 2 - Scenery

The Archbishop's desk is a supporter, scenery, in the Bishop's library. The description is "The Archbishop's desk has a single drawer. No doubt what's in that is highly important."
The printed name is "desk".

The single drawer is a container, closed, locked, part of the Archbishop's Desk. The old iron crypt key is in the single drawer.

Instead of doing something when the single drawer is involved and Return To The Cathedral has not happened:
	redirect the action from the single drawer to the Archbishop's Desk;
	try the current action instead;

Some Archbishop's bookshelves are scenery, in the Bishop's library. The description is "Well, of course he has books. But I didn't come here to read or to rummage around."
The printed name is "books".

Understand "book", "books", "shelf", "shelves", "bookshelf" as the Archbishop's bookshelves.

Instead of doing something when the Archbishop's bookshelves are physically involved:
	say "That won't make him listen to me, will it?";

Some narrow windows are glass windows, scenery, in the Bishop's library. The description is "Three narrow windows drop three strips of light across the room. Of course, the Archbishop has more than enough candles not to need sunlight.". The printed name is "windows".

Chapter 3 - Event on Entry

BISHEVENT1 is a trigger.

Rule for firing unfired BISHEVENT1:
	say "'Well, well!' he remarks, with an unhurried smile. 'I don't remember your name, young one, but I remember your face. Why did they send you? You've not broken something again, I trust?'[paragraph break]For a moment I'm too tongue-tied to speak. It's the Archbishop himself!";

After looking in the Bishop's Library when BISHEVENT1 is unfired:
	fire BISHEVENT1;
	change the current script to {SE_BISHOP_1, SE_BISHOP_2, SE_BISHOP_3 };

Understand "abbot", "figure", "figure in grey/gray", "grey/gray figure" as "[abbotorfigure]".

Rule for speaking with the Archbishop:
	if the topic understood includes "[calvinanddrake]" begin;
		say "I didn't come all this way – and do all that – just to complain!" instead;
	end if;
	do nothing instead;

[A somewhat vestigial non-scene just so that we can make use of scene-specific conditions such as "if Archbishop's Meeting has happened...". The actual scene logic is handled by scripted events, of course. We could use other, equivalent conditions, perhaps defined as a definition, but this way is at least built into the I7 syntax.]

Archbishop's Meeting is a scene. Archbishop's Meeting begins when the location is the Bishop's Library. Archbishop's Meeting ends when BISHEVENT1 is fired.

When Archbishop's Meeting begins:
	now the statues of St Breguet are scenery;
	now the window of the snake is scenery;
	[because they get mentioned in the replacement room description.]
	remove DistantDoric from play; [not needed - he's asleep now anyway!]
	move the secret ladder to the West Clerestory;

Rule for printing the description of a stained glass window when Archbishop's Meeting has happened:
	say "Perhaps I should tear it down and replace it with a picture of a Figure in Grey handing the Abbot a bag stuffed with a few hours['] worth of gold minutes.";

Chapter 4 - Scripted Events

SE_BISHOP_1 is a scripted event. The display text is "'I've got to tell you something important,' I blurt, thinking: I'd better tell this carefully, or he'll dismiss me out of hand. 'The Abbot doesn't know I'm here, he didn't send me. That's the thing, I need to tell you about the Abbot...'[paragraph break]'Is he ill?' the Archbishop asks.[paragraph break]'No. I...' And then it all falls out. Everything I overheard. The Vaults. Money. A theft...[paragraph break]The Archbishop listens patiently. For a moment I think he's going to help me, and then my heart drops. 'You didn't [i]really[r] hear any of this, not clearly,' he says, quite pleasantly. 'Did you?'"

Instead of saying yes or saying no when SE_BISHOP_1 is unfired and the Bishop's Library is visited:
	do nothing; [continuing without comment to the next event]

Instead of saying yes or saying no when SE_BISHOP_1 is fired and SE_BISHOP_2 is not fired:
	do nothing; [continuing without comment to the next event]

Instead of saying yes or saying no when SE_BISHOP_2 is fired and SE_BISHOP_3 is not fired:
	do nothing; [continuing without comment to the next event]

Rule for speaking with the Archbishop when SE_BISHOP_1 is fired and SE_BISHOP_2 is unfired:
	if the topic understood includes "[abbotorfigure]" begin;
		do nothing instead;
	end if;

SE_BISHOP_2 is a scripted event. The display text is "'I'm serious!' I insist.[paragraph break]'You seem a very serious young thing, certainly,' he says. 'And that's an excellent quality that will take you far in the Church; you only need look at Brother Reloh for that. As far as the Vaults are concerned, there's no reason to worry. They're firmly locked and the only key,' – he pauses, to pat the drawer of his desk – 'Is quite safe. Where only I have it.'[paragraph break]'But...'[paragraph break]'And even if your thief could turn himself into a lizard and slip through the gate,' he continues, 'there's a last lock that only I can pass. And that's without question.' He smiles. 'Well, it's [i]with[r] question, in fact. But never mind that.'"

SE_BISHOP_3 is a scripted event. The display text is "I try once more, but the Archbishop has heard enough. 'I admire your devotion. Especially from such a rough young child. But really, I'm a busy man.' With that he eases me towards the door.[paragraph break]'But...'[paragraph break]'No buts. In all things.' He raises a stern finger. 'Patience is the key.' He giggles. 'It really is, in fact. But remember that. Patience, that's the key. Now off you go.'[paragraph break]And with that, I'm ushered out. This is a disaster!"

After firing SE_BISHOP_3:
	now Doric is asleep;
	move the player to the East Clerestory;

Part 2 - East Clerestory B

Part 3 - North Clerestory B

Part 4 - West Clerestory B

[For the above, see Book 3, Parts 13, 14 and 15. ]


Part 4b - The Escaping Figure

[ TO DO: follow, appearing and disappearing as appropriate. need in c5 too? ]

The escaping Figure is an animate glimpse backdrop. Understand "[figure]", "man", "escaping" as the escaping Figure. "The Figure is a good way ahead of me, but if I keep moving, I'm [i]sure[r] I can catch up!"

Rule for writing a paragraph about the escaping Figure:
	now the escaping Figure is mentioned;

Before answering the escaping Figure that:
	try shouting at the escaping Figure instead.

Before of asking the escaping Figure about:
	say "The Figure isn't waiting around to talk to me. The Figure is getting away!" instead;

Before shouting at the escaping Figure:
	say "'[one of]Hey!' I holler. 'Stop where you are!'[or]'I won't let you get away with this!' I bellow.[or]'Come back here!' I shout.[cycling][line break]Nothing." instead;

Instead of doing something when the escaping Figure is physically involved:
	say "I'd have to catch him first!"

Instead of showing the knife to escaping Figure:
	say "If he'd just stand still long enough for me to threaten him, I would!"

Instead of throwing something at the escaping Figure:
	say "That won't stop him."

section 2 - the Upper reaches region

The Upper Reaches of the Cathedral are a region. Among the Gargoyles, Lower Gears, Upper Gears, Rafters, Behind the Clock Face are in the Upper Reaches of the Cathedral.

Part 5 - Among the Gargoyles


Among the Gargoyles is a room. "Looking down – oh, no... - there's the floor of the choir, far below. I'm really, really high up – higher than my little bedroom – and this ledge is a lot narrower than my bed... And there's nothing to hold onto - nothing out there but space, and the gigantic workings of the Cathedral clock, like a hornet's nest suspended from the centre of the dome."

Instead of going down in Among the Gargoyles:
	say "I've got to follow him... somehow...[paragraph break]";

Instead of going a direction in Among the Gargoyles:
	say "There's no way off this ledge at all!";

Instead of facing down when in Among the Gargoyles or in Lower Gears:
	say "A million metres below me are monks as small as black ants crawling round the altar below the clock. They'll get the shock of their lives when I fall on them..."

Instead of approaching the escaping Figure in Among the Gargoyles:
	say "He's climbing the clock: how I'm supposed to get over [i]there[r]?"


Chapter 2 - Scripted Events

After looking in Among the Gargoyles when SE_GARGOYLES1 is unfired:
	change the current script to { SE_GARGOYLES1, SE_GARGOYLES2 };
	move the escaping Figure to the Upper Reaches of the Cathedral;
	update backdrop positions;

SE_GARGOYLES1 is a scripted event. The display text is "Steady, Wren. You're good with heights, aren't you? But maybe not with pendulums! I duck to avoid the massive penduluum of the clock as it almost knocks me clear of the ledge! I cling onto a gargoyle and I don't... look... down...".

SE_GARGOYLES2 is a scripted event. The display text is "I spot the Figure, clinging to the clock's gears like a spider. The hood is turned to look back at me. For a moment he's still – then an escapement above him turns and he's scuttles upwards, deep into the turning wheels.".

Instead of doing something with the escaping Figure when SE_GARGOYLES2 is not fired and SE_GARGOYLES1 is fired:
	[ we're in Amongst the Gargoyles and we've not yet seen him. But we're about to! ]
	do nothing;



Chapter 3 - Pendulum

The cathedral clock penduluum is scenery, in Among the Gargoyles. "The penduluum weight is the size of a Grandfather clock and the rod on which it swings is the size of a tree. If that thing hits me it'd be like Drake stepping on a beetle."

The printed name is "penduluum". Understand "pendulum" as the cathedral clock penduluum.

The PenduluumCounter is a Busy Counter. The top end is 4. The internal value is 4.

Every turn when in Among the Gargoyles and SE_GARGOYLES2 is fired:
	increment the PenduluumCounter;

Rule for firing the PenduluumCounter when the internal value of the PenduluumCounter is 1:
	say "[one of]The penduluum hangs still in space for a full second at the far point of its swing.[or]The penduluum coasts to a stop inside the clock.[or]The penduluum is dead still, at the far point of its swing.[or]The penduluum is far off inside the clock.[stopping]";

Rule for firing the PenduluumCounter when the internal value of the PenduluumCounter is 2:
	say "[one of]The penduluum careers towards me, coming closer every second![or]The penduluum is picking up speed, heading right for me![or]The penduluum charges towards me![stopping]";

Rule for firing the PenduluumCounter when the internal value of the PenduluumCounter is 3:
	say "[one of]The penduluum swings up to ledge, almost knocking me down.[or]The penduluum slows to the edge of the ledge and waits for a moment, before starting to swing away.[or]For a moment the penduluum is still beside me, then it seems to float backwards off the ledge.[or]The penduluum almost hits me as it turns.[stopping]";

Rule for firing the PenduluumCounter when the internal value of the PenduluumCounter is 4:
	say "[one of]The penduluum sails away in slow-motion through the machinery of the great Clock.[or]The penduluum soars back into the depths of the clock's workings.[or]The penduluum swings away.[stopping]";

Instead of jumping in Among the Gargoyles:
	try taking the cathedral clock penduluum instead;

Instead of climbing or climbing up or jumping on the Cathedral Clock penduluum:
	try taking the cathedral clock penduluum instead;

Before taking the Cathedral Clock penduluum when the internal value of the PenduluumCounter is 1 or the internal value of the PenduluumCounter is 2:  [ that is, "sailed away" or "far point of swing" ] 
	say "The penduluum's at the far end of its swing. [i]You can't fly, young Wren[r]." instead;

Instead of entering or approaching or taking the Cathedral Clock penduluum: 
	if the internal value of the PenduluumCounter is 3: [ this is, "approaching fast" ]
		say "Until the last moment I don't know whether I can do it... and as the penduluum slows to a halt, I wrap my arms around it. A moment later my feet are in mid-air and";
	else:  [ this is, "up to the ledge" ]  
		say "Every wire in my body is telling me it's too late, and that makes it even later. At the last possible moment I jump into space... I'm over the vast hall of the Cathedral... and then with an awkward crash I hit the penduluum and wrap my arms around it![paragraph break]The whole clock above seems to shiver from the extra weight and then";
	say " I'm away, floating over space, faster and faster...[paragraph break]At the lowest point when I'm whipping through the air, I let go and drop onto a platform, surrounded by gears and windings. The penduluum is gone in a moment.";
	move the player to Lower Gears;


Chapter 4 - Scenery

Section 1 - Gargoyles

Some gargoyles of vice are a backdrop, in Among the Gargoyles and Parapet. "The ledge is fitted with gargoyles showing the Vices of Laxity. Everything's here, from sleeping on the job (poor Doric!) through to eating with your mouth open." Understand "gargoyle" as the gargoyles of vice.

The printed name of the gargoyles of vice is "gargoyles".

Instead of climbing the gargoyles of vice:
	say "I'm not going to let go of them, am I? I don't fancy keeping my balance up here.";

Section 2 - Choir Floor

The choir floor is a backdrop, in Among the Gargoyles, Lower Gears and Upper Gears. "[if the location is not Upper Gears]The floor looks hard and very far away. Great.[otherwise]I can't see the floor any more from this height.[end if]"

Instead of doing something when the Choir Floor is physically involved:
	say "[if the location is not Upper Gears]No thanks.[otherwise]I can't see the floor any more from this height.[end if]";

Section 2b - Singing Monks

Some singing monks is a backdrop, in Among the Gargoyles, Lower Gears and Upper Gears. "[if location is not Upper Gears]The shining spots far below are the bald heads of the monks around the altar. The machine on the altar itself is a single gleaming gold dot.[else]I can't see the monks any more, only hear the whisper of their song.[end if]". Understand "altar", "gold", "dot", "gleam", "bald", "head", "heads", "chant", "chanting", "song" as the singing monks.

Include (- has animate, -) when defining the singing monks.

Before asking the singing monks about:
	say "If I cried for help now they'd probably think it was a miracle: the Clock talking back to them." instead;

Before shouting at the singing monks:
	say "If I cried for help now they'd probably think it was a miracle: the Clock talking back to them." instead;

Instead of listening when the singing monks are visible:
	say "The song is soft and rhythmic and very, very far away."

Instead of doing something when the singing monks are physically involved:
	say "[if the location is not Upper Gears]No thanks.[otherwise]I can't see the monks any more from this height.[end if]";

Every turn when the singing monks are visible and a random chance of 1 in 3 succeeds and SE_GARGOYLES2 is fired:
	if the location is the Upper Gears:
		say "[one of]The chanting is barely audible now.[or]The monk's song is lost in the tick-tock of the clock.[cycling]";
	else:
		say "[one of]Thin singing drifts up from the floor far below.[or]The stone walls echo with soft chanting, regular and low, like the murmur of a shifting counterweight.[or]The monks below are just bright spots in black circles on the distant Cathedral floor.[cycling]"; 
	
Section 3 - Gears

Some gearwheels are a backdrop, in Among the Gargoyles, Lower Gears, Upper Gears, and the Rafters. "[if the location is Among The Gargoyles]The workings of the clock are a shipwreck of cogs, wheels and traces, their teeth and struts and scaffolds moving with the same slow purpose as Sa'at's Great Orrey. Up above them I can just see the enormous face of the rose window clock face.[otherwise if the location is Lower Gears]It's a maze of gears, chains and pinions, all in constant movement. A few have rungs and ladder-holds beside them, others have struts across their diameters.[otherwise if the location is Upper Gears]There are pulleys and chains everywhere, all turning the massive shaft of the clock overhead.[otherwise if the location is Rafters]The gears are across the room from where I am. The clock-face itself is nothing but a glass wall and the gigantic hands whose shadows I can just see.[end if]"

The printed name of the gearwheels is "gears".

Understand "gear", "gear-teeth", "gear-tooth", "teeth", "gears", "working", "workings", "[clockwork]", "cog", "cogs", "wheel", "wheels", "trace", "traces", "teeth", "strut", "struts", "pinion", "pinions", "scaffold", "scaffolds", "mechanism" as the gearwheels.

Understand "clock", "cathedral clock" as the gearwheels when in Lower Gears or in Upper Gears or in Rafters.

Instead of climbing the gearwheels when in Among the Gargoyles:
	say "They're a jump of twenty feet away or more, suspended over thin air and the choir below!";

Instead of doing something when in the Rafters and the gearwheels are physically involved:
	say "They're back across the space from me.";


Part 6 - Lower Gears

Lower Gears is a room. "I'm sandwiched between [the (remainder after dividing the times-moved of the Lower Gears by 4) + 2 in words] gears of the Cathedral clock, on a [by times-moved]narrow[or by]rickety[or by]unsteady[or by]worm-ridden[end] wooden [by times-moved]platform[or by]ledge[or by]plank[end] that [by times-moved]winds in and out between[or by]runs to the left of[or by]passes to the right of[or by]runs underneath[or by]bridges a gap between[end] the workings. [one of]This noise is louder than Reloh's duplicator – like an army of cooks all banging saucepans. I can barely keep straight which way is up and which way is down.[paragraph break][or][stopping]Platforms lead away to the [available-platforms][if times-moved of the Lower Gears is greater than 6], and a line of rungs disappears up[end if]."

The Lower Gears have a number called the times-moved. The times-moved of the Lower Gears is one.

Index map with Lower Gears mapped north of Among the Gargoyles.

Before going a planar direction in Lower Gears:
	if the noun is listed in the available-platforms begin;
		change the available-platforms to {north, northeast, east, southeast, south, southwest, west, northwest};
		sort the available-platforms in random order;
		truncate the available-platforms to 3 entries;
		say "I worm my way between the gears.";
		increase the times-moved of the Lower Gears by a random number between one and three;
		move the player to Lower Gears instead; [illusion of true movement.]
	end if;
	say "There's no way to go that way, except into the grinder of gear-teeth themselves." instead;

After going up from Lower Gears:
	say "The Figure went up so I will too. And never mind if the Cathedral clock loses a few seconds from me moving the gears as I climb. If the Cathedral loses its relics that'd be worse!";
	continue the action;

Understand "chain", "chains", "rung", "rungs", "ladder", "ladders", "hold", "holds", "ladderhold", "ladderholds", "ladder-hold", "ladder-holds", "line of" as the gearwheels when the location is Lower Gears.

Instead of climbing the gearwheels when in Lower Gears:
	try going up;

Instead of approaching the Escaping figure when in the Lower Gears:
	try going up.

Instead of going down when in Lower Gears:
	try jumping instead.

Instead of jumping when in Lower Gears:
	say "There's nothing but mashing gear-teeth beneath me.";

Section 1 - Platforms underfoot

Some Clock platforms are scenery in Lower Gears. "The platforms are held together by old iron nails." Understand "platform", "ledge", "ledges", "walkway", "walkways", "rafters" as the Clock platforms.

Instead of approaching or entering the Clock platforms:
	say "Which way? Platforms lead away to the [available-platforms].";

Instead of getting off the Clock platforms:
	try going down.

Instead of climbing the Clock platforms:
	try going up.

Instead of taking the Clock platforms:
	say "I could cling on for dear life, but it wouldn't help me catch the Figure!"

Instead of looking under the clock platforms: 
	try facing down.

Instead of facing down when in the Lower Gears:
	say "There's a long drop that way..."



Part 7 - Upper Gears

Upper Gears is a room, up from Lower Gears. "[one of]Further up now, and hanging onto a scaffold beam for dear life. Below – quite a lot of space, and the rest of the mechanism. Around, cogs grinding the rust off other cogs. And in front: a void of empty space. A gap – and then the beautiful crystal light of the rose window: the clock face itself, filling my eyes with light.[paragraph break]Way overhead, higher even still, is the shaft that turns the clock hands, reaching out from the gigantic mechanism and through the window. There's no way I can climb there. The gears here are smaller and moving too fast.[or]I'm on a beam bathed in the light of the rose window. High overhead is the thick metal beam that turns the clockhands, reaching through the window, but there's no way I can climb there.[stopping]"


Instead of approaching the escaping Figure in Upper Gears:
	say "The Figure must have climbed the gear-teeth: I can't do that! I'm just a child!"

Chapter 2 - Event on entry

UG_FIGURE1 is a trigger.

After looking in Upper Gears when UG_FIGURE1 is unfired:
	fire UG_FIGURE1;

Rule for firing UG_FIGURE1:
	say "Clinging to the shaft overhead is the Figure. He must have climbed the gear-teeth themselves.[paragraph break]'Why do you follow me, child?' the Figure demands, his hooded face turning towards me. 'You can't stop me from stealing the Perpetuum. There are greater wheels turning here that you don't understand!'[paragraph break]Then swiftly and smoothly, like a cat, he grabs onto a passing length of chain and soaring up into space. But I'm thinking one thing: he's planning to steal the [i]Perpetuum![r] [paragraph break]";

Chapter 3 - Objects

Section 1 - Barrel

A barrel is fixed in place, in the Upper Gears. "[if thick chain is gripped]The chain I'm holding onto runs out of the barrel beside me[else]Right beside me is a barrel with a crank, from which a thick iron chain runs up to a pulley near the top of the window[end if]. [if iron weight is low]The counterweight has fallen and the barrel must be empty of chain[else]A enormous counterweight hangs up there.[end if]."

The description of the barrel is "The barrel feeds out a long iron chain to a pulley above the rose window. The barrel has a crank on front and also a release lever. [if iron weight is low]The barrel is almost empty: the counterweight has spooled out plenty of chain.[else]The chain is stiff and taut thanks to the counterweight, high up by the beams.[end if]"

Section 2 - Crank

The crank handle is part of the barrel. The printed name is "crank". The description is "The crank handle on the barrel probably winds the chain."

Instead of turning the crank handle when the iron weight is high:
	say "The chain is as taut as it'll go, since the weight is hoisted right to the top.";

Instead of turning the crank handle when the iron weight is low:
	now the iron weight is high;
	if the thick chain is gripped:
		say "I let go of the chain first. ";
		now the thick chain is not gripped;
	say "The crank turns easily, and very slowly the weight rises up towards the pulley. Who's meant to use this machine I don't know: maybe it's left over from construction.[paragraph break]After several minutes of work, the weight is as high as it'll go. The release lever clicks closed.";

Section 3 - Lever

The release lever is part of the barrel. The printed name is "lever". The description is "The release lever on the barrel is currently [if the iron weight is low]open[else]closed[end if]."

Instead of pulling or opening or attacking the release lever when the iron weight is low:
	say "The lever's already open, so nothing happens.";

Instead of pulling or opening or attacking the release lever when the thick chain is not gripped and the iron weight is high:
	now the iron weight is low;
	say "The lever unlocks and the chain begins to spool away instantly, as the weight over the pulley plummets downwards. The links beside me wind away towards the window.";

Instead of pulling or opening or attacking the release lever:
	say "Clinging on tight – I must have gone crazy – I kick the release with my shoe. There's a sudden jerk and then I'm shot up and across. Stomach in throat, air beneath my feet, arms screaming for a clear explanation of exactly what do I think I'm doing? Hurtling towards the pulley. How much chain is there in this thing? I've no idea. What if I hit? I'm frozen as the pulley comes up fast – I'm going to be knocked down – [paragraph break]- and I've no choice but to let go and I [i]fall[r] – [paragraph break]- onto a rafter below. Sweet Grease! I can barely move I'm so busy shaking!";
	move player to Rafters;

Instead of pushing or knocking on the release lever:
	try pulling the release lever;

Instead of closing the release lever when the iron weight is high:
	say "The lever is closed. I could pull it open."

Instead of closing the release lever:
	say "The lever won't close, presumably because the counterweight is now so low."

Chapter 4 - Scenery

Section 1 - Gearwheels

Instead of climbing or jumping on the gearwheels when in Upper Gears:
	say "It's all vertical now, and the bars of the scaffold and struts of the cogs are more spaced out than the rungs of my ladder. I can't get higher.";

Understand "shaft", "hands", "beam", "metal beam" as the gearwheels when the location is Upper Gears.

Understand "rung", "rungs", "ladder", "ladders", "hold", "holds", "ladderhold", "ladderholds", "ladder-hold", "ladder-holds", "vertical", "pulley", "pulleys" as the gearwheels when the location is Upper Gears.

Section 2 - Rose Window

A rose window is a backdrop, in the Upper Gears, Rafters, Behind the Clock Face, Minute Hand, and Parapet.

Rule for printing the description of the rose window when in Upper Gears:
	say "The window is above and beyond. Its stained glass covers the clock's workings in fractured colours. It's beautiful here. Light and clockwork in perfect harmony.[paragraph break]A pulley hangs at its top, attached to the long chain that feeds into the barrel by my feet.";

Understand "clock", "face", "clockface", "clock-face", "crystal", "light", "stained", "glass" as the rose window.

Before doing something when the rose window is physically involved:
	if the location is Upper Gears or the location is Rafters:
		say "I can't reach the window from here." instead;
	continue the action.

Instead of attacking the rose window:
	say "It's enormous. Even if I could push a fingerhole through, no-one would ever even see. And it wouldn't help me keep up with the Figure."

Instead of touching the rose window:
	say "The glass is cold and warped; roughly made."

Instead of searching or looking through the rose window:
	say "Nothing is visible through the thick syrup colours of the glass."

Section 2b - Twelve

The XII is part of the rose window. Understand "numeral", "numerals", "number" as the XII.

Rule for printing the name of XII when in Behind the Clock Face:
	say "IV".

Understand "xii", "twelve" as the XII when in the Rafters.
Understand "iv", "four" as the XII when in Behind the Clock Face.

Instead of doing something when the XII is physically involved:
	if the location is the Rafters:
		say "Almost. Not quite.";
	else:
		say "I can't reach the window from here."

Rule for printing the description of the XII:
	say "The numerals are the size of my body."


Section 3 - Chain

A thick chain is a backdrop, in the Upper Gears, the Rafters, and Behind the Clock Face. "[if the location is the Rafters]The chain runs down from the pulley overhead to the weight below. It passes more rafters on the way.[otherwise]The thick chain extends both up and down from here.[end if]"

Understand "links" as the thick chain.

Understand "pulley", "weight", "iron" as the thick chain when the location is not Upper Gears.

Rule for printing the description of the thick chain when in the Upper Gears:
	say "The thick links of the chain run up to a pulley by the window. Over the pulley is a weight, [if the iron weight is high]hoisted as high as it can go[otherwise]which dangles far below[end if]. The end near me feeds into the barrel[if the thick chain is gripped].[paragraph break]I'm holding on to the chain for dear life![else].[end if]";

Instead of climbing the thick chain when in Upper Gears:
	say "I could grip my arms around the chain but the angle's too steep – and the distance, it's pretty far! I can't just climb out. I really can't.";

Before swinging the thick chain:
	try climbing the thick chain instead.

Instead of climbing the thick chain [elsewhere]:
	try going down instead;

The thick chain can be gripped.

Instead of taking the thick chain when the thick chain is not gripped:
	now the thick chain is gripped;
	say "I grab hold of the chain.";

Instead of dropping the thick chain when the thick chain is gripped:
	now the thick chain is not gripped;
	say "I let go of the chain.";

Instead of pulling the thick chain:
	say "[if the iron weight is high]The chain is taut from here to the pulley, since the weight is hoisted right to the top[otherwise]The chain is far too heavy to move[end if].";

Section 4 - Counterweight

An iron weight is scenery, in the Upper Gears. The iron weight can be high or low. The iron weight is high. The description of the iron weight is "A solid chunk of iron [if high]near the pulley[otherwise]hanging far, far below the gigantic rose window[end if]." Understand "counterweight", "counter-weight" as the iron weight. 

Instead of doing something when the iron weight is physically involved:
	say "The weight is far, far out of my reach, on the other end of the chain.";

Part 8 - Rafters

Chapter 1 - Description

Rafters is a room. "I'm clinging to a rafter. Beside me is the long chain from the pulley, down past the rose window that lights up everything in vivid red, blue and green. My foot could almost reach the XII on the clock face... Below is nothing but a few more rafters, presumably used for placing and replacing the glass. And then there's nothing but a long drop for a long time, and the chanting of the monks far below.[paragraph break]By one of the rafters near the bottom of the window is a little door in the clock itself – a pane of glass, swung outward. [i]The Figure.[r]" 

Instead of approaching the escaping Figure in the Rafters:
	try going down;

Instead of making to leave in the Rafters: 
	try going down.



Chapter 2 - Scenery

Instead of going up in the Rafters:
	say "Up is nothing but the gigantic pulley and I can't scramble onto that even if I wanted to.";

Instead of going a planar direction when in the Rafters:
	say "I can't go anywhere from here. I'm out on a limb, with just the chain for company.";

After going down from the Rafters:
	say "Gingerly, I clamber down the chain and onto the rafters behind the clock face, lower down.";
	continue the action;

Section 1a - rafters

Some rafter beams are a backdrop. They are in the Rafters, in the Upper Gears, in Behind the Clock Face. "The beams are so narrow I have to go one foot after the next. And they're old, and a little bent in the middle too!". Understand "rafters", "beam", "beams" as the rafter beams.

Instead of dropping the rafter beams:
	say "No way. I'm happier having something underfoot, at least!"

Instead of taking the rafter beams:
	say "Don't worry, there's no chance I'm letting go.";

Instead of approaching or entering the rafter beams in Upper Gears:
	say "The rafters can't take me anywhere from here. I need to go up!"

Instead of approaching or entering the rafter beams in Rafters:
	try going down;

Instead of approaching or entering the rafter beams in Behind the Clock Face:
	try going outside;

Section 1 - Rose Window

Instead of doing something when the Rose Window is physically involved and the location is the Rafters:
	say "It's sheer glass. I couldn't do anything.";

Rule for printing the description of the rose window when in Rafters:
	say "The window is close enough to touch – but so large it fills everything I can see. Somewhere below a panel is missing, creating a small door.";

Part 9 - Behind the Clock Face

Chapter 1 - Description

Behind the Clock Face is a room, down from the Rafters. "Like an unlucky symbol I can see the giant clock face in front of me, in reverse. The hands are turning widdershins, very slowly. Enough to make me shudder. The rafter I'm on extends right up to the glass panel set in the clock face, where a small square of normal light breaks the green and silver of the stained glass, near the IV.[paragraph break]The chain extends beside me, up and down."

Instead of approaching the escaping Figure in Behind the Clock Face:
	try going outside;

Instead of going up when in Behind the Clock Face:
	say "The door is within reach. This is where the Figure went.";

Instead of going down when in Behind the Clock Face:
	try going up instead;

Understand "small", "sky", "blue", "door", "panel", "square" as the Rose Window when the location is Behind the Clock Face.

Instead of entering the Rose Window when the location is Behind the Clock Face:
	try going outside instead;

Instead of exiting when the location is Behind the Clock Face:
	try going outside instead;

After going outside from Behind the Clock Face:
	say "I crawl over to the door and slip through...[paragraph break]";
	end the chapter;
	continue the action;

Chapter 2 - Scenery

Section 1 - Rose Window

Understand "door", "glass", "pane", "pane of glass", "little/small door", "blue", "sky" as rose window when the location is Behind the Clock Face or the location is the Rafters.

Rule for printing the description of the rose window when in Behind the Clock Face:
	say "Jewelled light blinds me. Only the square of blue sky - the door - looks safe. But that's the way the Figure went, so I know it's not...";

Book 5 - The Roofs of the City

Cathedral Roof is a region. The Minute Hand, Parapet are in Cathedral Roof.

Roofs of the City is a region. Rooftop 1, Rooftop 2,  Rooftop 3, Rooftop 4, Rooftop 5, Sloping Roofs, Weather Station, Observation Platform are in the Roofs of the City.

Rule for printing the description of the backdrop-sky when in the Roofs of the City:
	if TRIG_ROOFTOP_4 is fired:
		say "Somewhere up there is the Figure in his ornithopter.";
	else:
		say "The sky is gathering with clouds."

Rule for printing the description of the backdrop-clouds when in the Roofs of the City:
	say "The skies are darkening. Growing grey."

Part 0 - the Figure

After looking in the Minute Hand:
	move the escaping Figure to the Cathedral Roof;

After looking in Rooftop 1:
	move the escaping Figure to the Roofs of the City;

Rule for printing the description of the escaping Figure when in Roofs of the City and TRIG_ROOFTOP_4 is fired:
	say "The Figure's ornithopter is still beating its heavy bulk up into the sky."

Rule for printing the description of the escaping Figure when in Roofs of the City:
	say "The Figure is getting away. I've got to stop him somehow!"

Instead of shouting at the escaping Figure in Roofs of the City:
	say "Save your breath for running and jumping, Wren, that seems to be what's needed around here!"

Instead of approaching the escaping Figure in Roofs of the City:
	say "[one of]Problem is, I'm not sure which way to turn any more[or]Maybe if I look around I'll find some clue[stopping]."

Instead of approaching the escaping Figure in Roofs of the City when TRIG_ROOFTOP_4 is fired:
	say "He's escaped in an ornithopter! Either I [i]find[r] a way of following him or I give up here in despair."

[Added separate backdrop for these instead. ]
[Understand "ornithopter", "helipcopter" as the escaping Figure when TRIG_ROOFTOP_4 is fired.]


Rule for printing the description of the escaping Figure when in Roofs of the City and balloon spotted is true:
	say "The Figure is a dot in the sky to the south. I need to get up there!";

Part 1 - Minute Hand

Minute Hand is a room, exterior, outside from Behind the Clock Face. "It's a good thing I'm good with heights, because this is the highest I've ever been. My back's pressed against the cool glass of the rose window, and I'm standing on a wide metal girder. The [i]long[r] hand. The one that tells you minutes. Luckily it's between the III and the IV - almost level. For now.[paragraph break]And stretched out before me is the most incredible view: the whole of the city of St Philip, a mess of buildings like it washed up when the rivers flooded. Only the Abbey looks like it was actually built instead of dropped."

Instead of going inside from the Minute Hand:
	try entering the clock face door.

Instead of making to leave when in the Minute Hand:
	try jumping.

Instead of going nowhere when in the Minute Hand:
	try jumping.

Instead of approaching the escaping Figure when in the Minute Hand:
	say "I can't begin to understand how he got there..."

Index map with Minute Hand mapped east of Behind the Clock Face.

After looking in Minute Hand when SE_MINHAND0 is unfired:
	change the current script to { SE_MINHAND0, SE_MINHAND1, SE_MINHAND2, SE_MINHAND3 };
	continue the action;

SE_MINHAND0 is a scripted event. 

SE_MINHAND1 is a scripted event. The display text is "There's a parapet of the Cathedral a good way below, but no ladders, chains or cogs this time. But somehow – that's where the Figure is, looking my way, almost as though wondering if he should stay to help. But he doesn't, and then he's gone.".

SE_MINHAND2 is a scripted event. The display text is "The metal underfoot shivers a little...".

SE_MINHAND3 is a scripted event. The display text is "From behind the window there's an enormous groan like a giant waking up, and then the hand underneath me simply disappears. Five-eighteen, Wren. Too steep to stop myself from sliding...[paragraph break]Woomph!".

After firing SE_MINHAND3:
	move the player to the Parapet;

Instead of going down in Minute Hand:
	try jumping.

Instead of jumping in Minute Hand:
	say "No chance. It's too far. I'd have my neck in pieces before my feet hit the stone.";

Chapter 2 - Scenery

Section 1 - Clock face / Rose Window

Rule for printing the description of the rose window when in Minute Hand:
	say "The gigantic clock face. It has no handholds, no rungs. Nothing.";

Instead of entering the rose window when in Minute Hand:	
	try entering the clock face door instead.

Section 2 - City View

A thing called the mh_distant_city_view is scenery, privately-named, in Minute Hand. "I can see the whole city, from the River Tempus on side to the quicker River Fugit on the other. It all seems small enough to pick up and fix – but only if I reached a little further out..." The printed name is "city".

Understand "city", "view", "whole", "river", "rivers", "tempus", "fugit", "building", "buildings" as the mh_distant_city_view.

Instead of doing something when the mh_distant_city_view is physically involved: say "The city is spread out before me like a painting, but it's far, far away."


Section 3 - Minute hand

An iron bar is scenery, in Minute Hand. "The minute hand is a thick bar of iron about the size of one of the Cathedral pews. But it's also smooth, and steep, and not a safe place to stay..."

Understand "minute", "hand", "girder", "long", "metal", "underfoot" as the iron bar.
The printed name of the iron bar is "minute hand".

Instead of dropping the iron bar:
	try jumping instead;

Section 4 - Abbey Roof

The distant abbey roof is scenery, in Minute Hand. "In the Abbey roof I can see the single dark square of a missing tile."

Understand "square", "dark", "missing", "tile" as the distant abbey roof. The printed name is "Abbey roof".

Instead of doing something when the distant Abbey Roof is physically involved: say "It's miles away."


Section 4 - Parapet 

The distant parapet is scenery, in Minute Hand. "The parapet is the top of a buttress of the Cathedral, a good twenty metres below me."

Instead of doing something when the distant parapet is physically involved: say "It's far below me."

Instead of jumping on or entering or approaching the distant parapet:
	try going down.

Section 5 - Clock face door

The clock face door is scenery, privately-named, in Minute Hand. 

Instead of doing something with the clock face door:
	say "The door back inside is too high up now – it wasn't a minute ago, of course."

Understand "door" as the clock face door. The printed name is "door".

Part 2 - Parapet

Chapter 1 - Description

The Parapet is a exterior room. "[one of]I pick myself to my feet. [or][stopping]A narrow lead-covered walkway along the cathedral roof. [one of]How clockwise can you be? [or][stopping]It doesn't go anywhere, of course, but at least there're some gargoyles and things to stop me falling the rest of the way to the ground.[paragraph break]Off west a buttress flies out near the roof of a nearby Civil Service building."

Index map with Parapet mapped south of Minute Hand.

Instead of making to leave in Parapet:
	try going west.

Instead of going inside in Parapet:
	try climbing the rose window instead.

Instead of going up in Parapet:
	try climbing the rose window instead;

Instead of going nowhere when in Parapet:
	say "I've followed him this far. I can't give up now!";

Instead of approaching the escaping Figure when in Parapet:
	try going west.

Instead of jumping when in Parapet:
	try going west.

Chapter 2 - Event on Entry

After looking in Parapet when TRIG_PARAPET1 is unfired:
	fire TRIG_PARAPET1;
	continue the action;

TRIG_PARAPET1 is a trigger.

Rule for firing TRIG_PARAPET1:
	say "The Figure throws a glance over his shoulder before taking a flying leap off the buttress. It's incredible to watch – he's a like a grey squirrel, agile and totally fearless. I'm already exhausted – and he's off again, already!";

Chapter 3 - Scenery

Rule for printing the description of the escaping Figure when in the Parapet:
	say "The Figure's gone - leapt clear across the street below and onto the buttress opposite!"

Section 1 - Rose Window

Rule for printing the description of the rose window when in Parapet:
	say "I could just about touch the VI now.";

Instead of climbing the rose window when in Parapet:
	say "There's no way back up the glass – thankfully.";

Instead of doing something when the rose window is physically involved in Parapet:
	say "This clock can't help me now.";

Understand "hand", "hands", "minute", "VI", "6", "number", "numeral", "numbers", "numerals", "roman numeral", "roman numerals" as the rose window when the location is Parapet.

Section 1b - walkway

The lead walkway is scenery, in Parapet. "The walkway is the roof of the West Apse: a mind-boggling thought."

Section 2 - Gargoyles

[Backdrop from Among the Gargoyles]

Understand "spire", "spires", "gable", "gables" as the gargoyles of vice when the location is Parapet.

Rule for printing the description of the gargoyles of vice when in Parapet:
	say "The edge of the roof is lines with gargoyles all poised to spit rainwater down on people in the street below.";

Instead of climbing or jumping on the gargoyles of vice when in Parapet:
	say "I'm certainly not going to let go of them! They're the only things keeping me up here!";

Instead of dropping the gargoyles of vice when in Parapet:
	say "No thanks!";

Section 3 - Flying buttress

The scenery-buttress is a backdrop, privately-named, in the Parapet and in the Rooftop 1. "The flying buttress to the [if location is the Parapet]west is holding this wall up[else]east is holding the wall of the Cathedral up[end if]." The printed name is "buttress". Understand "flying", "buttress" as the scenery-buttress.

Instead of climbing, jumping off, jumping on, or entering the scenery-buttress when the location is Parapet:
	try going west;

Instead of climbing, jumping off, jumping on, or entering the scenery-buttress when the location is Rooftop 1:
	try going east;

Part 3 - Buttress

Chapter 1 - Description

Buttress is a room, exterior, west of Parapet. "I'm not on the roof anymore: I'm perched on a narrow stone arch that curves out from the wall and down to the ground. Hopefully I'm not going [i]that[r] way any time soon... This is where I saw the Figure jump across to the next roof, though now he's disappeared from sight." 

Instead of making to leave in the Buttress:
	try going east.

Instead of going east in Buttress:
	say "Back off? No way. I've gotten this far. I'm not giving up.";

Instead of going nowhere when in the Buttress:
	say "There's no way off this buttress apart from jumping, or falling.";

Instead of falling when in the Buttress:
	say "After I survived that clock in there? That wouldn't just be clumsy, it'd be [i]embarrassing[r]."

Instead of jumping when in the Buttress:
	say "Heart in mouth? Check. Fingers ready to claw the roof? Ready. Then – here goes![paragraph break]I spring like a cat – like a [i]flying[r] squirrel – like a mouse hit out of the kitchen by the Cook wielding a meat-tenderizer – I hurl myself across the gap and thump down on to the roof beyond. Good thing this is a Council building: they make their roofs good and firm.";
	move the player to Rooftop 1;

Chapter 2 - Scenery

Section 1 - Gargoyles

Understand "spire", "spires", "gable", "gables", "[cathedral]" as the gargoyles of vice when the location is Buttress.

Rule for printing the description of the gargoyles of vice when in Buttress:
	say "The Cathedral roof is back east.";

Instead of entering or climbing or jumping on the gargoyles of vice when in Buttress:
	try going east;

Section 2 - Roof

The slated lead roof is a backdrop, in the Buttress and in the Parapet. "About five feet below – and five feet [i]away[r] – is the slated lead roof that almost touches the buttress." The printed name is "roof". Understand "civil", "service", "building", "nearby" as the slated lead roof.

Before entering or jumping on or approaching the slated lead roof:
	if the location is the Parapet:
		try going west instead;
	else:
		try jumping instead.

Instead of doing something when the slated lead roof is physically involved:
	say "The building is out of reach - but not out of leap, maybe.";


Part 4 - Rooftop 1 (Lightning Rods)

A rooftop-area is a kind of room. A rooftop-area is usually exterior. The printed name of a rooftop-area is "Rooftop".

After facing towards a rooftop-area:
	say "The rooftops continue towards [the noun].";

The Rooftop 1 is a exterior rooftop-area. "[one of]If the city I saw from the clock-face is a sprawl then its roofs are worse: sloping and slanting this way and that, a mess of slate and lead, like someone kicked over a house of cards. Some parts look flat and others impossibly steep, or blocked with tall chimneys, extra walls or sharp lightning rods plugged into vegetable patches way below.[or]The roofs are a mess of chimneys, lightning rods, ways forward and sudden sharp drops.[stopping][paragraph break]From here, I could scramble down to the south, or hop across small gaps to the southeast or southwest. The Cathedral itself is back east."

Instead of making to leave in Rooftop 1:
	try going east.

Instead of going down in Rooftop 1:
	say "The street is too far to fall!"

Instead of going east in Rooftop 1:
	say "The buttress is too steep to climb back.";

Instead of jumping in Rooftop 1:
	try going down instead;

Chapter 2 - Scenery

Section 1 - Chimneys & Rods

Some chimneys are a backdrop, in Rooftop 1, Rooftop 3, Rooftop 4, Sloping Roofs. "Who would have thought people kept so much rubbish up here, hidden out of sight? This isn't [i]precision engineering[r], all these chimneys, this is a [i]great big mess of stuff[r]. It's not Right or Proper at all." Understand "chimney", "stuff" as the chimneys.

Instead of attacking or pushing or taking the chimneys:
	say "I couldn't pull this stuff apart, the lightning rods and chimneys are all solid – even if they are a mess.";

Instead of climbing or entering the chimneys when TRIG_ROOFTOP_4 is fired:
	say "I can't get as high as Figure did that way."

Instead of climbing or entering the chimneys:
	say "They'd probably fall over."

Does the player mean doing something with the chimneys: it is very unlikely.

Section 1b - Rooftops

Some tiled rooftops are a backdrop, in Roofs of the City. Understand "roofs", "roof" , "rooves", "tile", "tiles", "gutter", "tiled", "gutters", "level", "levels", "rooftop" as the rooftops. "The roofs are a mismatch of tiles and levels and different directions. At any moment I might be tipped off into the street!"

Instead of taking the tiled rooftops:
	say "I can't go wandering off with the rooftops, can I?"

Does the player mean doing something with the tiled rooftops: it is unlikely.
Does the player mean jumping off the tiled rooftops: it is likely.
Does the player mean getting off the tiled rooftops: it is likely.

Instead of jumping off or getting off the tiled rooftops:
	try going down instead.

Instead of putting something on the tiled rooftops:
	try dropping the noun instead.

Instead of entering the rooftops:
	say "I'm already on the rooftop (where did you [i]think[r] I was?)";

Section 2 - Lightning Rods

Some lightning rods are a backdrop, in the Roofs of the City. "The lightning rods run straight into gardens and vegetables patches. Something to do with the rattling of the metal feeding the plants. I don't think I understood it when I heard it explained to me."

Instead of touching or taking the lightning rods:
	say "Touch that and you might burn: the vibrations can be that strong. Especially in thunderstorms."

Understand "rod", "vegetable patches", "patch/patches", "rods", "lightning rods", "lightning rod" as the lightning rods.

Section 3 - streets

Some streets below are a backdrop, in Roofs of the City. "There are streets below on all sides, fairly quiet now as the evening draws in." Understand "street" as the streets below.

Instead of doing something when the streets below are physically involved:
	say "I'm not at street-level and I plan to [i]stay[r] that way."

Understand "alley", "alleys", "alleyway", "alleyways", "alley-ways", "alley-way" as the streets below when the location is not Rooftop 4.

Instead of throwing something at the streets:
	say "I'd have the City Guard out with bows and arrows if I started doing that."

Part 5 - Rooftop 2 (Fallen Chimney)

The Rooftop 2 is a rooftop-area, southwest of Rooftop 1. "[one of]This roof is almost flat, which is good, because there's empty space to the north and west of it. I could slip south, through the remains of a brick chimney collapsed into a whole heap of bricks. It seems to have been barged out the way to make room for a flat wide turret-top, on top of which is a glossy platform with a brass railing. Overlapping roofs create a second path to the northeast.[or]A corner of a roof, with nothing to north or west. There's a safe way back northeast. South is a fallen-down brick chimney topped by a big glossy platform that's elbowed itself some more space up here.[stopping]"

Instead of jumping in Rooftop 2:
	say "The platform's not that high, but it's too high to jump up and grab it.";

Instead of going down in Rooftop 2: 
	say "It's too far to fall to the street below."

Instead of making to leave in Rooftop 2:
	try going northeast.

Chapter 2 - Scenery

Section 1 - Chimneys & Rods

[Backdrop]

Section 2 - Platform

A raised platform is scenery, in Rooftop 2. "I can't make out what's on the platform[if Observation Platform is not visited] (if anything)[end if]: but I can see it's encircled by a railing."

The printed name is "platform". Understand "brass", "glossy", "railing", "big", "railings", "tower", "turret" as the raised platform.

Instead of jumping on or climbing or approaching or entering the raised platform:
	try jumping;

Instead of doing something when the raised platform is physically involved:
	say "The platform is a bit of a way above me."

Section 3 - Fallen Chimney

A fallen chimney is scenery, in Rooftop 2. "The collapsed chimney is now nothing but a few huge chunks of bricks, like the last crumbs of a cake. The mortar holding them together is crumbled and dry."

Understand "huge", "chunks", "collapsed", "crumbs" as the fallen chimney.
Understand "chunk", "chunk of", "brick", "bricks", "rubble", "pile" as the fallen chimney when the location does not enclose the huge chunk of brick.

Instead of attacking or opening or pushing the fallen chimney when the mortar is firm:
	say "The chunks of brick are stuck with mortar. Old mortar I could easily break, but I'd need some kind of tool to do it.";

Instead of pushing or attacking or opening the fallen chimney:
	say "The chimney is just a heap of broken stones already. There's nothing more I could do to it."

Instead of taking the fallen chimney when the mortar is firm:
	say "The smallest chunk of brick is almost as big as me. I'd need to break it up a little first if I was going to start carrying it around with me.";

Instead of taking the fallen chimney when the mortar is firm for the second time:
	try attacking the fallen chimney;

Instead of taking the fallen chimney when the huge chunk is on-stage:
	say "That chunk I took before is quite heavy enough, I think!";

Instead of taking the fallen chimney when the huge chunk is off-stage:
	move the huge chunk of brick to the location;
	try taking the huge chunk of brick;

Instead of climbing or jumping on or entering the fallen chimney:
	say "[one of]I climb halfway up the brick, but then skitter down again.[or]The chimney has fallen into a huge pile of rubble and sections of wall, pretty much unclimbable unless I was a cat. If I was on the platform, I could probably slide down it safely enough.[stopping]".


Instead of attacking the fallen chimney with something:
	redirect the action from the fallen chimney to the mortar, and try that instead;

Section 4 - Huge Chunk

A huge chunk of brick is a heavy thing. The description is "A[if the item described is held] stupid irritating miserable no-good wind-down cockeye[end if] heap of bricks, almost too heavy for me to carry at all."

Understand "bricks" as the huge chunk of brick.

Rule for printing the drop event of the huge chunk of brick:
	say "I can't keep carrying the bricks as well. I put them down.[paragraph break]";

Rule for printing the take event of the huge chunk of brick:
	say "I can just about pick it up. It's heavy, though... worse than carrying both Drake and Calvin's laundry baskets![paragraph break]";

Section 5 - Mortar

Some mortar is scenery, not plural-named, in Rooftop 2. "If all the mortar in these buildings is as dry and crumbled as the mortar in the broken chimney, then I'd better tread carefully. A curious pigeon could scrape this stuff away."

The mortar can be firm or loose. The mortar is firm.

Understand "crumbled", "crumbling", "dry" as the mortar.

Definition: a thing is scrapable if it is the knife or it is the lucky clock key or it is the small gear.

Instead of attacking or scraping or taking the mortar:
	say "My fingers are too big – and a bit too soft, even after all the cleaning I've done – to break the mortar. I'll need to use a tool of some sort."

Instead of slicing the mortar with something:
	try scraping the mortar with the second noun.

Instead of scraping the mortar with something scrapable:
	now the mortar is loose;
	say "Using the [if the second noun is the knife]knife point [else]edge of the [second noun] (and wearing it down horribly!) [end if]I work some of the mortar loose, powder some more, and free up a small chunk of brick that I can probably just about carry.";

Instead of attacking the mortar with something:
	try scraping the mortar with the second noun instead;

Part 6 - Sloping Roofs

The Sloping Roofs is a rooftop-area, south of Rooftop 1. "[one of]It's hard to keep my bearings here: below, several streets are coming together and their overhanging roofs – good for keeping the rain off – create a patchwork of tiles, chimneys, gaps and different levels. I can scramble up a few levels to the north, or I could probably slip away west and south, but I might get turned around in either of those directions.[or]Several roofs meet here in a mess of tiles. East is impassable, but I could climb rooftiles to north, east or south.[stopping]"

The printed name of the Sloping Roofs is "Sloping Roofs". [rather than "rooftop"]

Section - Bendy directions

South of Rooftop 2 is west of Sloping Roofs. 
South of Sloping Roofs is west of Rooftop 4. 
[West of Sloping Roofs is Rooftop 2.
West of Rooftop 4 is Sloping Roofs.]


Index map with Sloping Roofs mapped west of Rooftop 3.

Section - Moving in the Sloping Roofs

Instead of going down in Sloping Roofs: 
	say "There's no way down from here, I'm in the middle of a meeting of roofs."

Instead of jumping in Sloping Roofs:
	try going down instead.

Instead of making to leave in Sloping Roofs:
	say "Which way - north, east or south?"

Instead of going east in Sloping Roofs:
	say "When I said impassable, I meant, I'm at an impasse."

Chapter 2 - Scenery

Section 1 - Chimneys & Rods

Part 7 - Rooftop 3 (Pipe and Board)

The Rooftop 3 is a rooftop-area, southeast of Rooftop 1. "[one of]Half of this roof has collapsed, and whoever was repairing it clearly ran out of money only partway into the job. A pile of construction materials has been left behind[pipes-and-boards]. Some look like they could easily fall off the roof onto the street to the east. Safer ground is a short hop down to the northwest, and a bit of a scramble to the southwest.[or]This roof is half-repaired and littered with construction materials[pipes-and-boards]. There's a street to the east, but I could inch along the roof to the northwest or southwest.[stopping]"

To say pipes-and-boards:
	if the pile supports the length of piping or the pile supports the solid wooden board,
		say " -";
	if the pile supports the length of piping,
		say " pipes";
	if the pile supports the length of piping and the pile supports the solid wooden board,
		say " and";
	if the pile supports the solid wooden board,
		say " boards";
	if the pile supports the length of piping or the pile supports the solid wooden board,
		say ", that kind of thing";

Instead of going east in Rooftop 3: say "The street is a little too far below for me to safely fall."

Instead of going down in Rooftop 3: 
	try going east instead.

Instead of jumping in Rooftop 3:
	try going east instead.

Instead of making to leave in Rooftop 3:
	say "Which way - northwest or southwest?"


Chapter 2 - Scenery

Section 1 - Chimneys & Rods

[Backdrop]

Section 2 - Pile

A pile is a supporter, scenery, in Rooftop 3. "Bits and bobs.[verbose-pipes-and-boards]" 

Understand "bits", "bobs", "construction", "material", "materials", "pipes", "boards" as the pile.

To say verbose-pipes-and-boards:
	if the pile supports the length of piping or the pile supports the solid wooden board,
		say " A";
	if the pile supports the length of piping,
		say " large and hefty length of piping";
	if the pile supports the length of piping and the pile supports the solid wooden board,
		say ", a";
	if the pile supports the solid wooden board,
		say " wooden board about three times my height";
	if the pile supports the length of piping or the pile supports the solid wooden board,
		say ". That sort of thing.[no line break]";

Instead of taking the pile:
	say "I can't take the whole pile! One pipe or one board would be as much as I could manage[one of]. And a whole [i]army[r] of Drakes punching at my arms wouldn't be able to make me take more![or].[stopping]"

Section 3 - Wooden board

A solid wooden board is a heavy supporter, portable, on the pile. The description is "A solid wooden board, about seven feet long."

The printed name is "board".

Understand "plank", "long", "seven foot", "seven feet" as the solid wooden board.

Rule for writing a paragraph about the solid wooden board:
	say "Lying on the tiles is a length of wooden board";
	if the length of piping is in the location:
		say " and a [length of piping]";	
	say "."

Rule for printing the drop event for the solid wooden board:
	say "The board is too heavy to carry alongside anything else. It slaps down onto the roof by my feet.[paragraph break]";

Rule for printing the take event for the solid wooden board:
	say "I grab one end of the board, ready to drag it along behind me.[paragraph break]";

Instead of putting something on the solid wooden board:
	say "That wouldn't make carrying [the noun] any easier, would it?";

After going when the solid wooden board is carried:
	say "[one of]I drag the board along behind me[or]I pull the board along[at random].";
	continue the action;

Instead of pulling the solid wooden board:
	if the solid wooden board is not carried:
		try taking the solid wooden board instead;
	say "That's exactly what I am doing."

After looking when the solid wooden board is carried:
	say "I'm still holding this wooden board."

Section 4 - Pipe

The length of piping is a heavy thing, on the pile. The description is "A curious bit of metal piping: it's about ten feet long, with two right-angle bends at either end. Shaped like a gigantic staple, you might say."

The printed name is "pipe".

Rule for printing the name of length of piping when taking inventory:
	say "long and cumbersome length of piping";

Rule for writing a paragraph about the length of piping:
	say "Lying on the tiles is a length of piping";
	if the solid wooden board is in the location:
		say " and a [solid wooden board]";	
	say "."

After looking when the length of piping is carried:
	say "I'm still holding this length of piping."

Understand "pipe", "curious", "bit", "long", "ten foot", "ten feet", "bent", "bend", "bends", "gigantic", "staple" as the length of piping.

Rule for printing the drop event for the length of piping:
	say "This pipe's too much to handle as well. I put it down.[paragraph break]";

After going when the length of piping is carried:
	say "[one of]The pipe skitters along behind me[or]The pipe booms as it rattles along[or]I drag the pipe along behind me[at random].";
	continue the action;

Instead of searching the length of piping:
	say "The other end's in there."

Instead of pulling the length of piping:
	if the length of piping is not carried:
		try taking the length of piping instead;
	say "That's exactly what I am doing."

Part 8 - Rooftop 4 (Ornithopter & Tarp)

Chapter 1 - Description

The Rooftop 4 is a rooftop-area, south of Sloping Roofs, southwest of Rooftop 3. North of Rooftop 4 is nowhere. "[one of]I'm on the south side of a group of buildings, with other roofs I could scramble onto east, west, and northeast. To the south, there's a low wall and then a gap - an alleyway - before the next roof along. And that roof looks interesting: covered in machinery, though it's hard to say for sure.[or]There are other roofs east, west and northeast. To the south is a low wall, a twelve-foot gap, and then another roof that's covered in machinery.[stopping]"

Instead of jumping in Rooftop 4:
	if the plank bridge is in location or the wooden board is in the notch:
		say "The street is too far to fall." instead;
	try going south instead.

Instead of going down in Rooftop 4: 
	try jumping instead;

Instead of making to leave in Rooftop 4:
	say "Which way - east, west, or northeast?";

Instead of facing south when the plank bridge is on-stage and in Rooftop 4:
	say "There's my handy bridge over the alley."

Instead of facing south in Rooftop 4:
	say "There's a twelve foot gap over an alley, and then a roof covered in machinery."

Chapter 2 - Event on entry

TRIG_ROOFTOP_4 is a trigger. 
TRIG_ROOFTOP_4B is a trigger. 

Rule for firing TRIG_ROOFTOP_4:
	say "Something moves high above, and in a grey flash the Figure is before me. He nods once. 'Relentless,' he remarks. 'I admire your courage. Your persistence. You could almost be a machine.' I'm barely a foot away, and I still can't see his face. Nothing but that sleek grey suit.[paragraph break]'But this is where I leave you.' He whips away the tarpaulin, to reveal an ornithopter - something I've only seen in lithographs before. Pausing only to wind the key beneath one of the craft's gigantic wings, he leaps inside and in a moment, has taken to the sky! But the ornithopter is slow-moving: like a drifting leaf, drifting upwards...";

Rule for firing TRIG_ROOFTOP_4B:
	say "So, what now? There's no way I'm letting him get away; I'm going to be in so much trouble after all I've done, I'll need something to show for it. But I can't fly either. There's got to be a way. Something I can do. If the Universe is clockwork the way the Abbot says it is, then it can't have left me stranded, can it?"

After looking in Rooftop 4 when TRIG_ROOFTOP_4 is unfired:
	fire TRIG_ROOFTOP_4;

Every turn when TRIG_ROOFTOP_4 was fired and TRIG_ROOFTOP_4B is unfired:
	fire TRIG_ROOFTOP_4B;

Rule for choosing notable locale objects of Rooftop 4 when TRIG_ROOFTOP_4 is unfired:
	set the locale priority of the notch to 1;
	set the locale priority of the large tarp to 2;

Section	2b - Ornithopter object

The ornithopter is a glimpse backdrop in Roofs of the City. Understand "ornithopter" as the ornithopter when TRIG_ROOFTOP_4 is fired. "The ornithopter is still large in the sky. It moves like a slow, fat moth - with the Figure aboard!" Understand "helicopter" as the ornithopter.

Instead of approaching or entering the ornithopter: 
	say "I need a way to get myself airborne!"

Instead of doing something when the ornithopter is physically involved:
	say "The ornithopter is moving through the clouds!"


Chapter 3 - Objects


Section 2 - Notch

A notch is a container, fixed in place, in Rooftop 4. The description is "The [']notch['] is a gap in the brickwork of the low south wall overlooking the alley[one of]. Maybe the missing bricks fell out down below: that would have been pretty bad for whoever was below![or].[stopping]".

Rule for writing a paragraph about the notch:
	say "[if the notch contains the solid wooden board]There's a wooden board set into the notch in the wall and pushed out over the street.[else]The low south wall is missing a few bricks creating a gap – well, I'll call it a [i]notch[r].[end if]". 

Rule for writing a paragraph about the notch when the plank bridge is on-stage:
	say "The wooden board makes a nice plank bridge, weighed at this end with bricks."

Understand "low", "south", "wall", "gap", "wall", "brickwork", "brick-work" as the notch.

Instead of putting something on the notch:
	try inserting the noun into the second noun;

Instead of putting something on the solid wooden board when the notch contains the solid wooden board:
	try inserting the noun into the notch instead;

After inserting the solid board into the notch:
	say "The board slides in – not perfectly, it's no clockwork, but it'll do. The plank extends out over the alley to the south, almost all the way!";

Instead of inserting the huge chunk of brick into the notch when the notch contains the solid wooden board:
	remove the solid wooden board from play;
	remove the huge chunk of brick from play;
	say "I unload the bricks onto the end of the board, weighing it down nicely.";
	move the plank bridge to Rooftop 4;

Instead of inserting the huge chunk of brick into the notch:
	say "I don't have the tools to repair this wall, and anyway, whyever would I want to?";

Instead of inserting the length of piping into the notch when the notch contains the solid wooden board:
	move the length of piping to the location;
	say "I dump the pipe on the end of the board to weigh it down. It stays for a moment, and then slides away."

Instead of inserting the length of piping into the notch:
	say "The pipe would probably reach from this roof over the alley to the next roof, but I wouldn't like to try and walk across it. I'm a child, not an ant!"

Instead of inserting something that is not the solid wooden board into the notch:
	say "That wouldn't do me any good, would it?"

Instead of inserting something into the notch when the solid wooden board is in the notch:
	say "That wouldn't weigh the board down by much."

Instead of inserting the large tarp into the notch when the solid wooden board is in the notch:
	say "The tarpaulin is surprisingly light - not enough to counterbalance the board."

Instead of fastening something to the solid wooden board when the solid wooden board is in the notch:
	try inserting the noun into the notch instead.

Instead of entering or jumping over or climbing the notch:
	if the wooden board is in the notch or the plank bridge is on-stage:
		say "It's a twelve-foot gap. I can't jump that!" instead;
	try going south instead.


Section 1 - Tarp

A large tarp is in Rooftop 4. "[one of]A large tarp is thrown over something in the middle of this space[or]A large tarp lies discarded here[stopping]." The description is "[one of]This is expensive stuff: a fabric that's lighter and stronger and less itchy than the stuff they make my bed-sheets from, the way sunlight is different than the beady glow in a rat's eye. The Figure must be pretty wealthy to leave something like this behind! Perhaps he meant it as a present: something to buy me off the chase.[paragraph break]Not going to happen. I'm going to catch him, stop him, save the Perpetuum and go collect my reward from the Archbishop.[or]This is expensive stuff: a fabric that's light and strong. The Figure must be pretty wealthy to leave something like this behind![stopping]"

Understand "tarpaulin", "sheet", "roll", "roll of" as the tarp. The printed name of the tarp is "tarp".

Instead of slicing the tarp with the knife:
	say "The tarp is pretty tough: the knife probably couldn't get through it (and I don't see a reason to try!)"

After taking the tarp:
	say "Cumbersome, but that said – it rolls up pretty small!";

Rule for printing the name of the large tarp when taking inventory:
	say "roll of tarp"
	
Instead of opening the tarp:
	say "Unrolling it would make it harder to carry, and not much else. Right now it fits neatly under my arm."

Instead of opening the tarp when the elongated chimney pipe is wrapped:
	try taking the tarp instead.

Chapter 4 - Scenery

Section 1 - Roofs / Rods / Chimneys

[Backdrop]

Section 2 - Southern Roof

The southern roof is backdrop, in rooftop 4 and in rooftop 5. "The roof on the other side of the alley seems to be littered with glass and piping. [if Weather Station is not visited]Who knows – maybe there's another ornithopter there, or a catapult or something.[end if]"

Understand "rooftop", "southwestern", "roof top", "machinery", "machine", "machines", "piping", "glass", "equipment" as the southern roof.

Rule for printing the name of the southern roof when in Rooftop 5: say "southwestern roof".

Instead of doing something when the southern roof is physically involved:
	say "The equipment is across the gap over the alleyway, out of reach."

Instead of jumping on or entering or approaching the southern roof:
	try jumping.

Section 3 - 12-foot gap

A twelve-foot gap is a door, scenery, privately-named, open, not openable, south of Rooftop 4. "The alley below is far enough that a fall might knock my knees from their sprockets, and it's too wide to jump.". Through the twelve-foot gap is the weather station. Understand "alley", "alley way", "alley-way", "alleyway", "twelve-foot gap", "twelve foot gap", "12 foot gap" as the twelve-foot gap. 

After going through the twelve-foot gap:
	say "I inch out over my makeshift bridge. The weight of the bricks shudders – if it slips off that board then I'm dead, in a second – but it doesn't. And from the end, it's a short [i]spring[r] to the roof beyond.";
	continue the action;

Instead of going through the twelve-foot gap when the notch contains the solid wooden board:
	say "[one of]I inch a little way out on the board, but it quickly starts to tip over, into the street. I freeze, and inch my way back. Without something to weight the other end down, this bridge is useless![or]I'll need to weigh the other end down with something first.[stopping]";

Instead of going through the twelve-foot gap when the plank bridge is off-stage:
	say "It's a twelve-foot gap. I can't jump that!";
	
Last instead of going through the twelve-foot gap when the player is carrying the length of piping:
	say "With this pipe in two I'd be too heavy to get across the plank bridge[one of]. (Even though it might help my balance!)[or].[stopping]"

Instead of climbing or entering or standing on the wooden board when the wooden board is in the notch:
	try going south.

Instead of jumping over the twelve-foot gap:
	if the wooden board is in the notch or the plank bridge is on-stage:
		say "It's a twelve-foot gap. I can't jump that!" instead;
	try entering the twelve-foot gap;

Section 4 - Plank bridge

A plank bridge is scenery. "The wooden board passes over the notch in the brick wall. The near end is held down by the weight of the bricks."

Understand "brick", "bricks", "huge", "chunk", "of", "solid", "wooden", "board", "long", "seven foot", "seven feet" as the plank bridge.

Instead of taking the plank bridge:
	say "No thanks. I never want to lift that weight again.";

Instead of entering or climbing or approaching the plank bridge:
	try going south instead.

Part 9 - Rooftop 5 (Narrow Chimney)

Chapter 1 - Description

The Rooftop 5 is a rooftop-area, east of Rooftop 4. "[one of]This roof is surrounded on all sides by taller buildings, scalable to the west, and impossible every other way. There's no roof at all to the southwest - the tiles look down on an alleyway  – but beyond that is the glitter of machinery (but it's too far to jump, I think).[or]This is a dead-end of high walls that I can only leave to the west. Southwest the roofs open out over an alleyway - beyond which I can see some machinery (but it's too far to jump).[stopping]"

The printed name is "Rooftop".

Instead of jumping in Rooftop 5:
	say "[i]Definitely[r] too far to jump.";

Instead of going southwest in Rooftop 5:
	try jumping;

Instead of going southwest in Rooftop 5 when the vent is in the Weather Station:
	try entering the elongated chimney pipe.

Instead of going down in Rooftop 5:
	try jumping;

Instead of making to leave in Rooftop 5:
	try going west.

Instead of facing southwest when in Rooftop 5:
	say "There's an alleyway, and then [if Weather Station has visited]the Weather Station[else]a rooftop covered in machinery[end if]."

Chapter 2 - Scenery

Section 1 - Roofs / Rods

[Backdrop]

[ Use previous roof as a backdrop instead.

 Section 2 - Southwestern Rooftop

The southwestern roof is scenery, in rooftop 5. "The roof visible to the southwest is littered with machinery of some kind, but it's not exactly accessible from here."

Understand "rooftop", "roof top" as the southwestern roof.

Instead of jumping on the southwestern roof:
	try jumping;
]

Section 1 - Chimney Pipe

A thing can be a hot air vent. A thing is seldom a hot air vent.

A chimney pipe is fixed in place, hot air vent, in Rooftop 5. "By the alley is a squat iron chimney that's belching out fat slugs of smoke. The kitchen down there must be getting ready for a feast!" 

Understand "squat", "iron", "smoke", "slugs" as the chimney pipe.

The description is "A narrow iron chimney. Smoke and steam puff out of it. This might not even be a kitchen, it might be one of those steam boilers the Abbot sometimes mutters about."

Instead of smelling a hot air vent:
	say "The smoke is hot, but not greasy."

Instead of putting the length of piping on the chimney pipe:
	remove the length of piping from play;
	remove the chimney pipe from play;
	move the elongated chimney to Rooftop 5;
	say "With a bit of hefting and hauling – and a couple of burns on my arms – I get the pipe slotted over the chimney. The new, longer chimney points north, and starts getting hot and belching out steam pretty quickly.";


[ Hoops to jump to get the parser to treat PUT PIPE ON PIPE as a sensible request. Bring on Disambiguation Control! ] 

Does the player mean putting on the chimney pipe: 
	it is likely.
Does the player mean fastening to the chimney pipe: 
	it is likely.
Does the player mean inserting into the chimney pipe: 
	it is likely.
Does the player mean putting the length of piping on the chimney pipe: 
	it is likely.
Does the player mean fastening the length of piping to the chimney pipe: 
	it is likely.
Does the player mean inserting the length of piping into the chimney pipe: 
	it is likely.


Instead of fastening the length of piping to the chimney pipe:
	try putting the length of piping on the chimney pipe.

Instead of inserting the length of piping into the chimney pipe:
	try putting the length of piping on the chimney pipe.

Instead of inserting the solid wooden board into a hot air vent:
	say "If I blocked that chimney I might cause whatever was down there to explode!"

Instead of inserting something into a hot air vent:
	say "I'd only lose it."

Instead of searching a hot air vent:
	say "Sticking my face over it would be a sure-fire way to burn my eyebrows over. That air is hot!"

Instead of touching or taking or pushing the chimney pipe:
	say "I snatch my hand back from the chimney. It's hot!"

Instead of putting the tarp on the chimney pipe:
 	say "The tarp would make the chimney something I could handle, but it wouldn't do me any good - it's just a short chimney sticking out of the rooftop. I can't pick it up, or bend it, or anything like that - and there's nowhere to go if I tried climbing it!"

Instead of unscrewing the chimney pipe with the tarp:
	try putting the tarp on the chimney pipe.

Instead of wrapping the chimney pipe with the tarp:
	try putting the tarp on the chimney pipe;

Instead of fastening the tarp to the chimney pipe:
	try putting the tarp on the chimney pipe;

Instead of fastening the tarp to the chimney pipe:
	try putting the tarp on the chimney pipe;


Instead of putting the rag on the chimney pipe:
	say "The rag is just a bit of cloth torn from an old shirt. It wouldn't stop the chimney from burning my hands!"
Instead of wrapping the chimney pipe with the rag:
	try putting the tarp on the chimney pipe;
Instead of fastening the rag to the chimney pipe:
	try putting the rag on the chimney pipe;
Instead of unscrewing the chimney pipe with the rag:
	try putting the rag on the chimney pipe.

Section 2 - Elongated chimney pipe

The elongated chimney pipe is a pointer, hot air vent, fixed in place. "On one side of the roof is my odd contraption; a bent metal pipe attached to the iron chimney. It's belching smoke and steam in a generally [way of the item described]erly direction[if the way of the item described is southwest], across the alleyway[end if][if wrapped]. Wrapped around the near end is the sheet of tarpaulin[end if]."

The description is "My odd construction: the chimney, connected to a long metal pipe, that extends out about ten feet [if the way of the item described is not southwest]across the rooftop to the [way of the item described][otherwise]over the alley to the southwest[end if][if wrapped]. Wrapped around the near end is the sheet of tarpaulin[end if]."

Understand "squat", "iron", "smoke", "slugs" as the elongated chimney pipe.

Understand "curious", "bit", "long", "ten foot", "ten feet", "gigantic", "staple", "length", "piping" as the elongated chimney pipe.

The elongated chimney pipe can be wrapped or unwrapped. The elongated chimney pipe is unwrapped.

The way of the elongated chimney pipe is north.

Instead of taking the elongated chimney pipe:
	say "The pipe's [if unwrapped]too hot to touch with my bare hands, and it's [end if]certainly too heavy to face carrying it again.";

Instead of turning or attacking or touching the unwrapped elongated chimney pipe:
	say "Ouch! The pipe is scalding hot!";

Instead of direction-setting the unwrapped elongated chimney pipe to a direction:
	try turning the elongated chimney pipe;

Instead of putting the tarp on the unwrapped elongated chimney pipe:
	now the tarp is part of the elongated chimney pipe; [ tarp vanishes! can we do better? ] 
	now the elongated chimney pipe is wrapped;
	say "I wrap the Figure's tarpaulin a couple of times around the pipe as insulation.";

Instead of wrapping the elongated chimney pipe with the tarp:
	try putting the tarp on the elongated chimney pipe;

Instead of fastening the tarp to the elongated chimney pipe:
	try putting the tarp on the chimney pipe;

Instead of putting the rag on the elongated chimney pipe:
	say "The rag is just a bit of cloth torn from an old shirt. It wouldn't stop the chimney from burning my hands!"
Instead of wrapping the elongated chimney pipe with the rag:
	try putting the tarp on the elongated chimney pipe;
Instead of fastening the rag to the elongated chimney pipe:
	try putting the rag on the elongated chimney pipe;

Instead of unscrewing the unwrapped elongated chimney pipe with the tarp:
	try putting the tarp on the elongated chimney pipe;
	try turning the elongated chimney pipe;

Instead of turning or attacking the elongated chimney pipe:
	try turning the elongated chimney pipe backwards.

Instead of turning the elongated chimney pipe backwards:
	let the new way be the anticlockwise of the way of the elongated chimney pipe;
	repeat with N running from 2 to the number of turns to make:
		let the new way be the anticlockwise of the new way;
	try direction-setting the elongated chimney pipe to the new way;

Instead of turning the unwrapped elongated chimney pipe backwards:
	say "Ouch! The pipe is scalding hot!";

Instead of turning the unwrapped elongated chimney pipe forwards:
	say "Ouch! The pipe is scalding hot!";

Instead of turning the elongated chimney pipe forwards:
	let the new way be the clockwise of the way of the elongated chimney pipe;
	repeat with N running from 2 to the number of turns to make:
		let the new way be the clockwise of the new way;
	try direction-setting the elongated chimney pipe to the new way;

After direction-setting the elongated chimney pipe to a direction:
	if the way of the elongated chimney pipe is southwest begin;
		move the vent to the Weather Station;
	otherwise;
		remove the vent from play;
	end if;
	say "[one of]Working hard on the hot tarpaulin, I manage to get the pipe to turn, until it's pointing [way of the elongated chimney pipe][or]I work the pipe around in its fitting, to point [way of the elongated chimney pipe][stopping][if the vent is on-stage], across the alleyway[end if]."

Instead of entering the elongated chimney pipe when the vent is in the Weather Station:
	say "The pipe goes all the way over the alley below, but it's too spindly to take my weight!"

Instead of entering the elongated chimney pipe:
	say "There's not much point walking the pipe since it doesn't go anywhere."

Section 3 - Tarp as part of the pipe

Instead of taking the tarp when the tarp is incorporated by the elongated chimney pipe:
	move the tarp to the player;
	now the elongated chimney pipe is unwrapped;
	say "I whip the tarp off the pipe."

Rule for printing the description of the tarp when the tarp is incorporated by the elongated chimney pipe:
	say "The tarp is wrapped three or four times round the near end of the long bent pipe."

Instead of putting the tarp on the wrapped elongated chimney pipe:
	say "I did that already, remember?";

Part 10 - Observation Platform

Chapter 1 - Description

The Observation Platform is an exterior room. "[one of]I'm standing on a platform overlooking a roof covered in broken bricks to the north. A flight of metal steps lead down to the southeast, back to the weather station. A brass railing runs around the edge to stop anyone falling (I could use one of those for my bedroom).[or]The railed platform overlooks a littered roof to the north and steps lead southeast back to the weather station.[stopping]"

North from the Observation Platform is Rooftop 2.
Down from the Observation Platform is the Weather Station.

Instead of jumping in Observation Platform:
	try going north;

After going north from the Observation Platform:
	say "I swing myself over the railing, and land neatly on the roof below.";
	try looking;

Chapter 2 - Scenery

Section 1 - Brass Railing

The brass railing is scenery, in the Observation Platform. "The brass rail is well-polished and set about shoulder-height. I could easily climb over it to the roof below."

Understand "rail" as the railing.

Instead of climbing or jumping over or entering the brass railing:
	try going north;

Section 2 - Northern Roof

The northern roof is scenery, in the Observation Platform. "The roof to the north is gently sloped and lead-lined. It's been littered with clumps of brick by whoever built this tower."

Understand "rooftop", "roof-top", "roof top", "sloped", "lead", "lead-lined", "lined" as the northern roof.

Instead of jumping on the northern roof:
	try going north;

Section 3 - Glimpse of Weather Station

The glimpse of the weather station is a glimpse backdrop in the Observation Platform. It identifies the zephyrgraph. The printed name is "weather station". "The weather station is southeast of the platform, down some steps." Understand "step", "steps", "weather", "station" as the glimpse of the weather station. Instead of entering or climbing the glimpse of the weather station, try going down.

Chapter 3 - Telescope Mechanism

Section 1 - The Telescope Itself

The telescope is a pointer, eyeable, in the Observation Platform. "At the platform's centre is a metal telescope on a tripod that points [way of the telescope]. The tripod has a crank at its base[one of], much like the ones in the library and the one inside the clock's working. There must be a blacksmith somewhere who does nothing but make these cranks. I might be able to see him from here, too, since I've got a perfect view of the whole city[or], and the thing is set up to give a great view of the city[stopping]."

The description of the telescope is "The telescope is made of finely-moulded brass stamped with the crossed lightning of the Weather Guild. [one of]Often accused of non-mechanism – weather's just too temperamental - they tend to build machines that are overly complicated, like the ratchet-and-piston umbrella they sell in the Cathedral Yard market for nine hours a pop. So, the telescope[or]The[stopping] tripod has a crank and compass on the base, which presumably do the business of pointing.[paragraph break]Still, the view must be fantastic. I could look through the telescope to see. (It's currently pointing [way of the telescope])."

Understand "tripod", "mechanism" as the telescope.

The way of the telescope is east.

Instead of turning the telescope:
	say "No good trying to move it by hand. You can't back a gear against a gasket, as they say."

Instead of turning the telescope forwards: try turning the telescope.
Instead of turning the telescope backwards: try turning the telescope.

Instead of direction-setting the telescope to a direction:
	try turning the telescope;

Observing through the telescope is a rulebook.

Instead of looking through the telescope:
	consider the observing through the telescope rules;

Rule for observing through the telescope when the telescope points north:
	say "Looking north, St Philip stretches away to the mountains beyond. [run paragraph on]";	

Rule for observing through the telescope when the telescope points west:
	say "The huge clockface of the Cathedral – or a tiny portion of it – fills the eyepiece. [run paragraph on]";

Rule for observing through the telescope when the telescope points northwest or the telescope points southwest:
	say "The Cathedral's spires cut the view of the city beyond. [run paragraph on]";

Rule for observing through the telescope when the telescope points east or the telescope points southeast:
	say "Sunlight sparkles from the flickering surface of the Fugit, running down from the mountains towards the sea, far to the south. [run paragraph on]";

Rule for observing through the telescope when the telescope points northeast:
	say "The Abbey roof looks weathered and beaten this close up. [run paragraph on]";

Rule for observing through the telescope when the telescope points south:
	change balloon spotted to true;
	say "[one of]At first I think it's a fly on the lens, but when it doesn't move away I realise it's the Figure's ornithopter! Flying south, is he? [or]The Figure's ornithopter is clearly visible to the south. [stopping][run paragraph on]";

Balloon spotted is a truth state that varies. Balloon spotted is false.

Last observing through the telescope:
	if balloon spotted is false:
		say "But no sign of the Figure in this direction.";
	otherwise:
		say paragraph break;

Section 2 - Compass

The compass is a pointer, part of the telescope. The description is "The compass is a steel pointer riveted over the engraving of a compass on a brass disc at the telescope's base. Currently the pointer is set to [way of the compass][if the way of the compass is the way of the telescope]; the telescope points the same way[otherwise], while the telescope points [way of the telescope][end if]"

Understand "steel", "pointer", "brass", "disc", "engraving", "engraved" as the compass. The printed name is "compass".

The way of the compass is west.

Instead of turning the compass:
	try turning the compass backwards.

Instead of turning the compass backwards:
	try direction-setting the compass to anticlockwise of the way of the compass;

Instead of turning the compass forwards:
	try direction-setting the compass to clockwise of the way of the compass;

After direction-setting the compass to a direction:
	say "I flip the compass-pointer round to [way of the compass][one of]. It moves easily: well-oiled is well-placed, as they say.[or].[stopping]";

Section 3 - Crank

The large crank is part of the telescope. The description is "The large crank is attached to one leg of the tripod. There's presumably an Archimedes screw inside or something connecting it to the compass and the telescope up top."

Understand "handle" as the large crank.

Instead of turning the large crank when the way of the telescope is the way of the compass:
	say "The crank won't turn. Must be something wrong with the rest of the mechanism[one of].[or]. Something to do with the compass, maybe?[stopping]";

Instead of turning the large crank:
	now the way of the telescope is the way of the compass;
	say "[one of]Am I turning the crank or is the crank turning me? After a few rotations of whichever-it-is, I find I'm on a different side of the tower with both me and telescope facing [way of the telescope].[or]The crank turns and I find myself looking [way of the telescope].[or]This time, I turn the crank and pay attention to what's going on. It's not the telescope turning – it's the whole tower itself. That's the Weather Guild for you. The only thing that doesn't turn is the compass. Now we're pointing [way of the telescope], same as it.[or]The tower rotates so the telescope is now pointing [way of the telescope].[stopping]";

Section 4 - City View

A thing called the op_distant_city_view is scenery, privately-named, in Observation Platform. "The view isn't quite as incredible as from the minute hand of the clock, but I can still see the jumble of buildings, dipping slightly down as it approaches the River Tempus to one side, and the River Fugit on the other." The printed name is "city".

Understand "city", "whole", "river", "rivers", "tempus", "fugit", "building", "buildings" as the op_distant_city_view.

Instead of doing something when the op_distant_city_view is physically involved: say "The city is a lot, lot bigger than I thought it was - and it's a lot, lot bigger than me."

Part 11 - Weather Station

The Weather Station is an exterior room. "[one of]Good Grease! This roof is like a museum of meters! [or][stopping]Thermometers, barometers, precipitometers (these are just glass tubes open to catch the rain) and a zephyrgraph attached to a flight of metal stairs that lead up to a platform to the northwest. I can't see any other way off this roof, although there is a closed hatch underfoot. The wooden plank I used to get here is further off than I thought!"

Index map with Weather Station mapped south of Rooftop 4.

Instead of jumping in Weather Station:
	say "The wooden plank is too far away for me to reach now.";

Instead of making to leave in Weather Station:
	try going up.

Chapter 2 - Scenery

Section 1 - Chimneys

[Backdrop]

Section 2 - Rooftop / Bridge

The inaccessible board is scenery, privately-named, in the Weather Station. "The board sticks out over the alley below. It doesn't go half as far across as I thought it did when I took my jump. I'm glad I made it in one piece!"

Understand "board", "bridge", "plank", "solid", "wooden", "long" as the inaccessible board. The printed name of the inaccessible board is "bridge".

Instead of jumping on or entering the inaccessible board:
	say "[one of]I can see myself jumping from the roof-edge onto the board, and then going down as I land, and then pausing for a moment like a penduluum at the far end of its swing, and then pushing back up into the air again and catapulting off into space... so, no thanks. I'm staying here.[or]It's just too far for me to get onto safely.[stopping]"

Instead of doing something with the inaccessible board:
	say "It's too far from the edge of the roof to reach.";

Section 3 - Various meters

Some various meters are scenery, privately-named, in the Weather Station. "Thermometers, barometers, lots of stuff I can't read. The only one I understand is the zephyrgraph, which is pointing [way of the zephyrgraph].[if balloon spotted is false] But it's not going to tell me which way the Figure went.[end if]"

Understand "meters", "meter", "thermometer", "thermometers", "barometer", "barometers", "precipitometer", "precipitometers", "tube", "tubes", "glass tube", "glass tubes" as the various meters.

Instead of doing something when the meters are physically involved:
	say "[one of]I don't want to draw attention to myself by fiddling with them, do I?[or]These are delicate Holy Instruments, I shouldn't play with them![or]I'm not going to fiddle the meters. That would be wrong.[cycling]";

Instead of examining the various meters when the player's command includes "barometer/barometers":
	say "Barometers measure air pressure."

Instead of examining the various meters when the player's command includes "thermometer/thermometers":
	say "Thermometers measure air temperature."

Instead of examining the various meters when the player's command includes "precipitometer/precipitometers/tube/tubes":
	say "Precipitometers measure rainfall."

Section 4 - Metal steps

Some metal steps are an open door, scenery, not openable, northwest of the Weather Station, southeast of the Observation Platform. "A flight of metal steps, leading up to a platform."

Understand "stair", "stairs", "stairway", "flight of" as the metal steps.

Instead of going up in the Weather Station:
	try entering the metal steps;

Instead of climbing the metal steps:
	try entering the metal steps;

Section 5 - Hatch	

The hatch is a locked door, scenery, down from the Weather Station. "A locked metal hatch in the roof."

Instead of entering the hatch when the player's command includes "stand on":
	try jumping on the hatch.

Instead of jumping on the hatch:
	say "I'd make a racket and that might bring someone - which I don't want!"

Instead of opening or entering the hatch:
	say "It's locked from the inside[one of][or]. And with no keyhole[stopping].";

Instead of unlocking the hatch with something:
	say "It's locked from the inside[one of][or]. And with no keyhole[stopping].";

Instead of knocking on the hatch:
	say "Nobody answers."
	
Instead of attacking or pulling the hatch:
	say "The hatch doesn't even have a handle this side to yank on."
	
Instead of attacking the hatch with something:
	say "The boom from that might bring someone running - and it'd be all too easy for them to throw me off from here..."


Section 4 - Vent

The vent is scenery, hot air vent. "One end of the pipe I found. It's producing a steady billow of steam."

Understand "pipe", "steam", "piping", "smoke", "end", "hot steam/smoke", "chimney" as vent.

Instead of taking or turning or direction-setting the vent to:
	say "It's far too difficult to move from this end.";

Instead of putting the large tarp on the vent:
	say "I could wrap it up, but it'd be too cumbersome to move from this end anyway."

Section 5 - Spigot

The small spigot is a thing, fixed in place, in the Weather Station. "[if weather balloon is inflated]The inflated weather balloon bobs like an eager puppy beside the spigot it's tied to[else]In one corner, a small pipe emerges with a spigot on the end; it's next to (and tied to) a deflated weather balloon[end if]. [If the Weather Station contains the vent]Just above is my length of my piping, which is much more impressive: pumping out hot steam and smoke.[end if]"

The description of the small spigot is "A pipe sticks out of the roof and ends in a small spigot. It must be used for filling the balloon. The tap on the spigot is a flat screw-head, set flush with the pipe."

Understand "small", "pipe", "tap", "screw", "screwhead", "screw-head", "screw head" as the small spigot.

Instead of touching the spigot:
	say "It's not too hot, for whatever reason.";

Instead of opening, turning, or switching on the small spigot:
	say "The screw is set flat into the upper pipe, and my fingernail doesn't seem to be enough to get it to turn.";

Instead of unscrewing the small spigot with the lucky clock key:
	say "The edge of the key is too fat for the screw."	

Instead of unscrewing the small spigot with the small gear:
	say "The teeth of the gear are much too fat for the screw."

Instead of unscrewing the small spigot with the knife:
	say "[one of]I slip the knife-blade into the screw-head and turn. There's a brief hiss – then silence. I guess the hydrogen supply is off downstairs. Maybe the Abbot has finally cut the Weather Guild's funding. I close the tap up again.[or]No point trying again.[stopping]";

Before unlocking the small spigot with something:
	try unscrewing the small spigot with the second noun instead.
	
Instead of attacking the small spigot:
	say "That's no way to treat delicate equipment!"

Section 6 - Balloon

The weather balloon is scenery, in the Weather Station. "A small weather balloon. I suppose they use it to lift instruments up into the clouds – but it has a little basket underneath, and I might just be able to squeeze in. The Figure doesn't know what he's let himself in for with me, that's for certain. The balloon is currently [if inflated]full[otherwise]empty[end if], and is tied by a string to the pipe and the spigot."

First for supplying a missing second noun when untying the weather balloon from:
	change the second noun to the small spigot;	

Understand "basket", "string" as the weather balloon.

The weather balloon can be inflated or deflated. The weather balloon is deflated.

Instead of entering the deflated weather balloon:
	say "I try fitting myself into the basket. A squeeze – got to breathe in – but I'll just about go. I get out again, and that's nice too. So I just need to fill it up and I'm off!";

Instead of entering the inflated weather balloon:
	try untying the weather balloon from the small spigot instead;

Before fastening the weather balloon to something when the player's command includes "tie":
	say "The balloon's already tied to the spigot." instead.

Before fastening the weather balloon to the vent:
	try inserting the vent into the weather balloon instead.

Instead of taking the weather balloon:
	say "The basket is bigger than my armspan already, and then there's all the mess of fabric to make the balloon - I can't possibly carry it around. I wouldn't be able to see where I was going!"

Instead of putting the weather balloon on the vent:
	try inserting the vent into the weather balloon;

Instead of putting the weather balloon on the small spigot:
	try inserting the small spigot into the weather balloon;

Instead of filling the weather balloon:
	say "How? You want me to read the Abbey dictates at it until it's had enough hot air?";

Instead of inflating the weather balloon:
	try filling the weather balloon;

Instead of fastening the weather balloon to the small spigot:
	try inserting the small spigot into the weather balloon instead.

Instead of inserting the small spigot into the weather balloon:
	say "There's no gas coming from the spigot.";

Instead of inserting the vent into the inflated weather balloon:
	say "The balloon is already inflated, and ready for take-off!";

Instead of inserting the vent into the deflated weather balloon:
	now the weather balloon is inflated;
	say "Pulling and shoving by turns, I get the mouth of the balloon over to the steam-vent – and then in an instant, it's as light as a feather, easy to handle, bulging a little, bobbing up into the air, and before I know it, it's popped off the vent again and the little balloon is straining on the end of its rope, waiting to be released!";

Ballooning rules is a rulebook.

A ballooning rule when the balloon is deflated:
	say "The balloon's not going anywhere without any gas in it. And if I ever find a way to fill it, I'm going to want it to be tied down!" instead;

A ballooning rule when balloon spotted is false:
	say "[one of]I'm not so sure about that – just shoot up, and hope to catch the Figure by chance? I need to know which way he went and make sure I'm going that way.[or]I'm not just throwing myself to the winds. I want to know which way he went.[stopping]" instead;

A ballooning rule when the way of the zephyrgraph is not south:
	say "The Figure's heading south – the zephyrgraph is pointing [way of the zephyrgraph]. I'd be loosescrew to launch now!" instead;

Rule for supplying a missing second noun when untying the weather balloon from:
	change the second noun to the small spigot;

Instead of untying the weather balloon from the vent:
	try untying the weather balloon from the small spigot instead;

Instead of untying the weather balloon from the weather balloon [we take this to mean "basket" from "balloon" ]:
	say "The basket is pretty firmly connected to the balloon. I don't think I can get them apart."

Instead of slicing the weather balloon with the knife:
	say "I don't see how shredding the balloon is going to help it fly."

Instead of untying the weather balloon from the small spigot:
	abide by the ballooning rules; [i.e. stopping if a test fails]
	say "I untie the rope but leave it looped around the pipe, and keep a tight hold while I squeeze myself into the basket. Then, with a final check of the zephyrgraph I let go. The balloon whisks up into the sky, the basket spinning around and around. The city below a whirl of colours, like a Newtonsday Catherine Cog firework. I'm starting to feel giddy – but I'm making progress. The south wind is behind me like a gale and the dark blot of the ornithopter is closer by the second. In a few moments I'll be alongside, close enough to grab the side of his craft and hang on![paragraph break]The Figure must have seen me. The ornithopter is tilting up - moving higher. Then it drops suddenly. Whirling blades pass by within inches of my face. [i]Tried to get me?[r] I'm thinking. [i]You'll have to try harder than that![r] I catch a glimpse of that shadowy hood behind the controls and then I realise - the Figure wasn't trying to get me. The Figure was trying to shred the balloon.[paragraph break]For a moment, I'm still going up. Then I'm hanging there, perfect equilibrium. And then gravity takes hold. There's nothing for it. I'm falling. The clutter of rooftops rushes closer and closer. [i]You've really done it this time, Wren[r][paragraph break]A smash –[paragraph break]- splintering glass –[paragraph break]- someone thumps me on the back. Drake, here? -[paragraph break]- The wind is knocked from me –[paragraph break]- [i]good stuff, Wren. Just like clockwork.[no line break][r]";
	end a chapter;
	move the player to the feather bed;

Before approaching or entering the ornithopter when the weather balloon is inflated and the player is in Roofs of the City:
	try approaching the escaping Figure instead.

Before approaching or entering the ornithopter when the weather balloon is deflated and the Weather Station has been visited:
	try approaching the escaping Figure instead.

Before approaching the escaping Figure when the weather balloon is inflated and the player is in Roofs of the City:
	if the player is in the weather balloon:
		try untying the weather balloon from the small spigot instead;
	say "I just need to hop in the balloon and get going!" instead.
 
Before approaching the escaping Figure when the weather balloon is deflated and the Weather Station has been visited:
	say "I need to find a way of filling that balloon." instead.

Section 6b - Glimpse of weather balloon for navigation

The glimpse of the weather balloon is a glimpse backdrop. It identifies the weather balloon. Understand "weather", "balloon" as the glimpse of the weather balloon. "The weather balloon is all ready to go."

Every turn when balloon spotted is true:
	if the location is the Weather Station: [ avoid noun doubling up ]
		remove the glimpse of the weather balloon from play;
	else if the glimpse of the weather balloon is off-stage:
		move the glimpse of the weather balloon to the Roofs of the City.


Section 7 - Zephyrgraph

The zephyrgraph is a pointer, scenery, in the Weather Station. "A zephyrgraph is a small sheet of metal carefully crafted to look like a clock-hand, that's free to turn depending on the wind-direction. (Some people call it a 'weather vane'). It's currently pointing [way of the zephyrgraph]."

Understand "weathervane", "weather vane", "vane" as the zephyrgraph.

The way of the zephyrgraph is southeast.

C_WIND_DIRECTION is a counter. The top end is 4. The internal value is 2;

Every turn when the player can see the zephyrgraph:
	increment C_WIND_DIRECTION;

Rule for firing C_WIND_DIRECTION:
	let the available winds be {south, southeast, east};
	let x be the way of the zephyrgraph;
	remove x from the available winds, if present;
	sort the available winds in random order;
	change the way of the zephyrgraph to entry 1 of the available winds;
	say "[one of]The wind snaps the zephyrgraph round to point [way of the zephyrgraph].[or]The zephyrgraph moves to point [way of the zephyrgraph].[or]The zephyrgraph changes to [the way of the zephyrgraph].[at random]";

After firing C_WIND_DIRECTION:
	change the top end of C_WIND_DIRECTION to a random number from 1 to 3;

Instead of setting or turning the zephyrgraph:
	say "That wouldn't change the weather, but it'd be great it if did."

Instead of direction-setting the zephyrgraph to:
	try turning the zephyrgraph;

Instead of turning the zephyrgraph forwards:
	say "That wouldn't change the weather, but it'd be great it if did."

Instead of turning the zephyrgraph backwards:
	say "That wouldn't change the weather, but it'd be great it if did."

Instead of doing something when the zephyrgraph is physically involved:
	say "The zephyrgraph is too high up to reach.";

Book 6 - Covalt's Clock Shop

Part 0 - Covalt's Introduction Scene

Covalt's Introduction is a scene. Covalt's Introduction begins when the location is Covalt's Bedroom. Covalt's Introduction ends when the location is the Clock Shop.

Instead of entering Covalt during Covalt's Introduction: [yikes]
	try going north.

Part 1 - Bedroom

Chapter 1 - Description

The Covalt's Bedroom is a room. [deliberate use of definite article so as to print "The Bedroom" in text substitutions.] "[one of]I'm lying on a large feather bed, surrounded by broken glass and the wreckage of the hot air balloon. Not that this place wasn't messy to start with: it looks like less of a bedroom and more of a bird's nest. I can barely see the door to the north through all the clutter - [or]This must be the giant's bedroom, where he flings things around, rips them up, and pulls small children apart for fun. The only escape is the door to the north – or the skylight, but that's high above the bed, and plugged solid with wrecked balloon.[stopping]"

The printed name of Covalt's Bedroom is "Bedroom".

Instead of going north from Covalt's Bedroom when the player can see Covalt and the Clock Shop is not visited:
	say "There's no way I'm slipping past. He's got both his beady eyes on me, and so do his ravens.";

Instead of making to leave when in Covalt's Bedroom: try going north.



Chapter 2 - Event on Entry

After looking in Covalt's Bedroom when TRIG_COVALT1 is unfired:
	fire TRIG_COVALT1

TRIG_COVALT1 is a trigger.

Rule for firing unfired TRIG_COVALT1:
	say "- until it's flung back and suddenly, there's a giant standing there, wielding a metal club above his head and roaring at me. On either shoulder sits a dirt-coloured raven, cawing and pecking the air. 'Who are y[']?' he demands, his voice booming like a cannon. 'What d'y'do to my ceiling, [i]interloper[r]?'";
	move Covalt to Covalt's Bedroom;

Chapter 3 - Scenery

Section 1 - Feather bed

A feather bed is scenery, an enterable supporter, in Covalt's Bedroom. "The large feather bed has a dent in the middle deep enough for me to disappear in."

Instead of hiding from view during Covalt's Introduction:
	say "I cower back a little."

Instead of hiding under the feather bed during Covalt's Introduction:
	say "He's right there! I can't hide!";

Instead of standing on the feather bed when the player is not on the feather bed:
	say "Even then I couldn't reach the skylight, and I don't think the giant would like it.";

After getting off the feather bed:
	say "I get down off the bed.";

Instead of looking under the feather bed during Covalt's Introduction:
	say "There's no way out down there!"

Instead of looking under the feather bed when Covalt's Shop Hunt is happening and TRIG_DIAGRAM_FOUND is unfired:
	now the state of Covalt is 4;
	say "There's the diagram! I take it back to Covalt.";
	move the player to the Clock Shop;
	fire TRIG_DIAGRAM_FOUND;

Rule for writing a paragraph about Covalt when the state of Covalt is 4 and TRIG_DIAGRAM_FOUND is unfired: [ we're just coming in from bedroom with diagram! ]
	now Covalt is mentioned;

Instead of looking under the feather bed:
	say "There's probably more clock parts down there, but it might be rude to look."

Instead of jumping on the feather bed during Covalt's Introduction:
	say "What, in case I haven't annoyed him enough?"

Instead of jumping on the feather bed:
	say "That looks like fun - if I did it on my own bed I'd go through the floor. But, I'd rather not get anyone round here angry..."


Section 2 - Wreckage

The wrecked skylight is scenery, in Covalt's Bedroom. "Fragments of skylight have ripped the balloon into rags of cloth. Bits of basket and wire trail down. It's in a state."

Understand "balloon", "weather balloon", "basket", "bits", "wire", "wires", "rags", "cloth", "ruined", "ruined", "window", "wreck", "wreckage" as the wrecked skylight

Instead of doing something when the wrecked skylight is physically involved:
	say "The skylight where the balloon dangles is too far overhead. This room's tall enough for a giant, after all.";

Instead of repairing the wrecked skylight:
	say "[one of]It's in a total state: not Sad Depreciation so much as Total Annihilation[or]No chance. It's wrecked[stopping]."

Instead of entering the wrecked skylight during Covalt's Introduction:
	say "There's no way out that way - I'm stuck down here."

Instead of entering the wrecked skylight:
	say "This is a giant's room, remember. The skylight is way out of reach."

Instead of going up in Covalt's Bedroom:
	try entering the wrecked skylight.

Section 3 - Ravens

Some ravens are an animal, carried by Covalt. Understand "bird", "birds", "black", "crow", "crows", "hugin", "mummin", "munin" as the ravens.

To say raven-blurb:
	say "Two mechanical ravens, ink-black and beautifully crafted[one of]. Their wings are real feathers, each one fitted to the bodies by tiny, almost invisible brass joints. They are beautiful creations and move almost like real birds. Better, maybe[or][stopping]. " 

Rule for printing the description of the ravens when the state of Covalt is 1:
	say "[raven-blurb] The ravens sit one to a shoulder and eye me viciously.";

Rule for printing the description of the ravens when the state of Covalt is 2:
	say "[raven-blurb] The ravens are flapping and chittering, clearly agitated.";

Rule for printing the description of the ravens when the state of Covalt is 3:
	say "[raven-blurb] One of the ravens has climbed onto Covalt's head. The other is battling for the place.";

Rule for printing the description of the ravens when the state of Covalt is 4:
	say "[raven-blurb] The ravens have taken wing and are flapping round madly in a tiny space above Covalt's head. He doesn't seem to notice.";

Rule for printing the description of the ravens when the state of Covalt is 5:
	say "[raven-blurb] The ravens have settled again, both together on the same shoulder, with looks of icy determination.";

Instead of attacking or taking or pushing or turning or touching the ravens when the state of Covalt is less than 5:
	say "[one of]They look like they'd clean take my fingers off.[or]But they look [i]mean[r].[cycling]"

Instead of doing something when the ravens are physically involved and the state of Covalt is 1:
	say "No chance. They're clearly his.";

Instead of doing something when the ravens are physically involved and the state of Covalt is 2:
	say "No chance. They're clearly his.";

Instead of doing something when the ravens are physically involved and the state of Covalt is 3:
	say "The ravens look about ready to pluck out an eye they're so excited. I'm staying well clear.";

Instead of doing something when the ravens are physically involved and the state of Covalt is 4:
	say "The ravens are all over the place. Best avoided!";

Instead of doing something when the ravens are physically involved and the state of Covalt is 5:
	say "The ravens nip at my fingers.";


Chapter 4 - Covalt

Covalt is a man, privately-named, not proper-named.

Covalt has a number called the state. The state of Covalt is 1.

Understand "giant", "man", "huge" as Covalt.
Understand "Covalt" as Covalt.

Rule for printing the name of Covalt when Covalt is not proper-named:
	say "giant";

Rule for printing the name of Covalt when Covalt is proper-named:
	say "Covalt";

Section 1 - Initial Appearances

Rule for writing a paragraph about Covalt when the state of Covalt is 1:
	say "In the doorway is the giant, demanding to know what I'm doing.";

Rule for writing a paragraph about Covalt when the state of Covalt is 2:
	say "In the doorway is Covalt, as unbudgeable as a stone but as scary as a bear.";

Rule for writing a paragraph about Covalt [other times]:
	say "Covalt himself stands near the bedroom door to the [if the location is the Clock Shop]south[else]north[end if].";

Rule for writing a paragraph about Covalt when the state of Covalt is 4:
	say "Covalt is standing by the door to the [if the location is the Clock Shop]south[else]north[end if], deep in thought.";

Section 2 - Descriptions

Rule for printing the description of Covalt when the state of Covalt is 1:
	say "The giant is six-and-a bit feet of solid bone and grime. His overalls are oil-covered and in one hand he's clutching a clock-weight heavy enough to concuss a horse. Two mechanical ravens guard his shoulders.";

Rule for printing the description of Covalt when the state of Covalt is 2:
	say "Covalt is eyeing me intently, demanding to know more. He's still blocking the doorway. His ravens are backing him up with icy glares.";

Rule for printing the description of Covalt when the state of Covalt is 3:
	say "Covalt is casting about, swinging his gigantic chin this way and that like some enormous clock-weight. He's looking for his diagram. The ravens are clinging onto his clothes.";

Rule for printing the description of Covalt when the state of Covalt is 4:
	say "Covalt is deep in thought. The ravens have their heads together, almost thinking with him.";

Rule for printing the description of Covalt when the state of Covalt is 5:
	say "Covalt seems to have relaxed a bit, and now looks only big, and not as colossal as he did before. I can see now how delicate his fingers are and how sharp his eyes. No brute after all.";

Section 3 - Possessions

The penduluum weight is carried by Covalt. The description is "It'd be an unholy thing to be hit by, in more ways than one." Understand "pendulum" as the penduluum weight.

Instead of pulling or pushing or taking the penduluum weight:
	say "He'd brain me with it in a second if I tried."

Chapter 4 - Conversation Tables

Section - 0 - Converting some actions into conversation

Instead of saying sorry during Covalt's Introduction:
	try asking Covalt about "sorry".

Instead of asking Covalt to try saying sorry:
	try asking Covalt about "sorry".
	

Section 1 - When Angry

Table of angry Covalt conversation
conversation			topic
CT_COV_1_MYSELF			"[me]"
CT_COV_1_BALLOON		"balloon" or "skylight" or "ceiling" or "wreckage" or "wreck" or "window" or "weather balloon"
CT_COV_1_ABBEY			"[abbey]" 
CT_COV_1_CATHEDRAL		"[cathedral]"
CT_COV_1_ABBOT			"[abbot]"
CT_COV_1_FIGURE			"[figure]" or "chase"
CT_COV_1_ARCHBISHOP		"[archbishop]"
CT_COV_1_PEOPLE			"[abbeyfolk]" or "[sa'at]"
CT_COV_1_COVALT			"giant" or "[himself]"
CT_COV_1_RAVENS			"ravens" or "his ravens" or "hugin" or "mummin"
CT_COV_1_CLOCKWORK		"time" or "[clockwork]" or "[saints]"
CT_COV_1_SORRY			"sorry" or "apologise" or "apologies"
CT_COV_1_PERPETUUM		"[plot]" or "[perpetuum]"
CT_COV_1_PENDULUUM	"pendulum" or "penduluum" or "weight" or "hit me" or "hurt me"

Rule for choosing the conversation table of Covalt when the state of Covalt is 1:
	change the chosen conversation table to the table of angry Covalt conversation;

CT_COV_1_MYSELF is a conversation topic. The enquiry text is "Where to begin? 'I'm Wren,' I tell him.". The response text is "'Never mind that,' he growls. 'What you doing in that thing?' He points at the balloon wreckage.".

CT_COV_1_BALLOON is a conversation topic. The enquiry text is "'I was up in a balloon, chasing...'". The response text is "His face boils. 'Chasing after what?' he demands. 'Moonbeams and rainbows? I don't believe a word!'".

CT_COV_1_ABBEY is a conversation topic. The enquiry text is "'I come from the Abbey. I overheard something.'". The response text is "'Smash up my shop, was it?' he demands fiercely. 'Who told you to do that?'".

CT_COV_1_CATHEDRAL is a conversation topic. The enquiry text is "'It was in the Cathedral,' I try. 'I climbed up onto the roof and then...'". The response text is "'Why'd'y' do a thing like that?' he demands. 'You a crazy rasp, are y[']?'".

CT_COV_1_ABBOT is a conversation topic. The enquiry text is "'The Abbot, you see. He's in on in it!'". The response text is "'You weren't chasing no Abbot about on the roof,' the giant growls in reply. 'So talk some truth before I snap your arms.'"

CT_COV_1_FIGURE is a conversation topic. The enquiry text is "'I was chasing a... a Figure. A Figure in Grey.'". The response text is "His eyes snap to attention. 'A Figure in Grey? Lean? Tall? No face?'[paragraph break]'Under a hood.'[paragraph break]'Aye, like a clock in a dark corner.' He eases up a bit, though he's clearly worried. 'I've seen your Figure. Came into my shop wanting something made. Came to pester old Covalt... But what did he want? Why were you chasing him, eh?'"

After firing CT_COV_1_FIGURE:
	change the state of Covalt to 2;
	now Covalt is proper-named;

CT_COV_1_ARCHBISHOP is a conversation topic. The enquiry text is "'I tried to tell the Archbishop...'". The response text is "'Don't go quoting church names here,' he grumbles. 'Tell me straight or I'll straighten out your neck.'"

CT_COV_1_PEOPLE is a conversation topic. The enquiry text is "I don't think he'd know them."

Last after firing CT_COV_1_PEOPLE:
	now CT_COV_1_PEOPLE is not fired;

CT_COV_1_COVALT is a conversation topic. The enquiry text is "'Who are you?' I ask.". The response text is "'I'm the man whose bed you've broken, whose window you've smashed, and who's about to break your skull. That a good enough answer? Now you give me in return.'"

CT_COV_1_RAVENS is a conversation topic. The enquiry text is "'I like your ravens,' I try.". The response text is "'They eat meat,' he snaps back."

CT_COV_1_CLOCKWORK is a conversation topic. The enquiry text is "'I'm interested in clockwork,' I say.". The response text is "'Don't go changing the bells,' he warns you. 'I want to know what you're doing here, and don't tell me you're on no researching trip, because then you'd have come in using the front door like anyone else.'"

CT_COV_1_SORRY is a conversation topic. The enquiry text is "'I'm sorry about your window.'". The response text is "'You will be,' he promises. 'But you've got a reason and I want that more than I want your pity.'"

CT_COV_1_PERPETUUM is a conversation topic. The enquiry text is "'They were stealing – I mean, going to steal. Planning...'". The response text is "'There's a [i]they[r], is there?' he demands. 'Because I only see one street-rat breaking my stuff. So you'd better tell me who they are and faster than that.'"


CT_COV_1_MYSELF is clustered with CT_COV_1_BALLOON, CT_COV_1_ABBEY, CT_COV_1_CATHEDRAL, CT_COV_1_ABBOT, CT_COV_1_FIGURE, CT_COV_1_ARCHBISHOP, CT_COV_1_PEOPLE, CT_COV_1_COVALT, CT_COV_1_RAVENS, CT_COV_1_CLOCKWORK, CT_COV_1_SORRY, CT_COV_1_PERPETUUM, CT_COV_1_PENDULUUM.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_COV_1_MYSELF:
	say "I've already talked to him about that." instead;

section 1b - once only conversation for Covalt

CT_COV_1_PENDULUUM is a conversation topic. The enquiry text is "'Please don't hit me that thing,' I plead." The response text is "He looks at me with brows like drawn thunder. 'I'll do more than hit you. I'll grind you to powder if you don't tell me what you're doin' fallin' through my roof.'"

Rule for firing fired CT_COV_1_PENDULUUM:
	say "I've already talked to him about that." instead.

Section 2 - When Cautious

Table of cautious Covalt conversation
conversation			topic
CT_COV_2_MYSELF		"[me]"
CT_COV_2_BALLOON		"balloon" or "skylight" or "wreckage" or "wreck" or "window" or "weather balloon"
CT_COV_2_ABBEY		"[abbey]" 
CT_COV_2_ARCHBISHOPCATHEDRAL		"[cathedral]" or "[archbishop]"
CT_COV_2_ABBOTFIGURE	"[abbot]" or "[figure]" or "chase"
CT_COV_1_PEOPLE		"[calvinanddrake]" or "[horloge]" or "[reloh]" or "[sa'at]" or "cook"
CT_COV_2_COVALT		"giant" or "[himself]"
CT_COV_2_RAVENS		"ravens" or "his ravens" or "hugin" or "mummin"
CT_COV_2_CLOCKWORK		"time" or "[clockwork]" or "[saints]"
CT_COV_2_SORRY			"sorry" or "apologise" or "apologies"
CT_COV_2_PERPETUUM		"[perpetuum]" or "[plot]"
CT_COV_1_PENDULUUM	"pendulum" or "penduluum" or "weight" or "hit me" or "hurt me"
CT_COV_2_DONTKNOW		"dunno" or "don't/can't/dont/cant know/remember" or "no idea" or "who cares"


Rule for choosing the conversation table of Covalt when the state of Covalt is 2:
	change the chosen conversation table to the table of cautious Covalt conversation;

CT_COV_2_MYSELF is a conversation topic. The enquiry text is "'I've been running,' I clamour, 'and clinging on, and jumping...'". The response text is "'Yes, and whatever for?' he demands. 'You don't go throwing y'self off things unless there's something below you're after. So what is it?'".

CT_COV_2_BALLOON is a conversation topic. The enquiry text is "'I was chasing the Figure over the roof. He took off,' I explain. 'I tried to follow in this... the balloon.'". The response text is "'That's a crazy thing to do,' Covalt growls. 'So why'd y'do it? What's the counterweight, eh?'".

CT_COV_2_ABBEY is a conversation topic. The enquiry text is "'I overhead him in the Abbey. Discussing a plot.'". The response text is "'What plot?' Covalt demands. 'I don't call your crashing in [']ere a plot.'".

CT_COV_2_ABBOTFIGURE is a conversation topic. The enquiry text is "'The Figure and the Abbot. They were plotting something. Planning to steal..'". The response text is "'Steal what?' Covalt demands, brandishing the pendulum. 'They're after something – what's it? Unless you're a lying grit-stone who doesn't finish his stories. What are they [i]after[r]?'".

CT_COV_2_ARCHBISHOPCATHEDRAL is a conversation topic. The enquiry text is "'I tried to tell the Archbishop about it, but I didn't know what they were out to steal then.'". The response text is "'So?' he demands. 'What are they out to steal?'".

CT_COV_2_COVALT is a conversation topic. The enquiry text is "'Who are you?' I demand. 'How do I know you're not with them?'". The response text is "'Whoever they are,' he spits back, 'I'm a clockmaker. That's enough for you, for now.'".

CT_COV_2_RAVENS is a conversation topic. The enquiry text is "'Are your ravens real?'". The response text is "'You can see them, can't you?' he snaps back. 'Can't be made up then, can they?'".

CT_COV_2_CLOCKWORK is a conversation topic. The enquiry text is "'Does everything here run on clockwork?'". The response text is "'The whole world's on it, that's what they say. I know everything I make does, that's enough for me.'".

CT_COV_2_SORRY is a conversation topic. The enquiry text is "'I'm really sorry about your roof,' I say.". The response text is "'If you were chasing that Figure – well. You're lucky it's only the window you broke up. But you still aren't saying what you're chasin['] him for.'".

CT_COV_2_PERPETUUM is a conversation topic. The enquiry text is "'It's the Perpetuum,' I tell him. 'I'd never seen it before today, but that's what they're after.'". The response text is "'I'm not surprised,' Covalt replies. To my great relief, he lowers the club. 'That's what this Figure was after here, too, before. When I saw him. Come here asking me to build one. I might be the best – and the bravest, I told him – but I can't build a Perpetuum. Laws say, as I read them, that you can't have more than one.'[paragraph break]'But what [i]is[r] it?' I ask. 'What does it do?'[paragraph break]'I've got a design somewhere. A diagram. Shouldn't do, but I do. Somewhere through here. Come on!' He picks me up by the scruff and lobs me through the doorway.".

After firing CT_COV_2_PERPETUUM:
	change the state of Covalt to 3;
	move the player to the Clock Shop;
	say "'Now, that diagram,' Covalt mutters, and starts nosing around in the clutter that fills the room.";
	move Covalt to the Clock Shop;

Every turn when the state of Covalt is 2 and CT_COV_2_ABBOTFIGURE has been fired for four turns:
	say Covalt knows what;

To say Covalt knows what:
	say "Suddenly, the giant lowers his club. His brow is thickly knotted, like old rope. 'I'll tell you what they're after,' he grumbles to himself. 'The Figure, when he came in here, he were asking for something. A Perpetuum. That's it, ain't it? A Perpetuum. I told him I couldn't do it. Laws say, as I read them, you can't have more than one.'[paragraph break]The Perpetuum. Of course, that's what the Figure said.[paragraph break]'But what [i]is[r] it?' I ask. 'What does it do?'[paragraph break]'I've got a design somewhere. A diagram. Shouldn't do, but I do. Somewhere through here. Come on!' He picks me up by the scruff and lobs me through the doorway.";
	change the state of Covalt to 3;
	move the player to the Clock Shop;
	say "'Now, that diagram,' Covalt mutters, and starts nosing around in the clutter that fills the room.";
	move Covalt to the Clock Shop;
	
CT_COV_2_DONTKNOW is a conversation topic. The enquiry text is "'I don't know! I don't know what they're after!' I insist.". The response text is "[Covalt knows what][run paragraph on]".

CT_COV_2_MYSELF is clustered with CT_COV_2_BALLOON, CT_COV_2_ABBEY, CT_COV_2_ARCHBISHOPCATHEDRAL, CT_COV_2_ABBOTFIGURE, CT_COV_2_COVALT, CT_COV_2_RAVENS, CT_COV_2_CLOCKWORK, CT_COV_2_SORRY, CT_COV_2_PERPETUUM, CT_COV_2_DONTKNOW.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_COV_2_MYSELF:
	say "I've already talked to him about that." instead;

Section 3 - When Searching

Table of searching Covalt conversation
conversation			topic
CT_COV_3_MYSELF		"[me]"
CT_COV_3_BALLOON		"balloon" or "skylight" or "wreckage" or "wreck" or "window" or "weather balloon"
CT_COV_3_ABBEY		"[abbey]" 
CT_COV_3_ARCHBISHOP	 "[archbishop]"
CT_COV_3_CATHEDRAL		"[cathedral]"
CT_COV_3_ABBOT		"[abbot]"
CT_COV_3_FIGURE		"[figure]"
CT_COV_1_PEOPLE		"[calvinanddrake]" or "[horloge]" or "[reloh]" or "[sa'at]" or "cook"
CT_COV_3_COVALT		"giant" or "[himself]"
CT_COV_3_RAVENS		"ravens" or "his ravens" or "hugin" or "mummin"
CT_COV_3_CLOCKWORK		"time" or "[clockwork]"
CT_COV_3_SAINTS		"[saints]"
CT_COV_3_SORRY		"sorry" or "apologise" or "apologies"
CT_COV_3_PERPETUUM		"[perpetuum]" or "[plot]"
CT_COV_3_HERESY		"designs" or "heresy" or "designs" or "heresies" or "heretical" or "future"
CT_COV_1_PENDULUUM	"pendulum" or "penduluum" or "weight" or "hit me" or "hurt me"
CT_COV_3_DIAGRAM	"diagram" or "blueprint" or "design" or "chart" or "paper" or "looking/searching/hunting for" or "you/he after"
CT_COV_3_SHOP		"shop" or "workshop" or "room" or "store"



Rule for choosing the conversation table of Covalt when the state of Covalt is 3:
	change the chosen conversation table to the table of searching Covalt conversation;

CT_COV_3_MYSELF is a conversation topic. The enquiry text is "'I'm going to get killed when they find out I'm gone.'". The response text is "'That's no-sense,' he replies. 'They can't kill you while you're gone, can they? And you come back with that Figure's head on a stick, they'll thank-you. Except the Abbot, maybe. Or maybe including.'".

CT_COV_3_BALLOON is a conversation topic. The enquiry text is "'I'd pay for the skylight...' I begin.". The response text is "'But you've got less to your name than my cousin K. I see it. Rat.'".

CT_COV_3_ABBEY is a conversation topic. The enquiry text is "'They never told us about the Perpetuum at the Abbey.'". The response text is "'Not yet, maybe. As secrets go – mysteries – it's a deeper one. Deep in all this junk, too,' he adds, scornfully.".

CT_COV_3_CATHEDRAL is a conversation topic. The enquiry text is "'I was in the Cathedral earlier,' I tell him. 'I saw the Perpetuum.'". The response text is "'Not much to look at,' he says dismissively. 'Like most of us. It's the workings that count.'".

CT_COV_3_ABBOT is a conversation topic. The enquiry text is "'I can't believe the Abbot would steal!'". The response text is "'HE must think he knows what he's doing,' Covalt muses. 'Nothing happens at random.'[paragraph break]'Apart from me overhearing this,' I say.[paragraph break]'Aint no chances in that,' he grumbles. 'Nor in my skylight you falling through. Covalt the heretic: we're well matched, you and me.'".

CT_COV_3_FIGURE is a conversation topic. The enquiry text is "'Who is the Figure?'". The response text is "'No idea,' Covalt says simply. 'Not a tooth of one. Couldn't see his face. But you find me this diagram and I'll show you what he's after.'".

CT_COV_3_ARCHBISHOP is a conversation topic. The enquiry text is "'I tried to tell the Archbishop.'". The response text is "'Might as well try shouting to a thundercloud,' Covalt says. 'Or turn a rat into a ratchet. I tried to stick him on my new devices. Heretical, he said. So. Some things can't be done.'".

CT_COV_3_COVALT is a conversation topic. The enquiry text is "'Who are you?'". The response text is "'A clockmaker. An inventory. Aint meant to do both,' he smiles. 'But they're a little too scared to stop me. Besides, I'm the only one who knows how to mend the rose clock up, so, they call me heretic but they need me to keep both thumbs.'".

CT_COV_3_RAVENS is a conversation topic. The enquiry text is "'Do your ravens have names?'". The response text is "'Course they do. Hugin. Mummin. If that ain't old Celtic for hours and minutes, well, it should be.'".

CT_COV_3_CLOCKWORK is a conversation topic. The enquiry text is "'How long have you been doing clockwork?'". The response text is "He waves an arm around the room, nearly taking my head with it. 'Takes a lifetime to build up this. I trained in Geneva. To be a monk. Didn't like it. Couldn't see why I couldn't swing clock parts and, well. Sorry.' His thick cheeks turn a little red. 'Maybe you're too young for a full life story.'".

CT_COV_3_SAINTS is a conversation topic. The enquiry text is "'Who were the Saints?'". The response text is "'People like me,' Covalt says, brazenly. 'Only when they built something new, they weren't heretics they were geniuses. I should show you my new designs. I should. But if I did, I'd have to kill you.' He grins sharply.".

CT_COV_3_SORRY is a conversation topic. The enquiry text is "'I'm sorry...'". The response text is "'Oh, stop your whimpering,' he scolds. 'Find that diagram so I can show you this Perpetuum.'".

CT_COV_3_PERPETUUM is a conversation topic. The enquiry text is "'What is the Perpetuum?'". The response text is "'A relic. Of a time they made impossible things. It'll be easier with the diagram, I can't explain anything without a diagram.' Same as Brother Horloge says.".

CT_COV_3_HERESY is a conversation topic. The enquiry text is "'What were your new designs?'". The response text is "'Well,' he says, pausing to look flattered. 'Mostly voltaics. Wires, filaments. Was thinking about candles, see. Nothing clockwork in a candle, is there?'[paragraph break]I mention the candles on tracks in the Abbey, and he nods.[paragraph break]'See? They've built that [i]because[r] there's no clockwork in candles. Well. I was working on that. Fixing it. But.' He draws a long breath. 'The Church sent me a very nice letter about it and I decided to stop. And you tell them that when you get back, won't you. There's a good sprat.'".

CT_COV_3_DIAGRAM is a conversation topic. The enquiry text is "'What's this diagram we're looking for?' I ask." The response text is "'Stupid question,' he growls. 'I'll show you when we find it, won't I?'"

CT_COV_3_SHOP is a conversation topic. The enquiry text is "'So this is your shop?' I ask him." The response text is "'Absolutely. Built it up from good as nothing. Started out mending pocket watches off the back of a crate by the docks. And now...' He shrugs. 'Well, I'm not a lot better off. But I'm better at clocks.'"


CT_COV_3_MYSELF is clustered with CT_COV_3_BALLOON, CT_COV_3_ABBEY, CT_COV_3_ARCHBISHOP, CT_COV_3_CATHEDRAL, CT_COV_3_ABBOT, CT_COV_3_FIGURE, CT_COV_3_COVALT, CT_COV_3_RAVENS, CT_COV_3_CLOCKWORK, CT_COV_3_SORRY, CT_COV_3_PERPETUUM, CT_COV_3_HERESY, CT_COV_3_SAINTS, CT_COV_3_DIAGRAM, CT_COV_3_SHOP.
.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_COV_3_MYSELF:
	say "I've already talked to him about that." instead;

Section 3 (continued) - Enquiring about clock shop clutter

After enquiring of Covalt about something:
	carry out the choosing the conversation table activity with Covalt;
	carry out the choosing the conversation topic activity;
	carry out the speaking with activity with Covalt instead;	

Rule for choosing the conversation topic when we are enquiring of Covalt about something and the state of Covalt is 3:
	change the chosen conversation topic to the conversation corresponding to a hiding place of the second noun in the table of Covalt's Interesting Items;

Table of Covalt's Interesting Items
conversation			hiding place
CT_COV_CLUTTER		the junk
CT_COV_SHELVES		the rack of shelves
CT_COV_TABLE			the solid table
CT_COV_CLOCKS		the assorted clocks
CT_COV_WORKBENCH		the workbench
CT_COV_TOOLS			the tools
CT_COV_CLOCKPARTS		the clock parts
CT_COV_WATERCLOCK		the water clock
CT_COV_BATTERIES		the battery
CT_COV_BIBLE			the well-thumbed bible
CT_COV_PENDULUMS		the wall of pendulums
CT_COV_MONKEY		the mechanical monkey
CT_COV_DEVICE			the strange device
CT_COV_TOFFEE		the butter toffee 
CT_COV_PAPERS		the sketch papers
CT_COV_DOOR			the clock shop door

A clutter topic is a kind of conversation topic. The enquiry text of a clutter topic is usually "[one of]'Tell me about [the second noun],' I ask.[or]'What[if the second noun is plural-named] are these[otherwise][']s this[end if]?' I ask, pointing at [the second noun].[or]'[if the second noun is plural-named]Are they[otherwise]Is that[end if] important?' I ask, nodding at [the second noun].[at random]".

CT_COV_CLUTTER is a clutter topic. The response text is "'I don't need tidy,' he growls. 'Tidy is no good. It'll all go in a box when I do.'".

CT_COV_SHELVES is a clutter topic. The response text is "'Aint enough space,' he grumbles. 'Rent in this city? It's a crime. But you're seen how much space the Cathedral takes up? So think about that when you're learning your Devotions.'".

CT_COV_TABLE is a clutter topic. The response text is "'That's where I does the thinking,' he says. 'Thinking is four-fifths of any clock.' He looks suddenly abashed. 'Though; I does most of my thinking with my fingers, I suppose.'".

CT_COV_CLOCKS is a clutter topic. The response text is "'You aren't surprised, are you?' he demands. 'What do you expect a clockmaker to be stocking? Geese?' He giggles, quite unexpectedly. 'That'd be a [i]cluck[r]maker, surely!'".

CT_COV_WORKBENCH is a clutter topic. The response text is "'Got to work on something,' he grumbles. 'It's a bit less than I'd like, but I make do. Helps,' he adds mysteriously, 'that I'm tall.'".

CT_COV_TOOLS is a clutter topic. The response text is "'I've not got quite the tools I'd like,' Covalts says. 'There are times I need to borrow a few, from down the road. The others. Not that they're happy to lend them. It's cut-throat, I'll tell you. Really is.' He thinks about that for a moment. 'Specially if you aren't careful what you're doing.'".

CT_COV_CLOCKPARTS is a clutter topic. The response text is "'I've a few more of them than I should,' he says. 'I might have left a few out along the way.'".

CT_COV_WATERCLOCK is a clutter topic. The response text is "'Meant to go outside,' he remarks. 'Topped up by rain, see, so it runs for months. Only trouble is the sun dried it up again. Should a built a sundial on top, really, had both working together.' He thinks for a moment and adds, 'Fine unless it snows.'".

CT_COV_BATTERIES is a clutter topic. The response text is "'That?' Covalt grins. 'That you don't know about and you never saw. But I tell you, it's the future. The whole future, in one little package.'".

CT_COV_BIBLE is a clutter topic. The response text is "'Got some good bits,' Covalt remarks. 'Diagrams of escapements, mostly. A nice bit about the design of the One True Cog.'".

CT_COV_PENDULUMS is a clutter topic. The response text is "'They're ordered by length,' he tells me. 'People still order them by mass in some places. Primitives.'".

CT_COV_MONKEY is a clutter topic. The response text is "'I built that for a councillor. Of course, then he turns round and tells me he doesn't really want to pay for it. Cheeky, that's what I think.'".

CT_COV_DEVICE is a clutter topic. The response text is "'That,' and Covalt beams, 'is enough to get my shop shut down. Or burnt down, maybe. Of course, to the Church, it's nothing but sculpture. None of them would know how to turn it on.'".

CT_COV_TOFFEE is a clutter topic. The response text is "'Help yourself.'".

CT_COV_PAPERS is a clutter topic. The response text is "'Don't worry about the order,' Covalt says. 'Mostly, once I've written something down, that means I've learned it enough to not need the paper. I just use that pile to remind me what I've got up here.' And he taps his forehead.".

CT_COV_DOOR is a clutter topic. The response text is "'You want to go, do you? It's not safer out there, I'll tell you that.'".

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_COV_CLUTTER:
	say "I've already talked to him about that." instead;

CT_COV_CLUTTER is clustered with CT_COV_SHELVES, CT_COV_TABLE, CT_COV_CLOCKS, CT_COV_WORKBENCH, CT_COV_TOOLS, CT_COV_CLOCKPARTS, CT_COV_WATERCLOCK, CT_COV_BATTERIES, CT_COV_BIBLE, CT_COV_PENDULUMS, CT_COV_MONKEY, CT_COV_DEVICE, CT_COV_TOFFEE, CT_COV_PAPERS, and CT_COV_DOOR.



Section 4 - When Thinking

Table of thinking Covalt conversation
conversation			topic
CT_COV_4_DIFFERENCE		"difference" or "different" or "difference engine"

Rule for choosing the conversation table of Covalt when the state of Covalt is 4:
	change the chosen conversation table to the table of thinking Covalt conversation;

CT_COV_4_DIFFERENCE is a conversation topic. The enquiry text is "'What different?' I ask, confused." The response text is "'Of course!' he exclaims, a huge smile cracking his face open like he'd just hit himself with that penduluum of his. 'Sometimes your mouth knows even when your brain don't. And sometimes a machine knows. A knowing machine. [i]The Difference Engine[r]. You heard of it? You should have. Call yourself a monk. We need ourselves the Difference Engine.'[paragraph break]I consider explaining that I'm [i]not[r] a monk, I'm a Second Assistant Clock Polisher, but I let it pass. 'The Difference Engine?'[paragraph break]'Well, first you've got the calculator, right? And the calculator calculates. Give it some numbers, it works out a product. Well, the difference with the Difference is the numbers are ideas. Ideas are messages, and messages can be written as big numbers. So you take two ideas. Two numbers. One's an Actor, you see, the other's an Action. Then you whack [']em into a Difference Engine, and work out what they make.' He shakes his head with pleasure, like he's trying to dislodge that grin of his. 'Great bit of clockwork. About the size of four elephants and no part in it bigger than a woodlouse. That's [i]real[r] clockwork. That is.'"

After choosing the conversation topic when the player can see Covalt and the state of Covalt is 4:
	unless the chosen conversation topic is CT_COV_4_DIFFERENCE:
		change the chosen conversation topic to CT_COV_4_THINKING;

After firing CT_COV_4_DIFFERENCE:
	change the state of Covalt to 5;

CT_COV_4_THINKING is a conversation topic. The enquiry text is "[one of]'I...'[or]'But...'[or]'Maybe...'[or]'And...'[or]'Yes...'[or]'Where...'[or]'What...'[or]I swallow.[at random]". The response text is "[one of]He interrupts your question. 'Look, we need to work all this through. There's variables here. Levers left and right. We need to work out what's next to see what we do next. Something [i]different[r] needs to be done.'[or]'Problem solving,' Covalt interjects. 'Is clockwork, too. A [i]different[r] kind of clockwork, but still clockwork.'[or]'What's the [i]difference[r]?' he remarks to himself, not listening to me. 'That's the question.'[or][fire CT_COV_4_DIFFERENCE][stopping]"

Rule for firing CT_COV_4_DIFFERENCE while firing CT_COV_4_THINKING or firing COVALT_COUNTER:
	[we don't want to print the enquiry text in these situations] 
	say the response text of CT_COV_4_DIFFERENCE;
	say run paragraph on;

After firing unfired CT_COV_4_DIFFERENCE:
	add SE_COV_COUNTING_HOUSE to the current script;

SE_COV_COUNTING_HOUSE is a scripted event. The display text is "'Now,' Covalt continues. 'With your Church ways and rags and all, you might get in the Counting House all right. That's where they keep it. The Engine. Here. I'll give you the address. You can read, can't you?' I nod. In reply he produces, from nowhere I can see, a scrap of paper and a quill, and he scratches down an address. He presses it into my hand. 'That's the place. Now. [i]Skidaddle[r].'".

After firing SE_COV_COUNTING_HOUSE:
	now the player carries the scrap of paper;

The scrap of paper is a thing. The description of the scrap of paper is "'The Counting House'. Below – an address. Thriftsteal street. Government quarter."

Understand "address" as the scrap of paper.

Instead of attacking or eating or dropping the scrap of paper:
	say "Don't. I might need it, in case my memory springs a sprocket."

Section 5 - When enthusiastic

Table of enthusiastic Covalt conversation
conversation			topic
CT_COV_5_MYSELF		"[me]"
CT_COV_5_DIFFERENCEENGINE	"difference" or "engine" or "machine" or "knowing machine"
CT_COV_5_ABBEY		"[abbey]"
CT_COV_5_CATHEDRAL		"[cathedral]"
CT_COV_5_ABBOT		"[abbot]"
CT_COV_5_FIGURE		"[figure]" 
CT_COV_5_ARCHBISHOP		"[archbishop]"
CT_COV_1_PEOPLE		"[calvinanddrake]" or "[horloge]" or "[reloh]" or "[sa'at]" or "cook"
CT_COV_5_COVALT		"giant" or "covalt" or "[himself]"
CT_COV_5_RAVENS		"his ravens" or "ravens" or "hugin" or "mummin"
CT_COV_5_CLOCKWORK		"time" or "[clockwork]"
CT_COV_5_SAINTS		"[saints]" 
CT_COV_5_SORRY		"sorry" or "apologise" or "apologies"
CT_COV_5_PERPETUUM		"[perpetuum]" or "diagram" or "blueprint"
CT_COV_3_HERESY		"designs" or "heresy" or "designs" or "heresies" or "heretical" or "future"
CT_COV_3_SHOP		"shop" or "workshop" or "room" or "store"
CT_COV_5_ADDRESS	"address" or "scrap" or "paper" or "thriftsteal" or "counting house" or "government" or "quarter" or "way" or "route" or "directions" or "help"

[ only once ]
Rule for firing a fired conversation topic that is clustered with CT_COV_5_MYSELF:
	say "I've already asked about that." instead;

CT_COV_5_MYSELF is clustered with CT_COV_5_DIFFERENCEENGINE, CT_COV_5_ABBEY, CT_COV_5_CATHEDRAL, CT_COV_5_ABBOT, CT_COV_5_FIGURE, CT_COV_5_ARCHBISHOP, CT_COV_5_PEOPLE, CT_COV_5_COVALT, CT_COV_5_RAVENS, CT_COV_5_CLOCKWORK, CT_COV_5_SAINTS, CT_COV_5_SORRY, CT_COV_5_PERPETUUM, CT_COV_3_HERESY, CT_COV_3_SHOP, CT_COV_5_ADDRESS.
.

Rule for choosing the conversation table of Covalt when the state of Covalt is 5:
	change the chosen conversation table to the table of enthusiastic Covalt conversation;

CT_COV_5_MYSELF is a conversation topic. The enquiry text is "'So what should I do now?' I ask.". The response text is "'Go and find out,' he replies, cheerfully.".

CT_COV_5_DIFFERENCEENGINE is a conversation topic. The enquiry text is "'I don't understand about this Engine.'". The response text is "'Of course you don't. Clockwork and High Mathematik all in one. It's like understanding being on fire when you're drowning underwater.' He grimaces. 'St. Babbage – he was a genius. That's how it works. But it's for what it does – that's what you're needing it for. So how doesn't really matter.'".

CT_COV_5_ABBEY is a conversation topic. The enquiry text is "'Maybe I should go back to the Abbey?'". The response text is "'If you've got any sense you'll stay out of there for the next twenty years at least,' Covalt says. 'No place of a mind, working chores and all that copying out.'".

CT_COV_5_CATHEDRAL is a conversation topic. The enquiry text is "'What about guarding the Cathedral?'". The response text is "'Design before you do,' Covalt growls. 'No point rushing in and standing around. That won't bring your Uncle back to life, as they say.'".

CT_COV_5_ABBOT is a conversation topic. The enquiry text is "'I think the Abbot was scared,' I say.". The response text is "'Should be,' Covalt smiles, 'with you on his heels. Taking to the air in a balloon! Mad as a monkey-wrench!'".

CT_COV_5_FIGURE is a conversation topic. The enquiry text is "'How will I catch the Figure? He's faster – and probably smarter, too...'". The response text is "'Like I've told you. Like this Difference Engine will tell you. Time for some decent advising, that's what it is. Right now, if you look at it, you've got nothing but my demented ramblings and your own half-baked ideas,' – he holds up a palm – 'no offence, but you're shorter than my navel so you can't be that well-read. So.' He shrugs.".

CT_COV_5_ARCHBISHOP is a conversation topic. The enquiry text is "'Shouldn't we warn the Archibishop?'". The response text is "'You did already,' he says, impatiently. 'Anyway, if we start trying to do things the Church way we'll be going round and round a clockface when we should be going up in the air.' He grins, suddenly. 'I meant that as a figure of speech, but I guess that's what you did, there, in your balloon. So fancy that.'".

CT_COV_5_PEOPLE is a conversation topic. The response text is "He won't know them.".

CT_COV_5_COVALT is a conversation topic. The enquiry text is "'What will you do?'". The response text is "'Me? Keep my head down and fix my skylight. There's nothing else for me to do. I'm not having me suspected of theft, heresy is quite a charge enough.'".

CT_COV_5_RAVENS is a conversation topic. The enquiry text is "'I like your ravens.'". The response text is "'Well, they must like you,' he replies, 'or they'd have had your eyes out by now.'".

CT_COV_5_CLOCKWORK is a conversation topic. The enquiry text is "'So you know all about clockwork, then.'". The response text is "'My fingers know.' He waves one. It's about the size of a small dog. 'I'm a doer, not so much a thinker. I find things out instead of dreaming them up. That's my way. Half-bothered.'".

CT_COV_5_SAINTS is a conversation topic. The enquiry text is "'You know about the Saints?'". The response text is "'Inventors, designers. Good, mind. Very good. But morality, well, there's another thing. I don't know such.' He lowers his voice. 'I got my doubts on Babbage, say. And Newton? They say he lost it once his fame got out and it wound up with him locked in a cell somewhere, raving loony.' He winks. 'But don't tell ‘em I told you when you tell the other sprats, eh?'".

CT_COV_5_SORRY is a conversation topic. The enquiry text is "'I'm sorry about dragging you into this,' I tell him.". The response text is "'Not a grit-grime, don't worry. I'm dragging myself straight back out again the second you leave.'".

CT_COV_5_PERPETUUM is a conversation topic. The enquiry text is "'Is the Perpetuum important?'". The response text is "'Well,' and he scratches his chin with a noise like a cart over cobbles. 'Depends. Thing is, that right now, it isn't any use. Just for looking at. Powers itself and nothing else. I think that's right. The universe does its grind and the Perpetuum does it other. Or maybe they're related.' He shakes his head. 'I don't know. I get fuzzy about Book VIII of Euclid, you don't want to be asking me.'".

CT_COV_5_ADDRESS is a conversation topic. The enquiry text is "'How do I get to this Counting House?' I ask." The response text is "'That's easy,' he replies - then rattles off a long list of directions I don't remember at all. But I nod and pretend to listen anyway - exactly as though I was back in the Abbey."

Rule for choosing the conversation topic when we are enquiring of Covalt about something and the state of Covalt is 5:
	change the chosen conversation topic to the conversation corresponding to a hiding place of the second noun in the table of Covalt's Interesting Items;

Chapter 5 - Idle actions

COVALT_COUNTER is a counter. The top end is 5. The internal value is 2.

After speaking with Covalt:
	defer firing COVALT_COUNTER;

After looking during Covalt's Shop Hunt:
	[defer firing the counter]
	if the internal value of COVALT_COUNTER is 1,
		change the internal value of COVALT_COUNTER to the top end of COVALT_COUNTER;

Every turn when the player can see Covalt:
	increment COVALT_COUNTER;

Rule for firing COVALT_COUNTER when the state of Covalt is 1 and no conversation topic that is clustered with CT_COV_1_MYSELF is fired:
	say "The huge man in the doorway is waiting for me to tell him my story.";

Rule for firing COVALT_COUNTER when the state of Covalt is 1:
	say "[one of]'So?' the giant demands.[or]The big man's face is curled up into a growl.[or]'Well? [']Plain yourself,' the giant demands. 'Make yourself plain.'[or]The giant shifts his weight, making the floor creak.[or]'How'd you end up here, eh?' he demands.[in random order]";

Rule for firing COVALT_COUNTER when the state of Covalt is 2:
	say "[one of]'So? What's a Figure to do with you?'[or]'How'd you get started on this?' Covalt demands. 'Eh?'[or]'What's the story here?' Covalt demands. 'All the story.'[or]'What's the great plot, eh?' Covalt demands.[or]'You'd better explain and quick,' Covalt growls.[or]The penduluum swings a little. He's clearly not a patient angry giant.[or]'You tell me what that Figure was after,' he demands.[in random order]";

[State 3: see Rummaging Puzzle, below.]

Rule for firing COVALT_COUNTER when the state of Covalt is 4:
	say "[one of]'I've got a different idea forming,' he muses.[or]'We got to do something else,' he murmurs. 'Something...'[or]'There's an idea on the tip of my...' he begins, looking puzzled. 'Something. No. Else. Er...'[or]'It'll come to me, I'm sure,' Covalt says.[or][fire CT_COV_4_DIFFERENCE][paragraph break][stopping]";

Rule for firing COVALT_COUNTER when the state of Covalt is 5:
	if examining Covalt:
		now the internal value of the COVALT_COUNTER is the top end of the COVALT_COUNTER;	
	else if the number of entries in the hurry-up script is not 0:
		say entry 1 of the hurry-up script, paragraph break;
		remove entry 1 from the hurry-up script;


The hurry-up script is a list of texts that varies. The hurry-up script is { "Covalt looks pleased with himself.", "Covalt is waiting for me to go.", "It's time I got on.", "The Figure's out there, right now! I need to hurry up!" }.

When play begins:
	sort the hurry-up script in random order;

Part 2 - Clock Shop

Covalt's Shop Hunt is a scene. Covalt's Shop Hunt begins when the location is the Clock Shop. Covalt's Shop Hunt ends when the location is the Street. 

Understand "find diagram" as a mistake ("[look for diagram]") when Covalt's Shop Hunt is happening and the state of Covalt is 3.
Understand "look for diagram" as a mistake ("[look for diagram]") when Covalt's Shop Hunt is happening and the state of Covalt is 3.
Understand "search for diagram" as a mistake ("[look for diagram]") when Covalt's Shop Hunt is happening and the state of Covalt is 3.
Understand "hunt for diagram" as a mistake ("[look for diagram]") when Covalt's Shop Hunt is happening and the state of Covalt is 3.

To say look for diagram:
	say "[one of]There's lots of places to look - [if location is the Clock Shop]the desk, the shelves, the papers - I'll just have to start somewhere[else]in the main shop, as well as here[end if][or]You're going to have to think of somewhere to look, I can't see it.[stopping]. "

Chapter 1 - Description

The Clock Shop is north of Covalt's Bedroom. "[if the state of Covalt is at least 4]The afternoon sunlight comes in from the door to the street, casting shadows across the junk-piles and scrap.[else][one of]The first thing I see is the door onto the street, southwest. Escape! But there's nothing to escape from - Covalt is just a clockmaker and this is his workshop: a tiny room stuffed with springs and rods and pistons, the workbench and shelves and floor almost invisible under a layer of brass teeth and penduluums.[or]When I say I'm in Covalt's shop I'm mean I'm [i]in[r] it, knee-deep. It's everywhere. It's got more bits than one of Cook's soups, and there's not a scrap of space that isn't filled with clutter. It'd be like standing inside an intricate mechanism - if there was any Good Order or Precision at all, which there isn't. Somewhere in this mess is a table, and the door to the street is southwest, but even that's hung with a rack of shelves.[stopping][end if]"

Instead of making to leave in the Clock Shop: try going southwest.
Instead of going inside in the Clock Shop: try going south.


Chapter 2 - Rummaging puzzle

Section 1 - Examining clutter


After printing the description of a clutter thing (called the junk) that is remembered by Covalt when the state of Covalt is 3:
	say paragraph break;
	have Covalt inspect the junk;
	[ drop the extra line break cause by the last rule in this activity. We don't need it! ]
	now the final-paragraph-break is false;

After printing the description of uninspected clutter thing (called the hiding-place) when the player remembers at least three things and the state of Covalt is 3:
	say " And here's his diagram too";
	if the hiding-place is the toffee, say ", underneath";
	say ". I pull it out and hand it over to him.[paragraph break]";
	fire TRIG_DIAGRAM_FOUND instead;

After printing the description of uninspected clutter when the state of Covalt is 3:
	say " [one of]No sign of the diagram. [or]No luck on the diagram though. [or]Still no trace of Covalt's diagram. [or]No diagram there. [stopping]";

Section 2 - Covalt can look

Rule for firing COVALT_COUNTER when the state of Covalt is 3:
	have Covalt inspect the item Covalt inspects;

To have Covalt inspect (the curio - a thing):
	if the curio is remembered by Covalt:
		say "[one of]'Not there,' Covalt says. 'I looked.'[or]'I tried there,' Covalt remarks.[or]'No good,' Covalt says.[or]'I already tried there,' Covalt remarks.[cycling]";
	else if at least 10 things are inspected:
		say "'But, ah-ha! Here's the snake from its hollow log!' He pulls out a folded sheet of paper from behind [the curio].[paragraph break]";
		fire TRIG_DIAGRAM_FOUND;
	else if 3 things are inspected and COVALT_REMARKS_ON_DESIGNS is unfired:
		fire COVALT_REMARKS_ON_DESIGNS;
	else:
		now Covalt remembers the curio;
		say "[one of]Covalt rummages [if the curio is plural-named]through[else]around[end if] [the curio].[or]Covalt looks over [the curio], hoping to find his diagram, but having no luck.[or]Covalt straightens up from inspecting [the curio]. 'Nothing there,' he reports.[or]Covalt is shaking his head. 'It's not with [the curio].'[in random order]";

To decide which thing is the item Covalt inspects:
	let L be a list of objects;
	let L be the list of uninspected clutter in the Clock Shop;
	remove the clock shop door from L, if present;
	if the number of entries in L is 0, decide on Covalt;
	sort L in random order;
	decide on the entry 1 of L.

COVALT_REMARKS_ON_DESIGNS is a trigger. 

Rule for firing COVALT_REMARKS_ON_DESIGNS:
	say "'Problem is,' Covalt remarks as he hunts around the room, 'I have to keep hiding all my designs from prying eyes. So I end up [i]losing[r] my designs, and then it's a right trouble to dig them back up again.'";

Section 2b - Covalt will look where you ask him to

After firing a clutter topic (called the gas):
	let the curio be the hiding place corresponding to a conversation of the gas in the table of Covalt's Interesting Items;
	if the curio is not inspected:
		now the internal value of COVALT_COUNTER is 2;
		have Covalt inspect the curio;
		
Instead of asking Covalt to try examining or searching clutter:
	now the internal value of COVALT_COUNTER is 2;
	have Covalt inspect the noun;

Section 3 - Finding the Diagram

TRIG_DIAGRAM_FOUND is a trigger.

Rule for firing unfired TRIG_DIAGRAM_FOUND:
	say "Covalt spreads the paper out. 'The Perpetuum,' he whistles. 'Built by St. Babbage. Not drawn, you understand.' His voice has taken on a deep, reverent quality, more solemn and rich than the crackly old Abbot evers manages in any of his sermons. It's like the page itself was radiating the light of moving gear-teeth, throwing sparkles into Covalt's eyes.[paragraph break]'Drawing it came after,' Covalt continues. 'Babbage, they say, just sat down and made the machine. Cog-only knows how. Can't stop, you see. Can't start. Must have been running [i]while[r] he was putting it together. The Perpetuum is self-winding. Runs and runs without stopping. Forever. Look,' and he points to parts of the diagram. Cogs attached to other cogs that attach back to themselves. 'No spring at all,' Covalt says, wistfully. 'Nowhere for a spring to even [i]go[r]. A universe in miniature, all of its lonesome, so the books tell it. Got to keep it separate, and all is well. But your Figure, if he gets one. Well, I don't know.'[paragraph break]'What do you think the Figure wants with it?' I ask.[paragraph break]'Batters me. I don't know. I wondered that ever since he turned up asking me to build one – like I even [i]could[r] build one. I mean, this diagram, isn't a [i]full[r] diagram. It's like an aspect of the Perpetuum. Like, if you shone a light at the machine and sketched the outline of the shadow. Good for the soul of a clockworker, but your Figure? I guess he wants it [']dapted. For something else. Something quite else...' He trails off, quite suddenly, lost in thought.";

After firing TRIG_DIAGRAM_FOUND:
[	now the player carries the Perpetuum Mobile diagram; ]
	now Covalt carries the Perpetuum Mobile diagram;
	change the state of Covalt to 4;
	change the internal value of COVALT_COUNTER to the top end of COVALT_COUNTER;

Instead of taking the the Perpetuum Mobile diagram when Covalt is carrying the the Perpetuum Mobile diagram:
	fire TAKE_DIAGRAM;

Instead of examining the the Perpetuum Mobile diagram when Covalt is carrying the the Perpetuum Mobile diagram:
	fire TAKE_DIAGRAM;
	continue the action.

TAKE_DIAGRAM is a trigger.

Rule for firing TAKE_DIAGRAM:
	now the player carries the Perpetuum Mobile diagram;
	say "I pick the diagram out of Covalt's hands to take a look myself."

Every turn when TRIG_DIAGRAM_FOUND was fired and TAKE_DIAGRAM is unfired:
	fire TAKE_DIAGRAM;

Section - the Perpetuum Mobile diagram

The Perpetuum Mobile diagram is a thing. The printed name is "diagram of the Perpetuum Mobile". The description is "It's really a series of diagrams: the first, the rack for the ball-bearing just like I saw in the Cathedral. But below, well, then it gets [i]really[r] complicated. Cogs forming snake-like chains across several levels, all intersecting and then re-intersecting with themselves. It looks like, if it wasn't running, it'd be locked up solid and tight. But [i]because[r] it's running, there's always a gap for the next tooth to take." Understand "plan/diagram/blueprint", "perpetum", "diagram/ of" as the Perpetuum Mobile diagram.

After printing the description of the Perpetuum Mobile diagram when the player can see Covalt during Covalt's Shop Hunt:
	fire TRIG_DIAGRAM;

TRIG_DIAGRAM is a trigger.

Rule for firing unfired TRIG_DIAGRAM:
	say "[paragraph break]'It's not the full picture,' Covalt remarks. 'You can't get it from just one angle. You got look, lots of ways. So, you know. This picture's more for [i]inspiration[r] than to actually [i]build[r] one. That's what I told the Figure, see.'[run paragraph on]";

Instead of putting the Perpetuum Mobile diagram on something:
	try dropping the Perpetuum Mobile diagram.
Instead of inserting the Perpetuum Mobile diagram into something:
	try dropping the Perpetuum Mobile diagram.
Instead of giving the Perpetuum Mobile diagram to someone:
	try dropping the Perpetuum Mobile diagram.

Instead of dropping the Perpetuum Mobile diagram:
	say "Come on, Wren, you can’t go leaving diagrams of Holy Relics lying around the place now can you?";

Instead of giving the Perpetuum Mobile diagram to Covalt:
	say "Covalt shakes his head. He's deep in thought.";

Chapter 3 - Clutter

The junk is privately-named, scenery, clutter, in the Clock Shop. "Clutter is assorted stuff filling up space. It'd be better to say this room has 'gaps', one of which I'm standing in and another I'm using to breathe. The rest is filled by the workbench, the wall of pendulums of all shapes and sizes, and, everywhere else, clocks and clock parts."
Understand "assorted", "clutter", "junk", "stuff", "mess", "things", "gaps", "parts" as the junk.

Instead of searching the junk:
	say "Somewhere amongst all the parts and tools there's a workbench and the solid wooden table."

Instead of taking the junk:
	say "I'd need several carts to carry all this away."

A rack of shelves is scenery, clutter, in the Clock Shop. "A rack of shelves hang on the back of the door to the street. They mostly hold clocks (mainly whole clocks), although I can see a monkey-head sticking up at the back." The printed name is "shelves".

Instead of searching the rack of shelves:
	try examining the rack of shelves.

The solid table is a supporter, scenery, clutter, in the Clock Shop. "The solid table is covered with piles and piles and [i]piles[r] of paper, rather than the tools littering the workbench." The printed name is "table". Understand "desk", "wooden" as the table.

Instead of searching the solid table:
	try examining the solid table.

Instead of looking under the solid table:
	say "There's more stuff down there - more papers, mostly."


Some assorted clocks are scenery, privately-named, clutter, in the Clock Shop. "The clocks are every shape and size (including one with an oval dial whose hands extend and shrink as they go round; it's creepy to watch). A water clock keeps time by dripping water through a tiny hole. And at the back, there's a small mechanical monkey and a strange device made of wires and metal plates." Understand "clock", "clocks" as the assorted clocks. The printed name is "clocks".

The workbench is scenery, a supporter, clutter, in the Clock Shop. "The workbench is fitted with tools, with more tools piled on top. It's then dusted over with clock parts, some so careful and delicate they deserve individual felt cushion – this Covalt is clearly a lunatic, scattering them about like this. In one corner of the workbench, there's also a strange brown lump." Understand "bench" as the workbench.

Instead of searching the workbench:
	try examining the workbench.

Instead of looking under the workbench:
	say "There's more tools down there."

Some tools are scenery, clutter, on the workbench. "Tools of every size and denomination. This is a parliament of tools. An army. A great big heap. One is particularly odd: a smooth metal box with two flat pins sticking out the top. They're labelled + and -."

Some clock parts are scenery, privately-named, clutter, on the workbench. "Springs, pistons, rods, screws – there's a whole litany of parts in here." Understand "spring", "springs", "piston", "pistons", "rod", "rods", "screw", "screws", "clock parts", "clock part", "teeth", "brass" as the clock parts.

The water clock is scenery, privately-named, clutter, in the Clock Shop. "It works by droplets, falling onto a pan that gradually drags down on a rotating wooden tumblers. No winding and no hands!" Understand "water clock" as the water clock.

The battery is scenery, clutter, in the Clock Shop. "This is a riddle. What's a box that has no lid? Two pins but no teeth for them to meet? Doesn't look like it does anything, but solidly built and carefully sealed up?" Understand "box", "metal", "smooth", "pins", "+", "-", "batteries" as the battery. The printed name is "smooth metal box".

Instead of taking or touching or tasting the battery:
	say "[one of]'Don't touch that!' Covalt barks.[or]I don't want to make him angry.[stopping]";

The well-thumbed Bible is scenery, clutter, on the solid table. "A copy of the Bible. Leafing through, it looks fairly standard."

Instead of searching or opening the Bible: try examining the Bible instead.

Instead of taking the Bible:
	say "Covalt probably needs it - it lists all the Laws of Physik, all the motions of gear-wheels, and a lot of useful Constants besides."
	
Instead of consulting the Bible about:
	say "I don't have time to read all the Laws right now. Besides, they won't have changed since the [i]last[r] time I read them."

Some wall of pendulums is scenery, clutter, in the Clock Shop. "Covalt has penduluums in a rack on his wall like a sword-fighter might have swords." Understand "penduluum", "penduluums", "pendulum", "stubby", "brass" as the wall of pendulums.

Instead of doing something when the wall of pendulums is physically involved:
	say "The penduluums look too heavy to shift and they're a little high up for me."

Instead of searching the wall of pendulums:
	say "Standing on tip-toes I can peer between the penduluums[check in case we've found it in the noun]";

The mechanical monkey is scenery, clutter, in the Clock Shop. "It's a toy, or a pet, like Gubbler's salamander (and about the same size). Right now it's wound down." Understand "toy", "pet", "head" as the mechanical monkey.

Instead of taking the mechanical monkey:
	say "[one of]'Leave that,' Covalt snaps. 'It'll take your fingers off, it's mean.'[or]Covalt shakes his head. 'I'm not joking.'[stopping]";

Instead of turning the mechanical monkey:
	say "No key.";

The strange device is scenery, clutter, in the Clock Shop. "Hard to say. It looks like a cross between a plant and a box of screwdrivers. Hard to believe it does anything." 

Instead of turning or switching on the strange device:
	say "I can't really see how!";

Instead of taking the strange device:
	say "If I tried to lift it it would probably fall to pieces."

The butter toffee is scenery, clutter, on the workbench. "It's toffee. Butter toffee." Understand "brown", "lump" as the butter toffee.

Before eating or tasting the butter toffee:
	say "[one of]I nibble a corner. Wren, I'm thinking, you're hungry...[or]I take another bite, while Covalt isn't looking.[stopping]" instead;
	
Instead of slicing the butter toffee with the knife:
	say "I shave off a slice of toffee and eat it. Sugar. Food. I'm hungrier than I realised!" instead.
	
Instead of taking the butter toffee:
	say "'Don't take all of it,' Covalt grumbles. 'I need it to think.' So, [run paragraph on]";
	try eating the butter toffee instead.

Some sketch papers are scenery, clutter, on the solid table. "The desk is covered in papers – few complete blueprints, though; they're mostly sketches. In the middle of the pile is a well-thumbed Bible, marked with several more bookmarks (more papers)." The printed name is "papers". Understand "sketches" as the papers. Understand "piles", "paper", "piles of paper/papers", "bookmark", "bookmarks" as the sketch papers.

Instead of searching the sketch papers:
	try examining the sketch papers.

Instead of taking or looking under the sketch papers:
	say "Under the papers are more papers and under those... is the table[check in case we've found it in the noun]";

To say check in case we've found it in (t - a thing):
	if the player remembers at least six things and the state of Covalt is 3:
		say ". And there's his diagram. I pull it free and hand it over.[paragraph break]";
		fire TRIG_DIAGRAM_FOUND;
	else:
		if the t is uninspected, now the player remembers the t;
		say ".";

Chapter 4 - Door

The clock shop door is a closed door, privately-named, clutter, scenery, southwest of the Clock Shop, northeast of Escapement St. The description is "[if the location is the Clock Shop]On the back of the door to the street is a series of shelves, each bristling with all manner of clocks.[otherwise]The sign reads Covalt & Son, Chronometers Secular, Sacred and Second-Sprung. The word Son has been scratched out.[end if]".

Understand "door" as the clock shop door. The printed name is "door".

Understand "covalt", "covalt's", "chronometers", "scratched", "out", "and", "son", "word", "clock", "shop", "door", "sign" as the clock shop door when the location is Escapement St.

Before making to leave in the Clock Shop during Covalt's Shop Hunt:
	try opening the clock shop door instead.

Before going southwest in the Clock Shop during Covalt's Shop Hunt:
	try opening the clock shop door instead.

Before entering the clock shop door in the Clock Shop during Covalt's Shop Hunt:
	try opening the clock shop door instead.

Instead of opening the clock shop door when the scrap of paper is off-stage during Covalt's Shop Hunt:
	if the state of Covalt is at least 4:
		say "'Hold up,' Covalt insists. 'I'm trying to think. Don't go doing something different and distracting me.'"; 
	else:
		say "[one of]'Not so fast,' Covalt growls. 'You can't go running off with no idea else what's next or you'll wind up dancing in the circus or something and what kind of [i]story[r] would that be, eh? So settle down, quit with your legging it, and let's get thinking.'[or]This giant's my only hope of working out what to do next, I think. I'm not going anywhere until he says so.[stopping]";

Instead of opening the clock shop door when Return to Covalt's has not happened:
	say "'That's the place,' Covalt insists, tapping the address with a finger like a roofing mallet. 'The Difference Engine'll tell you all you want. I hope. If you can get a clear idea what you're wanting and – well, anyway.' He puffs his cheeks. 'One dead air balloon says you'll do your best.'[paragraph break]'Thanks,' I say. The first person to be nice to me – well, ever really. 'I appreciate your help.'[paragraph break]'Well, nothing's too good for a rat,' he snarls. 'And do pop back here later if you need to. I don't think. Bringing the Heretic police and that. Go on! Get out of it.' And with that, he boots me through the door and slams it with relish.";
	end the chapter;
	say "The streets of St Philip are narrow and winding, closer to the veins on a leaf than anything mechanical. Their only Holy Function is to get me completely and totally lost, and they do that so well that it takes a good couple of hours to find the way to the steps of the Counting House.[paragraph break]If anyone from the Abbey saw me out here they'd have my guts for wheel-belts. Lucky then that this is a side-street off a side-street, the kind of place full of urchins who look the same as me. I'd feel right at home - if I wasn't further from it than I'd ever been.";
	move the player to The Street;

Chapter 5 - Covalt's reactions to going to the Bedroom

After going when the state of Covalt is 4 during Covalt's Shop Hunt:
	move Covalt to the location;
	say "[one of]Covalt[or]The giant[or]The clockmaker[at random] [one of]wanders after[or]trails after[or]follows[at random] me[one of] into [the location][or] through the door[or], deep in thought[or] muttering to himself[or] chewing his lower lip[or][at random].";
	continue the action;

After going when the state of Covalt is 5 during Covalt's Shop Hunt:
	move Covalt to the location;
	say "Covalt follows me.";
	continue the action;

First for writing a paragraph about Covalt when the state of Covalt is at least 4 and the location was the Bedroom and the location is the Clock Shop: [ we've moved this turn ]
	now Covalt is mentioned;


Rule for writing a paragraph about Covalt when the state of Covalt is at least 4 and the location is the Bedroom and the location was the Clock Shop: [ we've moved this turn ]
	now Covalt is mentioned;

After going to the Bedroom from the Clock Shop when TRIG_DIAGRAM_FOUND is unfired during Covalt's Shop Hunt:
	say "Covalt grumbles something about modern children as I leave him to his search.";
	continue the action;

After going from the Bedroom to the Clock Shop when TRIG_DIAGRAM_FOUND is unfired during Covalt's Shop Hunt:
	say "'There you are,' Covalt grumbles. 'I suppose you didn't find my diagram in there anywheres.'";
	continue the action;

Instead of going to the Bedroom from the Clock Shop when the scrap of paper is on-stage:
	say "Covalt pushes me back[one of]. 'Get on with you already. Onto the street where you belong!'[or].[stopping]"

Chapter 6 - Glimpses for Bedroom and Shop

The glimpse-bedroom is a glimpse backdrop in the Clock Shop. The printed name is "bedroom". Understand "bedroom", "bed room", "back room", "backroom" as the glimpse-bedroom. The glimpse-bedroom identifies the feather bed.

The glimpse-Clock-Shop is a glimpse backdrop in the Bedroom. The printed name is "clock shop". Understand "clock", "shop", "store", "clockshop", "clock-shop" as the glimpse-Clock-Shop. The glimpse-Clock-Shop identifies the solid table.

Book 7 - The Counting House

Part 1 - Street

Chapter 1 - Description

The Street is an exterior room. "Either side stand sour buildings like a council of bored old men. At least the Counting House looks different: on the northeast corner, it's more like the woman who delivers vegetables to Cook once a week. Stocky, solid, all dressed up - in this case, marble steps, pillars and two enormous brass doors." The printed name of the Street is "Outside the Counting House".

Chapter 2 - Scenery

Section 1 - Buildings

Some buildings are a backdrop, in the street and the Counting House Steps. "It's a rich part of town – funny that the street is so dirty. There aren't even any lamps. By night this place is probably pitch dark." Understand "houses", "street", "streets", "dark", "town", "side-street", "side-streets", "side street/streets", "alley", "alleyway", "alley-way" as the buildings.

Instead of doing something when the buildings are physically involved:
	say "I'd better keep my mind on the Counting House. I'm not a tourist!";

Instead of approaching or entering the buildings:
	try going down.

Section 2 - Counting House

The distant counting house is scenery, privately-named, in the street. "The steps are to the northeast of where I'm standing." The printed name is "Counting House". Understand "counting", "house", "marble", "steps", "stairs", "brass", "doors", "door", "building", "different", "stocky", "solid", "enormous", "pillars" as the distant counting house.

Instead of entering or climbing or approaching the distant counting house:
	try going northeast instead;

Instead of going up when in the street:
	try going northeast instead;

Instead of going inside when in the street:
	try going northeast instead;
Instead of making to leave when in the Street:
	say "There's no turning back now."
Instead of going nowhere when in the Street:
	say "There's no turning back now."

Instead of doing something when the distant counting house is physically involved:
	try going northeast.

Chapter 3 - Event on Exit

After going northeast from the street:
	say "I climb the steps, one at a time, trying to look very serious.";
	continue the action;

Part 2 - Steps

Chapter 1 - Description

The Counting House Steps is an exterior room, northeast of the street. "The steps are flat and wide, as wide as the wide brass doors of the Counting House. On either side, two wide guards stand guard with their heads cocked to one side - why'd they stand like that I don't know."

Instead of going inside in the Counting House Steps: try going north.
Instead of making to leave when in the Counting House Steps: try going southwest.


After going to the Counting House Steps:
	the player attempts to enter the counting house in one turn from now;
	continue the action;

At the time when the player attempts to enter the counting house:
	if TRIG_COUNTING_HOUSE is unfired and the location is the Counting House Steps:
		fire TRIG_COUNTING_HOUSE;

TRIG_COUNTING_HOUSE is a trigger.
Rule for firing unfired TRIG_COUNTING_HOUSE:
	say "The guards['] spears move like well-oiled pinions to cross in front of the doors. Not like I wouldn't need their help in opening these doors anyway.[paragraph break]'This building is restricted,' the first guard says. 'I'm afraid unofficial visits aren't authorized.'[paragraph break]'Push off, street-rat,' the second guard translates. 'Beat it or we'll beat you.'[paragraph break]'I'm here on business,' I tell them, voice shaking.[paragraph break]'I'm afraid we'd need to see some verification of that,' says the first.[paragraph break]'Thief's business?' demands the second."

Rule for firing fired TRIG_COUNTING_HOUSE:
	say "'Verification,' the first guard reminds you. Their spears stay crossed.";

Chapter 2 - Scenery

Section 1 - Counting House

The front of the Counting House is a door, open, not openable, scenery, privately-named, north of the Counting House Steps, south of the Grand Foyer. "[if the location is the Counting House Steps]The Counting House is shaped like a big block of hard cheese, all straight edges and smooth surfaces. Even the brass doors have a yellowy luster that might be gold or might be oil. They've engraved, of course, Babbage, Godel and Ada of Lovelace, who I'm quite sure isn't a real saint even though she's got the cog-wheel over head like all the others.[otherwise]The large brass doors are padded on this side with thick red leather.[end if]". The printed name is "Counting House".

Rule for printing the name of the front of the Counting House when the location is the Grand Foyer:
	say "brass doors";

Understand "counting", "house", "building", "saints", "cheese", "block", "block of cheese", "yellow", "yellowy", "gold", "golden", "oil", "oily", "luster", "saints", "carvings" as the front of the Counting House when the location is the Counting House Steps.

Understand "large", "brass", "doors", "door" as the front of the Counting House.

Understand "south", "padded", "thick", "red", "leather" as the front of the Counting House when the location is the Grand Foyer.

Instead of going through the front of the Counting House from the Counting House Steps:
	fire TRIG_COUNTING_HOUSE;

Instead of opening the front of the Counting House:
	try entering the front of the Counting House instead;

Section 2 - Parts of the Facade

A facade-part is a kind of thing. A facade-part is scenery, proper-named.

Every facade-part is part of the front of the Counting House.

Instead of doing something when a facade-part is physically involved:
	say "The carvings are just part of the Counting House."

Instead of approaching or entering or hiding inside or climbing a facade-part:
	try entering the front of the Counting House instead.

Some facade-parts are defined by the Table of Counting House Facade Elements.

Table of Counting House Facade Elements
facade-part			description
Babbage-part				"Babbage looks serene, or perhaps a little bemused."
Godel-part				"Godel appears to be counting on his fingers: he's probably reached eleven, knowing him."
Ada of Lovelace		"She looks quite pleased to be up there."
pillars				"Each pillar is five times my height and not smooth, but grooved to form cog-teeth up its length."

The printed name of Babbage-part is "Saint Babbage." 
The printed name of Godel-part is "Saint Godel." 
The pillar are plural-named.
Babbage-part is privately-named.
Godel-part is privately-named.

Understand "st/saint babbage" as Babbage-part.
Understand "st/saint godel" as Godel-part.
Understand "pillar", "column", "columns" as the pillar.


Section 3 - Atmospheric effects

STEPS_COUNTER is a counter. The top end is 4. The internal value is 2.

Every turn when in Counting House Steps:
	increment STEPS_COUNTER;

Rule for firing STEPS_COUNTER:
	say "[one of]A carriage rattles along the cobbled street behind me.[or]The guards stand as motionless as hour hands; although one seems to have an itch on his nose.[or]The sun shining off the brass doors of the Counting House is almost blinding.[or]A few pigeons scatter between the pillars of the Counting House.[at random]";

The street-atmosphere is a backdrop, privately-named, in the Counting House Steps. The printed name is "street". "The street is empty once more."

Understand "carriage", "carriages", "pigeon", "pigeons", "bird", "birds" as the street-atmosphere.

Instead of doing something when the street-atmosphere is physically involved:
	try going down.

Chapter 3 - Guards

Some Counting House guards are a person, scenery, privately-named, in the Counting House Steps. "The guards are dressed in full livery: bright red uniforms with pendulums hanging from both shoulders, embroidered cog-links on their elbows, knee-high black boots tipped with metal pointers. Each one carries a flat spear: the one carried by the guard on the left is longer than the one carried by the guard on the right." The printed name is "guards".

Understand "guard", "guards", "uniformed",  "on the", "left", "right", "first guard/one/man", "second guard/one/man", "man", "men"   as the Counting House Guards.

Instead of attacking the Counting House guards:
	say "I don't think I do very well in a fight against these two."

Instead of attacking the Counting House guards with something:
	say "I don't think I do very well in a fight against these two."



Section 1 - Spears
													 
Some spears are carried by the Counting House guards. Understand "spear", "flat" as the spears. 

Rule for printing the description of the spears:
	say "Both the guards have got one: one's long, and the other one's short (and of course, the shorter one is the most important.)"

Instead of doing something when the spears are physically involved:
	say "I don't think the guards would let me!"

Instead of asking the Counting House guards for the spears:
	try taking the spears instead.

Instead of asking the Counting House guards to try opening the front of the Counting House:
	try going north.

Instead of asking the Counting House guards to try giving the spears to the player:
	try taking the spears instead.

Instead of asking the Counting House guards to try dropping the spears:
	try taking the spears instead.

Instead of pulling or taking the spears:
	say "If I could disarm two guards single-handed then I'd be able to deal with Calvin and Drake without scurrying around chasing Grey Figures in the hope of a reward!"

Section 1b - Uniforms

Some uniforms are worn by the Counting House guards. Understand  "uniform", "uniforms", "livery","boots", "knee high", "knee-high", "elbow", "elbows", "coglinks", "cog links", "links", "cog-links", "button", "buttons", "pendulums/penduluum", "pendulum/penduluum", "boot" as the uniforms.

Rule for printing the description of the uniforms:
	say "The uniforms are well-pressed and sparkling. Maybe I could get a job as a 2nd Assistant Button-Polisher!"

Instead of doing something when the uniforms are physically involved:
	say "I don't think the guards would let me!"

Instead of asking the Counting House guards for the uniforms:
	try taking the uniforms instead.

Instead of asking the Counting House guards to try giving the uniforms to the player:
	try taking the uniforms instead.

Instead of asking the Counting House guards to try dropping the uniforms:
	try taking the uniforms instead.

Instead of asking the Counting House guards to try taking off the uniforms:
	try taking the uniforms instead.

Instead of pulling or taking or taking off the uniforms:
	say "I don't think I could persuade two Counting House guards to undress, however funny it would be."

Instead of asking the Counting House guards to try taking off the uniforms:
	try taking the uniforms.

Section 1c - Nose

A nose is part of the Counting House guards. The description is "The guard has a fine Roman nose."

Understand "guards'", "guard's" as the nose.

Instead of doing something when the nose is physically involved: 	
	say "[one of]Who nose what would happen if I tried that?[or]Nose way.[cycling]"

Instead of searching the nose:
	say "From where I'm standing I can see right up it. Not much going on inside."

Instead of entering the nose:
	say "Right now, I'm the only one who in the nose about the Figure!"

Instead of scraping the nose:
	say "I don't think he'd appreciate it."

Section 2 - Conversation

The conversation table of the Counting House guards is the table of Counting House Guard conversation.

Table of Counting House Guard conversation
conversation			topic
CT_GUARD_ENTRY		"entry" or "[me]" or "aside" or "move" or "way" or "away"
CT_GUARD_GUARDS	"[himself]" or "guard" or "themselves" or "guarding" or "job" or "work"
CT_GUARD_PROOF		"business" or "proof"
CT_GUARD_CATHEDRAL		"[cathedral]" or "church" or "[abbey]" or "archbishop" or "[abbot]"
CT_GUARD_FIGURE		"[figure]"
CT_GUARD_PEOPLE		"[abbeyfolk]"
CT_GUARD_ENGINE		"engine" or "difference"
CT_GUARD_COUNTINGHOUSE	"counting" or "house" or "building"
CT_GUARD_CLOCKWORK		"[clockwork]" 
CT_GUARD_SAINTS		"saints" or "newton" or "babbage" or "breguet" or "godel"
CT_GUARD_DOOR		"door" or "doors"

CT_GUARD_ENTRY is clustered with CT_GUARD_PROOF, CT_GUARD_CATHEDRAL, CT_GUARD_FIGURE, CT_GUARD_PEOPLE, CT_GUARD_ENGINE, CT_GUARD_COUNTINGHOUSE, CT_GUARD_CLOCKWORK, CT_GUARD_SAINTS, CT_GUARD_GUARDS, CT_GUARD_DOOR.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_GUARD_ENTRY:
	say "I've already asked about that." instead;

Rule for firing fired CT_GUARD_GUARDS:
	say "That didn't seem to work too well before, did it?"

CT_GUARD_ENTRY is a conversation topic. The enquiry text is "'You've got to let me in. I'm from the Cathedral.'". The response text is "The guards look unimpressed. 'Without proof I'm afraid you could just as well be from the cock-fighting pits, looking to see who'll win tonight.'". 

CT_GUARD_GUARDS is a conversation topic. The enquiry text is "'So, is it a good job being a guard?' I ask pleasantly." The response text is "The first guard booms with laughter. 'Here that?' He pushes his mate in the arm. 'The young rat's trying to get us [i]on his side[r]. Maybe open us up, a little. How d'you like that?'[paragraph break]The second guard nods. 'No-one ever does that,' he agrees. 'Makes quite a nice change, to be honest with you.'"

CT_GUARD_PROOF is a conversation topic. The enquiry text is "'What sort of proof do you need?' I ask.". The response text is "The first guard shrugs. 'Normally isn't much of an issue of what,' he says, uncertainly. 'Most people have got something with them and just show it.'[paragraph break]'We don't usually do very much,' the second guard agrees.".
	
CT_GUARD_CATHEDRAL is a conversation topic. The enquiry text is "'I'm on business for the church,' I tell them.". The response text is "The first guard rolls his eyes. 'Look, wretchin. We'd not be guarding this place if you could talk your way in, would we?'".
	
CT_GUARD_FIGURE is a conversation topic. The enquiry text is "'I need to find out about the Figure in Grey,' I blurt.". The response text is "'Plenty of grey figures in here,' the second guard says. The first shoots him an icy look.".
		
CT_GUARD_PEOPLE is a conversation topic. The enquiry text is "I don't think they'd know them."

CT_GUARD_ENGINE is a conversation topic. The enquiry text is "'This is where they keep the Difference Engine, isn't it?' I ask.". The response text is "'This is the Counting House of St Philip,' the first guard replies. 'If you don't know what it's in it you probably don't have any right to know.'[paragraph break]'The kid does know,' the second guard points out.[paragraph break]'Well,' the first says to you. 'We still won't let you in.'".

CT_GUARD_COUNTINGHOUSE is a conversation topic. The enquiry text is "'What's the Counting House for?' I ask.". The response text is "The guards look baffled for a moment. 'Politics,' suggests the first. 'Counting,' answers the second.".

CT_GUARD_DOOR is a conversation topic. The enquiry text is "'Could you open the door?' I ask, as politely as possible." The response text is "'I could,' the first guard says.[paragraph break]'Absolutely,' the second replies. 'He could.'[paragraph break]'But I'm not going to,' the first guard says.[paragraph break]'No chance,' the second agrees. 'Sorry about that.'[paragraph break]The first guard gives him a sour look, but says nothing."

CT_GUARD_CLOCKWORK is a conversation topic. The enquiry text is "'But how does clockwork work?'". The response text is "The first guard shrugs. 'You're from the Abbey, aren't you? You tell us.'".

CT_GUARD_SAINTS is a conversation topic. The enquiry text is "'Which are those saints on the door?' I ask.". The response text is "'The saints of no-you-can't and go-pester-someone-else,' the second guard replies. The first rolls his eyes but says nothing.".




Section 3 - Permit

Instead of giving the Perpetuum Mobile diagram to the Counting House guards:
	try showing the Perpetuum Mobile diagram to the Counting House guards.

Instead of showing the Perpetuum Mobile diagram to the Counting House guards:
	say "[one of]'Doesn't mean a thing to me,' the first guard remarks, after peering at the diagram.[paragraph break]'It's a blueprint, isn't it?' the second replies.[paragraph break]'Yeah, but it's a not a blueprint for anything we've got here, is it?'[paragraph break]The second guard shrugs. 'I wasn't that good at school,' he says.[paragraph break]'Me neither.' The first guard prods me with the butt of his spear. 'You take your blueprints with you. No need to show off, now, is there?'[or]It didn't seem to do much good before.[stopping]";

Instead of giving the knife to the Counting House guards:
	try showing the knife to the Counting House guards. 

Instead of showing the knife to the Counting House guards:
	say "I'm not going to threaten the guards. They'd squash me in a second!"

Instead of giving the small gear to the Counting House guards:
	try showing the small gear to the Counting House guards.

Instead of showing the small gear to the Counting House guards:
	say "[one of]'See that?' the first guard remarks, laughing. 'The wretchin's trying to [i]bribe[r] his way in!'[paragraph break]'Never gonna work,' the second guard agrees, shaking his head. 'Never gonna work.'[paragraph break]'No. Can't bribe a Counting House guard.'[paragraph break]'Can't be done,' the second agrees.[paragraph break]'No way,' the first replies.[paragraph break]'Certainly not with something as worn out as that,' the second says.[paragraph break]The first frowns at him, and both go quiet.[or]That didn't work too well before, did it?[stopping]";

Instead of giving the scrap of paper to the Counting House guards:
	try showing the scrap of paper to the Counting House guards.

Instead of showing the scrap of paper to the Counting House guards:
	say "'Look, I've been [i]sent[r] here,' I insist, holding up the address.[paragraph break]'That is our address,' the first guard says. 'I recognise the number.'[paragraph break]The second guard nods. 'Ain't ever had a wretchin try and break their way in here, either.'[paragraph break]'Don't know why you would, nor neither.' The first guard pulls his spear away. 'Get inside with you, then. But don't mess with nothing.'[paragraph break]Don't mess with nothing? I can certainly agree to [i]that[r]. The second guard opens the door and I slip inside.";
	move the player to the Grand Foyer.


Instead of giving the work order to the Counting House guards:
	try showing the work order to the Counting House guards.

Instead of showing the work order to the Counting House guards:
	say "'How about this?' I try, producing Sa'at's work order.[paragraph break]The guards take one look at the seal and look deeply unimpressed. I suppose I wasn't going to fool the guards this way twice. But then the spears uncross and the first guard says, 'All right then.' The second opens the doors for me and I go inside.[paragraph break]Probably neither of them can read.";
	move the player to the Grand Foyer;

Chapter 4 - Event on Exit

Instead of going southwest when in the Counting House Steps:
	say "No turning back now. The Figure in Grey has got to be stopped!";

Instead of going down when in the Counting House Steps:
	try going southwest instead;


Part 3 - Grand Foyer


Last Instead of listening when the location is the Grand Foyer or the location is Main Platform or the location is Western Stairs or the location is Eastern Stairs or the location is Western Platform or the location is Eastern Platform or the location is Engine Room or the location is Western Balcony or the location is Eastern Balcony or the location is Eastern Landing or the location is Western Landing or the location is Eastern Hall or the location is Western Hall or the location is Long Hall:
	say "The clatter of cogs: [if Difference Engine is not visible]somewhere [end if]the Difference Engine is [i]moving[r]."

Instead of smelling when in the Grand Foyer:
	say "There's a soft smell of clean cloth coming from all around.";

Instead of listening when the Difference Engine is active and the Difference Engine is visible:
	say "The Engine is whirring and groaning and roaring, great winds of movement cascading from one side to the other. It's incredible!"

Instead of listening when Calculatrix Chase is happening:
	say "I've got my ears peeled for the people pelting after me!"

Chapter 1 - Description

The Grand Foyer is a room. "The hall is wide and lofty and filled with stars that shine from the sparkling brass fittings. It’s like Drake’s descriptions of the Abbot’s private bath-house: gleaming marble and a soft hazy smell. This is the foyer and it has nothing in it at all apart from two enormous staircases curving upwards to the west and the east."

Instead of listening when in the Grand Foyer and the Calculatrix Pristina is in the Main Platform:
	say "Voices murmur through the glass doors to the north. There are two women standing, almost in plain view but for the bevelled glass!";
	now CAL_SPOTTED is fired.


Instead of making to leave when in the Grand Foyer: try going south.
Instead of going inside when in the Grand Foyer: try going up.

Before going south when in the Grand Foyer:
	say "No thanks. I've got past those guards once, there's no reason to try it again." instead;

Instead of entering the front of the Counting House when in the Grand Foyer:
	try going south;

Instead of going up in the Grand Foyer:
	say "Which way? East or west?";

After going west from the Grand Foyer:
	say "My feet barely make a sound on the stairs.";
	continue the action;

After going east from the Grand Foyer:
	say "My feet barely make a sound on the stairs.";
	continue the action;

Chapter 2 - Scenery

Section 1 - Staircase backdrop

The marble stairs is a backdrop, privately-named, in the Grand Foyer, the Western Stairs, the Eastern Stairs, the Western Landing, the Eastern Landing. The printed name is "staircase".

Understand "staircase", "stairs", "steps", "stair", "carpeted", "marble" as the marble stairs.

Understand "guards", "guard", "racing" as the marble stairs when Calculatrix Chase is happening.

The description is "The stairs are thickly carpeted, presumably to cut down on the terrible noise of one or two people going up or down should anyone ever enter this building at all."

Rule for printing the description of the marble stairs when in the Grand Foyer:
	say "Marble steps one after the other, all thickly carpeted with a deep patterned carpet. If I thought the Cathedral was lavishly decorated then this place is just extravagant!";

Rule for printing the description of the marble stairs when the location is a landing:
	say "The stairs lead down, a kind of waterfall of rich carpet and gleaming marble.";

Rule for printing the description of the marble stairs when the location is a landing during Calculatrix Chase:
	say "Guards are racing up the stairs, in almost total silence because of the thick carpet.";

Instead of climbing the marble stairs:
	if the location is the Grand Foyer or the location is a Stairwell:
		try going up;
	otherwise:
		try going down;

Instead of climbing down the marble stairs:
	if the location is the Grand Foyer:
		say "The stairs only go up from here.";
	otherwise:
		try going down;

Instead of climbing up the marble stairs:
	if the location is a landing:
		say "The stairs only go down from here.";
	otherwise:
		try going up;

Definition: a room is a landing:
	if it is the Western Landing or it is the Eastern Landing, yes;
	no;

Definition: a room is a balcony-level:
	if it is the Western Balcony or it is the Eastern Balcony, yes;
	no;

Definition: a room is a stairwell:
	if it is the Western Stairs or it is the Eastern Stairs, yes;
	no;

Definition: a room is a hallway:
	if it is the Western Hall or it is the Eastern Hall, yes;
	no;

Definition: a room is platform-level:
	if it is the Western Platform or it is the Eastern Platform, yes;
	if it is the Main Platform, yes;
	no;

The thick patterned carpet is part of the marble stairs. Understand "deep", "thickly", "cog", "cogs", "pattern" as the carpet. It has description "The carpet is patterned with intersecting cogs, but the pattern seems never to repeat, anywhere across the floor."

Before doing something when the backdrop-floor is involved and the marble stairs are visible:
	redirect the action from the backdrop-floor to the thick patterned carpet, and try that instead.

Instead of putting something on the thick patterned carpet:
	try dropping the noun instead.

Instead of putting something on the marble stairs:
	try dropping the noun instead.

Instead of entering the patterned carpet when the player's command includes "stand on":
	say "Did you think I was floating in mid-air?"

Instead of entering or approaching the patterned carpet:
	say "Which way should I go? [run paragraph on]";
	try listing exits;

Section 2 - East / West Stairs

The West Foyer Steps are a mirror-thing, major, scenery, privately-named, in the Grand Foyer. The printed name is "west stairs". Understand "west", "western", "stairs", "staircase", "steps", "stair", "carpeted", "marble" as the west foyer steps when the player's command matches the text "west", case insensitively.

The first description of the west foyer steps is "Marble steps one after the other, all thickly carpeted with a deep patterned carpet. I thought the Cathedral was lavishly decorated then this place is just extravagant!"

The second description of the west foyer steps is "These stairs are the exact double of the others."

The East Foyer Steps are a mirror-thing, scenery, privately-named, in the Grand Foyer. The printed name is "east stairs". Understand "east", "eastern", "stairs", "staircase", "steps", "stair", "carpeted", "marble" as the east foyer steps when the player's command matches the text "east", case insensitively.

The East Foyer Steps pair the West Foyer Steps.

Instead of climbing or entering the west foyer steps: try going west;
Instead of climbing or entering the east foyer steps: try going east;

Instead of looking under the West Foyer Steps:
	say "The stairs have space beneath them. They must be built into the walls for support."

Instead of looking under the East Foyer Steps:
	say "The stairs have space beneath them. They must be built into the walls for support."

Section 3 - Glass Doors

Some glass doors are a door, open, not openable, scenery, north of the Grand Foyer, south of the Main Platform. "Beyond the glass doors is the complex and intricate machine, its pinions bent by the warped glass into meaningless shapes[if the Calculatrix Pristina is in the Main Platform]. In front of the machine I can make out two ladies, one short and dark-haired wearing a long white gown, the other elegant, thin and dressed up like a princess at a ball[end if]."

Does the player mean doing something with the glass doors: it is likely.

Instead of going through the glass doors when the location is the Grand Foyer and the Calculatrix Pristina is in the Main Platform and CAL_SPOTTED is unfired:
	fire CAL_SPOTTED;

Instead of examining or searching the glass doors when the location is the Grand Foyer and the Calculatrix Pristina is in the Main Platform and CAL_SPOTTED is unfired:
	fire CAL_SPOTTED;

Instead of going through the glass doors from the Grand Foyer when the Calculatrix Pristina is in the Main Platform:
	say "I don't want to get caught and even if the two women behind the door don't see me they'd be bound to [i]smell[r] me if I went inside.";

CAL_SPOTTED is a trigger. 

Rule for firing CAL_SPOTTED:
	say "My hand freezes on the door-handle as I overhear a woman's voice. 'The machine works quickly.' Peering through the door I can make out two figures on the other side, their bodies stretched and bent by the warps in the glass."

After going through the glass doors from the Grand Foyer:
	say "I slip through the glass doors, between the first blocks of the enormous machine and up onto the central platform.";
	continue the action;

Instead of opening the glass doors:
	try entering the glass doors;

Understand "beveled/bevelled", "bubbled", "warped", "bubbles", "warps", "door" as the glass doors.

Section 3b - glimpse of the machine

The glimpse-machine is a glimpse backdrop in the Grand Foyer. The printed name is the "[if the Difference Engine is admired]Difference Engine[else]machine[end if]". Understand "machine", "pinions", "difference", "engine", "computer" as the glimpse-machine.

Rule for printing the description of the glimpse-machine when in the Grand Foyer:
	say "[if the glass doors are closed]I can't make out much through the bevelled glass[else]The machine seems vast and very complicated[end if]."

The glimpse-machine identifies the sprung platform.



Section 4 - Desk

A large oak desk is a supporter, in the Grand Foyer. "To the north a pair of doors of beveled glass are filled by broken fragments of light and clockwork. To the south is a large oak desk and the bronze doors back onto the street." The description is "A sturdy oak table, probably made from the timbers of a sunken Spanish ship or something[if the oak desk is not empty]. On the table is [a list of things on the large oak desk][end if]."

Rule for writing a paragraph about the large oak desk:
	say "To the north are two doors of beveled glass. To the south is a large oak desk just next to the brass doors back onto the street.";

Understand "sturdy", "table", "wood", "wooden", "timbers" as the oak desk. The printed name is "oak desk".

Instead of looking under the large oak desk:
	say "There's nothing very interesting down there. The floor, mostly."

Section 5 - Folder

A leather folder is on the large oak desk. The description is "A leather folder containing a few documents. It's stamped with the Parliamentary seal of a spiked wheel."

The reading matter is "Inside are a few documents stamped with Parliament seals. [i]'In the Absence of his Lordship the honourable and worthy minister etc etc. Raffles du Mer, fighting on the Main for cog and country, her Ladyship the honourable and austere etc etc Duchess has been sanctioned to undertake War Office administrative responsibilities. We hope and pray for her husband's swift return...'[r][paragraph break]The next sheet has a hand-written note attached: [i]'Questions approved. Most unusual? Politically motivated?'[r] Beneath that is a sheet of numbers: must be an accounts list or something."

Instead of opening or searching the leather folder:
	try reading the leather folder instead;

The Parliamentary documents are part of the leather folder. Understand "paper", "papers" as the Parliamentary documents.

Instead of examining or reading the Parliamentary documents:
	try reading the leather folder instead.

Instead of taking the Parliamentary documents:
	say "They look boring. I don't need them."

The Parliamentary seal is part of the leather folder. Understand "spiked", "wheel", "stamp" as the Parliamentary seal. 

Instead of examining the Parliamentary seal:
	say "It's a cog, predictably: but a really spiky one. The kind you could roll over your enemies."

The sheet of numbers is part of the Parliamentary documents. Understand "account", "accounts", "list" as the sheet of numbers. 

Instead of examining the sheet of numbers:
	say "Two columns of five-digit numbers. One is headed Action Control, the other Actor Control."

Instead of taking the sheet of numbers:
	say "It's no use to me."

Section 6 - Duchess and Calculatrix

After deciding the scope of the player while in the Grand Foyer:
	if the Duchess Du Mer is in the Main Platform,
		place the Duchess Du Mer in scope;
	if the Calculatrix Pristina is in the Main Platform,
		place the Calculatrix Pristina in scope;

Understand "women", "ladies", "voices", "women's", "bodies", "important", "people", "figures" as the Glass Doors when in the Grand Foyer.

Part 4 & 5 - Eastern / Western Stairs

Instead of making to leave when in the Eastern Stairs: try going down instead.
Instead of making to leave when in the Western Stairs: try going down instead.
Instead of going inside when in the Eastern Stairs: try going up instead.
Instead of going inside when in the Western Stairs: try going up instead.

The Western Stairs is a major mirror-room, west of the Grand Foyer.

The first description is "The grand staircase sweeps out sideways and up like the hem of a dancing dame's dress. I could climb to the north[west with mirroring], head down to the [east with mirroring], or cling to the rail like a windswept sailor."

The second description is "This staircase is the exact mirror of the other: I almost expect to see another Wren standing and waving across the hallway to the [east with mirroring]. I could go up to the north[west with mirroring]."

The Eastern Stairs is a mirror-room, east of the Grand Foyer. The hemisphere is east. 

The Western Stairs mirrors the Eastern Stairs.

Instead of going up in the Western Stairs:
	try going northwest;

Instead of going up in the Eastern Stairs:
	try going northeast;

Instead of going down in the Western Stairs:
	try going east;

Instead of going down in the Eastern Stairs:
	try going west;

After going east from the Western Stairs:
	say "I swoop back down to the Foyer.";
	continue the action;

After going west from the Eastern Stairs:
	say "I swoop back down to the Foyer.";
	continue the action;

The long rail is a backdrop in the Western Stairs, in the Eastern Stairs. The description is "A long brass railing that swoops up the staircase." Understand "brass", "railing" as the long rail.

Instead of climbing or jumping on or jumping over or entering the long rail:
	say "I zoom back down to the Foyer!";
	move the player to the Grand Foyer;

Instead of taking the long rail:
	say "Come on, it's not [i]that[r] exciting standing here."


Part 6 & 7 - Eastern / Western Landings

Instead of making to leave when in Western Landing: try going southeast.
Instead of making to leave when in Eastern Landing: try going southwest.

Instead of making to leave when in Western Landing during Calculatrix Chase: try going north.
Instead of making to leave when in Eastern Landing during Calculatrix Chase: try going north.

Instead of going down when in Western Landing: try going southeast.
Instead of going down when in Eastern Landing: try going southwest.

Instead of going inside when in Western Landing: try going north.
Instead of going inside when in Eastern Landing: try going north.

Chapter 1 - Descriptions

The Western Landing is a major mirror-room, northwest of the Western Stairs. 

The first description is "[one of]The opulence of the Foyer is gone. [or][stopping]At the top of the stairs is a grand and silent hallway, like someone took the whole of the Abbey and chucked out all the candles, icons, wax, grease, soot, echoes and mothballs. I feel dirty just breathing the air.[paragraph break]The corridor continues to the north. Doors of frosted glass line up on either side, but all are closed."

The second description is "This landing is the same as the other one: a dark corridor lined by faceless closed office doors, heading endlessly north away from the stairs."

The Eastern Landing is a mirror-room, northeast of the Eastern Stairs. The hemisphere is east. 

The Western Landing mirrors the Eastern Landing.

Instead of going down in the Western Landing:
	try going southeast;

Instead of going down in the Eastern Landing:
	try going southwest;

Instead of going southeast in Western Landing during Calculatrix Chase:
	say "Right into the arms of the guards? That wouldn't be clever – and hanging round here waiting wouldn't be, either.";

Instead of going southwest in Eastern Landing during Calculatrix Chase:
	say "Right into the arms of the guards? That wouldn't be clever – and hanging round here waiting wouldn't be, either.";

Instead of smelling when in the Western Landing or in the Eastern Landing:
	say "Mothballs and rotting offices, I suppose."

Chapter 2 - Backdrops

Section 1 - Anxiety Counter

The Anxiety Counter is a counter. The top end is 5. The internal value is 2. 

Rule for firing the anxiety counter when Calculatrix Chase is not happening:
	say "[one of]People are talking quietly in the offices on either side.[or]Somewhere nearby, a floorboard creaks.[or]Someone approaches from down the corridor. I throw myself into a doorway until they're safely past.[or]From behind one of the doors I can hear voices, deep in conversation.[or]A door-handle turns. I freeze! But then the handle relaxes again and footfalls move away from the door.[or]If each room has just one person in it, that means at least forty ways I could get caught, and eighty pairs of feet…[or]If it weren’t for the carpet in this place my footsteps would have alerted everyone here by now![or]If only the doors had glass panels. Then at least I’d get some warning![cycling]";

The Region of Anxiety is a region. The Western Landing, the Eastern Landing, the Western Hall, the Eastern Hall, the Long Hall are in the Region of Anxiety.

Every turn when in the Region of Anxiety:
	increment the Anxiety Counter;

Section 2 - Some Doors

Some labeled doors are a backdrop, privately-named, in the region of anxiety.

Instead of opening or entering the labeled doors:
	say "I can't see whoever's inside wanting to help me."

Rule for printing the description of the labeled doors when in the Western Landing:
	say "The doors have labels: Office of Paradox, Bureau of Rhetorical Simplification, Archive of Unanswerable Queries, Department of Departmental Allocation next to the Department of Recursion, Department of Dependencies...";

Rule for printing the description of the labeled doors when in the Eastern Landing:
	say "The doors have labels: Governor of Logic, Prime Roster, Department of Conceptual Multiplication, Department of Efficiency and Inversing, Bursary and Expenses...";

Understand "label", "labelled", "labeled", "door" as the labeled doors when the player can not see the open subtle escape.

Understand "closed", "frosted", "glass", "labels", "doors" as the labeled doors.

Instead of knocking on the labeled doors:
	say "That seems like a great way to get myself caught."

Section 2b - Offices

Some offices are a backdrop in the Western Landing, in the Eastern Landing.


Understand "office of", "office", "offices", "bureau of", "archive of", "department of", "governor of" , "paradox", "rhetorical", "simplification", "unanswerable", "queries", "departmental allocation", "recursion", "dependencies" as the offices when the location is the Western Landing.

Understand "office", "offices", "bureau of", "archive of", "department of", "governor of" , "logic", "prime", "roster", "conceptual", "multiplication", "efficiency", "inversing", "and inversing", "bursary", "expenses", "and expenses" as the offices when the location is the Eastern Landing.

Rule for printing the description of some offices:
	say "The door to each office is opaque, which means its hard to work out what goes on inside."

Instead of entering or approaching or knocking on or attacking or pushing or searching or looking under some offices:
	say "I don't need any officials. I need the Difference Engine itself!"

Section 3 - Staircases

[See 'marble stairs' object in Grand Foyer, Staircase Backdrop, above.]

Part 8 & 9 - Eastern / Western Halls

Instead of making to leave when in the Eastern Hall: try going south instead.
Instead of making to leave when in the Western Hall: try going south instead.
Instead of going inside when in the Eastern Hall: try entering the Eastern Grille instead.
Instead of going inside when in the Western Hall: try entering the Western Grille instead.
Instead of making to leave when in the Eastern Hall during Calculatrix Chase: try going northwest instead.
Instead of making to leave when in the Western Hall during Calculatrix Chase: try going northeast instead.


The Western Hall is a major mirror-room, north of the Western Landing.

The first description is "The hall continues, soundless and empty. It curves a little here, from south to north[east with mirroring]. Of the doors lining either side one stands out to the [east with mirroring] – instead of the usual white wood-panelling, it's a brass grille, with Parliamentary cogwheels worked into the mesh."



The second description is "This hall is the same as on the other side of the building: curving from south to north[east with mirroring], with a brass grille set into the [west with mirroring] wall. Labelled doors line either wall, all closed."

The Eastern Hall is a mirror-room, north of the Eastern Landing. The hemisphere is east. 

The Western Hall mirrors the Eastern Hall.

Chapter 2 - Scenery

Section 1 - Western Grille

The Western Grille is a door, scenery, privately-named, east of the Western Hall, west of the Western Balcony. The printed name is "grille". Understand "brass", "grille" as the western grille. The description is "[if the location is a hallway]Through the grille comes the quiet murmur of gears and levers, like the sound of the woodworm munching through the rafters of your bedroom floor at night. It's a door, leading onto a small balcony on the inside of the building.[otherwise]The grille leads back to the corridor.[end if]"


Understand "cogwheels", "cogwheel", "parliamentary" as Western Grille.

Instead of going through Western Grille from Western Hall during Calculatrix Chase:
	say "No good trying to hide on the balcony - I need to get out of here!";

After going through Western Grille from Western Hall:
	fire TRIG_BALCONY; continue the action;

After going through Western Grille from Western Balcony:
	say "I slip back through the grille door."; continue the action;

Rule for implicitly opening the Western Grille:
	try silently opening the Western Grille; [saying nothing]

Instead of listening to the Western Grille:
	try examining the noun;

Section 2 - Eastern Grille

The Eastern Grille is a door, scenery, privately-named, west of the Eastern Hall, east of the Eastern Balcony. The printed name is "grille". Understand "brass", "grille" as the eastern grille. The description is "[if the location is a hallway]Through the grille comes the quiet murmur of gears and levers, like the sound of the woodworm munching through the rafters of your bedroom floor at night. It's a door, leading onto a small balcony on the inside of the building.[otherwise]The grille leads back to the corridor.[end if]"

Understand "cogwheels", "cogwheel", "parliamentary" as Eastern Grille.

Instead of going through Eastern Grille from Eastern Hall during Calculatrix Chase:
	say "No good trying to hide on the balcony - I need to get out of here!";

After going through Eastern Grille from Eastern Hall:
	fire TRIG_BALCONY; continue the action;

After going through Eastern Grille from Eastern Balcony:
	say "I slip back through the grille door."; continue the action;

Rule for implicitly opening the Eastern Grille:
	try silently opening the Eastern Grille; [saying nothing]

Instead of listening to the Western Grille:
	try examining the noun;

Section 3 - Grille event

TRIG_BALCONY is a trigger.

Rule for firing unfired TRIG_BALCONY:
	say "I stride through the brass grille and then have to catch myself from falling. Beyond it is nothing but a short balcony and a long drop.";

Rule for firing fired TRIG_BALCONY:
	say "I go out onto the balcony over the Engine.";

Section 4 - Doors

Rule for printing the description of the labeled doors when in the Western Hall:
	say "The doors have labels: Geographic to Semantic Mapping, Future Dating, Office of Deliberate and Indeliberate Misinformation, Catering and Festivities.";

Rule for printing the description of the labeled doors when in the Eastern Hall:
	say "The doors have labels: Department of Communications, Office of Lubrication, Translation - Retranslation – Obfuscation, Secretarial Pool and Showers.";

Part 10 - Long Hall

Instead of going inside when in the Long Hall and Calculatrix Chase is happening: 
	try going east.
Instead of making to leave when in the Long Hall and Calculatrix Chase is happening: 
	try going east.
Instead of going inside when in the Long Hall:
	try entering labeled doors.
Instead of making to leave when in the Long Hall:
	say "Southeast or southwest?"

The Long Hall is northeast of the Western Hall, northwest of the Eastern Hall. "The hallway continues here, southwest round to southeast, unless I'm just walking forwards and someone is pulling the carpet back underneath me. If I took down all the labels off the doors here and swapped them around I don't think anyone would ever find their own room again."

Chapter 2 - Scenery

Section 1 - Doors

Rule for printing the description of the labeled doors when in the Long Hall:
	say "The doors have labels: Office of Indexing, Department of Information Intersection, Department of Prophecy Management and Suitable Doubt, Minister for Consolidation.";

Understand "office", "offices", "bureau of", "archive of", "department of", "governor of" , "minister", "minister for", "indexing", "information", "intersection", "prophecy", "management", "suitable", "doubt", "consolidation", "management and suitable" as the offices when the location is the Long Hall.

Section 2 - Phantom Door

The subtle escape is a door, privately-named, east of the Long Hall, west of the Office. The description of the subtle escape is "[if the location is the Long Hall]The door's label is hidden because it's open. And right now, that's all that matters. That and the office beyond is empty.[otherwise]That door leads back to the hall, which means it leads back to the guards, and the guards’ spears. So, no thanks, I’m happy where I am for now… but not for much longer.[end if]". The printed name of the subtle escape is "door".

The subtle escape is closed.

After assembling available exits when the location is the Long Hall and Calculatrix Chase is not happening:
	remove east from the viable directions, if present;
	continue the action;

Rule for implicitly opening the subtle escape: [ we mirror can't go behaviour here ]
	try listing exits instead;
[	say "I can't go that way." instead;]

The initial appearance of the subtle escape is "Except for whoever it was that left their office door open, to the east. Perhaps they were scared by the sound of the guards, converging on me from both sides!" [This is used in the hallway]

Rule for deciding the concealed possessions of the Long Hall when the particular possession is the subtle escape:
	unless Calculatrix Chase is happening:
		yes;
	no;

Rule for printing a locale paragraph about the subtle escape when Calculatrix Chase is not happening:
	now the subtle escape is mentioned;

Rule for printing a locale paragraph about the subtle escape when in the Office:
	now the subtle escape is mentioned;

When Calculatrix Chase begins:
	now the subtle escape is open;

Understand "open", "label", "office", "door" as the subtle escape when Calculatrix Chase is happening.

After going through the subtle escape during Calculatrix Chase:
	say "It's as good a plan as any. I duck through into an office and slam the door behind.";
	continue the action;

Part 11 & 12 - Eastern / Western Balconys 

Instead of going inside when in the Western Balcony: try going west.
Instead of making to leave when in the Western Balcony: try going west.
Instead of going inside when in the Eastern Balcony: try going east.
Instead of making to leave when in the Eastern Balcony: try going east.

The Western Balcony is a major mirror-room.

The first description is "I'm teetering on a tiny balcony with no railing, that sticks out over a sea of machinery. Cogs within cogs: if I fell off it'd grind me to a powder. Which is why I've got my fingertips hooked through the grille to the [west with mirroring].[paragraph break]There is a ladder for going down to ground level from here. And looking across the open space of the Counting House, I can see – of course – another identical balcony on the other side."

The second description is "This balcony is the same as the first one. A ladder leads down to the thrashing machinery that froths and spits like a tureen of metal soup. Pea soup, because of the green light coming through the dome overhead."



The Eastern Balcony is a mirror-room. The hemisphere is east. 
The Western Balcony mirrors the Eastern Balcony.

Instead of going down from a balcony-level room when SE_BALCONY_3 is unfired:
	say "If I move, the two women would surely see me.";

Instead of going down from a balcony-level room during Calculatrix Chase:
	say "There's one guard left down there. More than a match for me if I run right into him!";

After going down from a balcony-level room:
	say "[one of]The ladder might be thin, but unlike the one to where I sleep it's solid metal and doesn't bend like a river-reed. [or][stopping]I'm down in a flash.";
	continue the action;

Chapter 2 - Scenery

Section 1 - Ladders

The balcony ladder scenery is a backdrop, privately-named, in the Western Balcony and the Eastern Balcony. "The balcony juts out over the workings of the Engine, perhaps to provide technicians with a view for repairs – or perhaps just to try and decipher how it works. A thin ladder leads down from one edge to ground level."

Understand "balcony", "metal", "ladder", "edge" as the balcony ladder scenery. The printed name is "balcony".

Instead of climbing up the balcony ladder scenery:
	say "The ladder goes down from here."

Instead of climbing the balcony ladder scenery:
	try going down;

Instead of taking or pulling or pushing the balcony ladder scenery:
	say "The ladders are bolted onto the walls of the Engine chamber."

Section 2 - Duchess Du Mer and Calculatrix Pristina

After deciding the scope of the player while the location is a balcony-level room:
	if the Duchess Du Mer is in the Main Platform,
		place the Duchess Du Mer in scope;
	if the Calculatrix Pristina is in the Main Platform,
		place the Calculatrix Pristina in scope;

Before doing something when the Duchess du Mer is physically involved and the location is a balcony-level room:
	say "Both women are way below me." instead.
Before doing something when the Calculatrix Pristina is physically involved and the location is a balcony-level room:
	say "Both women are way below me." instead.

Instead of shouting at the Calculatrix Pristina:
	say "I don't want to attract her attention! Why would I?"
Instead of shouting at the Duchess du Mer:
	say "I don't want to attract her attention! Why would I? (Except that she looks so kind and gentle...)"

Chapter 3 - Script

SE_BALCONY_1 is a scripted event. The display text is "In the middle of the machine below is a wide circular platform, on which two women are in deep discussion, their voices echoing through the domed hall.[paragraph break]'Any idea? Any at all?' the tall woman is asking.[paragraph break]'Five digits,' replies the other, smaller woman, before she pauses to push a pair of spectacles back up her nose. 'Five and five. All questions have an actor and an action, and each is a five digit number. Then it's a sort of sum we do...'[paragraph break]'How divine!' remarks the tall woman.[paragraph break]'Quite,' the other replies.".

SE_BALCONY_2 is a scripted event. The display text is "The shorter woman is indicating an elaborate steel abacus by her elbow. 'The numbers are entered here, and over on the other side. St. Babbage's original was free to be used by everyone but of course, once the Government sequestered the machine...'[paragraph break]'You have a copy of the key?' the tall woman demands. Her face is familiar from somewhere, but I can't place it.[paragraph break]'Of course I do!' The shorter woman laughs, and lifts up a key on a ribbon around her neck. It is made of a brilliant red material that sparkles in the light. 'How else could I compute your answers?'[paragraph break]'Calculatrix Pristina,' the tall woman asks, very seriously. 'Did it answer my three questions? Was it capable?'".

SE_BALCONY_3 is a scripted event. The display text is "The Calculatrix below is nodding. 'It can answer any question, even questions so very...' She shifts, awkwardly. '[i]Incompatible[r].'[paragraph break]'Never mind that,' the tall woman replies fiercely. That's when I place her: the Duchess du Mer, the only woman in Parliament, who gained the place after her husband disappeared along with his boat on the Spanish Main. She's visited the Abbot before and always seemed quite kind. [paragraph break]'All I'm trying to explain,' the Calculatrix replies, voice shaking, 'is that this -' a whisper - 'Relativity' - she blushes - 'is hard to describe in clockwork. And the machine's answers may only be the projection of the truth through the space of the Engine.'[paragraph break]The Duchess is waving a handful of small cards. 'All I want is a yes or no,' the Duchess replies. 'Are these answers reliable?'[paragraph break]'True, yes,' the Calculatrix answers. She looks distinctly uncomfortable. 'But reliable? Well, relatively, perhaps...'[paragraph break]The two women walk away towards the glass doors, still in conversation.".

SE_BALCONY_1 is clustered with SE_BALCONY_2 and SE_BALCONY_3.

The room-script of Eastern Balcony is { SE_BALCONY_1, SE_BALCONY_2, SE_BALCONY_3 }.
The room-script of Western Balcony is { SE_BALCONY_1, SE_BALCONY_2, SE_BALCONY_3 }.

After firing a scripted event that is clustered with SE_BALCONY_1:
	[maintain balance across the two balconies, as they can't really share the same script.]
	let the far balcony be the reflection of the location;
	if the number of entries in the room-script of the far balcony is not 0:
		remove entry 1 from the room-script of the far balcony;

After firing SE_BALCONY_2:
	now the Calculatrix Pristina is known;

After firing SE_BALCONY_3:
	now the Duchess Du Mer is known;
	remove the Duchess Du Mer from play;
	remove the Calculatrix Pristina from play;

Brief conversation is a scene. Brief conversation begins when SE_BALCONY_1 is fired. Brief conversation ends when SE_BALCONY_3 is fired.

Instead of listening to a balcony-level room during Brief Conversation:
	[[JON]: You may wish to say something here]
	do nothing;

Instead of listening to a balcony-level room when Brief Conversation has ended and Calculatrix Chase is not happening:
	[[JON]: And/or here!]
	continue the action;


Part 13 - In The Engine

Engine Room is north of Main Platform. The printed name is "In The Engine". West of The Engine Room is down of the Western Balcony. East of The Engine Room is down of Eastern Balcony.

The description is "[one of]I'm standing in the middle of the engine: it's like being a giant in a pine forest. All around are straight brass strands with cogs for branches and tiny teeth for needles that brush against those of their neighbours. It's all moving, all the time, stirred by a breeze – shivers start from the main platform to the south and across to the ladders east and west.[or]The machine around me moves and breathes quietly, just ticking over, cogs and stands twitching in their sleep. There's something eerie about it - and knowing this is the machine that runs the city, and maybe more... The central platform is just south of here. Two thin ladders climb the dome east and west.[stopping]"

Rule for printing the description of the Engine Room during Calculatrix Chase:
	say "The engine rises up on all sides, hopefully giving me a bit of cover from the guards on the platform. East and west the ladders rise up. Which is great: I've got [i]options[r].";

Instead of going up when in the Engine Room:
	say "Which ladder, east or west?"

Instead of making to leave when in the Engine Room: try going up.
Instead of going inside when in the Engine Room: try going south.

Section 1 - Ladders 

Some narrow ladders are scenery in the Engine Room. "The ladders lead up to balconies, one east and west." 

Understand "east ladder", "west ladder", "ladder", "brass", "metal" as the narrow ladders.

Instead of approaching or entering or climbing or taking the narrow ladders:
[ bit of a bodge ]
	if the player's command includes "east", try going east instead;
	if the player's command includes "west", try going west instead;
	try going up instead.

Instead of doing something when the narrow ladders are physically involved:
	say "The ladders are firmly built into the walls - just another part of the Engine. 'Good Maintainence  is its own Reward,' as the Abbot says."

Section 2 - Dials

Some small golden dials are a container, open, not openable, in the Engine Room. "On top of each brass spine is a small golden dial fitted with a pointer no thicker than a hair." The description is "[if we have taken the ruby key]Every spindle is topped by a tiny dial.[otherwise]Every spindle is topped by a tiny dial, marked with tiny numbers 0 to 9, along with a question mark, an exclamation mark and an ampersand.[end if]". The printed name is "dials". Understand "gold", "brass", "spindles", "spines", "dial", "spine", "spindle", "pointers", "pointer", "tiny", "mark", "marks", "question", "exclamation", "ampersand", "ampersands" as the small golden dials.

After printing the description of the small golden dials:
	if the ruby key is off-stage:
		move the ruby key to the small golden dials;
	if the ruby key has not been carried:
		say "[paragraph break]Sticking from one dial is a ruby-glass key. ";

Instead of turning the dials:
	say "[one of]I've no idea what they do, and if I changed any of them I'd never be able to remember how they were set before.[or]Seriously. I don't know what any of these do and there are thousands of them![stopping]";

Instead of setting the dials to:
	try turning the dials.
Instead of number-setting the dials to:
	try turning the dials.


Instead of inserting something into the dials:
	if the noun is the ruby key:
		try turning the dials instead;
	otherwise:
		say "[The noun] isn't going to fit there.";

Section 3 - Ruby Key

The ruby key is a thing. The description is "A small key of blood-coloured glass. It seems pretty fragile, but then I could probably break the engine if I sneezed on it."

Understand "glass", "ruby-glass", "blood-coloured", "blood-colored", "blood", "red", "coloured/colored" as the ruby key.

After taking the ruby key when we have not taken the ruby key:
	say "I reach over and pluck the key from the machine.";

The matching key of an abacus is usually the Ruby Key.

Chapter 2 - Scenery

Section 1 - Roof Dome

The roof dome is a backdrop, in the Main Platform, the Engine Room, the Western Balcony, the Eastern Balcony, the Eastern Platform, and the Western Platform. "Overhead, a dome of iron girders and pale green glass. With the movement below, it makes the whole room feel the way I imagine the ocean to be."

Instead of doing something when the roof dome is physically involved:
	say "The dome is far out of reach.";

Section 2 - Difference Engine

The Difference Engine is a backdrop, in Main Platform, The Engine Room, Western Balcony, and Eastern Balcony, Eastern Platform, Western Platform. 

The Difference Engine can be admired or unadmired. The Difference Engine is unadmired.

Every turn when the unadmired Difference Engine is visible:
	now the Difference Engine is admired.

Rule for printing the description of the inactive Difference Engine when the Difference Engine has been active:
	say "The machine has now gone quiet, all its cogs back to gentle stirring motions. Unfortunately for me, it's now the people who are all worked up!"

Rule for printing the description of the Difference Engine when the location is a balcony-level room:
	say "The Engine is a dizzying sight - the whole of the domed expanse filled with cogs and spindles and spines. This is the heart of the city, right here, or more likely it's brains. I could stare for hours - parts inside parts inside parts... Enough to make one fall and not notice till you hit one of those sharp stacks of cogwheels.";

Rule for printing the description of the inactive Difference Engine:
	say "The Engine is made of blocks, each a thicket of spindles lined with a stack of cogs, able to turn together or independently. A single breath of movement flits around the machine from one cog to another like there was a bee trapped in the workings: one moment by my feet and suddenly back over at the platform[if Calculatrix Chase has not happened]. [paragraph break]And if Covalt thinks this machine can tell me where I can find the Figure in Grey, then I guess it can[end if].";

Rule for printing the description of the Difference Engine:
	say "The machine is moving like a corn-field in a thunderstorm. It seems like every cog is turning, and each spine is clunking up and down, changing the way they interlaced. It's like the mechanism could shake itself loose at any minute. I don't want to be standing in the middle when it does.";

Understand "cube", "springs", "levers", "vertical rods", "rods", "cogs", "platforms", "scaffolds", "blocks", "thicket", "spindles", "stack", "breath", "single breath", "movement", "motion", "teeth", "tiny teeth", "brass", "stands", "stand", "straight", "spine", "machine" as the Difference Engine.

The Difference Engine can be active or inactive. The Difference Engine is inactive.

Instead of touching or turning or pushing or pulling or switching on the Difference Engine:
	say "I run my fingers along one of the spindles – then snatch them back before they're stung.";

Instead of doing something when the Difference Engine is physically involved and the location is a balcony-level room:
	say "The Engine is a good way below me at the foot of the thin ladder.";

Instead of doing something when the Difference Engine is physically involved and the location is a platform-level room:
	say "The Engine is below the level of this platform, behind a rail so I can't fall in."

Before attacking or switching off the difference Engine:
	say "Interesting idea. I could just move a couple of switches and then no-one would ever be able to fix it. Then they could never use it to track me down for what I'm doing now... but, if I did, how would I find out where the Figure was heading?" instead.

Before attacking the difference Engine when Calculatrix Chase is happening:
	say "No time for that now! Run!" instead.

Instead of entering the Difference Engine when the location is a balcony-level room:
	try going down;

Instead of setting the Difference Engine to:
	say "The controls are over on the main platform."
Instead of number-setting the Difference Engine to:
	say "The controls are over on the main platform."

Part 14 - Main Platform

Chapter 1 - Description

The Main Platform is a room. "The main platform rises up from the heart of the Engine and is topped by a single lever, large enough to topple a building or lift a ship from the water. Beside it is a low a pedestal of dull grey with something like Brother Reloh’s typewriter on top. Beside it is a dull grey box full of dull grey pamphlets.[paragraph break]To east and west thin catwalks lead towards panels fitted with controls. I could also go back north, or south towards the glass doors of the Foyer." 

Instead of making to leave when in the Main Platform: try going south.
Instead of going inside when in the Main Platform: try going north.
Instead of making to leave when in the Main Platform and Calculatrix Chase is happening: try going north.

After going from the Main Platform to the Engine Room during Calculatrix Chase:
	say "I leg it off the platform and between the cog-stacks.";
	continue the action;

Chapter 2 - Scenery

Section 1 - Platform

The sprung platform is a backdrop, in the main platform, in the Western Platform in the Eastern Platform. The description is "[if the location is the Main Platform]The platform seems to be very slightly sprung. Something to do with the lever, no doubt.[otherwise]The platform is made of delicate wrought iron and brass, and runs all along the south side of the atrium, facing the Engine. It's supported above floor level, where the driving springs are.[end if]". The printed name is "platform".

Instead of jumping in the main platform:
	say "The platform bounces underfoot.";

The glimpse-sprung platform is a glimpse backdrop in the Engine Room. "The engine is gathered around the base of the platform like it washed up there." The glimpse-sprung platform identifies the sprung platform. Understand "platform", "sprung", "main", "central" as the glimpse-sprung platform.

Instead of approaching or climbing or jumping on or entering the glimpse-sprung platform:
	try going south.

The platform-rail is a backdrop, privately-named, in the Main Platform, in the Western Platform, in the Eastern Platform. Understand "rail", "brass", "railing" as the platform-rail. The printed name is "brass rail". "The rail separates me from the lapping cogs of the Difference Engine." 

Instead of jumping over or entering or approaching or climbing the platform-rail:
	say "No thanks. I don't want to be number-crunched!"

Instead of taking or pulling or pushing the platform-rail:
	say "It's pretty firmly built (like everything here, I suppose.)";

Section 2 - Printer

The printer is scenery, in the main platform. The printed name is "device". Understand "device", "typewriter", "writer", "slot" as the printer. "It's not quite like Reloh's writer: it doesn't have any keys, just a slot for cards to come out. It must be connected to the Engine by something in the pedestal."

Instead of doing something when the printer is physically involved:
	say "However it works, it's part of the Engine and I certainly don't know how to use that.";

Instead of typing on the printer:
	say "It doesn't have any keys."

Section 2b - Pedestal

A dull grey pedestal is scenery, in the main platform. "On the pedestal is this typewriter-like machine." Understand "dull", "grey" as the pedestal.

Section 3 - Clutch

The clutch is scenery, in the main platform. Understand "lever" as the clutch. "To quote the Abbott, this lever might be big enough to move the whole World. At any rate, if it can power every cog of the Engine then it must be holding back a lot of force."

Instead of pushing the clutch:
	try pulling the clutch;

Instead of pulling the clutch when the Difference Engine is active:
	say "The machinery is already pounding away, all around me.";

Instead of pulling the clutch when exactly one difference-engine model is correctly set:
	say "I don't know. I'm not at all sure I've phrased the question well enough. Time only happens once, as Horloge likes to say, although the Abbot says everything will repeat, just like Klockwerk. Either way – for now at least – I'm only going to get one shot at this.";

Instead of pulling the clutch when all the difference-engine models are correctly set:
	now the Difference Engine is active;
	say "With all the strength I've got left after rooftops and giant bell-towers and ladders and all the rest, I heave back on the lever. Things begin to turn. The platform drops a little lower. Cogs and spindles on all sides start to whip up into a frenzy, the movement spreading across all around the room. It's like kicking over an ant hill.[paragraph break]And then the noise begins.";

Instead of pulling the clutch:
	say "I ought to get some idea of how this machine works before I turn it on.";

Section 4 - The Duchess Du Mer

Understand "tall", "taller", "tallest", "thin", "elegant", "beautiful", "woman", "lady", "tall/taller one", "figure", "shadow", "shape"  as the Duchess Du Mer.

Understand "Duchess", "Du", "Mer" as the Duchess Du Mer when the Duchess Du Mer is known.

The Duchess Du Mer is a woman, privately-named, unknown, scenery, in the Main Platform. "One thing's sure: she's a beautiful lady. Long gleaming hair like fresh oil, cheekbones arched like pinions arms. She could be the Goddess of Klockwerk brought to life if the Church allowed such a ridiculous idea outside of the Newtonmass stories of children."

Rule for printing the description of the Duchess when the location is the Grand Foyer:
	say "I can't see a lot through the bubbled glass, but the tall lady seems to be leaning over the shorter one as if telling her off.";

Rule for printing the name of the unknown Duchess Du Mer:
	say "tall [if the location is the Foyer]figure[otherwise]woman[end if]";

Instead of doing something when the Duchess Du Mer is physically involved:
	say "If she or anyone else found me here, they'd have me skinned in a second and use my bones to build a whirligig machine.";

Section 5b - Can't Talk

Before asking the Duchess Du Mer about when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Before  telling the Duchess Du Mer about when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Before asking the Duchess Du Mer for when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Before  answering the Duchess Du Mer that when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Section 5 - Calculatrix Pristina

The Calculatrix Pristina is a woman, privately-named, unknown, scenery, in the Main Platform. "The Calculatrix is short and squat, with a flop of brown hair almost covering her glasses. I've heard the monks mutter that it takes a certain kind of woman to work clockwork – what they mean, I don't know, but I guess this prim and awkward-looking woman must have it since she tends one of the most important machines in the world."

Understand "short", "shorter", "shortest", "squat", "woman", "short/shorter one", "dark-haired", "dark haired", "long gown", "gown", "white gown", "long white gown", "lady", "figure" as the Calculatrix Pristina.

Understand "Calculatrix", "Pristina" as the Calculatrix Pristina when the Calculatrix Pristina is known.

Rule for printing the description of the Calculatrix when the location is the Grand Foyer:
	say "I can't see a lot through the bubbled glass, but the shorter one seems to be operating the machine.";

Rule for printing the description of the Calculatrix when Calculatrix Chase is happening or the location is Caught:
	say "She's white with fury. On either side of her are guards, bristling with rage and anger.";

Rule for printing the name of the unknown Calculatrix:
	say "short [if the location is the Foyer]figure[otherwise]woman[end if]";

Rule for printing the name of the unknown Calculatrix while asking which do you mean:
	say "shorter one";

Instead of doing something when the Calculatrix Pristina is physically involved:
	say "The less I have to do with [i]her[r] the better.";

Section 5b - Can't Talk

Before asking the Calculatrix Pristina about when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Before telling the Calculatrix Pristina about when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Before  asking the Calculatrix Pristina for when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Before answering the Calculatrix Pristina that when the location is the Grand Foyer:
	say "I don't want them to see I'm here!" instead;

Section 6 - Punchcard

The punchcard is a thing. It has description "[if Calculatrix Chase is happening]It's a yellow rectangle of card. Punched in are a series of holes. More than that – I don't have time to find out.[otherwise if Calculatrix Chase ended in escape]The card has a series of punched holes and then some neat writing beneath: [i]462 Old Place, DOCKLANDS[r].[otherwise]The card is just a series of punched holes, like waterbiscuits after the mice have got to them. It doesn't mean anything![end if]"

Understand "punched", "card", "punch card", "holes", "yellow", "rectangle", "series" as the punchcard.

Instead of going from the Main Platform when the punchcard is not carried during Calculatrix Chase:
	say "I'm not going anywhere till I get my answer from the machine. Without that, then all this might as well have been greasing the wheels of the Ocean for the good it'll do me."

After taking the punchcard when the punchcard is not handled:
	say "I whip the card out of the typing machine.";

After taking the punchcard when in Caught:
	say "I go for the card but I'm not fast enough.";

Before attacking or eating the punchcard when in Caught:
	say "[one of]I move to threaten to eat the card. The Calculatrix laughs. 'We'll still skewer you,' she says, 'and cut the card from your stomach.' It's a pretty good argument, so I stop.[or]No good.[stopping]"

Before attacking or eating the punchcard:
	say "After all that? Never!" instead.



Section 7 - A box of pamphlets

A dull grey box of pamphlets is scenery, in the Main Platform. "The box is full of grey papers stamped with a Parliamentary seal. On the top of each one is written 'STRICT CONFIDENTIAL'."

Understand "grey pamphlets", "dull" as the box of pamphlets.

Understand "grey", "papers", "pamphlet", "dull" as the box of pamphlets when the player can not see the grey pamphlet.

After printing the description of the box of pamphlets:
	if the grey pamphlet is off-stage:
		say " I take one out. ";
		now the player carries the grey pamphlet;

Instead of taking the box of pamphlets:
	if the grey pamphlet is off-stage:
		try examining the box of pamphlets;
	otherwise:
		say "I don’t want any more of them. One was boring enough.";

The grey pamphlet is a thing. Understand "paper" as the grey pamphlet.

Rule for printing the description of the grey pamphlet:
	say "'A QUICK SUMMARY OF THE ESSENTIAL NUMERICALS OF ST GODEL.'[paragraph break]It’s a practical handout, presumably for using the machine. None of it makes any sense: 'quintessential numerics', 'adjusted methodologies', 'truth-state deterministic modifiers'. However, at the bottom in larger letters is a table labeled BASIC. Like the Commandments printed on the back of an Abbey Moral Text, this is the bit people actually use. It reads:[paragraph break]";
	say the table of pamphlet actor words laid out as a grid, paragraph break;
	say "'In detail,' the pamphlet continues, 'the actions are described as following thus:'[paragraph break]";
	say the table of pamphlet action words laid out as a grid, paragraph break;

Section 4

Table of grid layout options (continued) [cont. from the Grid Layout extension]
table 				cell spacings		headings	row numbering
table of pamphlet actor words	{10, 11, 11, 12, 0}	true		true
table of pamphlet action words	{10, 15, 12, 10, 0}	true		true

Table of pamphlet actor words
p1		p2		p3		p4		p5
"powerful"	"wanting"	"gold"		"breaking"	"universe"
"far past"	"generous"	"worshipful"		"going"		"giving"
"diluted"		"past"		"planning"	"flying"		"trying"
"fire"		"cruel"		"hoping"		"present"	"below"
"man"		"air"		"wise"		"organic"	"near future"
"emptiness"	"woman"	"far future"	"aether"		"cloudy"
"location"	"randomness"	"foolish"		"animal"		"earth"
"opening"	"city"		"water"		"orderliness"	"plant"
"getting"	"losing"		"being"		"world"		"saintliness"

Table of pamphlet action words
p1		p2		p3		p4		p5
"What"		"wants"		"cost"		"to break"	"everything?"
"When was"	"much"		"rise"		"to go" 		"money?"
"How"		"yesterday"	"is planning"	"to steal"	"ambition?"
"Why"		"wicked"	"hope"		"today"		"nothing?"
"Who"		"will"		"chose"		"to grow"	"next?"
"Which"		"give"		"next year"	"to vanish"	"rain?"
"Where"		"anyone"	"ruin"		"to eat"		"property?"
"Will"		"in St. Phillip"	"wash"		"to build"	"food?"
"Can"		"lost"		"live"		"to own"	"immortality?"

Chapter 4 - Calculatrix Chase scene

Calculatrix Chase is a scene.
Calculatrix Chase begins when the Difference Engine is active.

Instead of waiting during Calculatrix Chase:
	if the punchcard is not handled:
		say "The machine buzzes and groans." instead;
	say "[one of]No time to hang about.[or]What is their to wait for, my own end?[cycling]";

When Calculatrix Chase begins:
	change the current script to {SE_CHASE_0, SE_CHASE_1, SE_CHASE_2, SE_CHASE_3, SE_CHASE_3B, SE_CHASE_4, SE_CHASE_4B, SE_CHASE_5, SE_CHASE_5B, SE_CHASE_6, SE_CHASE_7, SE_CHASE_8, SE_CHASE_8B, SE_CHASE_9 };

SE_CHASE_0 is a scripted event. [Or rather, a scripted non-event... at any rate, it's a filler.]
SE_CHASE_3B is a scripted event. [Or rather, a scripted non-event... at any rate, it's a filler.]
SE_CHASE_4B is a scripted event. [Or rather, a scripted non-event... at any rate, it's a filler.]
SE_CHASE_5B is a scripted event. [Or rather, a scripted non-event... at any rate, it's a filler.]
SE_CHASE_8B is a scripted event. [Or rather, a scripted non-event... at any rate, it's a filler.]


SE_CHASE_1 is a scripted event. The display text is "The doors fly open. Standing between them is the Calculatrix, staring in disbelief. 'Stop?' she wails, but the Engine doesn't listen. At just that moment, the typing machine on the pedestal whizzes up into life and punches out a card. It's the answer to my question."

After firing SE_CHASE_1:
	move the punchcard to the main platform;
	move the official-guards  to the Main Platform;
	move the Calculatrix Pristina to the Main Platform.

Instead of going through the glass doors from the Main Platform when the Calculatrix is in the Main Platform:
	say "There's no way past the Calculatrix and her guards.";

SE_CHASE_2 is a scripted event. The display text is "Calculatrix Pristina has been joined at the glass doors by two guards. 'Stop that... child!' she demands. The two guards push forwards. More guards follow. Time to get out of here!"

After firing SE_CHASE_2:
	if the player does not carry the punchcard and the player can see the punchcard:
		try taking the punchcard;

SE_CHASE_3 is a scripted event. The display text is "'Get him, you idiots!' squeals the Calculatrix. She's by the pedestal now, maybe not certain whether to ask it who I am or to try and catch and beat it out of me. But the guards aren't uncertain. They're piling into the Engine, hot on my heels!".

Rule for firing SE_CHASE_3 when the location is the Main Platform:
	say "The guards swarm up onto the platform and then, that's it. I'm surrounded.";
	fire CAUGHT_EVENT instead;

SE_CHASE_4 is a scripted event. The display text is "'Back this way! The stairs!' the Calculatrix exclaims. The guards pile back through the Engine: I'm safe for now, but in a few moments I'm going to be flanked on both sides!".

Rule for firing SE_CHASE_4 when the location is a platform-level room or the location is The Engine Room:
	say "The guards swarm around me and there's nothing I can do. I'm surrounded.";
	fire CAUGHT_EVENT instead;

After firing SE_CHASE_4 when the location is not a platform-level room:
	move the official-guards  to the Grand Foyer;
	move the Calculatrix Pristina to the Grand Foyer;

SE_CHASE_5 is a scripted event. The display text is "I can hear guards approaching on both sides. Quickly, Wren, but time's ticking!".

SE_CHASE_6 is a scripted event. The display text is "I can hear them on both sides! There's got to be a way out of here! ".

Rule for firing SE_CHASE_6 when the location is not the Long Hall:
	say "The guards catch up with me and back me against a wall. There's nothing I can do.";
	fire CAUGHT_EVENT instead;

SE_CHASE_7 is a scripted event. The display text is "Quickly, quickly...".

SE_CHASE_8 is a scripted event. The display text is "The guards are right outside the door. I'm hardly well-hidden. I need to be gone.".

Rule for firing SE_CHASE_8 when the location is not the Office:
	say "Guards appear from both directions and there's nothing I can do.";
	fire CAUGHT_EVENT instead;

SE_CHASE_9 is a scripted event. [No display text.]

Rule for firing SE_CHASE_9 when the location is the Office:
	say "The door flies back and there they are.";
	fire CAUGHT_EVENT instead;

CAUGHT_EVENT is a trigger.

Rule for firing the CAUGHT_EVENT:
	move the player to Caught;
	move the Calculatrix Pristina to Caught;
	move the official-guards to Caught; 


Part 15C - Caught

Calculatrix Chase ends in capture when the location is Caught. 

When Calculatrix Chase ends in capture:
	change the current script to {SE_CAUGHT_1, SE_CAUGHT_2, SE_CAUGHT_3, SE_CAUGHT_4, SE_CAUGHT_5 };

Caught is a room. "I'm surrounded. Five guards with five spears and I can see the sharp end of all them. Only the Calculatrix is unarmed but then she's got those burning eyes. I don't see any way out of this one. I've let Covalt down."

SE_CAUGHT_1 is a scripted event. The display text is "'Hand it over,' she growls. The guards rattle their spears at me.".

SE_CAUGHT_2 is a scripted event. The display text is "'Give me that punch-card. The Engine doesn't compute anything without proper sanctioning!' She's almost stamping her feet with frustration.".

SE_CAUGHT_3 is a scripted event. The display text is "'You.' She snaps a finger at one of her men. In a moment, he's got my arm up behind my back, higher and higher – it's nothing worse than Calvin does every day but it still makes my fingers open with the pain – and that's it, I've dropped the card!".

After firing SE_CAUGHT_3:
	move the punchcard to the location;

SE_CAUGHT_4 is a scripted event. The display text is "The Calculatrix snatches up the card, and then frowns. 'What does this mean?' she demands. Somehow, she's reading the punch-holes on the card. '462 Old Place, Docklands. What's there? Tell me!'".

After firing SE_CAUGHT_4:
	move the punchcard to the Calculatrix Pristina;

SE_CAUGHT_5 is a scripted event. The display text is "'Oh, get this child out of here!' she snaps, irritably. 'I'll ask the machine, of course. Guards? Dump that... that thing... outside.'[paragraph break]I didn't even know my neck had a scruff until one of the guards grabs me by it. I'm dragged kicking and complaining along all that beautiful carpet into an empty office. Are they going to murder me?[paragraph break]One guard opens a window and then the other raises me like a counterweight and tosses me outside.[paragraph break]I land on a pile of junk in an alley behind the Counting House. Pick myself up and shake myself down. Time for some answers. Am I still alive? [i]Definitely[r]. How do I feel? [i]Proud[r]. Where is the Figure? [i]462 Old Place, Docklands[r].[paragraph break]Success. Now there's no time to lose.".

After firing SE_CAUGHT_5:
	end the chapter;
	fire ALLEY_EVENT1;
	move the player to the Dank Alley;

Section 1 - Interaction in Caught

Instead of giving the punchcard to the Calculatrix Pristina when in Caught:
	change the current script to {SE_CAUGHT_4, SE_CAUGHT_5}

Instead of asking the Calculatrix Pristina about when in Caught:
	say "[one of]She sees my mouth open and cuts me off[or]She cuts me short[stopping]. [run paragraph on]";

Instead of telling the Calculatrix Pristina about when in Caught:
	try asking the Calculatrix Pristina about "machine";
Instead of answering the Calculatrix Pristina that when in Caught:
	try asking the Calculatrix Pristina about "machine";
Instead of asking the Calculatrix Pristina for when in Caught:
	try asking the Calculatrix Pristina about "machine";

Instead of going when in Caught:
	say "The guards jostle me back. They're not letting me out any which way!"

Understand "beg" as making the sign of when in Caught.
Understand "beg for mercy" as making the sign of when in Caught.

Section 2 - Chasing Guards

Some official-guards are men, scenery, privately-named. "[if location is Caught]The guards surround me on all sides.[else]The guards are hot on my heels![end if]". The printed name is "guards".

Instead of doing something when the official-guards are physically involved:
	say "[one of]A jab with a spear pushes me back.[or]They're not going to let me near.[or]They're keeping me at arms length with their spears.[cycling]";

Understand "guard", "guards", "five guards", "man", "men", "spears", "spear", "sharp end/ends" as the official-guards.

Instead of attacking the official-guards:
	say "I go for one with my fist. The others grab me by the shoulders and pull me back, laughing."
Instead of attacking the official-guards with something:
	say "I go for one with [the second noun]. The others grab me by the shoulders and pull me back, laughing."


Part 15 - Eastern Platform

Section 2b - flash of red

[ We see this if we try to turn the abacus having not yet found the key ]

To provide key-hint:
	if the ruby key is off-stage:
		move the ruby key to the small golden dials;
		move flash-red to the location;
		say "[line break]From somewhere in the depths of the machine, I catch a flash of red.";

Carry out taking the ruby key:
	remove the flash-red from play;

The flash-red is a scenery, privately-named, thing. The description is "Something, gleaming, in the depths of the machine."  Understand "flash", "flash of", "red" as the flash-red. The printed name is "flash of red".

Instead of approaching the flash-red:
	let the way be the best route from the location to the Engine Room, using doors;
	if the way is a direction, try going the way instead;
	say "It's somewhere in the machine."

Instead of doing something when the flash-red is physically involved:
	say "The flash was somewhere deep in the machine."



Chapter 1 - Description

The Eastern Platform is a major mirror-room, east of the Main Platform. The hemisphere is east. The printed name is "East Platform". The Eastern Platform mirrors the Western Platform.

Instead of making to leave when in the  Eastern Platform: try going west.
Instead of going inside when in the  Eastern Platform: try going west.


The first description is "This is a small platform to the [west with mirroring] of the central dais. It surrounded on most sides by a brass rail, hooked onto which is a steel abacus that in turn is connected to the Engine by delicate silver chains like the spider-webs of my room after the rain has got in.[paragraph break]Hanging above the platform is a large wooden signboard[if the model-at-hand is not phrase-viewed].[else][board display][end if]"

To decide which difference-engine model is the model-at-hand:
	decide on the viewed model of a random visible display board.

The second description is "This platform is the mirror-image of the one to the [east with mirroring], except that the words on the painted signboard above the abacus are different[if the model-at-hand is not phrase-viewed].[else][board display][end if]"

To say board display:
	let m be the model-at-hand;
	say ": [i]'[stored meaning of m]'[if m is not the action-model]. [end if][r]";


Chapter 2 - Action Display

The action display is a display board, scenery, in the Eastern Platform. The viewed model of the action display is the action-model.

Chapter 3 - Action Control

An abacus called the action-control is scenery, in the Eastern Platform. 

There is a difference-engine model called the action-model.
The controlled model of the action-control is the action-model.

The stored value of the action-model is 32149;
The stored meaning of the action-model is "How much cost today immortality?";
The word-table of the action-model is the table of action words.

[ for actions we accept:
	first - 7			- where
	second - 8, 4, 9 - wicked, in St Phillip, lost
	third - 3, 5 - is planning, chose
	fourth - 2, 4 - to go, today
	fifth - 3, 5 - ambition
]

To decide what number is the action test score for (n - a number):
	let test-score be 0;
	assert that n is at least 11111 and n is at most 99999 issuing "Difference engine value out of range.";
	repeat with i running from 1 to 5:
		let l be the remainder after dividing n by 10;
		[l is now the least significant digit of n]
		if i is: 
			-- 1: 
				if l is 3 or l is 5, increase test-score by 1;
			-- 2: 
				if l is 2 or l is 4 or l is 5, increase test-score by 1;
			-- 3: 
				if l is 3 or l is 5, increase test-score by 1;
			-- 4:
				if l is 8 or l is 4 or l is 9, increase test-score by 1;
			-- 5: 
				if l is 7, increase test-score by 1;
		let n be n minus l;
		let n be n divided by 10; [ -- hence dropping the final digit from n]
	decide on test-score.

A correctness appraisal rule for the action-model:
[	if the stored value of the action-model is 78325 or the stored value of the action-model is 78525:]
	if the action test score for the stored value of the action-model is 5:
		say "My heart skips a beat. [i]It’s my question[r].";
		rule succeeds;

The last correctness appraisal rule for the action-model:
	let l be the action test score for the stored value of the action-model;
	if l is at most 1:
		say "[one of]Of course, I'm meant to be asking about the Figure's plans.[or]Of course, I'm meant to be trying to track down the Figure.[cycling]";
	else if l is at most 3:
		say "But [one of]I can feel I'm close to knowing where to look for the Figure, but I'm not quite there[or]I don't need a machine to tell me this isn't the quite question Covalt wanted me to ask[or]I want to know where the Figure in Grey is going to finish up after his ballooning, and I know this isn't quite going to help with that[or]it doesn't quite feel right[at random].";
	else if l is 4:
		say "That seems very close - but not quite it!";

An unlocking rule for an abacus:
	assert that the Ruby Key is not held by the player issuing "Ruby key not held.";
	say "I’d need some kind of key, surely." instead;

Chapter 4 - Word Table

Table of grid layout options (continued) [cont. from the Grid Layout extension]
table 			cell spacings		headings	row numbering
table of action words	{10, 15, 12, 10, 0}	true		true

Table of action words
p1		p2		p3		p4		p5
"What"		"wants"		"cost"		"to break"	"everything?"
"When was"	"much"		"rise"		"to go" 		"money?"
"How"		"yesterday"	"is planning"	"to steal"	"ambition?"
"Why"		"wicked"	"hope"		"today"		"nothing?"
"Who"		"will"		"chose"		"to grow"	"next?"
"Which"		"give"		"next year"	"to vanish"	"rain?"
"Where"		"anyone"	"ruin"		"to eat"		"property?"
"Will"		"in St. Phillip"	"wash"		"to build"	"food?"
"Can"		"lost"		"live"		"to own"	"immortality?"

Chapter 2 - Scenery

Part 16 - Western Platform

Chapter 1 - Description

The Western Platform is a mirror-room, west of the Main Platform. The printed name is "West Platform". 

Instead of making to leave when in the Western Platform: try going east.
Instead of going inside when in the  Western Platform: try going east.


Chapter 2 - Actor Display

The actor-display is a display board, scenery, in the Western Platform. The viewed model of the actor-display is the actor-model.

Chapter 3 - Actor Control

An abacus called the actor-control is scenery, in the Western Platform. 

There is a difference-engine model called the actor-model.
The controlled model of the actor-control is the actor-model.

The stored value of the actor-model is 16233.
The stored meaning of the actor-model is "Powerful woman royal soaring honest".
The word-table of the actor-model is the table of actor words.

To decide what number is the actor test score for (n - a number):
	let test-score be 0;
	assert that n is at least 11111 and n is at most 99999 issuing "Difference engine value out of range.";
	repeat with i running from 1 to 5:
		let l be the remainder after dividing n by 10;
		[l is now the least significant digit of n]
		if i is: 
			-- 5: 
				if l is 1 or l is 6, increase test-score by 1;
			-- 4: 
				if l is 1 or l is 4, increase test-score by 1;
			-- 3: 
				if l is 9 or l is 3, increase test-score by 1;
			-- 2:
				if l is 3, increase test-score by 1;
			-- 1: 
				if l is 6, increase test-score by 1;
		let n be n minus l;
		let n be n divided by 10; [ -- hence dropping the final digit from n]
	decide on test-score.

A correctness appraisal rule for the actor-model:
	if the actor test score for the stored value of the actor-model is 5:
[	if the stored value of the actor-model is 14936 or the stored value of the actor-model is 14966:]
		say "I step back and take a look. Well, it’s not great. But it’s probably as close as I’m going to get.";
		rule succeeds;

Instead of abacus-setting the actor-control to when the actor-model is correctly set:
	say "What I've got isn't not great, maybe, but it’s probably as close as I’m going to manage.";

The last correctness appraisal rule for the actor-model:
	let l be the actor test score for the stored value of the actor-model;
	if l is at most 1:
		say "[one of]Of course, I'm meant to be asking about the Figure.[or]Of course, I'm meant to be trying to track down the Figure.[cycling]";
	else if l is at most 3:
		say "But [one of]I can feel I'm close to asking about the Figure[or]I don't need a machine to tell me this isn't going to find the Figure[or]Last time I saw the Figure he was in his balloon - but I need to tell the machine that[or]this doesn't quite feel right[at random].";
	else if l is 4:
		say "That seems very close - but not quite right!";


Chapter 4 - Word Table

Table of grid layout options (continued) [cont. from the Grid Layout extension]
table 			cell spacings		headings	row numbering
table of actor words	{11, 12, 10, 12, 0}	true		true

Table of actor words
p1			p2				p3			p4			p5
"powerful"	"greedy"			"yellow"		"hopeless"	"black."
"ancient"	"giving"			"royal"		"abandoned"	"green."
"weak"		"old"			"cautious"	"soaring"	"honest."
"inconstant"	"cruel"			"hopeful"	"stuck"		"digging."
"human"		"white"			"wise"		"dead"		"child."
"sorrowful"	"woman"		"baby"		"vacant"		"grey."
"homely"	"crazy"			"foolish"		"animal"		"brown."
"welcoming"	"dirty"			"clean"		"benevolent"	"nurturing."
"childish"	"despondent"	"being"		"blue"		"saintly."

Part 17 - Office

Chapter 1 - Description

The Office is a room. "This is a grey office, dull as a Brother's cell. Whoever was in it probably rushed out because of the guards clattering this way. Either that or this is where the Calculatrix [i]herself[r] works."

The office window is an closed, unlocked, door, east of the office. "Anyway, whoever my benefactor is, they’ve left the window clearly unlocked. Shame this is the second floor!".

The description of the office window is "The window overlooks one of the grubby streets outside. There’s a faintly filthy smell drifting in." Through the office window is the Dank Alley.

Instead of making to leave when in the Office: try going east.
Instead of going inside when in the Office: try going east.

Instead of jumping over or jumping off or climbing or getting off the office window: try going east.

Report opening the office window:
	say "I throw open the window." instead.

Chapter 2 - Scenery

Some furnishings are scenery, in the office. "Desk, files, drawers. Nowhere decent to hide."

Instead of doing something when the furnishings are physically involved:
	say "There’s no good place to hide here. I need to get away!";

Chapter 3 - Exits

Instead of going through the subtle escape from the Office:
	say "No chance. The guards are coming!";

After going through the office window:
	say "No need to ask twice.[paragraph break]I swing my legs up onto the sill and then I’m over and out – yuk! – straight into a pile of rotting garbage. Something crawls out over my leg but I’m smart and I don’t scream, which means the guards overhead stick their heads out and then disappear again.[paragraph break]Then I’m up, brushing myself down and – once I’m two streets away – taking a deep breath. I might have survived all that but the card in my hand is only going to send me somewhere else. And if I’m following the Figure, things could get pretty hairy pretty fast.[paragraph break]The card, in a neat cog-calligraphic hand underneath the punched-out holes reads: [i]462 Old Place, DOCKLANDS[r]. Not the nicest part of the city. But I’ve got to stop the Figure stealing the Perpetuum before it’s too late. And that’ll be soon.[paragraph break]Thing about time is, it [i]always[r] is. So right now it’s time to get moving!";
	end the chapter;
	fire ALLEY_EVENT1;
	try looking;

Chapter 4 - Scene End

Calculatrix Chase ends in escape when the location is the Dank Alley. 

When Calculatrix Chase ends in escape:
	clear the current script;

Book 8 - The Docklands

Part 1 - Dank Alley

Chapter 1 - Description

The Dank Alley is a room. "Tall brick walls either side are dripping with damp moss, crawling with rats, filled with the smell of rotting fish. In the distance I can hear the hiss of the River and after that the endless shouts of the dockhands who seem to work through the night like machines."

Section 2 - Gas Light

A gaslight is a backdrop, not scenery, in the Dank Alley and in the South Side.

The initial appearance of the gaslight is "[if the location is the Dank Alley]At the end of this alley is a gaslight on the wall of a warehouse that gives out a tiny patch of warmth.[otherwise]On the wall above me is a gaslight casting a warm glow that's nice to stand in but only makes the shadows to east and west even deeper. The Figure might be standing there, watching, for all I know. Best not to hang around.[end if]"

The description of the gaslight is "The light is flickering like it might go out at any moment. There's just enough light to read the number on the warehouse wall."

Understand "lamp", "gas", "light", "flickering", "warm", "warmth" as the gaslight.

Instead of doing something when the gaslight is physically involved:
	say "The gaslight is fixed to the wall, too high to reach.";

Section 3 - Exits

Instead of going up in the Dank Alley:
	try going north;
Instead of going inside in the Dank Alley:
	try going north.
Instead of making to leave in the Dank Alley:
	say "There's no turning back."

Chapter 2 - Event on Entry

[After looking in the Dank Alley when ALLEY_EVENT1 is unfired:
	fire ALLEY_EVENT1]

ALLEY_EVENT1 is a trigger. 

Rule for firing unfired ALLEY_EVENT1:
	say "From somewhere far off the Cathedral bell is chiming for Even-sprung: clock-winding and dinner time. Not for me: I'm alone, surrounded by the empty warehouses and rusted scaffolds of the docklands. At least no-one pays any notice: the streets are full of urchins like me, dressed in rags like mine, sitting on street-corners collecting pennies for gear-shine and sharpening. I wonder if they ever get to eat.[paragraph break]I never realised how large the docks of the city were: but then if all the steel in St Philip comes in by boat I suppose it'd need to be like this, a whole city of boards and containers sticking out into the river. I've no idea where 462 Old Place is but then, if I wasn't going to find it the Difference Engine would have told me to give up. So I follow my nose to where the smell gets worse.[paragraph break]Old Place. There aren't any other kids here at all, only older children who look haggard and ghostly. I wish my clothes were more ragged – I'm walking with my arms crossed over the Abbey seal. To be caught here by anybody would be a fate worse than Calvin and Drake might deal out.";

Chapter 3 - Scenery

The distant warehouse is privately-named, scenery, in the Dank Alley. The printed name is "warehouse". The description is "White paint on the brickwork reads IV:VI:II.".

Understand "warehouse", "wall", "number", "numbers", "white", "paint", "bricks", "brick", "brickwork", "brick work", "ware house" as the distant warehouse.

Instead of entering the distant warehouse:
	try going north;

Instead of climbing the distant warehouse:
	try going north;

Part 2 - South Side

Chapter 1 - Description

The South Side is north of the Dank Alley. "The cobbles end here, replaced by wooden boards that crack and creak underfoot. The whole warehouse to the north must be built over the water: maybe they load things in from underneath."

[Initial appearance of gaslight object above.]

Section 2 - Exits

Instead of going south in South Side:
	say "First rule of winding, Wren: there's no turning back.";

Chapter 2 - Scenery

Some warehouse walls are a backdrop, in the South Side, the Front Door, the North Side.

Understand "corrugated", "iron", "nails", "rusty", "brick", "metal", "slick" as the warehouse walls.

Understand "white", "paint", "roman", "numerals", "IV", "VI", "II" as the warehouse walls when in the South Side.

Rule for printing the description of the warehouse walls:
	say "The warehouse walls are made of corrugated iron riveted by rusted nails into brick. ";

First after printing the description of the warehouse walls when the location does not enclose a door:
	say "There's no door on this side. ";

After printing the description of the warehouse walls when in the South Side:
	say "White paint on the brickwork reads IV:VI:II. ";

[ Last after printing the description of the warehouse walls:
	say paragraph break; ]

Instead of climbing the warehouse walls:
	say "The metal is too slick to climb.";

Instead of entering the warehouse when the location does not enclose a door:
	say "There's no door on this side. I'll have to go around.";

Part 3 - Front Door of Warehouse

Chapter 1 - Description

Front Door is a room. South of the Front Door is east of South Side. The description of Front Door is "The front door of the warehouse has a sign: '462 Old Place. Pellagiac Holdings Corp, &c &n, Storage and Wares'. This is the place but I can't see any way in – the door's locked by an iron bar I probably couldn't lift even if I could get the padlock off. Whatever's behind that must be worth a lot of money – but of course, I know what's inside. This cold and murky place is the lair of the Figure in Grey."

Instead of going inside in Front Door: try going west;

Instead of going a direction in Front Door when the noun is due east:
	say "There's a wall that way. This alley goes north-south.";

Chapter 2 - Door

A door called the huge iron door is locked, not open, west of the Front Door. "This side of the warehouse is right up against the side wall of another: I could slip around to north or south."

The description of the huge iron door is "The door is made of thick metal – it's amazing the boards below don't break from the weight. It's locked with a huge iron bar and a padlock. It's almost like it's talking to me saying, Wren, you need to find another way in."

Instead of going through the huge iron door from the Front Door:
	try examining the huge iron door instead;

Instead of opening, pushing, pulling or turning the huge iron door:
	say "The door is locked.";

Instead of unlocking the huge iron door with the wrench:
	try attacking the huge iron door with the wrench;

Instead of unlocking the huge iron door with something:
	say "I don't have a key to this door.";

Instead of attacking the huge iron door:
	say "If I had a thousand years to scratch away at that padlock with my clock key – or maybe only a hundred with something better – I might be able to get through that iron bar. But what's forged lasts, as the Abbot says, and I wasn't forged.";

Instead of attacking the huge iron door with the wrench:
	say "It might be a good wrench but I can hardly batter my way through iron with it, can I? A boot's no good for a butter-knife, as they say.";

Instead of attacking the huge iron door with something:
	try attacking the huge iron door;

Rule for supplying a missing second noun when the noun is the huge iron door while unlocking:
	say "I don't have a key to this door." instead;

Part 4 - North Side

Chapter 1 - Description

North Side is a room. East of the North Side is north of the Front Door. "The north side of the warehouse is wooden boards covered with rubble as far as I can see, like the warehouse to the south had been built on the ruins of some older larger building. Skirting round the warehouse to east or west will mean picking my way through clumps of brick and razor-sharp cement and in the scrappy moonlight I can barely see my own feet.[paragraph break]Which all means, if they unleash the dogs on me, this'd be a terrible place to try and run."

Rule for supplying a missing noun when running in the North Side:
	say "A terrible place.";

Instead of going north when in the North Side:
	say "The rubble gets thicker and higher in that direction[one of][or]. There's no way past[stopping].";

Chapter 2 - Scenery

Section 1 - Junk

The rubble is scenery in the North Side. "'Without order there is tardiness,' they say: well, this place is so tardy that by the time it got here it was a ruin. Dark shadows and broken bricks[if the Wrench is not handled]. And a gleam of metal – looking closer I spy a good quality wrench[end if]."

Section 2 - Wrench

The wrench is portable scenery, not fixed in place, privately-named, in the North Side. "A wrench. Not a holy tool but a pretty good one all the same. Why anyone would leave it out here to rust is beyond me. I can't help checking the top for bloodstains but of course it's been out in the rain..."

Understand "good", "quality", "weighty", "wrench", "metal", "tool" as the wrench when we have examined the rubble.

After taking the wrench:
	now the wrench is not scenery;
	say "[one of]It's a good weighty wrench, as satisfying to hold as a thigh-joint of lamb.[or]It's a wrench, but I take it.[or]Taken.[stopping]";

Part 5 - Dock

Chapter 1 - Description

The Dock is a room. North of the Dock is west of the North Side. South of the Dock is the Ledge. "The west side of the warehouse is built out over the water, where a few plank boards form a small dock for boats. The warehouse has a[if Front Door is visited]nother[end if] door here but of course it's closed – solid iron and locked with a metal bar.[paragraph break]I could skirt the building to the north and south so long as I kept my balance. The water looks like ink and it's bubbling slightly. There's probably a crocodile down there, watching me right now."

The River Thymes is a backdrop, in the Dock and the Ledge. "The wide River Thymes disappears into the darkness like someone had knocked a water-glass over a map of the town. On the other side are bright lights and fine buildings: that's Palatine Hill built right by the springs[if the location is the Dock]. The river is bubbling slightly here[end if]."

Understand "bubbling", "bubbles", "bubble" as the River Thymes when in the Dock.

Understand "wet", "water" as the River Thymes.

Instead of entering the River Thymes:
	change the internal value of the BREATH_COUNTER to 1;
	say "[one of]What a terrible idea. I take a deep breath and do it anyway.[or]I throw myself back into the horrible grimy water.[stopping]";
	if the location is the Dock:
		move the player to River 2;
	if the location is the Ledge:
		move the player to River 1;

Instead of going a direction in the presence of the River Thymes when the noun is due west:
	try entering the River Thymes instead;

Instead of undressing in the presence of the River Thymes:
	say "What's the point? If I'm going to go swimming I might as well stay as warm as I can."

Chapter 2 - Scenery

Section 1 - Loading Bay Door

[Hyphenated to avoid conflict with the Loading Bay room, below]

The loading-bay door is a locked door, privately-named, scenery, closed, east of the Dock, west of Loading Bay. "The door is made of heavy iron plates. It might slide up towards the roof if it wasn't locked down and about as heavy as the crescent moon."

The printed name of the loading-bay door is "massive door". Understand "heavy", "iron", "plates", "plated", "sliding", "door", "lock", "bar", "padlock", "massive" as the loading-bay door.

Instead of opening, pushing, pulling or turning the loading-bay door:
	say "The iron door is firmly locked.";

Rule for supplying a missing second noun when the noun is the loading-bay door while unlocking:
	say "I don't have a key. A key for this door would be massive. I probably couldn't even carry the key if I had it." instead;

Instead of attacking the loading-bay door:
	say "If I had a thousand years to scratch away at that padlock with my clock key – or maybe only a hundred with something better – I might be able to get through that iron bar. But what's forged lasts, as the Abbot says, and I wasn't forged.";

Instead of attacking the loading-bay door with the wrench:
	say "It might be a good wrench but I can hardly batter my way through iron with it, can I? A boot's no good for a butter-knife, as they say.";

Instead of attacking the loading-bay door with something:
	try attacking the loading-bay door;

Section 2 - Quay

Some mooring posts are scenery, not plural-named, in the Dock. "A small loading dock – just some mooring posts on the planking and a ramp going into the water." The printed name is "loading dock".

Understand "dock", "loading", "ramp", "planking", "small" as the mooring posts.

Instead of putting something on the mooring posts:
	try dropping the noun instead;

Part 6 - Ledge

The Ledge is south of the Dock. South of the Ledge is west of South Side. "This is a narrow plank walkway on the west side of the warehouse, that gives me barely a hand-span between the brick wall and the dark water of the River Thymes. I could scurry north or south like a rat, but hanging around here might be a bad idea."

Part 7 & 8 - Two Rivers

An underwater room is a kind of room.

Definition: a room is overground:
	if it is an underwater room, no;
	yes;

Instead of smelling the location when the location is an underwater room:
	say "But I'd drown!";

Understand "swim" as jumping when the location is an underwater room.

Instead of jumping when the location is an underwater room:
	say "I thrash wildly about, only managing to raise a cloud of bubbles and muck.";

Instead of dropping something when the location is an underwater room:
	say "I'd only lose [if the noun is plural-named]them[otherwise]it[end if].";

To decide whether the player has been underwater:
	if an underwater room is visited, yes;
	no;

To decide whether the player has not been underwater:
	unless the player has been underwater, yes;
	no;

Rule for printing the description of the Perpetuum Mobile diagram when the player has been underwater:
	say "The diagram’s bedraggled but still clear enough to read.";

Chapter 1 - River 1 Description

River 1 is an underwater room, west of the Ledge. The printed name is "Underwater". "I feel like a drowning dog, splashing around in the freezing cold water. No-one teaches clock-polishers to swim! But at least all that oil teaches you to hold your breath, and whatever it is I'm doing with my legs seem to be keeping me just below the surface.[paragraph break]I could clamber back onto the planks to the east, or follow them northwards. But I'd better not put my feet down because who knows what's down there..."

After going north in River 1:
	say "I paddle my way along.";
	continue the action;

Instead of going in River 1 when the noun is west or the noun is northwest:
	say "That would take me out into the river. I can't swim, remember?";

Instead of going in River 1 when the noun is due south or the noun is northeast:
	say "That way would take me under the dock, which doesn't sound safe at all.";

Chapter 2 - River 2 Description

River 2 is an underwater room, west of the Dock, north of River 1. The printed name is "Underwater, by the Dock". "This is like being in one of Chef's trifles: black jelly sheet above and mucky custard below. I'm holding my breath and trying to see through the muck. The ramp back up to the dock is to the east, which is a relief: below it, a fat pipe sticks out from somewhere and disappears into the depths of the river. Beside it is some kind of drain built into the earth under the dock."

After going south in River 2:
	say "I paddle my way through the water.";
	continue the action;

Instead of going in River 2 when the noun is due west or the noun is north:
	say "That would take me out into the river. I can't swim, remember?";

Instead of going southeast in River 2:
	say "That way would take me under the dock, which would hardly be safe, would it?";

Chapter 3 - Exiting to Dock

Instead of going up in an underwater room:
	try going east instead;

After going east from an underwater room:
	fire TRIG_RIVER;
	continue the action;

TRIG_RIVER is a trigger.

Rule for firing unfired TRIG_RIVER:
	say "Grabbing onto one of the poles supporting the dock I pull myself back up.";

Rule for firing TRIG_RIVER:
	say "I pull myself back out, [one of]teeth chattering[or]dripping[or]spitting water[or]shivering[at random].";

Chapter 4 - Breathing difficulties

BREATH_COUNTER is a busy counter. The top end is 4. The internal value is 1.

After going to an underwater room from an overground room:
	change the internal value of the BREATH_COUNTER to 1;

Every turn when the location is an underwater room:
	increment BREATH_COUNTER;

Rule for firing BREATH_COUNTER when the internal value of BREATH_COUNTER is 3:
	say "It's getting harder to hold my breath down here...", paragraph break;

Rule for firing BREATH_COUNTER when the internal value of BREATH_COUNTER is 4:
	say "[one of]My lungs are getting fully-wound: kicking and flailing I get up to the surface and drag myself out.[or]I need to breathe again, so I pull myself back up.[stopping]";
	if the location is River 1, move the player to Ledge;
	if the location is River 2, move the player to Dock;

Chapter 5 - Bubbling pipeline

The bubbling pipeline is scenery, in River 2. "The pipe emerges from the under the dock somewhere and disappears off into the river. There's a hairline crack in it bubbling gas into the water."

Understand "fat", "cracked", "broken", "pipe", "hairline", "bubbling", "bubbles", "bubble", "gas", "of gas", "crack", "fracture", "fractured", "gas pipe/pipeline/line/bubble/bubbles", "line" as the bubbling pipeline.

Instead of smelling the bubbling pipeline:
	say "It'll be gas, not air!";

Chapter 6 - Drain cover

The drain entrance is a door, scenery, privately-named, closed, not openable, locked, not lockable, northeast of River 2, southwest of the Drain Pipe.

Rule for printing the description of the open drain entrance:
	say "The drain is open and hardly looks welcoming. It's a dark hole leading northeast into the embankment under the dock.";

Rule for printing the description of the drain entrance:
	say "The drain leads into the embankment under the dock. The cover is held in place by [count of the bolts in words] [if the count of the bolts is one]last [end if]bolt[s].";

The printed name is "drain[if closed] cover[end if]".

Understand "drain", "entrance", "embankment", "embankment under the dock" as the drain entrance.
Understand "cover", "closed" as the drain entrance when the drain entrance is closed.
Understand "hole", "open" as the drain entrance when the drain entrance is open.

Some bolts are part of the drain entrance. The bolts have a number called the count. The count of the bolts is 5.

Understand "bolt" as the bolts.

Instead of going through the closed drain entrance:
	say "The drain cover is closed.";

Instead of opening the closed drain entrance:
	say "I can't turn bolts with my bare hands.";

Instead of unlocking the drain entrance with something when the second noun is not a key:
	try unscrewing the bolts with the second noun;

Rule for supplying a missing second noun while unscrewing the bolts with:
	say "I can't turn bolts with my bare hands.";

Rule for supplying a missing second noun while unscrewing the drain entrance with:
	say "I can't turn bolts with my bare hands.";

Instead of unscrewing the bolts with the wrench:
	decrease the count of the bolts by 1;
	if the count of the bolts is:
		-- 4: 
			say "Using the wrench underwater is like trying to run with pins-and-needles in your feet. But I do get the bolt loose. It sinks down out of sight into the mud.";
		-- 3:
			say "Another of the bolts comes free.";
		-- 2:
			say "That's half the bolts undone now. I only hope this drain goes somewhere useful!";
		-- 1:
			say "One more to go!";
		-- 0:
			say "That's it! The last bolt falls into the muck, and with a little encouragement the drain cover follows.";
			now the drain entrance is open;
			now the drain entrance is unlocked;

Instead of unscrewing the bolts with the wrench when the count of the bolts is 0:
	say "The bolts are all unscrewed and the drain is open.";

Instead of unscrewing the bolts with something:
	say "I can't get a good grip on those bolts with [the second noun].";

Instead of entering the open drain entrance when in River 2:
	try going northeast;

After going through the drain entrance from River 2:
	say "I squirm my way inside. It's narrow, not enough room to turn round. That doesn't seem like a problem until I remember that I'm underwater and the second hand's ticking till I run out of air. I push forwards: there's just me, the metal walls and the pounding of my heart like a massive drum.[paragraph break]Luckily the drain tilts up a little. My lips break the surface and I'm so relieved I feel like crying.";
	continue the action;

Part 8 - Drain

Chapter 1 - Description

The Drain Pipe is a room. The printed name is "Drain". The description is "The drain's heading upwards and I've found air above me, a little pocket of it, like I was an ant trapped inside a spirit level. [if the air pocket is unexamined]But I'm breathing, so either there's some kind of grate above me or the air will eventually turn as stale as prisoner's bread.[otherwise]Above me is a grate.[end if]"

Chapter 2 - Scenery

Section 1 - Air pocket, Grate, Drain

The air pocket is privately-named, scenery, a door, open, not openable. "[if the location is the Drain Pipe]There's some kind of grate above me![otherwise]I suppose if they load things from boats into here at high tide then the floor might get pretty wet. That's why they needed such a large drain.[end if]"

The air pocket is up from the Drain Pipe. The air pocket is down from the Loading Bay.

Understand "grate" as the air pocket.

Understand "air", "pocket" as the air pocket when the location is the Drain Pipe.
Understand "drain" as the air pocket when the location is the Loading Bay.

Instead of opening the air pocket, try going the air pocket.

After going through the air pocket from the Drain Pipe:
	if the air pocket is unexamined:
		say "There's some kind of grate above me. I push it open and haul myself up into a wide room.";
	otherwise:
		say "I push my way up through the grate and out of the water.";
	now the air pocket is examined;
	continue the action;

After going through the air pocket from the Loading Bay when the warehouse door is closed:
	say "I suppose the water-rats didn't get a chance to eat my toes last time. I drop back into the water of the drain.";
	continue the action;

Instead of going through the air pocket from the Loading Bay when the warehouse door is open:
	say "I can’t. The crate is completely blocking the drain. Next high tide, this place is going to [i]flood[r].";

Part 10 - Loading Bay

Chapter 1 - Description

The Loading Bay is a room. "I'm inside the warehouse but there's no sign of the Figure. Or anyone else. Or anything. The warehouse may be massive but it seems to be completely empty, [if the warehouse door is open]just that crate blocking the drain[otherwise]just one huge crate wrapped all round with thick iron chains[end if] and some piles of debris like those outside. There's enough floor space for a game of clockball, continuing off to the south.[paragraph break]About halfway down is the large metal door I saw from the dock. Above it a fat pipe crosses from wall to wall. The drain I came up from is by the north wall.". The printed name is "Loading".

Chapter 2 - Scenery

Section 1 - Drain

[ See 'Air Pocket', above. ]

Section 2 - Junk

Some debris [we have 'junk' in the clock shop and 'rubble' outside the warehouse...] is scenery, privately-named, in the Loading Bay. 

The printed name of the debris is "junk". Understand "junk", "debris", "rubble", "stone/stones", "broken", "beam/beams", "wood", "wooden", "pile/piles", "pile/piles of", "tile/tiles", "ceramic", "guttering", "gutter/gutters" as the debris. 

Rule for printing the description of the debris:
	say "Broken stone, wooden beams, piles of ceramic tile and guttering, things like that. ";

After printing the description of the debris when the north end of the rope is in the Loading Bay:
	say "A massive coil of rope. ";

After printing the description of the debris when the long ladder is in the Loading Bay:
	now the long ladder is not scenery;
	say "A long ladder. ";

Last after printing the description of the debris:
	say paragraph break;

Instead of taking or turning the debris:
	say "Clearing up in here isn't going to help me stop the Figure.";

Section 3 - A Long Ladder

A long ladder is portable scenery, in the Loading Bay. "A long wooden ladder, the sort of thing I could carry around so long as there was no-one about to crash into."

The long ladder can be placed. The long ladder is not placed.
The long ladder can be stuck. The long ladder is not stuck.

After printing the description of the placed long ladder:
	say "The ladder's propped underneath the pipe. ";

After printing the description of the stuck long ladder:
	say "The ladder leads down from the platform. ";

Rule for writing a paragraph about the long ladder:
	say "[if placed]A long ladder leans against the wall below the pipe.[otherwise if stuck]The ladder leads from the platform to the earth floor below.[otherwise]There's a long ladder here.[end if]";

Instead of climbing the long ladder when the long ladder is not placed and the long ladder is not stuck:
	say "The ladder doesn't exactly go anywhere at the moment.";

Instead of climbing the placed long ladder:
	say "The ladder puts me in reach of the pipe.";

Instead of taking the stuck long ladder:
	say "The ladder has dropped almost out of reach. There's no way I could get it back up here.";

After taking the long ladder:
	now the long ladder is not scenery;
	now the long ladder is not placed;
	say "[one of]I stick the ladder under my arm. I must look like a rat stealing a baguette stick.[or]I take hold of the ladder again.[stopping]";

TRIG_LADDER_PIPE is a trigger.

Rule for firing unfired TRIG_LADDER_PIPE:
	say "Waving this ladder around is like trying to repair a differentiator in a pocket water with nine foot wooden arms. I'm all over the place and only after making a noise louder than the midday chimes do I get it up against the wall, by the pipe.[paragraph break]If the Figure is here somewhere then I might as well have rung a doorbell.";

Rule for firing fired TRIG_LADDER_PIPE:
	say "I get the ladder into place under the pipe.";

Section 4 - North Pipe

A warehouse pipe is a kind of thing. A warehouse pipe is usually scenery, privately-named. The printed name of a  warehouse pipe is usually "pipe". Understand "pipe" as a warehouse pipe.

The north pipe is a warehouse pipe, in the Loading Bay. "The pipe's a fair few feet up the wall. What it's for is anyone's guess." 

Instead of putting the long ladder against a warehouse pipe:
	try standing the long ladder up instead;

Instead of standing the long ladder up when the player can see a warehouse pipe:
	fire TRIG_LADDER_PIPE;
	move the long ladder to the location;
	now the long ladder is placed;

Instead of putting the middle of the rope on a warehouse pipe:
	try fastening the noun to the second noun instead;

Before doing something when a warehouse pipe is physically involved:
	unless the long ladder is placed and the long ladder is in the location:
		unless we are putting the long ladder against the second noun or we are fastening a rope segment to the second noun or we are untying a rope segment from the second noun:
			say "The pipe's out of my reach." instead;

Section 5 - Sliding Door

Rule for printing the description of the loading-bay door when in the Loading Bay:
	say "The huge metal door is made of sliding iron bars that could be lifted up if, say, I was a twelve foot Hotlands warrior.";

An unlocking rule for the loading-bay door when the location is the Loading Bay:
	say "I don't have a key." instead;

Instead of unlocking the loading-bay door with something when the location is the Loading Bay:
	say "I don't have a key." instead;

Instead of opening, pushing, pulling or turning the loading-bay door:
	say "Do you think I'd let Drake and Calvin hit me so hard if I was strong enough to lift this door?";

Instead of attacking the loading-bay door when the location is the Loading Bay:
	say "I don't stand a chance.";

Section 6 - Crate

An enormous packing crate is scenery, in the Loading Bay. "An enormous packing crate. Whatever’s inside must be important because its wrapped around with iron security chains, almost like they were afraid of whatever’s inside breaking out[if the north end of the rope is tied to the packing crate]. The rope is tied to the crate[end if]."

Rule for printing the description of the enormous packing crate when the warehouse door is open:
	say "The crate has dropped into the drain, blocking my way out!";

The printed name of the enormous packing crate is "crate".

Instead of taking the packing crate:
	say "The crate is far too big and heavy for me to carry, I’d need to be a giant to even get my arms around it! But I could probably push it along the floor a little if I needed to.";

Instead of pushing the packing crate:
	try pushing the noun to nothing;

Rule for supplying a missing second noun when pushing the packing crate to:
	say "Where should I push the crate?";

Understand "push [enormous packing crate] down/into/through/in/to [air pocket]" as pushing it to. [Not a totally smart thing to do - i.e. the parser never normally generates such a command - but good enough for what we need]

Instead of pushing the enormous packing crate to a direction (called d):
	if d is down or d is north:
		try pushing the noun to the air pocket;
	otherwise if d is south:
		say "I put my shoulderblades to the side of the crate and dig my heels in and get it to move maybe an inch... not much further. Another look at the room is enough to convince me there’s no way I can push the crate all the way over there." instead;
	otherwise:
		continue the action; [[BUG]: new response required here]

Instead of pushing the enormous packing crate to the air pocket:
	abide by the crate pushing rules;
	assert that the south end of the rope is tied to the warehouse door issuing "Rope is tied to door.";
	assert that the north end of the rope is tied to the enormous crate issuing "Rope is tied to crate.";
	assert that exactly two rope segments are coiled issuing "Two rope segments coiled.";
	say "Putting my shoulderblades to the side of the crate and digging my heels into the floorboards, I manage to move the crate a tiny inch towards the drain. Every inch after that is easier as more and more of the crate is out of contact with the floor, until suddenly it’s moving and I nearly fall backwards with it. The crate tumbles away into the drain. The rope goes taut. And across the hall there’s the sound of moving metal...";
	now the warehouse door is open;

The crate pushing rules are a rulebook.

A crate pushing rule when the enormous packing crate is unsuspended:
	say "I could push the crate down the drain but then it’d be gone and it’d probably block my way out." instead;

A crate pushing rule when the enormous packing crate is suspended:
	let r be the other end of the rope nearby;
	if r is off-stage or r is unanchored:
		say "I’ve attached this rope to the crate but it’s not tied off anywhere, so surely I’d lose the whole thing if I pushed the crate down the drain?" instead;

A crate pushing rule when no rope segment is coiled:
	say "Even if the rope was taut – which it isn’t, not by a long way – I don’t think this crate’s heavy enough to rip the door right out of the wall." instead;

A crate pushing rule when exactly one rope segment is coiled:
	say "There’s still so much slack in the rope even with it passing over one of the pipes, that I’d just lose the crate down the hole if I did that." instead;

Section 7 - Rope

A rope segment is a kind of thing.

Interconnection relates one rope segment to another (called the other end). The verb to be terminated at implies the interconnection relation. 

Attachment relates one thing (called the anchor) to one rope segment. The verb to be tied to implies the reversed attachment relation.

A rope segment can be coiled. A rope segment is usually not coiled.

Definition: a rope segment (called the segment) is anchored:
	if the anchor of the segment is nothing, no;
	yes;

Definition: a rope segment (called the segment) is unanchored:
	unless the segment is anchored, yes;
	no;

Definition: a thing is suspended:
	if a rope segment is tied to it, yes;
	no;

Definition: a thing is unsuspended:
	unless it is suspended, yes;
	no;

To decide which rope segment is the rope nearby:
	if the location is the Loading Bay:
		decide on the north end of the rope;
	otherwise if the location is the Storage Bay:
		decide on the south end of the rope;

The north end of the rope is a rope segment, privately-named, in the Loading Bay. "An enormous coil of rope, maybe enough to cross the Thymes and back."

Understand "rope" as the north end of the rope. The printed name of the north end of the rope is "rope".

Rule for printing the description of a rope segment (called the segment):
	say "An enormous coil of rope, maybe enough to cross the Thymes and back. ";
	unless the noun is held:
		say the room description details of the segment;
	otherwise:
		say paragraph break;

Rule for writing a paragraph about a rope segment (called the segment):
	if the middle of the rope is held:
		say "I'm holding ";
		if the segment is tied to nothing or the other end of the segment is off-stage:
			say "one end ";
		otherwise:
			say "the middle ";
		[end if]
		say "of a long rope. ";
	otherwise:
		say "There's a length of rope here. ";
	[end if]
	say the room description details of the segment;

To say the room description details of (the segment - a rope segment):
	say "It";
	if the segment is tied to something (called the anchor):
		say "'s tied to [the anchor] and";
	if the segment is coiled:
		say " is looped over a pipe near the ceiling and";
	if the middle of the rope is not held and the other end of the segment is off-stage and the segment is unanchored and the segment is not coiled:
		say " is coiled up on the ground and";
	[end if]
	if the other end of the segment is on-stage:
		if the other end of the segment is coiled:
			say " disappears to the [if the segment is the north end of the rope]south[otherwise]north[end if] at a sharp angle up towards the roof. It";
		otherwise:
			say " snakes away to the [if the segment is the north end of the rope]south[otherwise]north[end if]. It";
		[end if]
	[end if]
	say " looks far too heavy for me to carry, but I could probably drag it around.";

The south end of the rope is a rope segment, privately-named. The south end of the rope is terminated at the north end of the rope. The printed name is "rope". Understand "rope" as the south end of the rope.

The middle of the rope is a rope segment, privately-named. The printed name is "rope". Understand "rope" as the middle of the rope.

Rule for printing the name of a rope segment (called r) while clarifying the parser's choice of something:
	if r is the middle of the rope:
		say "end I'm holding";
	otherwise if the player holds the middle of the rope:
		if r is tied to something (called the anchor):
			say "end tied to [the anchor]";
		otherwise if r is coiled:
			say "end hanging down from the pipe";
		otherwise:
			say "length coiled up on the ground";

Rule for implicitly taking a rope segment (called r):
	say "(first taking [the r])[command clarification break]";
	try taking r;
	assert that the player carries the middle of the rope issuing "Player segment carried.";
	redirect the action from r to the middle of the rope;

Section 6.1 - Taking Rope

Instead of taking a rope segment when the player has the middle of the rope and the noun is unanchored and the noun is not coiled and the other end of the noun is off-stage:
	say "I couldn't carry the whole rope. It's the size of two of me!";

Instead of taking a rope segment when the player has the middle of the rope:
	try pulling the middle of the rope instead;

Carry out taking a rope segment:
	now the player carries the middle of the rope instead;

Report taking a rope segment when the noun is unanchored and the other end of the noun is off-stage:
	say "I pick up one end of the long rope." instead;

Report taking a rope segment when the noun is anchored and the other end of the noun is off-stage:
	say "I've picked up the other end of the long rope." instead;

Report taking a rope segment:
	say "I take hold of the middle of the rope." instead;

Section 6.2 Going with Rope

The main warehouse is a region. The Loading Bay and Storage Bay are in the main warehouse.

Check going when the player carries the middle of the rope:
	unless the room gone to is in the main warehouse:
		say "The rope's too bulky for that!" instead;

After going when the player carries the middle of the rope:
	consider the rope movement rules;
	continue the action;

The rope movement rules is a rulebook.

A rope movement rule:
	if the room gone to contains a rope segment and the room gone from contains an rope segment (called r):
		if r is coiled or r is anchored:
			remove the middle of the rope from play;
			say "First I let go of the rope." instead;

A rope movement rule:
	if the room gone from contains an unanchored rope segment (called the loose end) and the room gone to contains a rope segment:
		remove the loose end from play;
		say "I haul the rope back along the floor, coiling it up as I go." instead;

A rope movement rule:
	if the room gone from contains a rope segment (called the coil) and the other end of the coil is off-stage:
		move the other end of the coil to the room gone to;
		say "I drag the rope out along the floor behind me." instead;

Section 6.3 - Dropping Rope

Instead of dropping a rope segment when the middle of the rope is not carried:
	say "I'm not holding the rope!";

Instead of dropping a rope segment when the location does not contain a rope segment:
	remove the noun from play;
	if the location is the Loading Bay:
		move the north end of the rope to the location;
	otherwise if the location is the Storage Bay:
		move the south end of the rope to the location;
	say "I drop the end of the rope to the floor.";

Carry out dropping a rope segment:
	remove the noun from play instead;
	assert that the location contains a rope segment issuing "Location contains a rope segment.";

Report dropping a rope segment:
	say "I let go of the rope." instead;

Section 6.4 - Looping Rope

The rope-looping rules are a rulebook.

A rope-looping rule when the rope nearby is coiled (this is the rope already coiled rule):
	say "I’d gain nothing from winding the rope any further around the pipe!" instead;

A rope-looping rule when the rope nearby is anchored (this is the rope tied down rule): 
	if the other end of the rope nearby is anchored:
		say "Both ends are already tied down!" instead;
	otherwise if the other end of the rope nearby is on-stage:
		say "I’ve only got the middle of the rope, not a free end.";

A rope-looping rule (this is the can't reach the pipe rule):
	unless the long ladder is placed and the long ladder is in the location:
		say "[one of]I try slinging the rope up in the air and over the pipe – no success. It’s too heavy for me to get it any distance up before it’s back down on my head again.[or]I can’t reach the pipe from down here![stopping]" instead;

Instead of fastening a rope segment to a warehouse pipe:
	abide by the rope-looping rules;
	assert that the long ladder is in the location and the long ladder is placed issuing "The player can reach the rope.";
	let x be the rope nearby;
	now x is coiled;
	say "[one of]I scramble a few rungs up the ladder with the end of the rope looped around my neck – not very safe, I know, but I’m working as fast as I can. Once I’m up high enough I chuck the rope over the pipe. Great. It’s now hanging down like a pulley![or]I scramble up the ladder and toss the rope over the piping.[stopping]";

Section 6.5 - Tying rope

Definition: a thing is a cleat:
	if it is the enormous packing crate, yes;
	if it is the warehouse door, yes;
	no;

The rope-fastening rules are an object-based rulebook.

A rope-fastening rule for something suspended:
	say "I’d gain nothing by tying the rope up in loops." instead;

A rope-fastening rule for something unsuspended when the rope nearby is anchored:
	say "I’d gain nothing by tying the rope up in loops." instead;

Instead of fastening a rope segment to a cleat:
	abide by the rope-fastening rules for the second noun;
	now the rope nearby is tied to the second noun;
	remove the middle of the rope from play;
	continue the action;

After fastening a rope segment to a cleat when no on-stage rope segment is coiled:
	let r be the other end of the rope nearby;
	say "I fasten the free end of the rope to [the second noun][if r is on-stage and r is anchored]. The other end is tied to [the anchor of r] across the room but there’s an enormous amount of slack in between[end if].";

After fastening a rope segment to a cleat when exactly one on-stage rope segment is coiled:
	let r be the other end of the rope nearby;
	say "I tie off the free end of the rope to [the second noun][if r is on-stage and r is anchored]. The other end is tied to [the anchor of r] across the room but despite passing over one of the ceiling pipes there’s still plenty of slack in the system[otherwise]. The other end passes over one of the ceiling pipes and dangles free on the other side. I’ve made a pulley system, but it might not be enough to shift [the second noun][end if].";

After fastening a rope segment to a cleat when at least two on-stage rope segments are coiled:
	let r be the other end of the rope nearby;
	say "[if r is not anchored]I tie this end of my pulley system off to [the second noun].[otherwise]I haul down on this end of the rope, feeling the fibres stretch. When the whole system is as taut as I can get it, I loop it through [the second noun] and tie it tighter than one of Drake’s Viennese burns. As the system relaxes the door seems to move maybe a second’s hand from the floor...[end if]";

Section 6.6 - Untying rope

Rule for supplying a missing second noun when untying a rope segment from something:
	if the player can see a cleat:
		if the rope nearby is tied to a cleat:
			change the second noun to the anchor of the noun;

Before untying the middle of the rope from something:
	redirect the action from the middle of the rope to the rope nearby;

Instead of untying a rope segment from something:
	if the second noun is not a cleat:
		say "[The noun] isn't tied to [that or those for the second noun]!" instead;
	abide by the rope-untying rules;
	now the noun is tied to nothing;	
	say "[one of]It takes a bit of jiggling, but I work free the knot from [the second noun][or]I work free the knot from [the second noun][stopping].";

The rope-untying rules are a rulebook.

A rope-untying rule when the rope nearby is not anchored:
	say "The rope isn’t tied to anything here." instead;

A rope-untying rule when the warehouse door is open:
	say "The rope system is held so tight I can’t begin to get the knots to move." instead;

Instead of untying a rope segment from a warehouse pipe:
	abide by the rope-unlooping rules;
	now the noun is not coiled;
	say "I pull the rope back down from the pipe.";

Section 6.7 - Unlooping rope

The rope-unlooping rules are a rulebook.

A rope-unlooping rule when the rope nearby is not coiled:
	say "The rope isn’t looped over the pipe here!" instead;

A rope-unlooping rule when the rope nearby is anchored:
	if the other end of the rope nearby is on-stage:
		if the other end of the rope nearby is anchored:
			say "But both ends of the rope are tied down!" instead;

A rope-unlooping rule when the rope nearby is anchored:
	if the other end of the rope nearby is on-stage:
		remove the other end of the rope nearby from play;
		now the other end of the rope nearby is not coiled;
		now the rope nearby is not coiled;
		say "Holding the rope just by where I’ve tied it, I haul it arm over arm until finally it falls free of the pipe overhead." instead;

Section 6.8 - Pulling Rope

Before pulling a rope segment:
	unless the noun is the middle of the rope:
		carry out the implicitly taking activity with the noun;

Instead of pulling a rope segment:
	abide by the rope-pulling rules;

The rope-pulling rules are a rulebook.

A rope-pulling rule when the warehouse door is open:
	say "The rope is already as taut at it’ll go, holding that door open!" instead;

A rope-pulling rule when the south end of the rope is anchored and no on-stage rope segment is coiled:
	say "[one of]I can pull all I like, but I’m never going to just pull the door away from the wall. It’s supposed to move upwards, like someone was pulling it from above![or]I need to get that rope to pull upwards, not along the floor![stopping]" instead;

A rope-pulling rule when the south end of the rope is anchored and exactly one on-stage rope segment is coiled:
	say "[one of]There’s a tiny moment when I think I’m actually doing some good, before I try just hanging with all my weight on the rope. And that does no good. So what more can I do?[or]I’m simply not heavy enough to get that door to shift. I need something heavier than it. A battleship maybe, or a small moon.[stopping]" instead;

A rope-pulling rule when at least two on-stage rope segments are anchored:
	say "I tug one way and the other. Both ends of this rope are firmly tied." instead;

A rope-pulling rule when the rope nearby is anchored and the other end of the rope nearby is off-stage:
	say "This end is firmly tied." instead;

A rope-pulling rule when the other end of the rope nearby is off-stage and the rope nearby is coiled:
	now the rope nearby is not coiled;
	say "I pull the rope clear from the pipe. It whips the floor with a vengeance." instead;

A rope-pulling rule when the other end of the rope nearby is off-stage:
	say "The free end of the rope waggles around the floor." instead;

A rope-pulling rule when the other end of the rope nearby is anchored:
	say "The other end of the rope is firmly tied." instead;

A rope-pulling rule when the other end of the rope nearby is coiled:
	now the other end of the rope nearby is not coiled;
	remove the other end of the rope nearby from play;
	say "There’s a thump as the other end of the rope uncoils from the pipe. I drag it back across the floor and gather it up." instead;

A rope-pulling rule:
	remove the other end of the rope nearby from play;
	say "I pull the rope back over from the other end of the long room." instead;

Part 11 - Storage

Storage Bay is a room, south of the Loading Bay. "This is the south end of the enormous room but it has another door to the east: this one less formidable-looking than the others and labeled with a sign: KEEP OUT. Sounds promising, even though from what I saw of the warehouse on the outside, there really can't be much more to the building at all. Perhaps this is the cupboard where the Figure sleeps." The printed name is "Storage".

The south pipe is a warehouse pipe, in the Storage Bay. "The pipe's a fair few feet up the wall. What it's for is anyone's guess." 

Chapter 2 - Warehouse Door

The warehouse door is a door, not open, not openable, not locked, not lockable, east of the Storage Bay, west of Gas Platform. "The enormous warehouse continues back to the north towards the drain I came up by. There’s a second fat pipe crossing the room here." The description is "The door is designed to slide up into the ceiling and in the centre of it is an iron ring for lifting. Presumably the Figure can just slide it up, but I certainly can’t.[If the Warehouse Door is suspended and the warehouse door is closed] The rope I’ve got tied to it might help though[otherwise if the warehouse door is open] Instead I’ve got the rope tied to it, and my pulley system has lifted the whole thing about two feet from the floor[end if]."

Instead of opening, pulling or pushing the closed warehouse door:
	say "It’s far heavier than me. There’s no way I can move it unaided.";

Instead of opening, closing, pulling or pushing the open warehouse door:
	say "It was hard enough getting it this far! I shouldn’t be ungrateful!";

After going through the warehouse door:
	say "[one of]Lying on my belly I pull myself through the gap into darkness. Halfway through I have a sudden horrible image: the Figure, standing by the crate in the drain with a candle to the rope that’s holding the enormous door above me. As quick as I can I pull myself through[or]I crawl under the door[stopping][if the player carries the long ladder]. Then I reach back through the gap and pull the ladder after me[end if].";
	continue the action;

Part 12 - Gas Platform

Chapter 1 - Description

Gas Platform is a room.

Gas Platform can be murky or bright. Gas Platform is murky.

Rule for printing the name of Gas Platform:
	say "[if Gas Platform is murky]Darkness[otherwise]Gas Platform[end if]";

Rule for printing the description of the Gas Platform:
	if the Gas Platform is murky:
		say "I’m on some kind of metal platform in the dark. The crack of light below the door is enough to make out a few controls beside me and a set of stairs leading down to the north. Down seems an odd way to be going since we’re above the river. There’s probably serpents down there, or octopuses, or water-camels.";
	otherwise:
		say "I’m on a metal platform that sticks out over an impossibly large space, twice the size of the warehouse I’m in at least. The room below is deep: the original staircase to the north gives up halfway down[if the long ladder is stuck]. Beyond that there’s the ladder[end if].[paragraph break]In the light of a hundred gas-lamps I can see the carved earth walls. This whole place has been scooped clean out of the rock and it’s filled with rows upon rows of silent metal men: a whole army of statues. Perhaps somewhere amongst them is the Figure.";

Rule for writing a paragraph about the warehouse door when in the Gas Platform:
	now the warehouse door is mentioned;
	do nothing;

Chapter 2 - Staircase

Section 1 - Staircase

The broken staircase is a door, open, not openable, scenery, down from the Gas Platform, up from the Warehouse Basement, north from the Gas Platform.

Rule for printing the name of the broken staircase when in the Gas Platform:
	say "staircase";

Rule for printing the description of the broken staircase when in the Gas Platform:
	if the Gas Platform is murky:
		say "I can’t see much beyond the first few steps.";
	otherwise:
		say "The staircase gives up halfway to the floor. It’s like the platform was sticking its tongue out at the army below. It’s probably them who chopped it in half."

The broken staircase can be fixed. The broken staircase is not fixed.

Instead of going through the broken staircase from the Gas Platform when the broken staircase is not fixed:
	if the Gas Platform is murky:
		say "[one of]I feel my way down the first few steps: then the metal underfoot starts to rock and sway. Perhaps all this is built on the water and is floating – or perhaps the supports have rotted and the staircase is about to fall. Terrified, I race back up to the safety of the platform.[or]I’m not going down that staircase in the dark. There’s something wrong about it.[stopping]";
	otherwise:
		say "The staircase ends halfway to the ground, in midair with nothing holding it up.";

After going through the broken staircase from the Gas Platform:
	say "There’s no way I’m turning my back on those metal men, so I swing round to the back of the ladder and climb down that, even though there’s a moment when I’m hanging out over an enormous drop.[paragraph break]None of them move as I make my way down.";
	continue the action;

Section 2 - Ladder

Instead of standing the long ladder up when in the Gas Platform:
	if the Gas Platform is murky:
		say "It’s far too dark to go waving the ladder around in here. I’d probably knock myself out.";
	otherwise:
		move the long ladder to the location;
		now the long ladder is stuck;
		now the broken staircase is fixed;
		say "It takes a small army of Wren’s all working together, but eventually I get the ladder over the side and pointing down towards the rock floor below. Then I let go and it lands with a [i]crash[r].[paragraph break]None of the metal men react.";

Chapter 3 - Gas controls

Section 1 - Control Panel

Some gas controls are scenery, in the Gas Platform. "[if the Gas Platform is murky]There might be more controls out there in the dark but what’s visible are a button below a large lever, and a red-painted bolt.[otherwise]These are the controls for the gas-lights. There must be a big tank under the platform or something.[end if]"

Instead of switching on the gas controls:
	say "I don’t know what they do, let alone how to make them work. There’s nothing for it, Wren, but to guess and hope you don’t break anything!";

Section 2 - Ignition Bolt

An ignition bolt is part of the gas controls. The description of the ignition bolt is "[if the Gas Platform is bright]Around the bolt is engraved HI, OFF and IGN. Whatever that means.[otherwise]The bolt’s just a bolt, but knowing my luck I’ll turn it and find it was the only thing holding this platform up.[end if]"

The ignition bolt has a number called the setting. The setting of the ignition bolt is 1.

Instead of turning or opening the ignition bolt:
	say "I can’t turn it with just my hands. Which might even be lucky.";

Instead of unscrewing the ignition bolt with the wrench:
	abide by the bolt-turning rules;

Instead of screwing the ignition bolt in with the wrench:
	try unscrewing the noun with the second noun instead;

The bolt-turning rules are a rulebook.

A bolt-turning rule when the Gas Platform is bright:
	say "I’ve already got the lights working. I don’t want to be in the dark now I’ve seen what’s down there." instead;

A bolt-turning rule when the long lever is not armed:
	say "The bolt doesn’t seem to turn: partly because the lever’s in the way of the wrench handle." instead;

A bolt-turning rule when the ignition button is not ignited:
	change the setting of the ignition bolt to the remainder after dividing the setting of the ignition bolt by 2; [0, 1, 2]
	increment the setting of the ignition bolt by 1; [1, 2, 3]
	if the setting of the ignition bolt is:
		-- 2:
			say "I heave the bolt around. The room is suddenly filled by a hissing sound, like a thousand baby cobras coiling and getting ready to strike!" instead;
		-- 3:
			say "I turn the bolt further. The baby cobras grow up into hot-headed angry adult cobras the size of oak trees. I’m almost deafened by the noise." instead;
		-- 1:
			say "I heave the bolt further still. Abruptly, the room falls quiet." instead;

A bolt-turning rule when the ignition button is ignited:
	now the Gas Platform is bright;
	say "I heave the bolt around and the stars on the wall erupt into flame, filling the chamber with light! And what a chamber – deep and wide – this is like standing inside the clock of the Cathedral all over again. The room below must be carved out of the rock below the riverbed, and its wall are crisscrossed with pipes which are now providing light.[paragraph break]And the room is full of people. Men, standing in rows and staring at me. I try not to move – hoping they won’t see me. They’re doing the same. Its like the room was filled with mirrors reflecting my image. I wave a hand but nothing happens. Nothing at all. They’re statues – in full armour – gleaming metal statues, more than I could count without growing thirty or forty more hands.[paragraph break]Whatever they are they must be connected to the Figure. There’s nothing for it, Wren, but to get a closer look somehow..." instead;

Section 3 - Lever

A long lever is part of the gas controls. The description of the long lever is "[if the Gas Platform is bright]A long metal lever labeled IGN is red letters.[otherwise]It feels like a metal lever, not as heavy as the one on the Difference Engine but still needing both hands to pull.[end if]"

The long lever can be armed. The long lever is not armed.

Instead of pushing the long lever:
	say "The lever doesn’t push.";

Instead of pulling or switching on the armed long lever:
	say "The lever’s already pulled up as far as possible.";

Instead of pulling or switching on the long lever:
	now the long lever is armed;
	say "Pulling the lever takes all the strength I’ve got left (which isn’t too much). In reply from the darkness comes the sound of a thousand tiny clicks.";

Section 4 - Ignition

An ignition button is part of the gas controls. The description of the ignition button is "[if the Gas Platform is bright]A large brass button labeled IGN.[otherwise]Just underneath the lever is a large brass button.[end if]"

The ignition button can be ignited. The ignition button is not ignited.

Instead of pushing or switching on the ignition button:
	abide by the ignition rules;	

The ignition rules are a rulebook.

An ignition rule when the ignition button is ignited:
	say "I wouldn’t want to risk turning the gas off by accident!" instead;

An ignition rule when the long lever is not armed:
	say "I push the button. Huh. Doesn’t seem to do anything." instead;

An ignition rule when the setting of the ignition bolt is 1:
	now the long lever is not armed;
	say "I push the button. The lever drops back suddenly almost taking my arm off! There’s that clicking noise all around again." instead;

An ignition rule when the setting of the ignition bolt is 2:
	now the ignition button is ignited;
	now the long lever is not armed;
	say "I push the button. The lever drops back suddenly almost taking my arm off! At the same time, the room is filled by a snapping noise and suddenly the darkness is full of stars! A whole sky of blue points. Where am I now? Outside? It’s a huge space, wherever it is. The hissing noise has stopped, too." instead;

An ignition rule when the setting of the ignition bolt is 3:
	say "I push down on the button but it refuses to press. One of those cobras must have gotten stuck underneath it or something." instead;

Chapter 4 - New Wrench

The wrench can be rusty or shiny. The wrench is rusty.

After going to the Gas Platform when the wrench is rusty and the player does not have the wrench and the wrench is not in main warehouse:
	now the wrench is shiny;
	move the wrench to Gas Platform;
	continue the action;

Rule for printing the description of the shiny wrench:
	say "This must be why whoever-it-was threw away that other wrench. It’s lighter, stronger and shinier, the same way the Archbishop’s teeth compare to mine.";

Part 13 - Warehouse

The Warehouse Basement is a room. "I’m standing in a forest of eyes, and arms, and hands. There are metal men all around me, on every side, all slightly different. The flickering gas-lights make it look and sound like they’re breathing. Any one might be about to reach out a hand and grab my shoulder… I need to work out the Figure’s plan as quickly as possible and then get out of here. In one piece!"

The printed name of the Warehouse Basement is "Warehouse"

Rule for printing the name of the broken staircase when in the Warehouse Basement:
	say "ladder";

Rule for printing the description of the broken staircase when in the Warehouse Basement:
	say "The ladder’s my ticket out of here, back up to the platform. (I don’t want to think about how I’m going to get back down that drain!)";

Instead of going through the broken staircase from the Warehouse Basement:
	say "I’m not running till I’ve worked out what the Figure’s up to. Once I know that, [i]then[r] I’m running.";

The army of metal statues is scenery, in the Warehouse Basement. "Each man is made of fine steel and brass and stands upright, about six foot tall. Their faces are bare faceplates with tiny glass eyes, but they all look like they’re crying because of deep channels for rain run-off that run from forehead to chin. Each one has a small hatch in the middle of their chest, a tiny fraction ajar."

Understand "mechanical", "men", "man" as the army of metal statues.

Instead of doing something when the army of metal statues is physically involved:
	say "With shaking fingers I open the hatch on the front of the nearest man. No surprise maybe to find he’s full of clockwork, but it’s clockwork like I’ve never seen before: cogs so small it’s like his whole body is infested with woodlice and maggots scrambling over one another. It’s like someone had taken the whole of the Difference Engine and shrunk it to fit.[paragraph break]Except there’s obviously something missing. All those cogs would need a spring about the size of the metal man’s head and it would need to be placed right in the middle where it could unwind to every part of his body. But in the perfect spot there’s nothing but a gap, like someone built this machine but never gave it a heart. What good are these men if all they do is stand in line?[paragraph break]That’s when I notice the seal. Something embossed on the inside of the chest hatch. I take a step back to see it more clearly – a winding key above an ocean wave, familiar from somewhere – and step into something firm and solid. A man out of line?[paragraph break]Then a hand grips my throat. 'Who sent you here?' demands a voice, smooth and icy. A voice I know well, that I should have been expecting. 'Who else knows about this place? Tell me before I crush every pinion in your neck.'[paragraph break]My toes are scrabbling on the ground. I try to scream but nothing comes out beyond a whisper. I can see the outline of the Figure’s cowl and beyond that, for the first time, almost make out an unhappy face.[paragraph break]'You’ll tell me or you’ll die here,' the Figure says quietly. 'You’ll die cold and alone like the rat you are.'[paragraph break]The room is getting darker. The tank for the gas lamps must be running low. Soon it’ll be me and the Figure and all these men, and no-one will ever find me or know where I’ve gone. Or is that someone? In the background? A shape, a shadow, my imagination or…[paragraph break]'Covalt?' I whisper, in desperation. 'Covalt, is that…'[paragraph break]Then the lights disappear completely. The heavy cord of the clock-key round my neck has become tangled while I was asleep. The stars are coming out. And then I’m underwater again.";
	end the chapter;
	fire SE_RETURN_1;
	move Covalt to Covalt's Bedroom;
	move the player to the feather bed;
	change the current script to {SE_RETURN_0, SE_RETURN_2}

Book 9 - Return to Covalt's

Return to Covalt's is a scene. Return to Covalt's begins when the player can see the army of metal statues. Return to Covalt's ends when the player carries the decoy Perpetuum Mobile.

Part 1 - Bedroom

Chapter 1 - Description

Rule for printing the description of Covalt's Bedroom during Return to Covalt's:
	say "Covalt’s little back room. The skylight’s still got a Wren-shaped hole in it but at least the bits of balloon have been tidied away into a corner with all the rest of a clockmaker’s junk.";

After going north from Covalt's Bedroom when Return to Covalt's is happening and Covalt is in Covalt's Bedroom: [horrible unnatural language]
	if the state of Covalt is:
		-- 1: say "Covalt follows you, his expression anxious.";
		-- 2: say "Covalt follows you. 'You looking for something, are you?'";
		-- 3: say "Covalt follows you. 'Sit still, won’t you? You’re giving me frets.'";
		-- 4: say "Covalt follows you.";
	try looking;
	move Covalt to Clock Shop;

Chapter 2 - Events

SE_RETURN_0 is a scripted event. [dummy]

SE_RETURN_1 is a scripted event. The display text is "There’s something pinching my nose. And again. Regular, like a second-hand – maybe he’s tied me to a clock, I’m thinking, maybe I’m going round and round the face on the Cathedral…[paragraph break]I open my eyes and two black birds flutter away, startled.[paragraph break]'There you are. Still in there? That’s good enough.' The voice is old and crumbling like the stones of the Abbey walls. Covalt. 'I found you on my doorstep. Hour ago or more than that. Wasn’t sure you were breathing. Don’t know how people tick and you can’t wind them back up.'"

SE_RETURN_2 is a scripted event. The display text is "'Found this with you,' Covalt adds, holding up a scrap of paper that looks like a postage stamp in his gigantic hand. 'Stay away – this is what it says, you see, now what I’m telling you. Stay away or the child will… Well.' The old man pauses, awkwardly. 'It says to stay away, whichever-wards.'"

After firing SE_RETURN_1:
	change the state of Covalt to 1;

Chapter 3 - Scenery

Rule for printing the description of the feather bed during Return to Covalt's:
	say "Covalt’s feather bed – large enough to sleep four of the Abbey’s initiated and still leave room for a nightmare or two.";

Instead of standing on the feather bed when the player is not on the feather bed during Return to Covalt's:
	say "Now isn’t the time for more sleeping.";

After getting off the feather bed during Return to Covalt's:
	say "My bones make a noise like cracking timber as I haul myself up.";

Rule for printing the description of the wrecked skylight during Return to Covalt's:
	say "The bits and pieces of my balloon, piled up on one side.";

Instead of doing something when the wrecked skylight is involved during Return to Covalt's:
	say "They’re as broken as the springs that hold my brain in my place. Oh, my head!";

Chapter 4 - Ravens

Rule for printing the description of the ravens when the state of Covalt is 1 during Return to Covalt's:
	say "The ravens flit around the room, on a fixed pattern. One goes, then the other. Round and round like, well, like they weren't real ravens. Which they're not, of course, however well-built and oiled they are.";

Rule for printing the description of the ravens when the state of Covalt is 2 during Return to Covalt's:
	say "The ravens have settled, one on top of Covalt’s head and the other on his left hand.";

Rule for printing the description of the ravens when the state of Covalt is 3 during Return to Covalt's:
	say "The ravens are pecking and peeking across the floor[one of]. 'Making a fool of us,' Covalt remarks, catching my eye[or][stopping].";

Rule for printing the description of the ravens when the state of Covalt is 4 during Return to Covalt's:
	say "The ravens have retired to a rafter.";

Instead of doing something when the ravens are physically involved and the state of Covalt is 1 during Return to Covalt's:
	say "I couldn’t catch them!";

Instead of doing something when the ravens are physically involved and the state of Covalt is 2 during Return to Covalt's:
	say "The raven pecks back, quick and vicious[one of]. 'Just like a real bird,' Covalt remarks proudly[or][stopping].";

Instead of doing something when the ravens are physically involved and the state of Covalt is 3 during Return to Covalt's:
	say "The raven skitters and hops out of my reach.";

Instead of doing something when the ravens are physically involved and the state of Covalt is 4 during Return to Covalt's:
	say "The ravens are up, out of reach on a rafter.";

Chapter 5 - Covalt

Rule for printing the description of Covalt when the state of Covalt is 1 during Return to Covalt's:
	say "Covalt is pacing back and forth. Every time he turns he nearly brings down a wall with his massive shoulders.";

Rule for printing the description of Covalt when the state of Covalt is 2 during Return to Covalt's:
	say "Covalt is seated, colossal head between colossal hands.";

Rule for printing the description of Covalt when the state of Covalt is 3 during Return to Covalt's:
	say "Covalt is poking through the room looking for some kind of answer.";

Rule for printing the description of Covalt when the state of Covalt is 4 during Return to Covalt's:
	say "Covalt is hard at work at the workbench.";

First for writing a paragraph about Covalt during Return to Covalt's:
	now Covalt is mentioned;
	carry out the printing the description activity with Covalt;
	[ say paragraph break; ]

Chapter 6 - Conversation Tables

Section 1 - When Concerned

Table of concerned Covalt conversation
conversation			topic
CT_COV_R1_MYSELF		"[me]"
CT_COV_R1_BALLOON		"balloon" or "skylight" or "ceiling" or "wreckage" or "wreck" or "window" or "weather balloon" or "sorry" or "apologies" or "apologise" or "flight"
CT_COV_R1_ABBEY			"[abbey]" 
CT_COV_R1_CATHEDRAL	"[cathedral]"
CT_COV_R1_ABBOT			"[abbot]"
CT_COV_R1_FIGURE			"[figure]"
CT_COV_R1_ARCHBISHOP	 "[archbishop]"
CT_COV_R1_PEOPLE		"[abbeyfolk]" or "[sa'at]"
CT_COV_R1_COVALT		"giant" or "covalt" or "[himself]"
CT_COV_R1_RAVENS		"ravens" or "his ravens" or "hugin" or "mummin"
CT_COV_R1_CLOCKWORK	"[clockwork]" 
CT_COV_R1_PERPETUUM		"[perpetuum]" or "[plot]"
CT_COV_R1_DIFFERENCEENGINE	"difference" or "engine" or "machine" or "knowing machine"
CT_COV_R1_ARMY		"docks" or "dockyard" or "warehouse" or "docklands" or "old place" or "army" or "metal" or "mechanical" or "men" or "statues" or "machines" or "soldiers"

Rule for choosing the conversation table of Covalt when the state of Covalt is 1 during Return to Covalt's:
	change the chosen conversation table to the table of concerned Covalt conversation;

CT_COV_R1_MYSELF is a conversation topic. The enquiry text is "'I should tell you what happened, I’ve got to,' I begin hurriedly. 'The Figure, and I found… and there was this rope and I…'". The response text is "'Slow down, slow down!' Covalt chides. 'Start with something and go on from there. Or you won’t have a story, you’ll have a coughing fit!'".
CT_COV_R1_BALLOON is a conversation topic. The enquiry text is "'I’m sorry about your skylight.'". The response text is "'Never mind my skylight,' he answers, crossly. 'I don’t want no sorries from half-dead children!'".
CT_COV_R1_ABBEY is a conversation topic. The enquiry text is "'Perhaps I should go back to the Abbey.'". The response text is "'Not until you’ve told me what’s happened to you,' Covalt replies severely.".
CT_COV_R1_CATHEDRAL is a conversation topic. The enquiry text is "'I’ve got to get to the Cathedral,' I insist.". The response text is "'Not till we have a plan you don’t.' He waves the Figure’s note meaningfully. 'And we won’t have a plan till you’ve told me what’s going on.'".
CT_COV_R1_ABBOT is a conversation topic. The enquiry text is "'The Abbot must know I’m  missing by now.'". The response text is "'Well, perhaps he cares or not, never mind,' Covalt replies roughly. 'But you’ve been blacked out hard enough that you’re owed a little time without a whipping.'".
CT_COV_R1_FIGURE is a conversation topic. The enquiry text is "'The Figure must have brought me here,' I say. 'He tried to strangle me…'". The response text is "'So?' Covalt’s voice is urgent. 'Where were you? What did you find?'".
CT_COV_R1_ARCHBISHOP is a conversation topic. The enquiry text is "'I’ve got to tell the Archbishop!' I insist.". The response text is "'No you don’t, urchin.' Covalt stamps his foot. 'You’ve got to tell me.'".
CT_COV_R1_PEOPLE is a conversation topic. The enquiry text is "He wouldn’t know them.".
CT_COV_R1_COVALT is a conversation topic. The enquiry text is "'Are you all right?' I ask.". The response text is "'Me? ME?' He looks furious. 'I’ve got this half-dead half-guttered gutter rat stinking of river water dropped dead on my doorstep and… oh!' He growls. 'You tell me about you. And leave me out of it, right?'".
CT_COV_R1_RAVENS is a conversation topic. The enquiry text is "'Are your birds all right?'". The response text is "'You must be addled,' he replies, in a voice as soft as falling granite. 'Worrying about my birds. Now what happened to you?'".
CT_COV_R1_CLOCKWORK is a conversation topic. The enquiry text is "'I found clockwork,' I begin. 'Clockwork…'". The response text is "'Start from somewhere else,' Covalt insists. 'From the start or wherever but somewhere with sense!'".
CT_COV_R1_PERPETUUM	 is a conversation topic. The enquiry text is "'He might have stolen the Perpetuum already!'". The response text is "'That he might,' Covalt replies. 'But I didn’t feel any earthquake yet and you believe me, if your Figure starts taking that thing apart you’ll feel it in the wind-up of your bones.'".
CT_COV_R1_DIFFERENCEENGINE is a conversation topic. The enquiry text is "'I got to the Engine, like you said,' I tell him.". The response text is "'Course you did,' he replies, with clear pride. 'And where did it send you on to?'".
CT_COV_R1_ARMY is a conversation topic. The enquiry text is "'The Engine sent me to the docks!' I tell him. 'And I found – an army…' I try to describe the soldiers with their metal faces and mechanical chests.". The response text is "Covalt is nodding before I’ve finished. 'So that’s your answer then,' Covalt says, seriously. 'The Perpetuum.'".

CT_COV_R1_MYSELF is clustered with CT_COV_R1_BALLOON, CT_COV_R1_ABBEY, CT_COV_R1_CATHEDRAL, CT_COV_R1_ABBOT, CT_COV_R1_FIGURE, CT_COV_R1_ARCHBISHOP, CT_COV_R1_PEOPLE, CT_COV_R1_COVALT, CT_COV_R1_RAVENS, CT_COV_R1_CLOCKWORK, CT_COV_R1_PERPETUUM, CT_COV_R1_DIFFERENCEENGINE,  CT_COV_R1_ARMY.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_COV_R1_MYSELF:
	say "I've already talked to him about that." instead;

After firing CT_COV_R1_ARMY:
	change the state of Covalt to 2;

Section 2 - When Realizing

Table of realizing Covalt conversation
conversation			topic
CT_COV_R2_MYSELF		"[me]"
CT_COV_R2_BALLOON		"balloon" or "skylight" or "ceiling" or "wreckage" or "wreck" or "window" or "weather balloon" or "sorry" or "apologies" or "apologise" or "flight"
CT_COV_R2_CHURCH		"[abbey]" or "[cathedral]" or "[figure]"
CT_COV_R2_CLERGY		"[abbot]" or "[archbishop]"
CT_COV_R2_PEOPLE		"[abbeyfolk]" or "[sa'at]"
CT_COV_R2_COVALT		"giant" or "covalt" or "[himself]"
CT_COV_R2_RAVENS		"ravens" or "raven" or "his ravens" or "hugin" or "mummin"
CT_COV_R2_PERPETUUM		"[perpetuum]" or "[plot]"
CT_COV_R2_DIFFERENCEENGINE	"difference" or "engine" or "machine" or "knowing machine"
CT_COV_R2_ARMY		"docks" or "dockyard" or "warehouse" or "docklands" or "old place" or "[clockwork]" or "army" or "metal" or "mechanical" or "men" or "statues" or "machines" or "soldiers"

Rule for choosing the conversation table of Covalt when the state of Covalt is 2 during Return to Covalt's:
	change the chosen conversation table to the table of realizing Covalt conversation;

CT_COV_R2_MYSELF is a conversation topic. The enquiry text is "'Then the Figure found me and knocked me out,' I tell him, finishing my story.". The response text is "'Yes, yes.' He’s not listening – brows bent, deep in thought.". 
CT_COV_R2_BALLOON is a conversation topic. The enquiry text is "'I’m sorry about your skylight.'". The response text is "'Never mind my skylight,' he answers, crossly. 'I don’t want no sorries from half-dead children!'".
CT_COV_R2_CHURCH is a conversation topic. The enquiry text is "'Do you think the Figure’ll go back to the Cathedral?' I ask.". The response text is "'The Figure? Certainly,' Covalt says. 'We know what he’s wanting, after all, don’t we? And I don’t suppose getting fingers round your throat will have changed that for him.'".
CT_COV_R2_CLERGY is a conversation topic. The enquiry text is "'We should warn someone in the Church.'". The response text is "'You have any proof?' Covalt replies angrily. 'You’ve given yourself a rusty enough name already today.' Then suddenly he’s grinning. 'They don’t listen to rats like us, rat.'".
CT_COV_R2_PEOPLE is a conversation topic. The enquiry text is "He won’t know them.".
CT_COV_R2_COVALT is a conversation topic. The enquiry text is "'What are you thinking?' I ask.". The response text is "'Can’t you guess?' he replies.".
CT_COV_R2_RAVENS is a conversation topic. The enquiry text is "'Are your birds all right?'". The response text is "He waves the question away unanswered.".
CT_COV_R2_DIFFERENCEENGINE is a conversation topic. The enquiry text is "'Surely the Difference Engine could tell us what’s going on…'". The response text is "He laughs bitterly. 'We don’t need an Engine for that no more. Got a perfectly good rig of springs up here.' He taps his temple.".
CT_COV_R2_ARMY is a conversation topic. The enquiry text is "'The clockwork men…'". The response text is "'All had hatches in their guts, I heard you. You see the cogs on this don’t you?'".
CT_COV_R2_PERPETUUM is a conversation topic. The enquiry text is "'The Perpetuum,' I say. 'The Figure wants it for the army?'". The response text is "'He’s going to make a copy,' Covalt says heavily. 'Give each one a heart that never needs no winding. Merciless and unstoppable soldiers. More like a plague than an army.'[paragraph break]'But for what?'[paragraph break]Covalt shrugs. 'We won’t find out. Copying the Perpetuum? That’s like jamming a second spring into a working balance. Too much power. Or too much of something.' In a moment Covalt is on his feet again. 'Here’s how I see it. We need to stop the Figure but we can’t. We stop him today and he’ll be back tomorrow. He’s going to steal that Perpetuum and somehow we’ve got to put the chocks in [i]after[r] that.'[paragraph break]'How?'[paragraph break]Then he shakes his head. 'I’ll be widder-wound if I can see how.'".

CT_COV_R2_MYSELF is clustered with CT_COV_R2_BALLOON, CT_COV_R2_CHURCH, CT_COV_R2_CLERGY, CT_COV_R2_PEOPLE, CT_COV_R2_COVALT, CT_COV_R2_RAVENS, CT_COV_R2_PERPETUUM, CT_COV_R2_DIFFERENCEENGINE,  CT_COV_R2_ARMY.

[These topics may only be fired once.]
Rule for firing a fired conversation topic that is clustered with CT_COV_R2_MYSELF:
	say "I've already talked to him about that." instead;

Rule for firing CT_COV_R2_BALLOON:
	fire CT_COV_R1_BALLOON;

[If we ask Covalt about himself a second time, it is the same as asking about the Perpetuum - but without the usual enquiry text.]

First for firing fired CT_COV_R2_COVALT:
	if the enquiry text of CT_COV_R2_COVALT is not "":
		say the enquiry text of CT_COV_R2_COVALT;
	change the enquiry text of CT_COV_R2_PERPETUUM to "";
	fire CT_COV_R2_PERPETUUM;

[If we respond cluelessly to either of Covalt's prompts, it is the same as asking him about himself for the second time -- only without even that enquiry text!]

First after firing unfired CT_COV_R2_COVALT:
	ask DQ_COV_R2_GUESS;

First after firing unfired CT_COV_R2_ARMY:
	ask DQ_COV_R2_GUESS;

DQ_COV_R2_GUESS is a direct question.

A negative response rule for DQ_COV_R2_GUESS:
	now CT_COV_R2_COVALT is fired; [as though it were a repeat firing]
	change the enquiry text of CT_COV_R2_COVALT to "";
	fire CT_COV_R2_COVALT; [thereby firing the Perpetuum response only]

[Finally, the above mechanisms funnel conversation through to the Perpetuum quip]

After firing CT_COV_R2_PERPETUUM:
	change the state of Covalt to 3;

Section 3 - When figuring out what to do

Table of planning Covalt conversation
conversation			topic
CT_COV_R3_MYSELF		"[me]"
CT_COV_R3_BALLOON		"balloon" or "skylight" or "ceiling" or "wreckage" or "wreck" or "window" or "weather balloon" or "sorry" or "apologies" or "apologise" or "flight"
CT_COV_R3_CHURCH		"[abbey]" or "[cathedral]" or "[abbot]" or "[archbishop]"
CT_COV_R3_FIGURE			"[figure]"
CT_COV_R3_PEOPLE		"[abbeyfolk]" or "[sa'at]"
CT_COV_R3_COVALT		"giant" or "covalt" or "[himself]"
CT_COV_R3_RAVENS		"ravens" or "raven" or "his ravens" or "hugin" or "mummin"
CT_COV_R3_CLOCKWORK	"[clockwork]" 
CT_COV_R3_SAINTS			"[saints]"
CT_COV_R3_DIFFERENCEENGINE	"difference" or "engine" or "machine" or "knowing machine"
CT_COV_R3_PERPETUUM		"[perpetuum]" or "[plot]"

Rule for choosing the conversation table of Covalt when the state of Covalt is 3 during Return to Covalt's:
	change the chosen conversation table to the table of planning Covalt conversation;

CT_COV_R3_MYSELF is a conversation topic. The enquiry text is "'What can I do?' I ask.". The response text is "'Right now? Think. First step is [i]always[r] to think. How do we stop a Figure when we can’t stop a Figure?'".
CT_COV_R3_BALLOON is a conversation topic.
CT_COV_R3_CHURCH is a conversation topic. The enquiry text is "'I could go back to the Cathedral.' I gulp. 'Get in his way.'". The response text is "'Sneak in? You definitely will. No other way to get to the teeth on this one. But then what? That’s the rock.' He stares at his big fingers. 'It’s there, right in my hands like I’m holding it already, but I don’t see it!'".
CT_COV_R3_FIGURE is a conversation topic. The enquiry text is "'The Figure’s too strong for me to fight,' I remind him. 'I tried, and...'". The response text is "'No matter. You won’t be fighting him again. Brave but not brainy. What we need is a trick. A trap. And traps need bait...'".
CT_COV_R3_PEOPLE is a conversation topic. The enquiry text is "He won't know them". 
CT_COV_R3_COVALT is a conversation topic. The enquiry text is "'Are you all right?'". The response text is "'I’m thinking,' he snaps. 'Haven’t you seen someone thinking before? Some kind of rat you are. Can’t you do some thinking of your own?'".
CT_COV_R3_RAVENS is a conversation topic.
CT_COV_R3_CLOCKWORK is a conversation topic. The enquiry text is "'Can we use clockwork?'". The response text is "'You can always rely on clockwork,' Covalt replies strictly. 'Don’t forget that.'".
CT_COV_R3_SAINTS is a conversation topic. The enquiry text is "'Maybe we should pray...'". The response text is "'We can get to that once we’ve got some fool-of-a-chance scheme on the way,' Covalt replies. 'Plenty of time.'".
CT_COV_R3_DIFFERENCEENGINE is a conversation topic. The enquiry text is "'I’m not going to ask that Difference Engine again,' I assure him.". The response text is "He chortles. 'I don’t think you will. I didn’t think you would first time over. I thought it’d get you arrested and out of my hair.'".
CT_COV_R3_PERPETUUM is a conversation topic. The enquiry text is "'Do you think we could steal the Perpetuum first?'". The response text is "'Not a bad idea,' he admits, mulling it over, brain turning round on its spindle. But finally he shakes his head. 'No good. Where do you think the Figure would look when he didn’t find it? Right here, I’d say.'".

CT_COV_R3_MYSELF is clustered with CT_COV_R3_BALLOON, CT_COV_R3_CHURCH, CT_COV_R3_FIGURE, CT_COV_R3_PEOPLE, CT_COV_R3_COVALT, CT_COV_R3_RAVENS, CT_COV_R3_CLOCKWORK, CT_COV_R3_SAINTS, CT_COV_R3_DIFFERENCEENGINE, CT_COV_R3_PERPETUUM.

Rule for firing a fired conversation topic that is clustered with CT_COV_R3_MYSELF:
	say "I've already talked to him about that." instead;

Rule for firing CT_COV_R3_BALLOON:
	fire CT_COV_R1_BALLOON;

Rule for firing CT_COV_R3_RAVENS:
	fire CT_COV_R2_RAVENS;

Instead of doing something when the Perpetuum Mobile diagram is involved and the state of Covalt is 3:
	if we are not giving the perpetuum mobile diagram to Covalt:
		try giving the perpetuum mobile diagram to Covalt instead;

Instead of giving or showing the Perpetuum Mobile diagram to Covalt when the state of Covalt is less than 3:
	say "He doesn’t even look. He’s thinking about something else.";

Instead of giving or showing the Perpetuum Mobile diagram to Covalt when the state of Covalt is 3:
	remove the Perpetuum Mobile diagram from play;
	now the player carries the silver coins;
	change the state of Covalt to 4;
	say "'Wait now, what’s that? What are you doing with that?' Covalt’s voice is shaking, unless I’m still feeling dizzy. He’s pointing at the diagram of the Perpetuum in my hands like it was a two-foot rat. 'Did I tell you could go walking off with that?'[paragraph break]'I...'[paragraph break]Then the grin breaks out across his face like a sunrise through dirty glass windows. 'Because that’s a bloody brilliant thought from a brain as small as yours. Brilliant. I was saying I couldn’t build a Perpetuum, wasn’t I? But I can always build a box. Doesn’t take nothing to build a box. A trap. And here.'[paragraph break]Digging in a pocket he pulls out screws, keys, lengths of wire coiled in helices, a plane file, sandpaper and then finally, three shiny silver minutes that make my eyes light up.[paragraph break]'There’s an autopothecary over the street,' he says gleefully. 'You get yourself in there and buy the strongest sleeping drug you’re old enough to buy. Then we’ll spring-load it into a decoy Perpetuum and next morning there’ll be a sleeping Figure in the Cathedral vaults ready to be locked up and forgotten.'[paragraph break]";
	if the location is the Clock Shop:
		say "Covalt smiles a wicked smile and then turns to rummaging across his worktop. 'I’ll get some bits together.'";
	otherwise:
		say "Covalt drags me through into the main workshop and starts rummaging across his worktop. 'I’ll get some bits together. Get yourself going.'";
		move the player to the Clock Shop;
		move Covalt to the Clock Shop;

Section 4 - When we have a plan

Table of working Covalt conversation
conversation			topic
CT_COV_R4_MYSELF		"[me]" or "[abbey]"
CT_COV_R4_BALLOON		"balloon" or "skylight" or "ceiling" or "wreckage" or "wreck" or "window" or "weather balloon"  or "flight"
CT_COV_R4_CATHEDRAL	"[cathedral]"
CT_COV_R4_CLERGY		"[abbot]" or "[archbishop]"
CT_COV_R4_FIGURE			"[figure]"
CT_COV_R4_PEOPLE		"[abbeyfolk]" or "[sa'at]"
CT_COV_R4_COVALT		"giant" or "covalt" or "[himself]"
CT_COV_R4_RAVENS		"ravens" or "raven" or "his ravens" or "hugin" or "mummin"
CT_COV_R4_CLOCKWORK	"[clockwork]" 
CT_COV_R4_SAINTS			"[saints]"
CT_COV_R4_DIFFERENCEENGINE	"difference" or "engine" or "machine" or "knowing machine"
CT_COV_R4_PERPETUUM			"[perpetuum]" or "[plot]"

CT_COV_R4_MYSELF  is a conversation topic.  The enquiry text is "'What happens to me after we catch the Figure?'". The response text is "The old giant looks up at me with some sympathy. 'Since this plan of ours doesn’t have a wet flame’s chance of working,' he says very sensibly, 'we’d better not waste time worrying about that.' But I can see he’s not being honest.".

CT_COV_R4_BALLOON is a conversation topic. The enquiry text is "'Breaking into the vaults will be nothing compared to that balloon ride.'". The response text is "'Idiot,' Covalt replies. 'You’ll trip over your feet and that’ll be that.'".
CT_COV_R4_CATHEDRAL is a conversation topic. The enquiry text is "'What happens if I don’t make it back into the Cathedral?'". The response text is "'You will,' Covalt says. 'That’s not the risky part of the plan, so you’ve got to.'".
CT_COV_R4_CLERGY is a conversation topic. The enquiry text is "'If they catch me in there...'". The response text is "'Then don’t let them catch you,' Covalt growls. 'The point is they catch [i]him[r]. So let’s make sure that’s how it happens.'".
CT_COV_R4_FIGURE is a conversation topic. The enquiry text is "'And then when they find the Figure, passed out...'". The response text is "'Holding what looks like the Perpetuum... It'll be a short sentence.' He draws one finger across his throat. 'And then we wind out what to do with the real Perpetuum,' he sighs.".
CT_COV_R4_PEOPLE is a conversation topic. The enquiry text is "He won’t know them.".
CT_COV_R4_COVALT is a conversation topic. The enquiry text is "'Can you really make something that’ll look convincing? The Figure is no idiot...'". The response text is "'I can,' Covalt replies stiffly, 'and I’ll do it even better if you stop with your rusty talking.'".
CT_COV_R4_RAVENS is a conversation topic. The enquiry text is "'If you can make something that looks like a raven...' I begin.". The response text is "He pauses for a moment, then smiles. 'Kind of you, street-rat. So.'".

CT_COV_R4_CLOCKWORK is a conversation topic.
CT_COV_R4_SAINTS is a conversation topic.
CT_COV_R4_DIFFERENCEENGINE is a conversation topic.
CT_COV_R4_PERPETUUM is a conversation topic.

Rule for firing CT_COV_R4_CLOCKWORK:
	fire CT_COV_R3_CLOCKWORK;

Rule for firing CT_COV_R4_SAINTS:
	fire CT_COV_R3_SAINTS;

Rule for firing CT_COV_R4_DIFFERENCEENGINE:
	fire CT_COV_R3_DIFFERENCEENGINE;

Rule for firing CT_COV_R4_PERPETUUM:
	fire CT_COV_R3_PERPETUUM;

CT_COV_R4_MYSELF is clustered with CT_COV_R4_BALLOON, CT_COV_R4_CATHEDRAL, CT_COV_R4_CLERGY, CT_COV_R4_FIGURE, CT_COV_R4_PEOPLE, CT_COV_R4_COVALT, CT_COV_R4_RAVENS, CT_COV_R4_CLOCKWORK, CT_COV_R4_SAINTS, CT_COV_R4_DIFFERENCEENGINE, CT_COV_R4_PERPETUUM.

Chapter 7 - Idle actions

Rule for firing COVALT_COUNTER when the state of Covalt is 1 during Return to Covalt's:
	say "[one of]Covalt paces the floor, waiting for me to explain.[or]'Well?' Covalt demands.[or]'You’d better tell me what happened to you,' Covalt growls.[or][stopping]";

Rule for firing COVALT_COUNTER when the state of Covalt is 2 during Return to Covalt's:
	say "[one of]Covalt looks stunned, like he’s been used as a bell-clapper.[or]The giant’s face is cracked with frowns.[or]'I don’t see the teeth on this,' Covalt grumbles. 'I don’t see them at all.'[or][stopping]";

Rule for firing COVALT_COUNTER when the state of Covalt is 3 during Return to Covalt's:
	say "[one of]'What we need,' Covalt murmurs, 'is a plan.'[or]'Some kind of plan,' Covalt grumbles. 'You can’t make eggs into an omelet if you don’t have a plan.'[or]'Can’t do anything without a plan, you see,' Covalt says. 'Something to lay out what you do, when.'[or][fire TRIG_COV_DIAGRAM][stopping]";

TRIG_COV_DIAGRAM is a trigger.

Rule for firing unfired TRIG_COV_DIAGRAM:
	try giving the Perpetuum Mobile diagram to Covalt;

Rule for firing COVALT_COUNTER when the state of Covalt is 4 during Return to Covalt's:
	say "[one of]Covalt has settled at his workbench and is turning the plan of the Perpetuum this way and that.[or]Covalt rummages across his workbench and comes up trumps with a  sheet of metal and a small brass pin.[or]'Just the surface stuff,' Covalt murmurs to himself. 'None of them workings.'[or]'Are you still here?' Covalt demands of me, suddenly. 'Where’s your side of all this?'[or][stopping]";

Part 2 - Clock Shop

Rule for printing the description of the Clock Shop during Return to Covalt's:
	say "Looks like Covalt didn’t tidy up while I was out, then. From the bedroom door to the south round to the door to the southwest there are 11 hours of stuff – cogs, traces, all that clockwork the monks polish up and Covalt just tosses around his room like so much chickenfeed.";

Instead of opening the clock shop door when the state of Covalt is less than 4 and Return to Covalt's is happening:
	say "[one of]'Stop there,' Covalt demands, blocking my way with one gigantic hand. 'You’ve dragged me up into this, now you’re going to help me out.'[or]Covalt stops me. 'Not till we’ve a plan and I know what’s what.'[or]Covalt stops me.[stopping]";

After going through the clock shop door from the Clock Shop during Return to Covalt's:
	if the state of Covalt is 4:
		say "'Make it a knock-out, don’t go halves!' Covalt shouts after me.";
	continue the action;

Instead of closing the clock shop door when in the Clock Shop during Return to Covalt's:
	say "I wouldn’t dare touch it. Who knows what mechanics its got to try and take my hand off if I did?";

Instead of doing something when a clutter thing (called the junk) is involved during Return To Covalt's:
	if the junk is not the clock shop door:
		say "This stuff isn’t going to help me now.";
	otherwise:
		continue the action;

Part 3 - Escapement Street

Escapement St is a room. "It’s night. Gaslight webs the shining edges of the cobblestones. All the shops are closed except for Covalt’s back northeast. The streets are empty of people, no boys running around or girls weaving cats-cradle between their hands.[paragraph break]But the Autopothecary to the northwest is still open. It never closes."

The printed name of Escapement St is "Escapement Street".

The autopothecary shopfront is scenery, in Escapement St. "The Autopothecary is a machine set behind some expensive plate glass. OPEN ALL NIGHT, reads the sign. FOR WINDING-UP AND WINDING-DOWN AT ALL HOURS OF THE WATCH."

Instead of entering the autopothecary shopfront:
	try going northwest;

Instead of going north in Escapement St:
	say "I don’t have the time – or the wind – to go running all over the city any more.";

Instead of going south in Escapement St:
	say "I don’t have the time – or the wind – to go running all over the city any more.";

Instead of going to the Clock Shop from Escapement St when the player does not have the sleeping drug:
	say "Covalt would eat my head if I went back empty-handed." instead;

Some gaslamps are scenery, in Escapement St.  "[one of]The lamps have all been lit by little wedge-shaped hammers that peel back on ratchets and strike a flint inside the... look, this doesn’t really matter, does it?[or]There’s enough light to see the Autopothecary, northwest, and Covalt’s to the northeast, and what else is in the dark can stay there for all I care.[stopping]"

Understand "gas", "lamp", "gaslamp", "lamps", "light", "lights" as the gaslamps.

Chapter 8 - Silver minutes

Some silver coins are a proper-named thing. The silver coins have a number called the count. The count of the silver coins is 3.

Understand "1", "one" as the silver coins.
Understand "2", "two" as the silver coins when the count of the silver coins is at least 2.
Understand "3", "three" as the silver coins when the count of the silver coins is at least 3.
Understand "silver", "coin", "minute", "minutes" as the silver coins.

Before printing the name of the silver coins:
	say "[count of silver coins in words] ";

Rule for printing the name of the silver coins:
	say "silver minute[if the count of the silver coins is not 1]s[end if]".

Rule for printing the description of the silver coins:
	say capitalized "[count of silver coins in words] silver coin[s]. [run paragraph on]";
	say "More money than I've ever held before. Certainly more than they give out at Newtonmass (and then take straight back off us in the New Year’s Donations).";

Part 4 - Autopothecary

The Autopothecary Booth is northwest of Escapement St. "This is a small booth, all tiled gleaming white and washed down to make the place look healthy and clean. The plate glass wall to the southeast lets in enough gaslight to see the controls of the machine: a series of little doors, each with its own coin slot beneath. Beside it is a neat little press for combining fresh ingredients into medicines. Above that is a price-list chalked up like an inn sign."

The printed name of the Autopothecary Booth is "Autopothecary".

Table of grid layout options (continued) [cont. from the Grid Layout extension]
table 					cell spacings
table of autopothecary ingredients		{19, 34, 4}

Table of autopothecary ingredients
p1			p3		p2
"NAME"			"DOOR"		"EFFECT"
"Feverfew"		"A1"		"Reduces headaches"
"Peppermint"		"A2"		"To ease the stomach"
"Willow bark"		"A3"		"Reduces fever"
"Oil of Vitriol"		"A4"		"Intensifies effect of other oils"
"Horehound"		"B1"		"Expectorant"
"Poppy"			"B2"		"Induces sleep"
"Foxglove"		"B3"		"For difficulties of the heart"
"Pokeweed"		"B4"		"Improves complexion"
"Oil of Clotweed"		"C1"		"Strengthens blood"
"Tincture of Morphos"	"C2"		"For dreaming"
"Tincture of Hermes"	"C3"		"Clarifies the mind"
"Poryphic Salts"		"D1"		"Aids the flow of vital blood vessels in time of peculiar need"
"Albumic Salts"		"D2"		"For invigoration"
"Entropic Salts"		"D3"		"To ease breathing"

[ When play begins:
	say the table of autopothecary ingredients laid out as a long grid; ]

A tiny door is a kind of container, scenery, open, not openable. Some tiny doors in the Autopothecary are defined by the table of autopothecary vending machine slots.

The description of a tiny door is usually "Each door’s about big enough for a mouse, but if I put my coins in and only get a mouse in return I’ll be spitting screws until the thirteenth stroke. The doors are all labeled but not with what they sell, only with codes: B3 or D2."

Understand "tiny", "doors", "door", "slot", "slots" as a tiny door.

Table of Autopothecary Vending Machine Slots
tiny door	label		product		effect
door A1		"A1"		"feverfew"	"for reducing headaches"
door A2		"A2"		"peppermint"	"for easing the stomach"
door A3		"A3"		"willow bark"	"for reducing fever"
door A4		"A4"		"oil of vitriol"	"for intensifying the effect of other oils"
door B1		"B1"		"horehound"	"an expectorant"
door B2		"B2"		"poppy"		"for inducing sleep"
door B3		"B3"		"foxglove"	"for heart difficulties"
door B4		"B4"		"pokeweed"	"for improving complexion"
door C1		"C1"		"oil of clotweed"		"for strengthening blood"
door C2		"C2"		"tincture of Morphos"	"for dreaming"
door C3		"C3"		"tincture of Hermes"	"for clarifying the mind"
door D1		"D1"		"poryphic salts"		"to aid the flow of blood vessels"
door D2		"D2"		"albumic salts"	"for invigoration"
door D3		"D3"		"entropic salts"	"to ease breathing"

Rule for asking which do you mean when everything matched by the parser is a tiny door:
	say "Which door?" instead;

Rule for deciding whether all includes a tiny door:
	it does not;

Chapter 3 - Please Insert Coin

Section 1 - Items available

Medicine is a kind of thing.

Some oil of vitriol is a medicine. The description is "A small glass vial filled with an emerald green oil."
Understand "small", "glass", "vial", "filled", "with", "emerald", "green", "oil" as the oil of vitriol.

The Tincture of Morphos is a medicine, proper-named. The description is "A glass bottle filled with a clear liquid that sparkles like crystal.".
Understand "small", "glass", "bottle", "filled", "with", "clear", "sparkling/sparkly", "crystal", "liquid" as the Tincture of Morphos.

Some poppy seed-pods are a medicine. The description is "A handful of tiny poppy seed-pods."
Understand "handful", "tiny", "seed", "seeds", "pod", "pods" as the poppy seed-pods.

Rule for printing the name of the oil of vitriol when we are inserting silver coins into a tiny door:
	say "little vial of green oil";	

Rule for printing the name of the Tincture of Morphos when we are inserting silver coins into a tiny door:
	say "small bottle of some clear, evil-looking liquid";

Rule for printing the name of the poppy seed-pods when we are inserting silver coins into a tiny door:
	say "few dark green seed pods";

Instead of eating or drinking medicine:
	say "No chance. I’m not experimenting on myself!";

Section 2 - Inner Workings

Instead of buying a tiny door when the player has silver coins:
	try inserting the silver coins into the noun;

Instead of inserting the silver coins into a tiny door:
	abide by the vending machine rules for the second noun;

The vending machine rules are an object-based rulebook.
The vending machine rulebook has an object called the vended item.

First vending machine rule for door A4:
	change the vended item to the oil of vitriol;

First vending machine rule for door B2:
	change the vended item to the poppy seed-pods;

First vending machine rule for door C2:
	change the vended item to the tincture of morphos;

A vending machine rule when the vended item is not nothing:
	if the vended item is on-stage:
		say "I’ve already got that ingredient from the drawer." instead;

First vending machine rule for door D1 when TRIG_DOOR_D1 is unfired:
	fire TRIG_DOOR_D1 instead;

TRIG_DOOR_D1 is a trigger.
For firing TRIG_DOOR_D1: say "The price on that door is a colossal 16 minutes!";

Last vending machine rule for a tiny door (called x) when the vended item is nothing:
	choose row with a tiny door of x in the table of autopothecary vending machine slots;  
	say "[one of]I don’t know. I’ve only got [count of silver coins in words] coin[s] and I wouldn’t want to buy the wrong thing.[or]But that's [product entry], [effect entry]! What good would that be?[stopping]" instead;

Last vending machine rule for a tiny door (called x) when the vended item is not nothing and the count of silver coins is 1 and the player is not honest:
	if TRIG_LAST_COIN is unfired:
		change the remembered slot of DQ_COIN to x;
		fire TRIG_LAST_COIN instead;
	otherwise:
		now the player is honest;
		say "You chicken, Wren. [run paragraph on]";

Last vending machine rule for a tiny door (called x) when the vended item is not nothing:
	decrement the count of the silver coins by 1;
	if the count of the silver coins is at most 0:
		remove the silver coins from play;
	now the player carries the vended item;
	say "[one of]The coin disappears into the slot and watching it go is a bit like losing a finger or waking up in the morning when it’s wet and cold and it’s washing day. Then there’s a loud clatter from inside the autopothecary and the little door drops open – just long enough for me to snatch out a [vended item].[or]I drop in the second coin and this time I’m ready for the door, managing to get out a [vended item] without trapping my fingers on the way out.[or]The last coin disappears, gone for good into this stupid little machine. In return I get a [vended item].[stopping]";

Section 3 - A Moral Dilemma

Yourself can be honest, dishonest, or morally neutral. Yourself is morally neutral.

TRIG_LAST_COIN is a trigger.

Rule for firing unfired TRIG_LAST_COIN:
	say "The last coin... couldn’t I make do with the ingredients we've got?";
	ask DQ_COIN;

DQ_COIN is a direct question. DQ_COIN has a tiny door called the remembered slot.

An affirmative response rule for DQ_COIN:
	now the player is dishonest;
	say "I’m sure what we’ve got will be strong enough.";

A negative response rule for DQ_COIN:
	now the player is honest;
	try inserting the silver coins into the remembered slot of DQ_COIN;

Chapter 4 - Drug Press

Section 1 - Description

The autopothecary press is a container, scenery, in the Autopothecary. "The press is a small contraption for mixing drugs together. Since it’s meant to be used in the middle of the night by people with roaring headaches and upset bellies it’s got instructions all over it and it couldn’t be easier. Right now, the little tin disc above the machine is displaying: '[press status message]'[paragraph break]"

The reading matter of the autopothecary press is "The little tin disc above the machine displays '[press status message]'[paragraph break]";

Understand "lever", "tin", "disc" as the autopothecary press.

The autopothecary press has a number called the state. The state of the autopothecary press is 1.

To say press status message:
	if the state of the autopothecary press is:
		-- 1: say "Add Herbs and lift lever.[run paragraph on]";
		-- 2: say "Add Herbs and lift lever.[run paragraph on]";
		-- 3: say "Add liquids.[run paragraph on]";
		-- 4: say "Lift lever if ready to combine all ingredients.[run paragraph on]";
		-- 5: say "Lift lever if ready to combine all ingredients.[run paragraph on]";
		-- 6: say "Add Herbs and lift lever.[run paragraph on]";

Section 2 - Drug Adding

The drug-adding rules are an object-based rulebook.

Instead of inserting something into the autopothecary press:
	abide by the drug-adding rules for the noun;

A drug-adding rule for a thing (called x) when x is not medicine:
	say "I don't want to break it." instead;

A drug-adding rule for the poppy seed-pods:
	say "Following the instructions on the sign, I brush the poppy seeds off my palm and into the press.";
	remove the poppy seed-pods from play;
	change the state of the autopothecary press to 2;
	rule succeeds;

A drug-adding rule for the oil of vitriol when the state of the autopothecary press is less than 3:
	say "The little sign says 'Add herbs and raise lever,' but the oil isn’t a herb." instead;

A drug-adding rule for the tincture of Morphos when the state of the autopothecary press is less than 3:
	say "The little sign says 'Add herbs and raise lever,' but the tincture isn’t a herb." instead;

A drug-adding rule for the oil of vitriol:
	say "I drip the contents of the vial into the funnel[if the state of the autopothecary press is 3]. The tin sign rotates to read 'lift lever if ready.'[otherwise].[end if]";
	remove the oil of vitriol from play;
	increment the state of the autopothecary press by 1;
	rule succeeds;

A drug-adding rule for the tincture of morphos:
	say "The Morphos falls in tiny starlight splashes into the bowl of the press. There’s a faint bitter smell that makes my head spin... [if the state of the autopothecary press is 3]The tin sign rotates to read 'lift lever if ready.' [end if][paragraph break]";
	remove the tincture of morphos from play;
	increment the state of the autopothecary press by 1;
	rule succeeds;

Section 3 - Drug Pressing

Instead of pushing or switching on the autopothecary press:
	try pulling the autopothecary press instead;

Instead of pulling the autopothecary press:
	abide by the drug-pressing rules;

The drug-pressing rules are a rulebook.

A drug-pressing rule when the state of the autopothecary press is 1:
	say "I give the lever a twitch. The two plates inside come neatly together, then separate out again since there’s nothing inside to squeeze." instead;

A drug-pressing rule when the state of the autopothecary press is 2:
	change the state of the autopothecary press to 3;
	say "I push the lever up. Two plates inside the machine come together to squeeze the pods, releasing golden oil into a bowl below. The disc on the front of the machine rotates to read 'Now add liquids.'" instead;

A drug-pressing rule when the state of the autopothecary press is 3:
	say "I push the lever again, giving the seed pods another squash, but there’s no more oil to drain out." instead;

TRIG_LAST_MINUTE is a trigger.

Rule for firing unfired TRIG_LAST_MINUTE:
	say "I’ve still got one minute left to spend. If there’s something else that’ll make this drug more powerful I’d better find it." instead;

A drug-pressing rule when the state of the autopothecary press is 4 and the count of the silver coins is 0:
	say "I’ve still got my third ingredient left to put in." instead;

A drug-pressing rule when the state of the autopothecary press is 4:
	if the player is dishonest:
		change the state of the autopothecary press to 5;
		anonymously abide by the drug-production rule;
		[stop]
	if TRIG_LAST_MINUTE is unfired:
		fire TRIG_LAST_MINUTE instead;
	now the player is dishonest;
	say "I’ll keep the third coin, then. For myself.";
	change the state of the autopothecary press to 5;
	anonymously abide by the drug-production rule;

A drug-pressing rule when the state of the autopothecary press is 5:
	assert that the player is not dishonest issuing "Player is not dishonest.";
	now the sleeping drug is strong;

A drug-pressing rule when the state of the autopothecary press is 5 (this is the drug-production rule):
	now the player carries the sleeping drug;
	now the state of the autopothecary press is 6;
	say "The lever springs up then down, clamping a lid onto the bowl inside the machine. There’s a brief moment of spinning and then the whole press tips over and out drains a murky liquid to be caught in a bottle below. That’s my sleeping drug! Gingerly, I pick it up." instead;

A drug-pressing rule when the state of the autopothecary press is 6:
	say "The machine is empty." instead;

Section 4 - A Sleeping Drug

The sleeping drug is medicine. The description is "A little bottle of a murky grey coloured liquid. Perfect for the Figure[if weak].  I only hope it’s strong enough[end if]."

The sleeping drug can be weak or strong. The sleeping drug is weak.

Instead of giving the sleeping drug to Covalt:
	remove the sleeping drug from play;
	say "Covalt barely looks up from his work. 'I’m sure it’ll do,' he snaps. 'Stick it over there and don’t say anything else at any point until I’ve got all this work done.' On the bench in front of him is half a box and it doesn’t look bad – the little ball rolling down the zigzag track, the casements either side that flip-flop the surface. And on the inside is a tight spring attached to a little hammer from a bell-strike ready to the break the glass, right about a small needle.[paragraph break]Gingerly Covalt picks up the bottle, and fits it into the box. 'Don’t press the casements,' he warns. 'Or you’ll fire the needle. Don’t forget that.' With slow delicacy he clicks a panel into place.[paragraph break]'I could go to the gallows for making this,' Covalt says. 'They won’t thank me. They won’t thank either of us. They’ll be grateful and then they’ll send us up the scaffold. But we’ll face that when the hands come round for it. You ready?'[paragraph break]I nod. What else can I do?[paragraph break]'Sneak into the vaults and swap this over. So good luck and I’m not coming with you. If they ask you where you got this from you say it fell from the stars.' And then he chucks me out and slams the door.[paragraph break]And then I’m off, on my own again, back on my way to the Cathedral of Time.";
	now the player carries the decoy Perpetuum;
	end the chapter;
	say "Like the lowliest ratchet in the bottom of a gear-train, I move in darkness. Through the streets of the city, sticking close to the walls. Carrying the Perpetuum – or something that looks so much like it – that I can’t afford to be seen. My only hope would be that they mistook me for a scruffy little angel.[paragraph break]Luckily it’s easy to find my way. The Cathedral’s great dome looms over all of St Phillip, blotting out stars. I head deeper into darkness until it fills the entire northeastern sky, and that’s when I’m beside the great Western door.";
	move the player to the Public Yard;

Book 10 - Return to the Cathedral

When Return to the Cathedral begins:
	now the West Door [public entrance to the Cathedral] is unlocked;
	now the West Door is open;
	remove the Chanting Monks from play;
	move the real Perpetuum Mobile to the Steel Altar; [in the Inner Vault]

The decoy Perpetuum Mobile is a thing. The description is "Covalt's done an incredible job. I only caught a glimpse of the Perpetuum before, but this is exactly like it. The board on top, with the track for the ball-bearing, and a few tiny levers sticking from the sides like ant's legs. And everything else (and in this case, [i]nothing[r] else) hidden away inside."

Understand "dummy", "tiny levers/lever", "levers", "bearing", "case", "dark", "wood", "tilting", "board", "ball-bearing", "groove", "grooved", "path", "track", "gold", "brass", "ball", "ball bearing", "mechanism" as the decoy perpetuum mobile.

Instead of dropping the decoy Perpetuum when TRIG_SECRET_PANEL is unfired:
	say "I need it. I can’t afford to lose it in the dark.";

Instead of dropping the decoy Perpetuum when TRIG_SECRET_PANEL is fired and the location is not the Cathedral Choir:
	say "I want to keep it as near me as I can.";

After dropping the decoy Perpetuum:
	assert that TRIG_SECRET_PANEL is fired issuing "Secret Panel has been entered?";
	assert that the location is Cathedral Choir issuing "In Cathedral Choir.";
	now the decoy Perpetuum is scenery;
	say "I tuck the Perpetuum into the shadows by the stalls. Barely visible to anyone – I hope." instead;

Part 1 - Public Yard

Return to the Cathedral is a scene. Return To The Cathedral begins when Return to Covalt's ends. Return To The Cathedral ends when TRIG_FIGURE_ENTERS is fired.

The Public Yard is a room. "The public square where the people come to hear the edicts and songs and gather before Mass, Volume and Compline. It’s empty now except for a towering statue of St Newton, gazing thoughtfully up at the stars. The great door of the Cathedral is open to the east.[one of][paragraph break]There’s no time to lose.[or][stopping]"

The silhouetted Cathedral of Time is scenery, in the Public Yard. "The Cathedral raises spires like pins in a pin-cushion, only just visible as gaps in the stars. The glowing face of the rose window clock puts the time as a quarter to midnight. The door to the Cathedral is open.". The printed name of the silhouetted Cathedral is "Cathedral". Understand "church" as the silhouetted Cathedral of Time.

The statue of St Isaac Newton is scenery, in the Public Yard. "Newton stands, apple in one hand, skull in the other. If he let go of either one I’d be crushed like a beetle in Drake’s bunkroom.". The printed name of the statue of St Isaac Newton is "statue of St Newton".

Understand "apple", "skull" as the statue of St Isaac Newton.

Rule for printing the description of the West Door when in the Public Yard during Return To The Cathedral:
	say "The great door is open, just enough to let someone slip inside. Probably left that way for the Figure. I need to be quick.";

After going through the West Door from the Public Yard during Return To The Cathedral:
	say "I slip into the dark.";
	continue the action;

Instead of closing the open West Door during Return To The Cathedral:
	say "It’s too heavy for me to move.";

Instead of entering the silhouetted Cathedral of Time:
	try going east;

Part 2 - Cathedral Entrance

Rule for printing the description of the Cathedral Entrance during Return To The Cathedral:
	say "The Cathedral to the north is almost pitch dark, with a few false stars – candles, reflecting from the polished brass and the windows. The huge doors east and south are sealed fast: the door west should be but it’s been left open[one of]. [paragraph break]I need to get down to the Crypt, to plant the decoy. And fast – before the Figure beats me to it.[or].[stopping]";

Rule for printing the description of the entry seal during Return To The Cathedral:
	say "I can barely see the seal in the half-light.";

Instead of doing something when the Great Doors are physically involved during Return To The Cathedral:
	say "The doors are shut fast.";

Instead of doing something when the East Doors are physically involved during Return To The Cathedral:
	say "The doors are shut fast.";

Rule for printing the description of the West Door when in the Cathedral Entrance during Return To The Cathedral:
	say "The small west door is a crack ajar.";

Instead of closing the open West Door when in the Cathedral Entrance during Return To The Cathedral:
	say "It’s too heavy for me to shift. I can’t keep the Figure out.";

Instead of going through the West Door from the Cathedral Entrance during Return To The Cathedral:
	say "No time for turning back!";

Part 3 - Lower Nave

Rule for printing the description of the Lower Nave during Return To The Cathedral:
	say "Oak pews are sleeping either side of the aisle. I can barely see the shrines to east and west. Past the second seal to the north, the nave continues.";

Rule for printing the description of the lower seal during Return To The Cathedral:
	say "I can barely see the seal in the half-light.";

Instead of going south from the Lower Nave during Return To The Cathedral:
	say "I can’t run away now.";

After going west from the Lower Nave during Return To The Cathedral:
	say "I slip between the pews and into the shrines.";
	continue the action;

After going east from the Lower Nave during Return To The Cathedral:
	say "I slip between the pews and into the shrines.";
	continue the action;

After going north from the Lower Nave during Return To The Cathedral:
	say "I creep further in.";
	continue the action;

Chapter 2 - Pews

Rule for printing the description of a pew during Return To The Cathedral:
	say "Rows of varnished oak pews.";

Instead of entering or hiding inside or hiding under or hiding behind a pew when Calvin's Patrol has not happened during Return To The Cathedral:
	say "Now is not a time to pray, or hide!";

Instead of entering or standing on or sitting on or hiding inside or hiding under or hiding behind a pew (called the hiding place) during Calvin's Patrol:
	say "[one of]I dive in between the pews[or]I shuffle in between the pews[or]I drop to my knees between the pews[at random][if the player carries a lit candle], and blow out my candle[end if].";
	move the player to the hiding place, without printing a room description;
	while the player carries a lit candle:
		let x be a random candle held by the player;
		now x is not lit;

Part 4 - Upper Nave

Rule for printing the description of the Upper Nave during Return To The Cathedral:
	say "The nave is wider here, wider than to the south and with more tightly-packed pews on either side. But right now only shadows are bowing their heads. To the north is the altar, still gleaming.";

Rule for printing the description of the upper seal during Return To The Cathedral:
	say "I can barely see the seal in the half-light.";

After going to the Upper Nave during Return To The Cathedral:
	if Calvin Cutscene has not happened:
		change the current script to {SE_CALVIN_1, SE_CALVIN_2, SE_CALVIN_3};
	continue the action;

SE_CALVIN_1 is a scripted event. The display text is "There are two figures sitting at its base, with a single candle between them. When I recognize Calvin I duck immediately behind a pew. How am I supposed to get past those two?[paragraph break]They’re playing dice. They must have been here some time."

SE_CALVIN_2 is a scripted event. The display text is "'How are we meant to tell if someone’s grey in this light?' Calvin complains. He’s whispering. 'Why couldn’t the old man have given us a password to ask for or something?'[paragraph break]Drake is more boisterous. By the look on his face he’s just rolled eleven. 'If the Abbott says to keep people out, we keep people out. Maybe even people in grey.'".

SE_CALVIN_3 is a scripted event. The display text is "'What’s that?' Calvin is up, suddenly, looking around. 'I heard something.'[paragraph break]'Better get to our places,' Drake says, sounding a little more nervous now. 'I’ll guard the library. You’re on patrol.'[paragraph break]'Me? Why...'[paragraph break]'Get on with it,' Drake snaps. The candles move out into darkness, one west and one north, then in and out of sight up a set of winding stairs.".

Calvin Cutscene is a scene. Calvin Cutscene begins when SE_CALVIN_1 is listed in the current script. Calvin Cutscene ends when the current script is empty.

Instead of doing something during Calvin Cutscene:
	unless we are waiting or we are listening or we are taking inventory:
		say "I’m frozen with fear." instead;
	if we are taking inventory:
		continue the action;

Calvin's Patrol is a scene. Calvin's Patrol begins when SE_CALVIN_3 is fired.

When Calvin's Patrol begins:
	now Calvin is scenery;
	move Calvin to the West Apse;
	move the ebony dice to the Cathedral Altar;

Part 5 - Altar

Rule for printing the description of the Cathedral Altar during Return To The Cathedral:
	say "The altar is still gleaming even though the candlelight has gone. It’s set between the workings of the great clock in the centre of the Cathedral. Aisles lead off in all four directions, but the Crypt is to the east.";

Section 1 - Altar, Clock Machinery, Dais and Canopy

Rule for printing the description of scenery when in the Cathedral Altar during Return To The Cathedral:
	say "It would be worth enough to buy a house if it wasn’t too heavy to lift.";

Instead of taking scenery when in the Cathedral Altar during Return To The Cathedral:
	say "I’m not here to steal anything. Well. Almost not anything.";

Section 2 - Dice

There is a plural-named thing called two ebony dice. "Calvin has left his dice here." The description of the two ebony dice is "Two ebony dice. I don’t get things like that."

Instead of taking the ebony dice:
	say "Not now. No time for games.";

Part 6 - Choir

Part 1 - Description

Rule for printing the description of the Cathedral Choir during Return To The Cathedral:
	say "This is like standing in the bottom of the Abbey’s well: a circular pool of dark with the gigantic window just a different shade of dark. To the south is the altar but I can’t see it, and right overhead is the great engine of the clock. I can almost feel it ready to fall.";

Part 2 - Scenery

Rule for printing the description of the window panels during Return To The Cathedral:
	say "The windows are dark.";

Rule for printing the description of the east stairs during Return To The Cathedral:
	say "Spiral steps leading up.";

Instead of going through the East Stairs from the Cathedral Choir during Return To The Cathedral:
	say "[one of]I start up the stairs then freeze. Light – a single point. Drake’s candle.[or]Drake hasn’t moved. There’s no going up that way.[stopping]";
	if TRIG_CRYPT_GRATE is fired and TRIG_SECRET_PASSAGE is unfired:
		fire TRIG_SECRET_PASSAGE;

Rule for printing the description of the west stairs during Return To The Cathedral:
	say "Spiral steps leading up.";

After going through the west stairs from the Cathedral Choir during Return To The Cathedral:
	say "I dash quickly up the stairs.";
	continue the action;

Part 3 - Choir Stalls

Rule for printing the description of the Choir Stalls during Return To The Cathedral:
	say "The stalls are like trolls in the dark. Their carvings are tattoos.";

After printing the description of the Choir Stalls during Return To The Cathedral:
	if TRIG_SECRET_PASSAGE is fired:
		try touching the Choir Stalls;

Instead of entering or sitting on or standing on the Choir Stalls during Return To The Cathedral:
	say "Now isn’t the time to practice my singing!";

Instead of entering or sitting on or standing on the Choir Stalls when the player can see the open secret panel during Return To The Cathedral:
	try going inside;

Instead of going inside when the player can see the closed secret panel:
	try going north instead;

Instead of pushing or pulling or opening the Choir Stalls during Return To The Cathedral:
	try touching the Choir Stalls instead;

Instead of touching the Choir Stalls when the Secret Panel is closed and the player carries a lit candle during Return To The Cathedral:
	now the Secret Panel is open;
	say "I run my hand across the embossed figures. Woodworkers, joiners, lathes, bevellers, the men who put the threads on screws. Their tools – hammers and files and drills...[paragraph break]...one panel swings open revealing a dark passage beyond.";

Instead of touching the Choir Stalls when the Secret Panel is closed during Return To The Cathedral:
	say "I lean in close to examine the carvings but can’t make out any of the details. There are hundreds of figures – if there’s a catch here, it could be anywhere![paragraph break]Without a decent light, I’ll never find it (and with a decent light, Drake will certainly find [i]me[r].)";

Instead of touching the Choir Stalls when the Secret Panel is open during Return To The Cathedral:
	say "One panel swings open revealing a dark passage beyond.";

Instead of going through the secret panel when the player carries the decoy Perpetuum:
	fire TRIG_SECRET_PANEL;

TRIG_SECRET_PANEL is a trigger.

Rule for firing TRIG_SECRET_PANEL:
	say "The false Perpetuum is too wide to carry into the gap. I’m going to have to leave it here.";

A secret panel is a door, privately-named, scenery, closed, inside from the Cathedral Choir, outside from the Secret Stair.

Rule for deciding the concealed possessions of the Cathedral Choir:
	if the particular possession is the closed secret panel:
		yes;

Part 7 - Shrine of the Saints

Rule for printing the description of the Shrine of the Saints during Return To The Cathedral:
	say "East of the nave, the shrine is lit by a single shaded lantern. From the walls, the eyes of statuettes glitter like rat faces. I can barely see the stand of candles in the middle.";

Part 2 - Scenery

Rule for printing the description of the statuettes during Return To The Cathedral:
	say "They are the icons of the saints. I can’t make out any detail beyond the smooth polished tonsures and the cog-teeth halos above.";

Instead of taking or pushing the statuettes during Return To The Cathedral:
	say "The statues are holy relics. I’m not here to steal relics – except, of course, I am. Only not these ones. More important ones.";

A devotional oil lamp is scenery, in the Shrine of the Saints. "An oil lamp in a brass band. It flickers with a deep amber glow."

Understand "deep", "amber", "flickering", "flicker", "glowing", "glow", "oil", "lantern", "lamp", "in", "in a", "brass", "band" as the devotional lamp.

Part 3 - More candles

Rule for printing the description of the brass stand during Return To The Cathedral:
	say "The stand is lined with candles meant for devotions to the saints.";

Some thin candles are scenery, part of the brass stand. "There are hundreds of thin candles." The indefinite article of the thin candles is "hundreds of".

Rule for deciding the concealed possessions of the brass stand:
	if Return To The Cathedral is happening:
		if the particular possession is a candle dispenser:
			yes;
	otherwise:
		if the particular possession is the thin candles:
			yes;
	no;

Instead of taking the thin candles:
	if the player has a candle:
		say "I don’t need another one.";
	otherwise:
		now the player carries the single-candle;
		say "I pick a candle from the stand.";

A candle can be lit or unlit. A candle is usually unlit. Understand "lit", "flame" as a candle when the item described is lit.

The single-candle is a candle, privately-named. The printed name of the single-candle is "candle". The wax is clear. Understand "narrow", "candle" as the single-candle.

When Return To The Cathedral begins:
	if the player has a candle:
		while the player has a candle:
			remove a random candle had by the player from play;
		now the player carries the single-candle;

Rule for printing the description of a candle during Return To The Cathedral:
	say "[if unlit]It’s too dark to tell what colour the wax is. Not that it matters, now.[otherwise]The narrow candle throws out a circle of light.[end if]";

Instead of dropping the unlit single-candle:
	say "If I put it down I would lose it in the darkness.";

Instead of inserting the single-candle into the brazier:
	say "All that seems like weeks ago now.";

Instead of inserting a candle into the devotional oil lamp during Return To The Cathedral:
	now the noun is lit;
	say "I tip the candle into the lantern flames. It sparks and hisses as it lights.";

Instead of inserting a candle into the devotional oil lamp:
	remove the noun from play;
	say "I light [the noun] and place it in the niche of [a random miniature statuette].";

After going from the Shrine of the Saints to the Lower Nave when the player has a lit candle:
	say "I go back to the nave, careful to shield the candle’s light behind my palm. Mustn’t be seen. Not here[if Calvin Cutscene has happened]. Not by those two[end if].";
	continue the action;

Part 8 - East Apse

Rule for printing the description of the East Apse during Return To The Cathedral:
	say "The eastern apse is filled with pews. Through the heavy door to the south I can hear the Orrey, still moving in its endless cycle. To the northeast is an iron grate: it leads to the crypts[one of]. [paragraph break]That way, Wren, and be bold about it.[or].[stopping]";

Rule for printing the description of the Hall Door during Return To The Cathedral:
	say "The heavy door to the Orrey is locked.";

When Return To The Cathedral begins:
	now the Hall Door is closed;
	now the Hall Door is locked;

Instead of knocking on the Hall Door during Return To The Cathedral:
	say "I don’t want to wake anyone[one of]. Sa’at’s probably still in there, working through his endless papers, putting each one he finishes to the bottom of his stack to do again[or][stopping].";

Rule for printing the description of the crypt grate during Return To The Cathedral:
	say "This is the grate to the crypt. It’s smaller than a man – dating from a time before the Cathedral, before even the City. Perfect size for a Wren. Or a stooping Figure.";

Instead of opening the crypt grate when the player does not have the old iron crypt key during Return To The Cathedral:
	fire TRIG_CRYPT_GRATE instead;

Instead of unlocking the crypt grate with something when the player does not have the old iron crypt key during Return To The Cathedral:
	fire TRIG_CRYPT_GRATE instead;

First unlocking rule for the Crypt Grate when the player does not have the old iron crypt key during Return To The Cathedral:
	fire TRIG_CRYPT_GRATE instead;

TRIG_CRYPT_GRATE is a trigger.

Rule for firing TRIG_CRYPT_GRATE:
	say "The grate is locked. The Bishop hasn’t left it open – he must have given the Figure the key. But the only key?[paragraph break]Not the only key. I saw one earlier. In the Bishop's desk. Where he kept it.";

Part 9 - West Apse

Rule for printing the description of the West Apse during Return To The Cathedral:
	say "Rows of pews face the altar back east. To the south, the door to the Great Library is closed.";

When Return To The Cathedral begins:
	now the Library Archway is closed;
	now the Library Archway is locked;

Instead of doing something when the Library Archway is physically involved during Return To The Cathedral:
	say "The oak door is locked.";

Instead of knocking on the Library Archway during Return To The Cathedral:
	say "[one of]I knock nervously. There is no response.[or]I try again, more boldly. Still nothing. And why should there be? And who here would help me? For all they know, Wren, [i]you’re carrying the Perpetuum[r].[stopping]"

Part 10 - Calendar Shrine

Rule for printing the description of the Calendar Shrine during Return To The Cathedral:
	say "The Calendar Unlimited is like a still pond in the darkness. The nave is back east.";

Rule for printing the description of the Calendar Unlimited during Return To The Cathedral:
	say "The table-like machine seems still, but beneath the surface everything is whirring. All the indicators say Danger, Darkness and the jagged crack of the Fundamental Flaw.";

Instead of doing something when the Calendar Unlimited is physically involved during Return To The Cathedral:
	say "I’m not here for that. One relic is enough.";

Rule for printing the description of the Brazier during Return To The Cathedral:
	say "The brazier is cold.";

Before inserting something into the Brazier during Return To The Cathedral:
	say "No time to play now.";

Part 11 - West Clerestory

Rule for printing the description of the West Clerestory during Return To The Cathedral:
	say "The clerestory circles the Choir from a storey above, but now is nothing but a coal-pit. The balcony continues northeast. Stairs spiral downwards through a hole in the floor.";

Rule for printing the description of a stained glass window during Return To The Cathedral:
	say "The windows are dark.";

Rule for printing the description of the West Stairs during Return To The Cathedral:
	say "The stairs lead down.";

Part 12 - North Clerestory

Rule for printing the description of the North Clerestory during Return To The Cathedral:
	say "The clerestory curves here, from southwest to southeast, and that’s where Drake is standing with his candle: right outside the Bishop’s Library. [one of][paragraph break]Who are they supposed to be guarding it from? Surely not the Figure? And then I realize. The Abbott’s set them to guard it from me – or anyone like me. Anyone who might get into the Library and somehow stop the Figure from reaching the crypt.[or][paragraph break][stopping]";

Instead of going to the East Clerestory from the North Clerestory during Return To The Cathedral:
	say "I can’t let Drake find me[if TRIG_CRYPT_GRATE is fired]. There has to be another way[end if].";
	if TRIG_CRYPT_GRATE is fired and TRIG_SECRET_PASSAGE is unfired:
		fire TRIG_SECRET_PASSAGE;

Rule for printing the description of the statues of St Breguet and St Babbage during Return To The Cathedral:
	say "It’s too dark to see them.";

TRIG_SECRET_PASSAGE is a trigger. 

Rule for firing unfired TRIG_SECRET_PASSAGE:
	say "Wait. Something the Abbott said, before, when talking to the Figure, about secret doors...[paragraph break][i]'Six? The only one I know is the one from the Choir to the Bishop’s Library! Where there’s a drill...'[run paragraph on][r][paragraph break]Where there’s a drill, Wren. Where there’s a drill – there’s a way...";

Part 13 - Calvin's Patrol

Every turn during Calvin's Patrol:
	consider the patrolling rulebook for Calvin;

The patrolling rules are an object-based rulebook.

Calvin has a list of objects [rooms] called the patrol. The patrol of Calvin is { West Apse, Cathedral Altar, Upper Nave, Lower Nave, Upper Nave, Cathedral Altar, East Apse, Cathedral Altar}.

COUNTER_CALVIN is a counter. The top end of COUNTER_CALVIN is 2.

A patrolling rule for Calvin (this is the only move on alternate turns rule):
	increment COUNTER_CALVIN;
	if the internal value of COUNTER_CALVIN is 2:
		if the player can see Calvin:
			anonymously abide by the detection rulebook;
		do nothing instead;

A patrolling rule for Calvin (this is the Calvin movement rule):
	rotate the patrol of Calvin backwards;
	move Calvin to entry 1 of the patrol of Calvin;

A patrolling rule for Calvin:
	if entry 1 of the patrol of Calvin is the location:
		say "Calvin is almost on me. Either I run or I hide!" instead;

A patrolling rule for Calvin:
	if entry 2 of the patrol of Calvin is the location:
		say "The light of a candle is approaching from [the quick best route from the location to the location of Calvin][one of]. Time to get out of here, Wren![or].[stopping]" instead;

A patrolling rule for Calvin:
	if entry 3 of the patrol of Calvin is the location:
		say "I can hear footsteps approaching from [the best route from the location to the location of Calvin]." instead;

The detection rules are a rulebook. The detection rules have default no outcome.

First detection rule:
	if the player is on a pew:
		say "[one of]Calvin pauses, sniffing the air. His eyes are darting in the candlelight. They glance at me two or three times – straight at me. But he comes no closer.[paragraph break][or][stopping]Calvin moves on.";
		anonymously abide by the Calvin movement rule instead;

TRIG_CAL_DETECT is a trigger.

A detection rule when TRIG_CAL_DETECT is unfired:
	fire TRIG_CAL_DETECT;
	move the player to Public Yard instead;
 
Rule for firing TRIG_CAL_DETECT:
	say "For a moment it looks like Calvin will look straight through me, but then he looks straight [i]at[r] me. For a moment he’s silent. I can see the belting coming a mile off: he’s winding up his anger, getting it ready to let loose...[paragraph break]'Wren?' he hisses, under his breath. 'What are you [i]doing[r] here? If Drake finds you he’d [i]string you up![run paragraph on][r]'[paragraph break]His voice is shaking. I’ve never heard him so angry. Or not angry – afraid. The whites of his eyes have turned yellow. 'You’ve got to go. [i]This isn’t a game![r]'[paragraph break]He grabs my arm as he speaks – here it comes, I’m thinking – then he drags me away through the nave of the church, hissing at me to stay quiet, all the way to the front gate. 'Go. All right? Please. Don’t tell anyone.'[paragraph break]Then he – and his feeble candle – have disappeared back inside.";

A detection rule:
	say "[one of]'Wren, please!' Calvin hisses. He looks awful, almost sick. 'Don't stay here. You stupid [i]novice[r]. And if you do stay here, [i]hide[r]. Whatever you do. [i]Hide![run paragraph on][r]'[paragraph break]And then, just like that, he moves away.[or]Calvin doesn’t seem to see me. Just passes straight through.[stopping]";
	anonymously abide by the Calvin movement rule;

Book 11 - Bishop's Library

Part 1 - Secret Stair

The Secret Stair is a room. "This is nothing but a tiny gap between the stones, maybe built for insulation or for the rats to build their nests. It winds upwards as it curves around the clerestory. A staircase."

After going up from the Secret Stair:
	say "I creep my way up the stairs."; continue the action;

After going outside from the Secret Stair:
	say "I slip out, grateful for the space to breath."; continue the action;

The sloping floor is scenery, in the Secret Stair. "The floor itself tilts upwards."

Understand "staircase", "stairs", "steps", "stair", "stair case", "step", "sloping", "tilting", "slope", "tilt", "sloped", "tilted", "floor", "itself" as the sloping floor.

Up from the Secret Stair is the Ancient Landing.

Part 2 - Ancient Landing

The Ancient Landing is a room. "Dusty wooden floorboards fill this tiny space between the walls - the stairs have emerged onto a landing, with a banister rail along one side. Perhaps this was once part of a larger room: now its just a missing piece, that ends to the south in solid stone...[paragraph break]...and to the east, ends in a wooden door carved with a clock."

Instead of going south in the Ancient Landing:
	say "It's solid stone.";

After going down from the Ancient Landing:
	say "I slip back into the staircase."; continue the action;

A gap in the stonework is scenery, in the Ancient Landing. "If I didn’t know they were there I’d think they were just a gap in the stonework." 

Understand "staircase", "stairs", "steps", "stair", "stair case", "step", "sloping", "tilting", "slope", "tilt", "sloped", "tilted", "floor", "itself" as the gap in the stonework.

Instead of entering the gap in the stonework:
	try going down;

A banister is scenery, in the Ancient Landing. "The wood is ancient and drilled with termite holes. In place to aid an old man, maybe, if he came through here to hide."

Chapter 1 - Clock Door

The secret Clock Door is a door, privately-named, scenery, closed, openable, not lockable, east of the Ancient Landing, west of the Bishop's Library. "A wood panel door carved with the single image of a clock face. It seems solid enough."

Understand "secret", "clock", "door", "wood", "panel", "carved", "face" as the secret clock door when Return To The Cathedral has happened.

Rule for printing the description of the open secret Clock Door:
	say "The door has slid back to reveal the inside of a Grandfather clock. Beyond the penduluum is moonlight, and the Library.";
	if the enormous penduluum is ticking:
		say "The penduluum strikes backwards and forward past the door.";
	otherwise:
		say "The penduluum is still.";

First before going through the closed secret Clock Door:
	say "Maybe it’s a door. Maybe it’s a wall." instead; [no implicit opening]

Instead of opening the open secret Clock Door:
	say "The panel has slid away into the wall.";

After opening the secret Clock Door:
	say "Getting my fingers in at six o’clock and eleven I heave with all my might – and almost fall. The wooden panel moves easily, drawing aside into the wall to reveal shining clock working, weights, and a beating penduluum like a heart… It’s the inside of a Grandfather clock. And beyond the workings I can see the Library.";

Instead of closing the closed secret Clock Door:
	say "The panel is already closed.";

After closing the secret Clock Door:
	say "The panel slides back across the clock. However old it might be, it moves with well-greased ease.";

Instead of going through the secret Clock Door from the Ancient Landing when the enormous penduluum is ticking:
	say "[one of]I move forward slowly, but the swinging Penduluum is stomping in my path like a giant blacksmith bashing a hammer down and aiming for my chest. Two beats a second – faster than I can move.[or]The heavy penduluum is blocking my path as sure as it was Drake hitting one fist after the other.[stopping]";

After going through the secret Clock Door from the Ancient Landing:
	say "I slip around the side of the penduluum, through the glass doors and out into the Library.";
	continue the action;

Chapter 2 - Inner Workings

Section 1 - Penduluum

The Clock Workings is a room.

After deciding the scope of the player when the secret Clock Door is open in the Ancient Landing:
	place the clock workings in scope;

A rule for reaching inside the clock workings:
	if the secret Clock Door is open:
		allow access;

The enormous penduluum is scenery, in the clock workings. "The Penduluum is enormous. [if stopped]It hangs lifeless as a cow from a butcher’s hook.[otherwise]It beats heavy time, side to side, driving the workings of the clock, driven by enormous counterweights on either side.[end if]"

The enormous penduluum can be ticking or stopped. The enormous penduluum is ticking.

Instead of taking, pushing, pulling or attacking the stopped enormous penduluum:
	say "I’m not big enough to get that Penduluum to move.";

Instead of taking, pushing, pulling or attacking the ticking enormous penduluum:
	say "It’d knock me flat!";

Section 2 - Weights

Some heavy brass weights are scenery, in the clock workings. "Two heavy brass cylinders that drive the clock, inch by weighty inch[if removed]. They are side by side on the bottom of the clock case[end if]."

The heavy brass weights can be present or removed. The heavy brass weights are present.

Instead of taking the removed heavy brass weights:
	say "The weights are too heavy to carry, or to put back.";

Instead of taking the present heavy brass weights:
	say "I wrap my whole body round the weight on the left-hand side and heave upwards, trying to slip it from its hook[if the enormous penduluum is ticking]. The giant penduluum comes so close to my head that it bellows in my ear, once, twice, three times[end if]. My muscles are straining so hard I can feel my shoulder-ball lifting from its socket.[paragraph break]And then suddenly the weight is free, and it drops the ground. Drake must have heard that, I think. Have to hope the Bishop locks his door.[paragraph break][if the enormous penduluum is ticking]The penduluum winds to a stop. [fire TRIG_JAMMED_CLOCK][end if]";
	now the heavy brass weights are removed;	
	now the enormous penduluum is stopped;

COUNTER_WEIGHTS [ha!] is a counter. The internal value is 2. The top end is 2.

Every turn when the player can see the present heavy brass weights:
	increment COUNTER_WEIGHTS;

Rule for firing COUNTER_WEIGHTS:
	if the perfect clockwork workings are not jammed:
		say "The weights of the Penduluum ratchet one notch lower[one of].[or].[or]. If only I wait another three hours they might reach the base.[or].[stopping]";

Section 3 - Clockwork

TRIG_JAMMED_CLOCK is a trigger. 

Rule for firing unfired TRIG_JAMMED_CLOCK:
	say "[i]This is what will happen if the Perpetuum is taken[r], I try to tell myself. [i]Only not just here. Everywhere[r].";

Some perfect clockwork workings are a container, scenery, in the clock workings.  "The clockwork of the Bishop’s clock is perfect: carved with precision, fitted with reverence, tuned by blind masters with hearing that prevents them sleeping in the same rooms as moths or ants or woodworm[if jammed]. And I’ve jammed the workings[end if]."

Rule for printing the name of the perfect clockwork workings:
	say "workings";

The perfect clockwork can be running smoothly or jammed. The perfect clockwork is running smoothly.

Instead of inserting something unsuitable for jamming into the perfect clockwork workings:
	say "I can't see what good that will do.";

After inserting something suitable for jamming into the perfect clockwork workings:
	now the perfect clockwork workings are jammed;
	say "Clockwork – the movement of tick after tock – is the engine that drives the whole universe, every star, every planet, every leaf on every tree. It is unstoppable, unquestionable, unjudging, fair, precise and orderly. Clockwork continues, as the Abbott says: it defeats us all.[paragraph break]But then the Abbott has never plunged [a noun] into the gear trace of a clock and watched the gears scream and shake and choke in fury. It is an ultimate heresy: the sound must be the sound of the demons that have come to take my springs.[paragraph break][if the enormous penduluum is ticking][paragraph break]The penduluum swings to a stop. There is sudden, terrible silence. [fire TRIG_JAMMED_CLOCK][end if]";

After removing something from the perfect clockwork workings:
	now the perfect clockwork workings are running smoothly;
	if the heavy brass weights are present:
		now the penduluum is ticking;
	say "I slide [the noun] from the workings of the clock. The cogs snap after them but the clock, incredibly, begins to turn once more[if the heavy brass weights are present]. Even the penduluum begins to move[end if]."

Part 3 - Bishop's Library

When Return To The Cathedral begins:
	remove the Archbishop from play;

Rule for printing the description of the Bishop's Library during Return To The Cathedral:
	say "The small library is the first lit room I’ve seen in the Cathedral, like the Bishop had somehow fixed the moon in place to shine through the enormous stained-glass windows. The room is filled with the shadows of saints and the letters of proverbs – across the desk floats [i]Patience is the Key[r]. But not now, Wren. Now speed is of the essence.[paragraph break]The Grandfather clock is open and eerily silent. The desk drawer is [if the single drawer is closed]closed[otherwise]open[end if].";

Instead of waiting in the Bishop's Library during Return To The Cathedral:
	say "This isn’t helping, Wren.";

Instead of going south from the Bishop's Library during Return To The Cathedral:
	say "The door must be locked – and even if it isn’t, Drake’s right outside.";

Rule for printing the description of the Archbishop's Desk during Return To The Cathedral:
	say "Light from the window highlights the blotter and the top drawer of the desk.";

First unlocking rule for the Archbishop's Desk during Return To The Cathedral:
	say "I don’t have a key. There must be some other way to slip the catch." instead;

First unlocking rule for the single drawer during Return To The Cathedral:
	say "I don’t have a key. There must be some other way to slip the catch." instead;

Instead of unlocking the Archbishop's Desk with something during Return To The Cathedral:
	redirect the action from the Archbishop's Desk to the single drawer;
	try the current action instead;

Instead of opening or closing or pushing or pulling the Archbishop's Desk during Return To The Cathedral:
	redirect the action from the Archbishop's Desk to the single drawer;
	try the current action instead;

Definition: a thing is suitable for catch-slipping:
	if it is the knife, yes;
	if it is the blotter, yes;
	no;

Instead of unlocking the locked single drawer with something suitable for catch-slipping during Return To The Cathedral:
	say "I slide [the noun] across the top of the drawer until it finds the catch. It shouldn’t be this easy – but it seems that luck the Abbott is always saying doesn’t exist is with me. The lock turns over.";
	now the single drawer is unlocked;

Instead of opening or pulling the locked single drawer during Return To The Cathedral:
	say "I try and heave the drawer, but it’s locked. Not very securely, perhaps, but locked all the same.";

After opening the unlocked single drawer during Return To The Cathedral:
	say "I slide open the drawer.";
	try searching the single drawer;

After searching the open single drawer during Return To The Cathedral:
	if the old iron crypt key is in the single drawer:
		say "Inside is the key the Bishop showed me: the old iron key that opens the crypt grate.";
	otherwise:
		say "There’s nothing important inside.";

The description of the old iron crypt key is "The key is maybe as old as the Cathedral walls themselves. Heavy and hooked like something broken off a boat’s anchor chain[one of]. Perhaps they use it to punish those who try to break into the crypts...[paragraph break]...the Figure had better hope he doesn’t meet me down there[or][stopping].";

A blotter is scenery, on the Archbishop's Desk. "[if the blotter is on the Archbishop's Desk]Projected across the blotter are the words [i]Patience is the Key[r][otherwise]It’s just a blotter, flat and wide, made of thin wood[end if]." 

Rule for printing the description of the Archbishop's bookshelves during Return To The Cathedral:
	say "I’m not here to read. I’m here to get that key!";

Rule for printing the description of the narrow windows during Return To The Cathedral:
	say "The room is walled on one side by glass decorated with saints and wise proverbs. None of which is 'steal that key and then get running.'";

Rule for printing the description of the secret Clock Door when in the Bishop's Library during Return To The Cathedral:
	say "The Bishop’s clock has stopped, maybe for the first time since it was made. And I did it. Me.";

After going through the secret Clock Door from the Bishop's Library during Return To The Cathedral:
	say "I slip back through the clock, closing its front doors as I go.";

Rule for printing the description of the Bishop's Door when in the Bishop's Library during Return To The Cathedral:
	say "The door to the clerestory is almost certainly locked.";

Instead of going through the Bishop's Door from the Bishop's Library during Return To The Cathedral:
	say "The door to the clerestory is almost certainly locked.";

Part 4 - Choir

Chapter 1 - Lost Perpetuum trick

Last after going to the Cathedral Choir from the Secret Stair during Return To The Cathedral:
	if TRIG_LOST_DECOY is unfired:
		try looking;
		fire TRIG_LOST_DECOY;
	otherwise:
		continue the action;

The decoy perpetuum can be lost. The decoy perpetuum is not lost.

TRIG_LOST_DECOY is a trigger.

Rule for firing TRIG_LOST_DECOY:
	now the decoy perpetuum is lost;
	say "The Perpetuum’s not where I left it! It’s gone.";

After reading a command when the decoy perpetuum is lost:
	now the decoy perpetuum is not lost;
	now the player carries the decoy perpetuum;
	say "Oh, no. There it is. I just didn’t see it in the dark.[paragraph break]I quickly pick it up.";
	reject the player's command;

Part 5 - Crypt

The matching key of the crypt grate is the old iron crypt key.

After unlocking the crypt grate with the old iron crypt key:
	say "I turn the key as slowly and quietly as I can. Tumblers move like ravens out of the way of a carriage: slowly, reluctantly, in hopping movements, croaking and clawing as they go.
Then the gate is open. Like a pin into a hinge joint, I enter the dark.";
	now the crypt grate is open;
	if the implicitly opening activity is not going on,
		try going the crypt grate instead;

Book 12 - Crypt

Part 1 - Crypt Stairs

The Crypt Stairs is a room. "[one of]I turn and lock the grate behind me, snapping closed the padlock so that the Figure won’t suspect. Trapping me down here with him.[or]This isn’t the time for fear, Wren, even if this is the place for it. There are steps leading down: I need to take them.[stopping]"

The printed name of the Crypt Stairs is "Staircase".

After going to the Crypt Stairs from the East Apse:
	now the crypt grate is closed; now the crypt grate is locked;
	say "From the window of my tiny room in the rafters I’ve often watched the shadow of the Cathedral of Time as it races round the streets of St Philip – leaping up with the dawn and not stopping for breath till night.[paragraph break]Today I saw another shadow, grey this time instead of black, and inside the Cathedral.[paragraph break]And now, I am a shadow myself. A shadow in the Cathedral: a darkness moving through the darkness of the crypts. There are stairs leading down: I can smell them, cold air from underground, with a hint of grease, the sweetness of lamps and beeswax.[paragraph break]Like a shadow, all the light is behind me.[paragraph break]Like a shadow, I can’t stop moving.";
	continue the action;

Instead of going southwest when in the Crypt Stairs:
	say "I can’t. I’ve locked the grate behind me, and I need to move on.";

Rule for printing the description of the crypt grate when in the Crypt Stairs:
	say "The thick iron grate leads back to the Cathedral, but I’m not going that way.";

Before going through the crypt grate when in the Crypt Stairs:
	say "I need to keep going. I don’t have much time." instead;

Instead of opening the crypt grate when in the Crypt Stairs:
	try going the noun instead;

Instead of unlocking the crypt grate with something when in the Crypt Stairs:
	try going the noun instead;

Part 2 - Ossuary

Chapter 1 - Description

The Ossuary is a room, down from the Crypt Stairs. "[one of]A few years ago, before I got to clock polishing, when I was still sweeping up dust and coiling wire for my dinner, one of the Brothers died. His name was Brother Wilmslow but Calvin and Drake called him Brother Weakslow because he was so old he couldn’t move any faster than a shuffle and had trouble lifting his fork. I don’t think I ever spoke to him and he was so near-blind he probably never saw me at all.[paragraph break]I don’t think he can see me now, either, even though that’s him, propped up in a stone niche in the wall of the tunnel to the south.[or]The walls are smooth stones but into some are built triangular niches. Can’t I just tell you about the niches? Do I have to tell you about the skeletons and bodies sitting up inside them?[paragraph break]Round the head of each is tied a small round dial – a deathwatch. They make no sound at all.[paragraph break]The tunnel goes south. So will I, once I get the courage.[stopping]"

Instead of listening to the Ossuary:
	say "None of the bodies are making any noise. They must be praying, counting seconds or reciting the Tangent.";

Chapter 2 - Scenery

Section 1 - Niches

Some triangular niches are scenery, in the Ossuary. "Not all the stone niches are full. Some have bodies sitting cross-legged, and some have sunken piles of bones with skulls surrounded by knees."
The printed name of the triangular niches is "niches".

Understand "triangle", "niche" as the triangular niches.

Instead of entering the triangular niches:
	say "I know I’m going to die down here all right, but I’m not that keen to get it over with!";

Section 2 - Brother Wilmslow

Brother Wilmslow is a man, scenery, in the Ossuary. "Brother Wilmslow is sitting up, as if he’d fallen asleep at dinner. On his head is the small round dial of his deathwatch."

Understand "weakslow" as Brother Wilmslow.

Instead of doing something when Brother Wilmslow is physically involved:
	say "I don’t want to wake him.";

Rule for speaking with Brother Wilmslow:
	say "Brother Wilmslow was always deaf as well as blind. Now he’s mute too. It must be awful for him down here with nothing to do.";

Section 3 - Bodies

The bodies of dead monks are scenery, in the Ossuary. "They’re all Brothers, still robed, though some of the robes are only so much dust and cobweb."

Understand "dusty", "robed", "skeleton", "skeletons", "heads", "sunken", "piles", "piles of", "bone", "bones", "skull", "skulls", "knees", "robe", "robes" as the bodies of dead monks. The printed name of the bodies of dead monks is "skeletons".

Instead of taking or searching the bodies of dead monks:
	if the linen cloth has been held and the dowel handle is not on-stage:
		now the player carries the arm bone;
		say "I pick out the oldest-looking bone I can, and hold it by one end, trying not to squirm. I can feel the ghost reaching down the length of it to hold me back.";
	otherwise:
		continue the action;

Instead of taking or searching the bodies of dead monks:
	say "No chance ! I’m not digging around inside a skeleton. You must think I’m crazy!";

The arm bone is a thing. "I think it’s an arm." The printed name of the arm bone is "bone".

Section 4 - Deathwatches

Some deathwatches are scenery, in the Ossuary. "A small round dial tied by a wire band to the forehead of the Brother. Each seems still but is moving really: the minute hand pushing forward then juddering back, as though the springs were too spent to get the hand round the dial. They aren’t – these springs will run until the soul has gone. But the watches have been cobbled: how could the watch move beyond the moment of death when their owners couldn’t?"

Instead of taking the deathwatches:
	say "It’s not my time for one. Not yet.";

Instead of setting the deathwatches to something:
	try switching on the noun;

Instead of turning, switching on, switching off the deathwatches:
	say "If I turned the watch backward I might wake him. If I turned it back, he might crumble to dust. I leave it alone.";

Part 3 - Landing

Chapter 1 - Description

The Crypt Landing is a room, south of the Ossuary. "[one of]Light! [or][stopping]The tunnel from the north opens out here into a vaulted chamber and there are four iron torches burning in each corner. Between them, east and west, are arched doorways like lidded eyes. By the south wall, a missing flagstone leads further down: more darkness."

The printed name of the Crypt Landing is "Landing".

After going from the Ossuary to the Crypt Landing:
	say "[one of]I don’t want to meet the Figure here. Only one place to hide and I don’t like it. So I keep going.[or][stopping]";
	continue the action;

Chapter 2 - Scenery

Section 1 - Stairs

Some steep stairs are scenery, in the Crypt Landing. "Steep stairs – so steep I’d have to go backwards. They lead into pitch dark."

Understand "darkness", "steps", "staircase" as the steep stairs.

Section 2 - Archways

Some carved archways are scenery in the Crypt Landing. "Each arch is topping by a carving: a skull on its side, the eye-sockets forming an hourglass."

Instead of entering the carved archways:
	say "Which way, Wren? East or west?";

Understand "skull", "skulls", "arch", "archway", "arches", "carvings", "eye", "sockets", "hourglass", "hourglasses", "hour glass", "hour glasses" as the carved archways.

Section 3 - Lanterns

Some iron torches are scenery, in the Crypt Landing. "The torches are inlaid with carvings of the crescent moon. Their rope wicks burn slightly blue: fuel must be running into them through channels in the stone, but what kind of fuel it is that burns forever I can’t think[one of]. [i]Maybe it’s dead men’s breath. That’d certainly explain the smell[r].[or].[stopping]"

Understand "crescent", "moon", "rope", "wicks", "blue", "fire", "fires", "smelly", "light", "lights", "burning", "lantern", "lanterns" as the iron torches.

Understand "torch" as the iron torches when the player can not see the makeshift torch.

Instead of taking the iron torches:
	say "The torches are fixed to the wall[one of] – and if they’re fed from inside, they’d be no good removed anyway[or][stopping]."

Part 4 - Upper Vault

The Upper Vault is a room, west of the Crypt Landing. "[one of]I catch my breath as I enter. [or][stopping]This room is a vault of ancient pagan relics: torchlight from the arch back east gleams over water-clocks and candle-clocks and stranger devices I can’t even name, made of wood and bone. There’s no brass here, no cogs, no bearings, no blown glass. It should have all been destroyed.[paragraph break]As if I needed to add, the Perpetuum is [i]not[r] here[if sundial on shelf]. The only metal thing at all is the plate of a large sundial, resting on a shelf[end if]."

An eastern arch is scenery, in the upper vault. "The arch leads back to the landing." Understand "east", "archway" as the eastern arch.

Instead of entering the eastern arch:
	try going east instead;

Some pagan relics are scenery, in the upper vault. 

Instead of doing something when the pagan relics are involved:
	say "[one of]In the days before St Newton people had been ignorant of Penduluums and the Simple Approximation of Sine, and had been forced to use all sorts of foolish things to measure time. None of them worked, of course – water slides and marked candles and so forth. Brother Reloh says that without a True understanding of Time, Time cannot exist.[paragraph break]Looking at all the things here I feel sorry for those primitive people, who must have always been waking up to find the day was over, or enduring nights that went on forever without any breakfast.[or]Leave them be. Their time is finally done.[stopping]"

A dusty shelf is scenery, in the upper vault. The printed name is "shelf".

A plate sundial is on the dusty shelf. "The plate sundial is made of dark, lusty gold, and would probably be worth a packet if anyone could be demon-happy enough to buy it in the markets of the town. The gnomon is razor sharp still but the underside is worn away, with a series of strange indentations."

After taking the plate sundial:
	say "The plate is heavier than it looks.";

Understand "dark", "lusty", "gold", "razor", "sharp", "gnomon", "worn", "underside", "series", "series of", "strange", "indentations" as the plate sundial.

Part 5 - Mortuary

The Mortuary is a room, east from the Crypt Landing. "[one of]The back of my neck starts prickling and I’m only one step inside. [i]Don’t be a fool, Wren. No ghosts in these machines[r]. But that doesn’t stop all sort of things from making people dead, so that they end up in rooms like this one.[paragraph break][or][stopping]The stone walls are cold, and wet with the last breath of all the bodies that have been prepared down here. When they come they lie down on the large stone slab in the centre of the room. Blown-glass tubes lead out from it on either side with another at one end. Their insides are the colour of burnt bacon.[paragraph break]By the arch to the west is a shelf carved out of the rock. On it are the tools of the trade: spices, cloth, dowels, oil. At least there’s no lathe or whetstone or screws."

Instead of smelling the Mortuary:
	say "The room is heavy with death, like an October night heavy with rain.";

Instead of listening to the Mortuary:
	say "The wet walls are whispering, Wren.";

Chapter 2 - Scenery

Section 1 - Arch

A western arch is scenery, in the mortuary. "The arch leads back to the landing." Understand "west", "archway" as the western arch.

Instead of entering the western arch:
	try going west instead;

Section 2 - Slab

A slab is scenery, in the Mortuary. "The slab is a bit larger than a man, a bit wider than a man, and has a shallow impression in the shape of a man, with his legs together and wrists by the blown-glass tubes."

Instead of entering the slab:
	say "You must think I’m crazy! The ghosts would eat my bones for breakfast!";

Section 3 - Shelf

A rock shelf is scenery, in the Mortuary. "The shelf is hewn from the rock itself, to hold the bandages and the oil. On one side is a stack of wooden dowels."

Instead of entering the rock shelf:
	say "It’s too small for me to hide.";

Instead of putting something on the rock shelf:
	say "I’m not here to tidy things away.";

Section 4 - Spices

Some jars of spices are scenery, on the rock shelf. "The shelves are lined with the spices of death: cinnamon, cardamom, mace and star anise. They sit in jars between the rolls of bandages and the bowl of oil.";

Understand "jar of", "jar", "cinnamon", "cardamom", "mace", "star anise", "of death", "death" as the jars of spices.

Instead of taking the jars of spices for the first time:
	say "I don’t think Cook would like me adding those to the Abbey soup.";

Instead of taking the jars of spices:
	try smelling the jars of spices;

Instead of smelling, tasting, eating the jars of spices:
	say "The smell is enough to make me feel ill.";

Section 5 - Oils

A bowl of thick black oil is scenery, on the rock shelf. "At one end of the shelf is a wide shallow bowl, thick with dark black oil."

Instead of taking the bowl of black oil for the first time:
	say "I try lifting the bowl, only to find that it isn’t a bowl: it’s a carved part of the shelf."

Instead of taking the bowl of black oil:
	try attacking the bowl of black oil;

Instead of attacking or pulling or turning the bowl of black oil:
	say "I don’t have a stone-hammer with me.";

Instead of touching, tasting, drinking, eating the bowl of black oil:
	say "The oil is as thick as slug-slime and as black as death. Who knows what it’s made from?";

Section 6 - Bandages

Some bandages are scenery, on the rock shelf. "Long rolls of cloth fill half the shelf – dry cloth, the same colour as bone and as dry as bone[if the linen cloth is off-stage]. One end of the roll hangs loose, like a lolling tongue[end if]."

Some linen cloth is a thing. The description is "[if oiled]A strip of linen, gleaming smugly with oil.[else]I’ve torn a strip of linen from the bandage roll, about the length of my arm.[end if]"

The linen cloth can be oiled or unoiled. The linen cloth is unoiled.

Understand "dry" as the linen cloth when the linen cloth is unoiled.

Instead of taking the bandages when the linen cloth is off-stage:
	say "I tear away a strip of the dry linen cloth.";
	now the linen cloth is unoiled;
	now the player carries the linen cloth;

Instead of taking the bandages:
	say "I’ve already got enough. I’m not here to wrap myself up – or anyone else.";

Instead of inserting the oiled linen cloth into the bowl of black oil:
	say "It’s already soaked through with oil.";

Instead of inserting the unoiled linen cloth into the bowl of black oil:
	say "[one of]I dip the linen strip once, twice in the bowl of oil. It comes out gleaming.[or]I soak the linen strip.[stopping]"

Section 7 - Dowels

Some dowels are scenery, on the rock shelf. "There’s a pile of stocky wooden dowels on the shelf. I don’t even want to think what they’re for."

Instead of taking the dowels when the dowel handle is off-stage:
	now the player carries the dowel handle;
	say "I pick up a dowel. It’s a good length, but far too light to use as a cudgel. (And I’m too much of a wimp to use one, too.)"

Instead of taking the dowels:
	say "I’ve already got one.";

The dowel handle is a thing. "It’s a good length, the size and shape of my forearm." The printed name is "handle".

Chapter 3 - Making a torch

Section 1 - Construction

A thing can be a torch stick.
The dowel handle is a torch stick.
The bone is a torch stick.

Instead of wrapping a torch stick thing (called the stick) with the linen cloth:
	remove the noun from play;
	remove the second noun from play;
	now the stick is part of the makeshift torch;
	now the linen cloth is part of the makeshift torch;
	now the player carries the makeshift torch;
	say "I roll the [if the linen cloth is oiled]oozing [end if]linen around the end of the [if the stick is a dowel handle]wooden handle[else]bone[end if], once, twice, until it's tight. I’m left holding something that looks a lot like a [if the linen cloth is unoiled]dry torch[else]torch, ready to be lit[end if]."

Section 2 - Description

The makeshift torch is a thing. The description of the makeshift torch is "It’s the best I can do for a torch: cloth wrapped around a handle [if the arm bone is part of the makeshift torch]that once held a hand of its own[end if]."

Rule for printing the description of the lit makeshift torch:
	say "Clockwork can do a lot of things: tell the time, move the wheels of a cart, operate pistons and machines, move the stars and the Earth, even predict the weather. But clockwork can’t make Light. Only Fire makes Light – and that’s what I’ve got. I’m a Second Assistant Clock Polisher, and I’ve got fire on a stick.";

Rule for printing the name of the lit makeshift torch:
	say "brightly burning torch";

Section 3 - Oiling

Instead of inserting the lit makeshift torch into the bowl of black oil:
	say "No chance. It might explode.";

Instead of inserting the unlit makeshift torch into the bowl of black oil when the linen cloth is oiled:
	say "The torch is already soaked with oil. Any more and it might blow up!";

Instead of inserting the unlit makeshift torch into the bowl of black oil:
	now the linen cloth is oiled;
	say "I dip the head of the torch into the oil until it gleams.";

Section 4 - Lighting

Instead of inserting the unlit makeshift torch into the iron torches when the linen cloth is oiled:
	now the makeshift torch is lit;
	say "I lift the head of the torch up to the flame – and it catches in a second. The walls around me leap with light!";

Instead of inserting the unlit makeshift torch into the iron torches when the linen cloth is unoiled:
	remove the linen cloth from play;
	remove the makeshift torch from play;
	now the player carries everything that is part of the makeshift torch;
	say "[one of]I reach up to light the linen head of the torch. It ignites and begins to glower with flame. Then ashes break off, and soon the whole thing has burned to nothing.[or]I burn the linen on the torch-head to nothing. It’s no good without fuel![stopping]";

Before doing something when a torch-part is involved:
	if the noun is a torch-part:
		redirect the action from the noun to the makeshift torch;
	if the second noun is a torch-part:
		redirect the action from the second noun to the makeshift torch;
	try the current action instead;

Definition: a thing is a torch-part:
	if it is part of the makeshift torch, yes;
	no;

Part 6 - Dark Stair

Chapter 1 - Description

The Dark Stair is a room, south from the Crypt Landing, down from the Crypt Landing. "The stairs down from the landing end in midair. Everything beyond is darkness."

Rule for printing the description of the Dark Stair when the player can see the lit makeshift torch:
	if the gnomon tip is in the location:
		say "There’s a gap, between the end of the stairs, and the start of the smooth stone slope that disappears downwards into the dark. It’s no staircase, but there are worn-down depressions down its length. It’s a handspan wide and no more.[paragraph break]";
	otherwise:
		say "I’m at the bottom of a staircase with nothing but the dark below.[paragraph break]";
	say "The step before the last step is wider than the others: on the left a metal sconce is fixed to the wall. On the right is a low stone pedestal. If I started to fall I could grab onto either!"

After going from the Crypt Landing to the Dark Stair when TRIG_DARK_STAIR is unfired:
	fire TRIG_DARK_STAIR;
	continue the action;

TRIG_DARK_STAIR is a trigger.

Rule for firing unfired TRIG_DARK_STAIR when the player has the lit makeshift torch:
	say "The stairs disappear downwards. I must be lower than the Abbey well by now, maybe even lower than the spring of St Philip itself. My hands are running over stone bricks – then slick rock seamed with rough minerals.[paragraph break]Then, quite suddenly, the stairs come to an end in mid-air. Below them is empty space: my torch is like the scratch of a fingernail on the Polar Ice. It’s as though the world was hollow and I had reached the rotten core.";

Rule for firing unfired TRIG_DARK_STAIR:
	say "Total darkness. I’m feeling my way – one step, then another, like I was coming down the ladder from my room. Then just as I’m getting the hang of it, the deep step gets deeper and deeper and I realise my foot is heading out into nothingness because the stairs have stopped… with no time to pull back I sit down, sharply. Below me is empty air – could be a handspan, could be the height of a tower. The air is still, and cold. The darkness around could be the size of the night.";

Instead of dropping something in the Dark Stair:
	say "I can’t risk it rolling and disappearing into space.";

Chapter 2 - Scenery

Rule for deciding the concealed possessions of the Dark Stair:
	if the player can see the lit makeshift torch, no;
	if the particular possession is the sconce, yes;
	if the particular possession is the granite column, yes;

Section 1 - Staircase

A dangling stair is scenery, in the Dark Stair. "Each step is a carved stone block, dangling from the block before. In the end they’re all supported by nothing. Only darkness lies below." 

Section 2 - Sconce

A sconce is scenery, a container, in the Dark Stair. "It’s an iron pike with a bracket set on the wall. The bracket is wrought to look like the rays of a sun."

Instead of taking the sconce:
	say "It’s fixed into the stone. That means it’s a solid handhold.";
 
Understand "solid", "wrought", "iron", "pike", "bracket", "sun", "rays", "holder" as the sconce.

After inserting the lit makeshift torch into the sconce:
	say "I slow the torch neatly into the sconce. Light pours down over the pedestal opposite.";

After taking the lit makeshift torch when the makeshift torch was in the sconce:
	say "I lift the torch back out of the sconce.";

Section 3 - Pedestal

A granite column is scenery, a supporter, in the Dark Stair. "A granite column, waist-high to a man which means nose-height to me. The surface is marked with ridges and slots in some kind of design – maybe there used to be something here, some kind of treasure that was ripped away – or a goblin – or a heretical device powered by water or the movement of ants."

The printed name of the granite column is "pedestal". Understand "pedestal" as the granite column.

Instead of pushing, pulling the granite column:
	try turning the noun instead;

After putting the plate sundial on the granite column:
	now the plate sundial is part of the granite column;
	say "The sundial fits the pedestal-top precisely, almost as if the ancients who built it were capable of engineering. But primitives had no Mechanics. It was St Newton who brought us out of the dark."

Section 4 - Gnomon Control (Assembled Pedestal)

Definition: the granite column is assembled if the plate sundial is part of it.
Definition: the granite column is unassembled unless it is assembled.

The granite column has a number called the shadow setting. The shadow setting of the granite column is 4.

Instead of rotating when the noun is the unassembled granite column:
	say "The pedestal seems to shift but only for a moment before locking up[one of]. It might be a crank with a cam or a cam without a key, as the Abbot would say, but either way it won’t go[or][stopping].";

Before doing something when the plate sundial is involved and the granite column is assembled:
	redirect the action from the plate sundial to the granite column;
	try the current action instead;

Instead of taking the assembled granite column:
	say "The sundial seems to have locked into place and I can’t see how[one of]. With a sinking feeling I realise I’ve made things easier for the Figure, not harder[or][stopping].";

Rule for printing the description of the assembled granite column:
	say "The sundial sits on the granite pedestal, slotted neatly into place. [if the lit makeshift torch is in the sconce]The torchlight casts a needlepoint shadow: the time is [shadow setting of the granite column in words][otherwise]The light of my torch is making the time leap like crazy, as though the Earth had come loose from its bearing and was rolling end over end past the sun[end if]."

Instead of rotating when the noun is the assembled granite column and the player carries the makeshift torch:
	say "If I’m going to shift this pedestal around I’ll need my hands free. The torch is in the way!";

Instead of turning the assembled granite column:
	let n be the shadow setting of the granite column + 1;
	while n is greater than 12:
		change n to n - 12; [13 becomes 1]
	try number-setting the noun to n;

Instead of turning the assembled granite column backwards:
	let n be the shadow setting of the granite column - 1;
	while n is less than 1:
		change n to n + 12; [0 becomes 12]
	try number-setting the granite column to n;

Instead of number-setting the assembled granite column to when the number understood is less than 1:
	say "The clock face reaches from one to twelve.";

Instead of number-setting the assembled granite column to when the number understood is greater than 12:
	say "The clock face reaches from one to twelve.";

Instead of number-setting the assembled granite column to when the number understood is the shadow setting of the granite column:
	say "The shadow is already pointing at [shadow setting of the granite column in words].";

Instead of number-setting the assembled granite column to when the shadow setting of the granite column is 12:
	say "I can’t get the gnomon to turn any more[one of]. Maybe the Abbott was hoping he’d simply run off into the dark. Instead, I’ve saved him...[or].[stopping]";

Instead of number-setting the assembled granite column to:
	change the shadow setting of the granite column to the number understood;
	say "[one of]I grab the edges of the pedestal and heave. To my surprise, it turns without trouble, like some great weight had been quietly counterbalanced away.[or]I put both hands on the pedestal and drag it round.[or]I haul on the pedestal.[stopping]";
	consider the gnomon rules;

The gnomon rules are a rulebook.

A gnomon rule when the shadow setting of the granite column is 12:
	move the gnomon tip to the Dark Stair; 
	say "The shadow on the face of the gnomon creeps round to midnight and after settling for a moment, the stairs underneath me start to shake, as if they were being lifted from underneath! [i]Now you’ve done it, Wren. This whole place is going to fall! [r][paragraph break]But it doesn’t. Instead, something massive – stone, moving on ancient castors – wheels into place at the end of the stairs. A smooth stone slope, leading down." instead;

A gnomon rule when the shadow setting of the granite column is 1 or the shadow setting of the granite column is 11:
	say "The shadow settles at [shadow setting of the granite column in words] o’clock[one of]. In the darkness, I hear something grumble and groan in response, like there was a giant trapped down there and the sundial was the lock on its cage.[or]. Whatever’s down there is right by me![or].[stopping]" instead;

A gnomon rule:
	say "The shadow moves to [shadow setting of the granite column in words].[paragraph break][one of]In the dark, something whispers and mutters.[or]Whatever’s down there in the darkness grumbles again, like it was dragging gigantic feet.[or]The grumbling thing is louder now.[or]Something is definitely moving down there, in the dark, and by the sound of it, it’s the size of the Cathedral itself.[or]The machinery responds, huge and awful.[stopping]" instead;

Section 5 - Gnomon Tip

The gnomon tip is scenery.

Instead of going down from the Dark Stair when the player can not see the gnomon tip:
	say "There’s nothing but space there! I’m not jumping!";

Instead of jumping in the Dark Stair:
	try going down;

Part 7 - Gnomon

The Middle of the Gnomon is a room, down from the Dark Stair. "The light from above quickly disappears. I’m left in darkness, worse than before. There aren’t even any walls to hang on to. I can feel the stone underfoot getting thinner and thinner, until I’m standing on a wire..."

The printed name of the middle of the gnomon is "Gnomon".

After deciding the scope of the player when in the middle of the gnomon:
	place the contents of the Henge in scope;

Part 8 - Henge

Chapter 1 - Description

The Henge is a room. "I’m standing by the base of the gnomon in a cavern that rivals the dome of the sky for its size. There are twelve stones: twelve giants, staring in at me. They are all in shadow. There is no sun to cast a time across the dial. Water drips from the ceiling. The air is cold.[paragraph break]Between two of the stones is a door of dark iron. It’s almost invisible to the west."

Chapter 2 - Scenery

Section 1 - Stones

Some giant stones are scenery, in the Henge. "Twelve stones, one for every hour, with the tallest to the twelve."  Understand "twelve", "tallest", "stone", "rock", "rocks", "hour", "hours" as the giant stones.

Instead of entering the giant stones:
	say "There is nothing but shadow between the stones, except for the stones that flank the door.";

Section 2 - Gnomon

The stone slope is a door, scenery, open, not openable, up from the Henge, down from the middle of the gnomon.

Rule for printing the description of the stone slope when in the middle of the gnomon:
	say "It must have taken a million footsteps from a thousand people to wear these steps into the stone.";

Rule for printing the description of the stone slope when in the Henge:
	say "The gnomon of the sundial climbs away into the darkness overhead.";

Section 3 - Sundial

The face of the sundial is scenery, in the Henge. "The dial must be the work of a king, built by slaves for the worship of masses. It must have been ground level once, in full sunlight, maybe between a river and the sea. Now the whole of St Philip lies above it. Every bog, spring and screw, built on top of this: a clock that runs by the sun. All that machinery, Wren, built above a [i]lie[r]."

The printed name of the face of the sundial is "sundial".

Part 9 - Iron Door

Chapter 1 - Description

A room called the Iron Entry is west of the Henge. "The iron door is closed, hung between two stones as though it was just a curtain of metal and not a door at all. On its surface is embossed the Winding Key, but it looks small and feeble with the great gnomon behind.[paragraph break]Above the door is a head carved in brass. The Head’s eyes are watching me."

The printed name of the Iron Entry is "Iron Door".

Instead of waiting in the Iron Entry for the first time:
	say "It doesn’t do any good.";

Instead of waiting in the Iron Entry:
	say "[one of]It doesn’t do any good.[or]Still nothing.[purely at random]";

Chapter 2 - Scenery - Iron Door

The Iron Vault Door is a door, scenery, west of the Iron Entry, east of the Inner Vault. The Iron Door is closed and locked.

The printed name of the iron vault door is "iron door".

An unlocking rule for the iron vault door:
	rule fails;

Instead of opening the locked Iron Vault Door when the current script is empty:
	say "I try the door. It’s locked, of course.";
	change the current script to {SE_BRASSHEAD_1, SE_BRASSHEAD_2, SE_BRASSHEAD_3, SE_BRASSHEAD_4, SE_BRASSHEAD_5, SE_BRASSHEAD_6};

Instead of opening the locked Iron Vault Door:
	say "It’s locked tight, of course.";

After going through the iron vault door from the iron entry:
	say "I step through into the vault, expecting sudden stinging death any second.";
	continue the action;

Chapter 3 - Scenery - Brass Head

Section 1 - Description

A solid brass head is a person, scenery, in the Iron Entry. "The head is solid brass. Its dull eye-sockets stare right back at me. The expression could skin a cat.".

Section 2 - Script

The solid brass head has a number called the loop count. The loop count of the solid brass head is 0.

SE_BRASSHEAD_1 is a scripted event. The display text is "[one of]Then, with a terrible silence, the eyelids of the Brass Head slide open. It’s so smooth I don’t notice until it’s already staring at me. [or][stopping]The Head opens its mouth and speaks. 'Time. Is.'".

SE_BRASSHEAD_2 is a scripted event. The display text is "[one of]The Brass Head says nothing more. It’s eyes are watching me. It’s waiting.[or]The Brass Head is waiting.[stopping]".

SE_BRASSHEAD_3 is a scripted event. The display text is "The Brass Head speaks again. 'Time. Was.'".

SE_BRASSHEAD_4 is a scripted event. The display text is "The Head waits again[one of]. For me to prove myself, although I can’t think how[or][stopping].".

SE_BRASSHEAD_5 is a scripted event. The display text is "The Brass head speaks. 'Time. Past.'".

SE_BRASSHEAD_6 is a scripted event. The display text is "The eyes above the door snap closed. The chamber is silent once more.".

Section 3 - Script loop count

Before firing SE_BRASSHEAD_1:
	increment the loop count of the brass head by 1;

After firing SE_BRASSHEAD_4 when the loop count of the brass head is 1:
	say "If this door is the vault and the Head is a lock, then the Figure must know a way through. There’s no keyhole. No mechanism to be undone. Nothing the Abbott could have given him to get by, except perhaps a word.[paragraph break]But what word would serve as a key to the vaults?";

After firing SE_BRASSHEAD_6 when the loop count of the brass head is 1:
	say "This is where it ends then, Wren: this is how far you get. To the final door, where I’ll wait, Perpetuum in hand, until the Figure finds me and kills me, down here in the dark where no-one will ever find my body. If I’m really lucky he’ll fill me up with oil and spices and leave next to Brother Wilmslow.[paragraph break]I’m try to think of something comforting. All the Abbott’s old phrases. Covalt’s rough manner. The Archbishop – who spoke to me, a polisher! – and told me to be calm. Patience, he’d said. Patience is the key.[paragraph break]So I’d better be patient. The Figure will come, soon enough.";

After firing SE_BRASSHEAD_1 when the loop count of the brass head is 2:
	say "'Patience is the key.' The Brass Head is nothing but patient. For a crazy moment I wonder if I could somehow escape the Figure when he finds me here by pretending to be a machine, by standing as still – as patient – as the Head itself.[paragraph break]But it wouldn’t work. My arms are shaking. I’m tired. I’m sweating. I’m no machine. I’m just a fledgling. I don’t even know how I [i]got[r] here.";

After firing SE_BRASSHEAD_3 when the loop count of the brass head is 2:
	say "If there’s a word, I’m thinking, it must be a sacred word to survive in a place like this. Something from the Heart of the Church: something based on its precision, its perfect cog-teeth and meshing spokes. Every wheel within a wheel, every part in its place.";

After firing SE_BRASSHEAD_5 when the loop count of the brass head is 2:
	say "The Great Principles: Timing, Precision... something else? Something that talks to the tick-tock of things, the even pace of history, that never rushes and trips but always gets there in good time?";

After firing SE_BRASSHEAD_2 when the loop count of the brass head is 3:
	say "'Patience is the key,' I mutter to myself. 'Patience is the key.'[paragraph break]The Brass Head is [i]watching[r] me. It almost looks [i]hungry[r]."

After firing SE_BRASSHEAD_5 when the loop count of the brass head is 3:
	now the iron vault door is unlocked;
	now the iron vault door is open;
	change the current script to {};
	say "'Patience is the key...'[paragraph break]The Head frowns. 'Patience,' it replies.[paragraph break]The iron door swings open.";

Section 4 - Interaction

Rule for speaking with the solid brass head when SE_BRASSHEAD_1 is unfired:
	say "It’s a statue of a Head. It can’t hear me!" instead;

Rule for speaking with the solid brass head when the current script is empty:
	say "Nothing. [one of]The Head is totally lifeless. It’s not listening any more than the stones of the Henge listened to me whimpering on the way down the Gnomon. [or][stopping]Maybe I only dreamt that it moved." instead;

The conversation table of the solid brass head is the table of brass head conversation.

Table of brass head conversation
topic			conversation
"patience"		CT_HEAD_PATIENCE

The default topic of the solid brass head is CT_HEAD_WRONG

CT_HEAD_PATIENCE is a conversation topic.

Rule for firing CT_HEAD_PATIENCE:
	now the iron vault door is unlocked;
	now the iron vault door is open;
	change the current script to {};
	say "The Brass Head frowns slightly, as if concentrating. 'Patience,' it replies. Nothing happens.[paragraph break]Then the iron door swings open.";

CT_HEAD_WRONG is a conversation topic. The response text is "[one of]The Head raises a single eyebrow. 'No,' it intones.[or]The Head’s mouth arches down at the edges.[or]The Head rolls dull eyes.[or]'No,' the Head intones.[stopping]".

Part 10 - Inner Vault

Chapter 1 - Description

The Inner Vault is a room. "[one of]I woke up this morning a Second Assistant Clock Polisher, who would have been on slops-duty if I’d touched any mechanisms deeper in that the face. Now, somehow I don’t understand, through some kind of horrible accident – the kind that shouldn’t happen in a world that runs on clockwork – I’m in here, in the Inner Vaults of the Cathedral of Time.[paragraph break]The door swings shut behind me. Now I must be a relic too.[or]This room is completely bare, except for a steel altar like a fallen brick. Ticking quietly to itself on top is the Perpetuum[if the steel altar supports the decoy perpetuum mobile]. Or so it seems..[end if].[stopping]"

Chapter 2 - Scenery

Section 1 - Iron Door

After going through the iron vault door from the iron entry:
	now the iron vault door is closed;
	continue the action;

Rule for printing the description of the iron vault door when in the inner vault:
	say "The door has closed.";

Rule for deciding the concealed possessions of the iron vault door when in the inner vault:
	if the particular possession is the solid brass head:
		yes;
	no;

Rule for implicitly opening the iron vault door when in the Inner Vault:
	do nothing;

Section 2 - Steel Altar

The steel altar is a supporter, scenery, in the inner vault. "The altar is plain metal, almost dull. On the altar is [if the steel altar supports the decoy perpetuum]Covalt’s replacement for [end if]the Perpetuum."

Rule for printing the description of the real Perpetuum Mobile when the Inner Vault is visited:
	say "It’s more beautiful than I remember. The rolling bearing across its surface is like the sun on a hazing winter evening. Watching it is hypnotic.";

Instead of putting the decoy perpetuum mobile on the steel altar:
	try taking the real perpetuum mobile;

Does the player mean putting the decoy perpetuum on the steel altar:
	it is very likely;

Does the player mean taking the real perpetuum when the steel altar supports the real perpetuum:
	it is very likely;

Does the player mean taking the decoy perpetuum when the steel altar supports the decoy perpetuum:
	it is very likely;

Rule for printing the name of the decoy perpetuum mobile when the asking which do you mean activity is going on and the player can see the real perpetuum:
	say "decoy";

Rule for printing the name of the real perpetuum mobile when the asking which do you mean activity is going on and the player can see the decoy perpetuum:
	say "real one";

Rule for printing the name of the decoy perpetuum mobile when the clarifying the parser's choice activity is going on and the player can see the real perpetuum:
	say "decoy";

Rule for printing the name of the real perpetuum mobile when the clarifying the parser's choice activity is going on and the player can see the decoy perpetuum:
	say "real one";

After taking the real perpetuum mobile when the real perpetuum mobile was on the steel altar:
	now the decoy perpetuum mobile is on the steel altar;
	the figure comes in two turns from now;
	say "I make the sign of the Winding Key – twice, for luck – then lift the Perpetuum carefully from its place. There’s a tiny hiccup in the way it moves which makes me catch my breath … but then it continues.[paragraph break]In its place I put down Covalt’s replica. It’s a good match, especially in this light. Then I push the switch that Covalt told me to, to set the trap. And that’s that. It’s done.[paragraph break]Time to get out of here. Patience can go widdershins: I need to fly!";

Instead of taking the decoy perpetuum mobile when the decoy perpetuum mobile was on the steel altar:
	say "Testing the trap on myself could be a very costly mistake!";

Section 3 - Arrival of the Figure

Instead of opening the iron vault door when in the Inner Vault and the real perpetuum mobile is on the steel altar:
	say "I can't go yet!";

Instead of opening the iron vault door when in the Inner Vault and the decoy perpetuum mobile is on the steel altar and TRIG_FIGURE_ARRIVAL is unfired:
	fire TRIG_FIGURE_ARRIVAL;

Instead of opening the iron vault door when in the Inner Vault:
	say "He’s right outside! I’ll never slip past him!";

TRIG_FIGURE_ARRIVAL is a trigger.

At the time when the figure comes:
	fire TRIG_FIGURE_ARRIVAL;

Rule for firing unfired TRIG_FIGURE_ARRIVAL:
	the figure enters in two turns from now;
	say "That’s when I hear it. The voice of the Brass Head.[paragraph break]'Time. Is.'[paragraph break]It must be the Figure. Outside the door.";

TRIG_FIGURE_ENTERS is a trigger.

At the time when the figure enters:
	fire TRIG_FIGURE_ENTERS;

Rule for firing unfired TRIG_FIGURE_ENTERS:
	say "The door opens[unless we are hiding behind the iron vault door] and I press myself quickly behind it[end if]. Darkness enters like cold night wind through a hole in the roof. It is the Figure, moving as fast as only he can.[paragraph break]He wastes no time and goes straight to the altar. It’s all I can do to keep quiet while I’m watching. He picks it up – for a moment I think the trap has failed, but then I understand that Covalt has built it better than that: delaying the sting to make certain of getting the victim.[paragraph break]There’s a [i]crack[r] as the needle springs out. The Figure stops still. That’s it, I’m thinking, I’ve got him. I’ve got him![paragraph break]Then, slowly, the Figure puts down the decoy. He pulls the needle curiously from his arm. From the tilt of his hood I can see he’s regarding it – firstly curiously, then with anger.[paragraph break]He’s completely unharmed[if the player is dishonest]. Maybe I should have made the potion properly, like Covalt told me to! Or maybe it wouldn’t have mattered[end if]. Maybe the Figure can run, and jump and climb, and can’t be harmed.[paragraph break]In a single movement like a cat with a rabbit he tears the decoy apart. Guts and gears spill everywhere. The Figure picks one up, turns it over – then dashes away.[paragraph break]At least I’ve scared him, I think. But of course, I haven’t. Covalt made the decoy well, but he made it in a hurry, using whatever parts he could find. Parts that still bear his stamp. And his name.[paragraph break]A moment later, I’ve got the Perpetuum under one arm and I’m racing out the door.";

Section 4 - Hiding

Instead of hiding from view in the Inner Vault when TRIG_FIGURE_ARRIVAL is unfired:
	say "I don’t need to hide, I need to [if the decoy perpetuum is not on the steel altar]switch the Perpetuums and [end if]leave!";

Instead of hiding from view in the Inner Vault when TRIG_FIGURE_ARRIVAL is fired:
	say "Where? There’s nowhere!";

Instead of hiding behind the iron vault door when in the Inner Vault and TRIG_FIGURE_ARRIVAL is unfired:
	try hiding from view instead;

Instead of hiding behind the iron vault door when in the Inner Vault and TRIG_FIGURE_ARRIVAL is fired:
	say "It’s the best I can do: I flatten myself against the wall, behind the door.";
	fire TRIG_FIGURE_ENTERS;

Instead of hiding behind the steel altar when in the Inner Vault and TRIG_FIGURE_ARRIVAL is unfired:
	try hiding from view instead;

Instead of hiding behind the steel altar when in the Inner Vault and TRIG_FIGURE_ARRIVAL is fired:
	say "Great idea – except he’ll walk straight over to it and there I’ll be. [i]With[r] the real Perpetuum.";

Book 13 - Midnight

Midnight is a scene. Midnight begins when Return to the Cathedral ends.

When Midnight begins:
	move Covalt to Covalt's Bedroom;
	now Covalt is scenery; [described in room description] 
	change the state of Covalt to 1;
	move the Figure in Grey to Covalt's Bedroom;
	move the ravens to the bird cage;
	now the ravens are not scenery;
	end the chapter;
	say "If I’ve ever run so quickly I can’t remember when. My legs are moving faster than the four-tooth that drives the millisecond hand. Empty streets blur beneath my feet. The silent city streets are empty except for the sound of my breathing – and the shadow of the Figure, disappearing round every corner, slipping into the gloom of every alley way, ahead at every turn moving as fast as nightfall.[paragraph break]And I know I can’t catch up with him. I’m tiring, getting slower, winding down...[paragraph break]And then the bells begin to ring for midnight. All over the city and all at once. A hundred voices – high screeching bells, low bells that grumble the way Cook does, and every kind of bell in between. And they’re all shouting one thing: [i]faster, Wren, faster. However fast your clock ticks, tick faster[r].[paragraph break]And I find I can. Not winding down: breaking every Law, I’m winding up, soaking energy in. By the ninth chime I’m at the top of Escapement Street. By the tenth I’m outside Covalt’s shop. The plate glass window is shattered. I dart inside.";
	end the chapter;
	move the player to Clock Shop;
	change the current script to {SE_MIDNIGHT_1, SE_MIDNIGHT_2, SE_MIDNIGHT_3};

Part 1 - Clock Shop

Rule for printing the description of the Clock Shop during Midnight:
	say "The main room of the clock shop has been turned upside down, almost literally. There is nothing but wreckage.";

SE_MIDNIGHT_1 is a scripted event. The display text is "The eleventh chime barely covers an inhuman scream from the door to the south."

SE_MIDNIGHT_2 is a scripted event. The display text is "From the south comes a louder cry: something strangling, something else weeping.".

SE_MIDNIGHT_3 is a scripted event. The display text is "The crying is more than I can bear. The twelfth chime strikes and I rush through into Covalt’s bedroom.".

After firing SE_MIDNIGHT_3:
	move the player to Covalt's Bedroom;

After going to Covalt's Bedroom from the Clock Shop during Midnight:
	change the current script to {};
	continue the action;

Instead of hiding from view in the Clock Shop during Midnight:
	say "I can't. I've got to help him."

Section 2 - Wreckage

The clock shop wreckage is scenery. "The shop is reduced to rubble. No sign of Covalt though - no arms or legs sticking out."

Instead of searching or turning or pushing or hiding inside or hiding under the clock shop wreckage:
	say "Leave it, Wren. You've got to save Covalt!"

When Midnight begins:
	move the clock shop wreckage to the Clock Shop.

Part 2 - Bedroom

Chapter 1 - Description

Rule for printing the description of Covalt's Bedroom during Midnight:
	say "The skylight is broken. The bed is in pieces. One wall is half-rubble, and that’s where Covalt is, pinned in place by a shadow. The Figure, leaning over him, with murderous intent[one of]. [paragraph break]I can feel my lucky clock key, cold against my chest. No-one to save you now, Wren. No clockwork making it easy for you[or].[stopping]"

Instead of going north from Covalt's Bedroom during Midnight:
	say "I can’t leave him!";

Chapter 2 - Scenery

Section 1 - Feather Bed

Rule for printing the description of the feather bed during Midnight:
	say "The feather bed has been snapped in three.";

Instead of doing something when the feather bed is physically involved during Midnight:
	say "This is not time for sleeping!";

Section 2 - Wreckage 

Rule for printing the description of the wrecked skylight during Midnight:
	say "Bits of my balloon are hanging from the skylight like dirty moss.";

Instead of doing something when the wrecked skylight is physically involved during Midnight:
	say "There won’t be any help coming in that way!";

Section 3 - Ravens

Rule for printing a locale paragraph about the bird cage during Midnight:
	if the state of Covalt is 1:
		say "The awful screaming is coming from Covalt’s ravens. They’re in their cage, tearing against it, trying to get themselves free!";
	continue the activity;

Rule for printing a locale paragraph about the Ravens during Midnight:
	say "The ravens circle the Figure, blinding him!";

Rule for printing the description of the Ravens during Midnight:
	if the state of Covalt is 1:
		say "Covalt’s ravens are clawing and pulling at the cage bars, trying to get free!";
	otherwise if the state of Covalt is at most 3:
		say "The ravens are circling the inhuman Figure, clawing and pecking at his iron face!"; 

Section 4 - Cage

The bird cage is a closed transparent container, openable, scenery, in Covalt's Bedroom. "[if the bird cage is closed]The cage is closed with a small hook.[otherwise]The cage has sprung open.";

After opening the bird cage when the state of Covalt is 1 during Midnight:
	change the state of Covalt to 2;
	move the ravens to Covalt's bedroom;
	say "I throw the latch on the cage and the birds explode out, filling the room with gigantic black wings. If the Figure is a shadow then these creatures are the night itself, and they’re too fast for him to catch! One keeps him busy, flailing his arms, while the other goes for his hood pulling it back.[paragraph break]Covalt gasps. So do I. The Figure’s head is not a head at all, but a moulding of brass like the one in the crypt, held by a thin rod from shoulders of steel.[paragraph break]'You’re an automaton!' Covalt cries. 'I didn’t know it was possible...'[paragraph break]The Figure is still too busy fighting off the birds to reply. That’s when I see it: a dark crack in the back of its neck. The winding slot, where his key must go. No wonder it always wore that hood.";

Section 5 - Covalt

Rule for printing the description of Covalt when the state of Covalt is 1 during Midnight:
	say "Covalt is held tight against the wall by the Figure!";

Rule for printing the description of Covalt when the state of Covalt is 2 during Midnight:
	say "The ravens are keeping the Figure busy, but it’s still not enough for Covalt to break free. He needs my help!";

Rule for printing the description of Covalt when the state of Covalt is 3 during Midnight:
	say "Covalt is pinned, but there’s a grin on his face. He knows what to do – only if he tries to tell me, the Figure will know I’m here and I’ll have lost my only chance.";

Rule for printing the description of Covalt when the state of Covalt is 4 during Midnight:
	say "Don’t look at him, Wren, help him!";

Instead of doing something when Covalt is physically involved and the state of Covalt is 1 during Midnight:
	say "The Figure is in the way. I need to throw him off balance, somehow!";

Instead of doing something when Covalt is physically involved and the state of Covalt is 2 during Midnight:
	say "The ravens aren’t enough to get the Figure out of the way!";

Instead of doing something when Covalt is physically involved during Midnight:
	say "The only way to help him is to bring the Figure down!";

First for firing COVALT_COUNTER during Midnight:
	do nothing;

Every turn when in Covalt's Bedroom and the state of Covalt is 1 during Midnight:
	say "[one of]The Figure seems taller again in the darkness. One gloved hand holds Covalt by the neck, a little way off the ground. 'Give me the Perpetuum,' he hisses. 'Be assured, I will kill you for it!'[or]Covalt’s eyes move – he’s seen me. But he doesn’t cry out. Then I realize: the Figure doesn’t know I’m here. I’ve got a chance to surprise him![or]Covalt moves his eyes away from me, maybe so the Figure won’t catch my reflection in them.[or][desperately thinking loop][stopping]";

To say desperately thinking loop:
	say "[one of]Think, Wren, think![or]Or if thinking doesn’t work, just do something![or]No time to lose![cycling]";

Every turn when in Covalt's Bedroom and the state of Covalt is 2 during Midnight:
	fire TRIG_COVALT_FIGURE_2;

TRIG_COVALT_FIGURE_2 is a trigger.

Rule for firing fired TRIG_COVALT_FIGURE_2:
	change the state of Covalt to 3;
	say "'You’re a machine,' Covalt growls. 'Just some two-bit machine run amok with gremlins in your gears.'[paragraph break]The Figure’s voice is impassive, just as it always has been. 'Better a machine than a feeble man.'[paragraph break]But Covalt grins, and the sight makes my heart soar with pride. 'Machines are fine,' he says. 'Till they need repairing. That’s when they come to me. When someone’s jammed something in their winding slot and snapped their spring.'";

TRIG_COVALT_FIGURE_3 is a trigger.

Every turn when in Covalt's Bedroom and the state of Covalt is 3 during Midnight:
	fire TRIG_COVALT_FIGURE_3;

Rule for firing fired TRIG_COVALT_FIGURE_3:
	change the state of Covalt to 4;
	say "'Now!' Covalt shouts. 'Jam something in, whatever you’ve got!'";

Section 6 - Figure

The winding slot is part of the Figure in Grey.
The wound spring is part of the winding slot.

Rule for deciding the concealed possessions of the figure in grey:
	if the particular possession is the winding slot: 
		if Midnight is happening and the state of Covalt is not 1:
			no; [winding slot has been revealed by the ravens...]
		yes; [...otherwise it is concealed...]
	no; [...but nothing else is! -- e.g. cloak.]

Rule for printing the description of the figure in grey when the state of Covalt is 1 during Midnight:
	say "The Figure looms over Covalt like a gigantic rearing slug.";

Rule for printing the description of the figure in grey when the state of Covalt is 2 during Midnight:
	say "It’s almost impossible to believe: all that speed, all the strength, that voice... all in a machine...";

Rule for printing the description of the figure in grey during Midnight:
	say "The ravens are keeping the Figure busy but not busy enough. He’ll never tire!";

Instead of attacking the figure in grey during Midnight:
	say "The Figure is more powerful than me. I’ve got the element of surprise on my side... and nothing else.";

Instead of unlocking the figure in grey with something when the player can see the winding slot:
	redirect the action from the figure in grey to the winding slot, and try that instead;

An unlocking rule for the figure in grey:
	if the player can see the winding slot and the player can see my lucky clock key:
		rule succeeds with result my lucky clock key;
	otherwise:
		rule fails;

Section 7 - Game end

An unlocking rule for the winding slot:
	if the player can see my lucky clock key:
		rule succeeds with result my lucky clock key;
	otherwise:
		rule fails;

Instead of unlocking the winding slot with my lucky clock key:
	try attacking the wound spring instead;

Instead of inserting my lucky clock key into the winding slot:
	try attacking the wound spring instead;

Instead of attacking the wound spring:
	now the player wears my lucky clock key;
	try attacking the wound spring with my lucky clock key instead;

Instead of attacking the wound spring with my lucky clock key:
	say "The winding slot on the Figure's neck is a thumb-width big. A tiny target, like fitting a tweezer's head into the cracks of a mesh-system. But precision is what clockwork’s all about. I’ve a novice. I’ve trained. And I know that the winding slot goes all the way in. Right into the Figure’s clockwork soul.[paragraph break]I grab the key from around my neck and plunge it in. The Figure doesn’t notice – it can’t feel! – until I start to turn.[paragraph break]The spring begins to coil. The Figure jerks up, releasing Covalt, who falls back to the floor. It struggles to turn, trying to make a grab for me, but the ravens on either side are battering it back. I only need another turn or two. The spring inside the neck is getting almost impossible to move and then...[paragraph break]CRACK![paragraph break]I can hear the spring spinning off inside the Figure’s chest. Hear the awful noise as it catches in a mechanism deep inside. I quickly make the sign of the Winding Key as the Figure crumples: first one leg, then the other. The floor shakes as it falls.[paragraph break]The last of its energy is enough to look up at me. 'You,' it hisses through lips that don’t move as it speaks. Its voice sounds almost sad. 'You know not what you do.'[paragraph break]And then, silence. The ravens settle, one on each of Covalt’s shoulders. The old man looks exhausted, his face the colour of bruised tomatoes.[paragraph break]'That’s the most incredible piece of clockwork I ever saw,' he says slowly, furiously, his eyes glowing with anger. 'And you just destroyed it.'[paragraph break]Can Covalt really be angry that I...[paragraph break]'That was well done, young Wren.' He coughs. 'But I tell you, when I build something like that metal man, I’m going to give him an off-switch. Stupid to have to break such a fine machine. Whoever built that... a genius.' He strokes his beard, and gets to his feet – taking the Perpetuum from me as he does so. He’s looking back to normal already: a sour-faced moody old man. 'A genius, and an idiot, too.'[paragraph break]'But who was it?' I demand. 'Who built it?'[paragraph break]'That’s the question,' Covalt answers, gravely. 'For every spring that’s wound on this Earth, there’s a human hand turning the key. No divine mechanics down here. We may be free of this thing –' and he lands a kick squarely in the still automaton’s chest - 'but someone out there was behind it. Someone planning an army and after the Perpetuum. We may be free of the clockwork today, young Wren. But we’re not free of the clockmaker.'";
	end the game in victory;

Book W - Walkthrough Script

Test jonsprogress with "test intro / test abbey-garden / test cathedral / test clockchase / test rooftops / test covalt / up / show order to guards / w / nw / n / e / z / z / d / x dials / get key / s / w / unlock abacus / set abacus to 14936 / e / e / unlock abacus / set abacus to 78325 / w / pull lever ".

test cheat7 with "test intro / gonear street / purloin work order".

Test tochapter7 with "test intro / test abbey-garden / test cathedral / test clockchase / test rooftops / test covalt".

Test walkthrough with "test intro / test abbey-garden / test cathedral / test clockchase / test rooftops / test covalt / test countinghouse / test outsidewarehouse".

Test intro with "z/w/hide in clock/put tumbler on door/z/z/z/z/z/out/open door/w/w".

Test abbey-garden with "d/e/sw/e/get cup/e/n/put cup in bracket/hide in pantry/s/s/smell/take leaf/s/put tea in basket /x train / get gear / turn spigot / wind key / w / sw / sw / sw / w / get new gear / ne / take keys / e / e / e / e / e / n / put new gear in train / pull lever / n / z / z / z / s / take cup of tea / w  / sw/ sw / sw  /w / ne / put tea on table / get keys / get keys / e / e / e / e / up / w / n / w / w / take ladder / e / sw / e / e / e / put ladder against wall / up / w/drop rag/ w".

Test abbey-clock with "d/e/sw/e/get cup/e/n/put cup in bracket/hide in pantry/s/s/smell/take leaf/s/put tea in basket /x train / get gear / turn spigot / wind key / w / sw / sw / sw / w / get new gear / ne / take keys / e / e / e / e / e / n / put new gear in train / pull lever / n / z / z / s / take cup of tea / w / sw / sw / z / w / ne / put tea on table / get keys / get keys / e / e / e / unlock clock / open clock / set clock to 5 pm / set clock to 5 pm / w / w / sw/ sw / w / w / drop rag / w".

Test abbey2 with "d/e/sw/e/get cup/e/n/put cup in bracket/w/w/z/z/z/e/e/get tea/x train/get gear/turn spigot/wind key/put tea in basket/w/sw/sw/w/get new gear/ne/e/ne/e/put new gear in train/pull lever/z/z/z/w/w/z/z/z/e/e/e/get tea/w/sw/sw/sw/w/put tea on table/get keys/get keys/e/e/e/unlock clock".

test cathedral with "w/n/e/get blue/get red/get yellow/w/n/n/w/sw/open tome/get knife/ne/e/s/s/w/put red in brazier/put blue in brazier/get purple with knife/e/n/n/e/se/take work order/nw/w/w/sw/look up principia planetaria in catalogue/test steel/test brass/test gold/pull chain/ne/e/e/se/give principia to sa'at/take order/nw/se/give wax to sa'at/get order/nw/w/n/e/give work order to doric/give work order to doric/n/lever, spring, winding key".

test clockchase with "z/z/z/nw/z/z/sw/u/z/z/z/z/jump/u/hold chain/pull lever/d/out/z/z/z/w/jump".

test rooftops with "sw/scrape mortar with knife/get bricks/ne/se/sw/drop bricks/ne/get plank/sw/put plank in notch/put bricks in notch/ne/get pipe/sw/get tarp/e/put pipe on chimney/put tarp on chimney/turn pipe sw/w/s/nw/turn compass south/turn crank/look through telescope/se/put balloon on vent/z/z/get in basket ".

test steel with "turn steel crank 6 times/turn steel crank backwards 9 times".

test brass with "turn brass crank".

test gold with "turn gold crank 7 times/turn gold crank backwards 3 times".

test covalt with "tell giant about balloon / tell giant about figure / tell covalt about abbot / tell covalt about perpetuum / x table / x shelves / x clocks / x tools / x workbench / x brown lump / x water clock / ask covalt about difference / out".

test countinghouse with "up / show order to guards / w / nw / n / e / z / z / d / x dials / get key / s / w / unlock abacus / set abacus to 14936 / e / e / unlock abacus / set abacus to 78325 / w / pull lever / z / get card / n / w / w / ne / e / e".

test outsidewarehouse with "n/e/n/x rubble/get wrench/w/w/unscrew bolts with wrench/unscrew bolts with wrench/unscrew bolts with wrench/w/unscrew bolts with wrench/unscrew bolts with wrench/enter drain/drop wrench/u".

test insidewarehouse with "x junk / get ladder / put ladder against pipe / get rope / put rope on pipe / tie rope to crate / get ladder / get rope / s / put ladder against pipe / put rope on pipe / tie rope to door / n / push crate down drain / s / get ladder / e / pull lever / turn bolt with wrench / push button / pull lever / turn bolt with wrench / stand ladder / down / open men".

test covaltreturn with "ask covalt about me / tell covalt about dockyard / tell covalt about me / tell covalt about himself / no / x diagram / sw / nw / buy b2 / buy a4 / buy c2 / no / put poppy seeds in press / pull lever / put tincture in press / put oil in press / pull lever / se / ne / give drug to covalt"

test returncathedral with "e/n/e/put candle in lantern / w / n / z / z / n / e / ne / w / n / e / x carvings / in / drop perpetuum / in / u / open door / get weights / e / open drawer with knife / open drawer / get key / w / d / out / s / s / e / ne"

test crypt with "d"

Book X - Not For Release - Fixing the RNG

When play begins:
	seed the random-number generator with 1234;

Xyzzying is an action out of world.
Unxyzzying is an action out of world.
Understand "xyzzy" as xyzzying.
Understand "unxyzzy" as unxyzzying.

Carry out xyzzying:
	seed the random-number generator with 1234;

Report xyzzying:
	say "A hollow voice whispers 'groo.'";

Carry out unxyzzying:
	seed the random-number generator with 0;

Report unxyzzying:
	say "A hollow voice whispers 'oorg.'";

Book Y - Not For Release - Alpha Testing

test quarters with "x desk / x designs / x scratches / x cot / x blanket / x bust / x window / x door / x pendulum / x weights / x weight of precision / x counterweight / x counterweight of slapdashery / x figure / x abbot";






