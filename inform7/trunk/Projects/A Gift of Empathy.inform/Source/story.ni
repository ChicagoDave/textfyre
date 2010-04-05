"The Empath's Gift" by Textfyre

[
Include (- Constant DEBUG; -) after "Definitions.i6t".
]

[  Change Log
When                 Who                     What
05-Apr-2010 	R. Newcomb		Michelle 3/29, Aidan 3/02, Rooms01 3/09, Paul's transcript 2010-01-23
28-Feb-2010 	R. Newcomb		Michelle, Brad, Inquiring it about, various improvements
1-Sep-2009	G. Jefferis	Wandering orderly
31-Aug-2009	G. Jefferis	Chapter 4 - Hospital scene
26-Aug-2009	G. Jefferis	Chapter 3 mostly done - Maelstrom maze.
25-Aug-2009	G. Jefferis	Chapter 2 mostly done.
24-Aug-2009	G. Jefferis	Chapter 2 begun: FOCUS command, conversations with Stacy & Ava, chat with Lucian.
17-Aug-2009	G. Jefferis	Chapter 1 tidied up and now solvable
03-Aug-2009	G. Jefferis	Conversation points
29-Jul-2009	G. Jefferis	Option events on entering
25-Jul-2009	G. Jefferis	More scenery
23-Jul-2009	G. Jefferis	Scenery and goals extension
22-Jul-2009	G. Jefferis	Map for first chapter and scenery
14-Jul-2009	G. Jefferis	Start Project
]

Use no scoring, American dialect and full-length room descriptions.
The story creation year is 2009.

Include FyreVM Support by Textfyre.
Include Punctuation Removal by Emily Short.
Include Basic Screen Effects by Emily Short.

Include Textfyre Standard Rules by Textfyre.
Include Textfyre Standard Backdrops by Textfyre.
Include Triggers by Textfyre.
Include Quips by Textfyre.
Include Basic Followers by Textfyre.
Include Counters by Textfyre.
Include Conversation Topics by Textfyre.
Include Scripted Events by Textfyre.
Include Goals by Textfyre.

Include Test Suite by Textfyre.
Include Parse List by Textfyre.


Book - Initialisation

Part 0 - Beating memory constraints

Use MAX_STATIC_DATA of 400000.
Use MAX_OBJECTS of 1024.

[these I wrap around anything that I don't want in the debug build, such as PAUSE THE GAME which breaks re-runs]
To say ifndef debug: (- #ifndef DEBUG; -).
To say enddef debug: (-  #endif; RunParagraphOn(); -). 



Part 00 - Fixing the index map

Index map with Courtyard mapped north of first floor midpoint.
Index map with Front Lawn mapped south of first floor lobby west.
Index map with Second Avenue mapped southwest of first floor rooms west.
Index map with Calvin Field North mapped northeast of First Floor Lobby East.
Index map with Calvin Field South mapped southeast of First Floor Lobby East.
Index map with Info Desk mapped south of First Floor Midpoint.
Index map with Info Desk mapped north of First Floor Lobby West.

Part 1 - Set up

Use numbered rules.

To say (p - a person) quips (q - a quip): start conversation with p on q. [ the former system of using ASK Person ABOUT "Topic" was broken because, in the "conversation table of the Person", the topic column has to have the topics for all the objects in the game re-listed within it. This is error-prone, laborious, and destroys any parsing intelligence such as disambiguation, scope, does-the-player-mean fine tuning, etc.  So I've created an ASK Person ABOUT Object which consults the "object-based conversation table of the Person" for objects, once Inform has run its full parsing AI on what the heck the player meant by "TAKE RED". The above Say phrase allows me to marry the ASK ABOUT Object system's parsing to the pre-existing Quip system's dialogue-threading. Win-win. ]

To decide which table-name is the empty table: (- TheEmptyTable -). [uninitialized table-name parameters get this]

To say try (act - an action) -- running on: 
	(- RunParagraphOn();  {act}; RunParagraphOn(); -). 
[used within "Understand...as a mistake" and Ask About replies to effect how-to-play instructions and gamestate change. Very handy.]


Chapter 1 - Banner Text

Rule for printing the banner text:
	select the title channel;
	say "[b][story title][r][line break]";
	select the credits channel;
	say "[story title] by [story author][line break]";
	say "Copyright [story creation year] by [story author][line break]";
	say "Designed by Paul O'Brian[line break]";
	say "Written by Christopher Huang[line break]";
	say "Game Engine (FyreVM) by Jesse McGrew[line break]";
	say "Inform 7 Programming by Graeme Jefferis[line break]  and Ron Newcomb[line break]";
	say "Testing by ____[line break]";
	say "Special thanks to Graham Nelson and Emily Short[line break]";
	say "for all of their hard work on Inform 7.[line break]";
	say "All rights reserved[line break]";

Chapter 2 - Passage of Time

A term day is a kind of value. Day 10 specifies a term day.

The current term day is a term day that varies. The current term day is Day 2.

When play begins:
	change left hand status line to "[Current term day]: [location]";
	change right hand status line to "[time of day]";

The chapter num is a number that varies. The chapter num is usually 1. [TODO]

To decide whether in chapter/chapters (N - a number): decide on whether or not the chapter num is N.
To decide whether in chapters/chapter (N - a number) through/thru/thorugh (M - a number): decide on whether or not the chapter num is at least N and the chapter num is not greater than M.

The land of the dead is a room. [TODO]
The mindscape is a room. [TODO]
The dreamscape is a room. [TODO]
There is a scene called the Battle with the Thief.  [TODO]
Deepest place is a room. [TODO]
To In The Battlefield see Chapter 07: placeholder "To be continuted: In The Battlefield, see Chapter 07."
To Go straight to section (txt - some text) in Chapter 09 text: placeholder "Go straight to section ['][txt]['] in Chapter 09 text."
Daniel's photograph is a thing. [todo] [FOCUS ON AIDEN, chapter 8]
To does a chapter change go here: placeholder "does a chapter change go here?"

section 1 - not for release
	
Understand "chapter" as a mistake ("Currently in chapter [the chapter num]."). Understand "chapter [number]" as a mistake ("Now pretending we're in chapter [set chapter num to number understood][the chapter num]."). To say set chapter num to (N - a number): now the chapter num is N; if the chapter num > 10, now the chapter num is 10; if the chapter num < 1, now the chapter num is 1.

Chapter 3 - Options

Rule for deciding whether all includes scenery:
	it does not;

Part 2 - The player

Chapter 1 - Description

Rule for printing the description of yourself:
	placeholder "A description of the player.";

Chapter 2 - Belongings

The player carries the items list for the scavenger hunt.

The items list for the Scavenger Hunt is a thing. The description is "A newspaper[line break]A feather[line break]A flag[line break]A star[line break]A dinosaur[line break]A hat[line break]Something that was once alive"

Understand "item", "of items" as the items list for the Scavenger Hunt.

Before printing the name of the items list for the Scavenger Hunt when we have not examined the items list for the scavenger hunt:
	say "unread ";

Rule for printing the name of the items list for the Scavenger Hunt:
	say "list of items for the Scavenger Hunt";

The player carries some dollars. The indefinite article of the dollars is "a few".

Understand "few", "dollar", "note", "money", "cash", "greenbacks", "buck", "bucks" as the dollars.

Last carry out taking inventory:
	list the player's goals;

Part 3 - Introduction

The time of day is 7:05 PM.

When play begins:
	say "It's your second year at the LEAP summer camp, and so far it's been as great as you remember last year to have been.  Ava Winters and Stacy Alexander, whom you met last year (and whom your brother Aidan calls 'your girlfriends', much to your embarrassment) are here again.  You spent yesterday catching up on the news in between options and classes, and now you're settling in with the smug sensation of not being a raw newbie any more.[paragraph break]The LEAP summer camp isn't quite the same as most summer camps.  LEAP is an acronym for 'Learning Enrichment Activity Program'; the brainchild of world-renowned educator Professor Damon Rose, it is housed on the campus of the University of Colorado at Valmont, and was created for Gifted and Talented Kids (gosh, that sounds impressive) to expand their horizons and encourage them to stretch their mental capabilities.[paragraph break]Whatever. That's all in the promotional flyers. You just know that you're in for two weeks of the sort of interesting classes you don't get in school, and a bunch of fun options with which to fill up the free time after classes.  This evening, for instance, you've signed up for a scavenger hunt....";
	say ifndef debug;
	pause the game;  [this breaks the skein otherwise]
	say enddef debug;
	say "LEAP, Day 2.  Evening.[paragraph break]'Okay, kids!' Michelle, the counselor in charge of the scavenger hunt option waves her hands to settle the crowd around you, before finally remembering her whistle.  A brief [i]fweep[r] sweeps through the room.  'Okay, does everyone have their list?  Everyone good?  Okay!  You have until 8:25 pm to find everything on your lists, return here, and show me your lists so I can check them.  So synchronise your watches... are we all in sync?  Good!  Your time starts... now!'[paragraph break]Michelle's whistle gives another sharp fweep, and the room practically empties as everyone else runs off to begin their hunt."; 

Book - Actions

Part 1 - Focus

Focusing on is an action applying to one visible thing. 

Understand "focus on [something]", "focus [something]", "focus", "focus on", "feel", "sense" or "sense [something]" as focusing on[ when the player has been aware of an emotional residue].   [removed the condition to remove parser error on FOCUS commands -- it set up false expectations that the words are unknown by the game]

Rule for supplying a missing noun when focusing on:
	if there is a salient emotional residue:
		change the noun to a random salient emotional residue;
	otherwise:
		change the noun to the location;

Report focusing on an emotional residue:
	consider the focusing rules for the noun;

Report focusing on a room:
	say "You sense nothing untoward or out of the ordinary here.";

The focusing rules are an object-based rulebook.

Part 2 - Folding (newspaper)

Folding is an action applying to one carried thing.

[Understand "fold [Star-Spangled Banner]" as folding.
Understand "fold up [Star-Spangled Banner]" as folding.
Understand "fold [Star-Spangled Banner] up" as folding.
Understand "fold [Star-Spangled Banner] into [text]" as folding it into.
Understand "fold [Star-Spangled Banner] up into [text]" as folding it into.
Understand "fold up [Star-Spangled Banner] into [text]" as folding it into.]

Understand "fold [something preferably held]" as folding.
Understand "fold up [something preferably held]" as folding.
Understand "fold [something preferably held] up" as folding.

Folding it into is an action applying to one thing and one topic.

Understand "fold [something preferably held] into [text]" as folding it into.
Understand "fold [something preferably held] up into [text]" as folding it into.
Understand "fold up [something preferably held] into [text]" as folding it into.

Check folding something into:
	try folding the noun instead;

Check folding something:
	placeholder "You can't fold that.";

Part 3 - Playing (the piano)

Playing is an action applying to one thing.

Understand "play [thing]" as playing. 

Check playing the piano:
	say "You amuse yourself with 'Chopsticks'." instead.

Check playing:
	say "You fool around with it until your ears bleed.  Which wasn't long." instead.


Part 4 - Knocking

Knocking on is an action applying to one thing.

Understand "knock [door]" as knocking on.
Understand "knock on/at [door]" as knocking on.

Instead of attacking a door:
	try knocking on the noun;

Check knocking on:
	say "You get no reply."

Part 5 - Hiding it under

Hiding it under is an action applying to two things.

Understand "hide under [something]" as hiding it under. 
Understand "hide [something] under [something]" as hiding it under (with nouns reversed). 

Rule for supplying a missing noun while hiding something under: now the noun is the player.

Check hiding something under: say "Oh, very funny."

Check hiding yourself under: say "Why?  You don't have to hide from anyone."

Check hiding yourself under when in chapter 8: say "Aidan may be pumped full of sedatives, but they're not going to make him stupid enough to miss you crawling under there!"


Part 6 - Shouting

Section 1 - Shouting at

Shouting at is an action applying to one visible thing.

Understand the command "shout" as something new.
Understand "shout" as shouting at.
Understand "shout at/to [someone]" as shouting at.
Understand "call to/at/over [someone]" as shouting at.
[Understand "shout at/to [something]" as shouting at.
Understand "call to/at/over [something]" as shouting at.]

Understand "shout [text] at/to [someone]" as answering it that (with nouns reversed).
Understand "call [text] to [someone]" as answering it that (with nouns reversed).

Understand the command "yell" as "shout".
Understand the command "scream" as "shout".
Understand the command "cry" as "shout".
Understand the command "bellow" as "shout".
Understand the command "wail" as "shout".
Understand the command "yelp" as "shout".

Rule for supplying a missing noun when shouting at:
	change the noun to the location;

Check shouting at something which is not a person:
	placeholder "There's no use shouting at [the noun]." instead.

Check shouting at yourself:
	placeholder "Must you berate yourself?" instead;

Check shouting at the location:
	placeholder "Must you draw attention to yourself?" instead;

Check shouting at someone:
	placeholder "Must you draw attention to yourself?" instead;

Part 7 - Kicking

Kicking is an action applying to one thing. Understand "kick [something]" as kicking. 
Check kicking something (this is the block kicking rule): say "You don't know kung fu!" instead.
[Instead rules override in particular circumstances for specific messages ]


Part 8 - inquiring someone about an object

[ASK ABOUT for objects.  This is much less error-prone for programmers/writers creating conversation tables as they needn't ensure the table's Topic column explicitly re-lists all the synonyms for each object X .  Furthermore, in case of name clashes, like "paper hat" and "paper" (for newspaper), the player gets the nicety of Which Did You Mean.  
For each character, use like the following.  Note that the default reply is the first row of the table. This allows it to be character-specific without writing additional rules or proxy objects. 
Replies with [if..] constructs may need a [run paragraph on] construct within them. (It's either putting RPO in half of them, or putting [line break] in the other half of them.) 
The column "conversation" is named specifically because the topic conversation table uses "conversation" as an object column too.  This makes certain coding tricks easier... such as combining the two tables into a single one of 3 columns. ]

[
The object-based conversation table of Mr So-and-so is the table of so-and-so's replies.

Table of so-and-so's replies
conversation 			reply
an object				"The first row is the default i-don't-know response.[line break]"
his red right hand			"A great song."
one red shoe				"A great movie."
]

A person has a table-name called the object-based conversation table. 

Understand "ask [someone] about [any thing]" or "ask about/-- [any thing]" or "a about/-- [any thing]" as inquiring it about. Inquiring it about is an action applying to one thing and one visible thing.

Report inquiring something about a conversation listed in (the object-based conversation table of the noun): say "[the reply entry][line break]" instead.

Last report inquiring it about when (the object-based conversation table of the noun) is not the empty table: 
	choose row 1 in the object-based conversation table of the noun;
	say "[the reply entry][line break]" instead.

Last report inquiring it about when (the object-based conversation table of the noun) is the empty table: 
	try talking to the noun instead.

Instead of asking someone about "themself/theirself/himself/herself", try inquiring the noun about the noun.

[Rule for supplying a missing second noun when inquiring something about: if the number of people in the location who are not the player is 1 begin; change the second noun to the noun; change the noun to a random person in the location who is not the player; say "([current action])[command clarification break]"; end if.]

[extend same niceties to ASK ABOUT Topic]
[Understand "ask about/-- [text]" or "a about/-- [text]" as asking it about. 

Rule for supplying a missing noun when asking something about: if the number of people in the location who are not the player is 1, change the noun to a random person in the location who is not the player.]

Part 9 - auto-EXITS

[The action is in the Textfyre Standard Rules, but as a novice player myself, EXITS is much more useful as a response to Going Nowhere than the standard response... or even as an explicit EXITS command itself.  --Ron]

Before going nowhere, try listing exits instead. 

After printing the name of a direction (called the way) while listing exits:
	if the room way from the location is visited, say " (to [the room way from the location])".

Understand "go","walk","run" or "go [text]","walk [text]","run [text]" as a mistake ("[run paragraph on][try listing exits][run paragraph on]  ").

First carry out going when the room gone to is exterior and the room gone from is interior: say "You step out into the bright sunshine."

First carry out going when the room gone to is interior and the room gone from is exterior: say "You leave behind the bright sunshine."


Part 10 - inventory rather than silliness

[this game uses FOCUS/SENSE/FEEL for its main dramatic action. But it's a transitive verb, so its only a matter of time until the typical kid types FEEL ME or TOUCH ME.  In that case, INVENTORY, as a sentence.]

First check touching yourself: say "You pat yourself down.  You have "; list the contents of the player, as a sentence, including contents; say "." instead.


Part 11 - kinds of talking

Asking someone about is conversing.
Asking someone for is conversing.
Inquiring someone about is conversing.
Talking to someone is conversing.
Telling someone about is conversing.

Part 12 - examing unimplemented things

[Section 1 - for release only 

Check room-examining when the noun is not visited: say "You've never been there, so you can't recall." instead.    [todo comment me back in]
]

Section 2 - always


Understand "x [any room]" or "examine [any room]" as room-examining. room-examining is an action [out of world] applying to one visible object. Does the player mean room-examining the location: it is very likely.  Rule for clarifying the parser's choice of the location: do nothing. Check room-examining when the noun is not the location: say "You're not there to look at it.  You're pretty sure you can get there by going [directions from the location to the noun]." instead. Carry out room-examining: try looking.

Your room is visited.

[I am so proud of myself for being able to write this without using global variables, and only one local variable. :)  -RN]
To say directions from (source - a room) to (destination - a room):
	if source is not a room or destination is not a room:
		say "... well actually you have no idea";
		stop; 
	let aim be the best route from the source to the destination, using doors; 
	if aim is not a direction:
		say "... well actually you're not quite sure";
		stop; 
	now source is the room aim from the source;
	if the source is the destination, say "[unless the destination is the room aim from the location]and [end unless][aim]";
	otherwise say "[aim], [directions from source to destination]".


Understand "x [text]" or "examine [text]" as unknown-examining. unknown-examining is an action [out of world] applying to one topic. Check unknown-examining: [out-of-world actions don't set THE TOPIC UNDERSTOOD. reported to graham ]
	let possible term be indexed text;
	let possible term be the topic understood;
	replace the text "\b(the|a|an|my|his|her|your|their|our|another)\s" in the possible term with "";
	replace the text "\B(es|s)\b" in the possible term with "";
	if the description of the location matches the text possible term, case insensitively:
		say "[one of]The [possible term] doesn't look very interesting.[or]The [possible term] looks like every other [possible term] you've ever seen.[or]You don't think the [possible term] is all that interesting, really.[or]It's very [possible term]-like.[at random]";
	otherwise:
		say "You can't see such a thing." instead;

Part 13 - score

Understand the command "score" or "full score" as something new.
Understand "score" or "full score" as score printing. Score printing is an action out of world. Carry out score printing: list the player's goals.




Book - Definitions

Part 1 - Scavenger Hunt

A scavenger hunt goal is a kind of goal. Some scavenger hunt goals are defined by the table of scavenger-hunt-goals.

Table of scavenger-hunt-goals
scavenger hunt goal	printed name
the newspaper-goal	"find[if achieved]ing[end if] a newspaper"
the feather-goal		"find[if achieved]ing[end if] a feather"
the flag-goal		"find[if achieved]ing[end if] a flag"
the star-goal		"find[if achieved]ing[end if] a star"
the dinosaur-goal		"find[if achieved]ing[end if] a dinosaur"
the hat-goal		"find[if achieved]ing[end if] a hat"
the life-goal		"find[if achieved]ing[end if] something that was once alive"

A goal-scoring rule for a scavenger hunt goal (called G):
	if the player has something that fulfills G:
		goal achieved;

When play begins:
	change the current goals to the list of scavenger hunt goals;

Fulfillment relates various things to various scavenger hunt goals.

The verb to be fulfilled by implies the reversed fulfillment relation.
The verb to fulfill (he fulfills, they fulfill) implies the fulfillment relation.

Part 2 - Options

An option is a kind of thing. An option is usually scenery.

Instead of taking an option, say "Maybe tomorrow."

instead of Listening when the school of rock option is in the location and in chapter 1, say "Hey, they're not bad.  A bit too loud, but not bad at all.  At least, the loudness covers up any mistakes they may be making."

Understand "dance" as jumping when an option is in the location.

Instead of jumping in the presence of the school of rock option, say "You execute a few freestyle steps, much to the amusement of the musicians."

Understand "enrol in/for [option]" as taking.
Understand "participate in [option]" as taking.
Understand "join [option]" as taking.
Understand "join in/with [option]" as taking.
Understand "join in with [option]" as taking.

Understand "campers", "students", "people" as an option.

An option has a room called the venue.

When play begins:
	repeat with o running through options:
		change the venue of o to the location of o;

Part 3 - Menu Quip

A menu quip is a kind of transitional quip. 

Part 4 - Dispensers and Representation

Section 1 - Terms

Representation relates one thing to another (called the true image).
Offering relates one thing to another (called the prize).

The verb to represent (it represents, they represent) implies the representation relation.
The verb to be represented by implies the reversed representation relation.
The verb to vend (it vends, they vend) implies the offering relation.
The verb to be vended by implies the reversed offering relation.

Section 2 - Dispensers

A dispenser is a kind of thing. A dispenser is usually fixed in place.

Understand "[something related by reversed representation]" as a dispenser.

A procedural rule when taking a dispenser:
	ignore the can't take scenery rule;
	ignore the can't take what's fixed in place rule;
	ignore the can't take component parts rule;

Check taking a dispenser when nothing is vended by the noun:
	say "No need." instead.

Check taking a dispenser when the prize of the noun is enclosed by the location:
	say "You already have one [prize of the noun][if the player does not have the prize of the noun] right in front of you[otherwise], and don't need another one[end if]." instead.

Last check taking a dispenser:
	if the prize of the noun is off-stage, move the prize of the noun to the location; 
	try taking the prize of the noun; 
	if the rule failed, remove the prize of the noun from play instead;
	otherwise the rule succeeds.

Last after taking something vended by something:
	say "You take [a noun]."

Does the player mean taking or dropping a dispenser (called the vendor): if the prize of the vendor is in the location, it is unlikely. 
Rule for clarifying the parser's choice of something vended by something (called the vendor): if the vendor is in the location, do nothing instead. [skips the "(the red flag)" disambig message when dealing with The Red Flag in the presence of The Pile Of Red Flags.]

[Does the player mean taking or dropping the pile of red flags when the red flag is in the location: it is unlikely. 
Rule for clarifying the parser's choice of the red flag when the pile of red flags is in the location: say nothing.]

Part 5 - Cutouts of various types

A thing can be cardboard. 
A thing is usually not cardboard.

Understand "cardboard", "card board", "card", "picture/pictures of", "image/images of" as cardboard.
Understand "cutout", "cut out", "cut-out" as cardboard when the item described is a wall cutout.

Section 1 - Cutout Pouches

A cutout pouch is a kind of dispenser, privately-named.

Rule for printing the name of a cutout pouch:
	say "pouch";

Understand "pouch" as a cutout pouch.

Understand "pouch of", "[something related by reversed representation]", "pouch" as a cutout pouch when the player's command matches the text "pouch", case insensitively.

Instead of searching a cutout pouch, try examining the noun.

Section 2 - Life-sized cutouts

A life-sized cutout is a kind of thing, scenery.
Some life-sized cutouts are defined by the table of cardboard people.

Table of cardboard people
life-sized cutout
Stephan Eberharter
Frankenstein's Monster
Audrey Hepburn in her role as Holly Golightly
An astronaut

A life-sized cutout can be lifesized. A life-sized cutout is usually lifesized.
Understand the lifesized property as referring to a life-sized cutout.
Understand "life-sized", "life sized" as lifesized.

A life-sized cutout is usually cardboard.
Understand the cardboard property as referring to a life-sized cutout.

A cutout pouch is part of every life-sized cutout.

Stephan Eberharter is in First Floor Midpoint.
Frankenstein's Monster is in Pits Stairwell.
Audrey Hepburn in her role as Holly Golightly is in Second Floor Lobby.
An astronaut is in Third Floor Lobby.

Before printing the name of a life-sized cutout:
	say "life-sized cardboard cutout of "

Last before printing the name of Stephan Eberharter:
	say "Olympic ski champion ";

Stephan Eberharter is improper-named.
Frankenstein's Monster is improper-named.
Audrey Hepburn in her role as Holly Golightly is improper-named.

Instead of taking a life-sized cutout when a cutout pouch is apparent:
	try taking a random apparent cutout pouch;

Understand "cutout", "cut out", "cut-out", "picture", "image", "photo", "picture/image/photo of" as a life-sized cutout.

Section 3 - Wall cutouts

A wall cutout is a kind of backdrop. Some wall cutouts are defined by the table of cutout scenery.

A wall cutout is usually cardboard.
Understand the cardboard property as referring to a wall cutout.

Understand "picture/pictures", "image/images", "cutouts", "cut outs", "cut-outs" as a wall cutout.

Table of cutout scenery
wall cutout
the images of winter sports
the images of classic horror
the images of Hollywood stars
the images of stellar bodies

The images of classic horror are in Pits West, Pits Stairwell, Pits East.
The images of winter sports are in First Floor Rooms West, First Floor Midpoint, First Floor Rooms East.
The images of Hollywood stars are in Second Floor Rooms West, Second Floor Lobby, Second Floor Rooms East.
The images of stellar bodies are in Third Floor Rooms West, Third Floor Lobby, Third Floor Rooms East.

Instead of taking a wall cutout when a cutout pouch is apparent:
	try taking a random apparent cutout pouch;

Part 6 - Dorm Rooms

A Dorm Room is a kind of room. 

Inhabitation relates various people to one Dorm Room (called home). The verb to inhabit (he inhabits, they inhabit, he inhabited, it is inhabited, he is inhabiting) implies the inhabitation relation.

The verb to be occupied by implies the reversed inhabitation relation.

The player inhabits Your Room.


Part 7 - Emotional residues

Section 1 - Definitions

[One of the things Inform does brilliantly well]

An emotional residue is a kind of thing.

Tainting relates various emotional residues to various rooms. The verb to taint (he taints, they taint, he tainted) implies the tainting relation.

Emotional-Awareness relates one person to various emotional residues.
The verb to be aware of implies the emotional-awareness relation.
The verb to be able to sense (it is sensed) implies the emotional-awareness relation.

Definition: an emotional residue is salient if the player can sense it and it taints the location.

After printing the description of a room (called R) when an emotional residue is salient:
	if R is the location:
		repeat with E running through salient emotional residues:
			carry out the printing the description activity with E;

Part 8 - Identified / Unidentified

[This is to do with "real names".]

A thing can be identified or unidentified. A thing is usually identified.

An unidentified thing is usually improper-named.

To identify (x - a thing):
	now x is identified;
	now x is proper-named;

Part 9 - Major and minor Goals

A goal can be major or minor. A goal is usually minor.

The goal-tidying rules are a rulebook.

A goal-tidying rule (this is the tidy recently achieved goals rule):
	remove the list of minor goals from the recently achieved goals;

A goal-tidying rule (this is the tidy current goals rule):
	remove the list of minor goals from the current goals;

Part 10 - Availability of Quips

A quip can be available or unavailable. A quip is usually available.

Part 11 - Headaches

A headache is a kind of trigger.

Part 12 - Friendliness

Friendship relates various people to each other.
The verb to be friends with implies the friendship relation.

Yourself is friends with Stacy Alexander.
Yourself is friends with Ava Winters.
Ava Winters is friends with Stacy Alexander.

Definition: a person is friends:
	decide on whether or not the player is friends with them;

Before listing contents of a room:
	group friends together;

Before grouping together friends:
	say "your friends ";

Book 0 - Jacobs Hall Map

Part 1 - Lobby West

Chapter 1 - Description

First Floor Lobby West is a room. "This used to be the living room, back when [one of]Alexander Quaverley Jacobs, the eccentric old coot who donated this place to the university[or]old AQJ[stopping] was still alive and the university was just starting up.  It's got a huge fireplace, and a big bay window looking out onto the front lawn.  It's also been painted completely white from floor to ceiling, so thickly that you're not sure if some of the molding is not actually just bubbles under the paint.  The info desk is back through the arch to the north, and the lobby continues, through another arch, to the west.[paragraph break]A large brass plaque has been fixed into the space over the fireplace."

Rule for printing the name of first floor lobby west:
	say "First Floor Lobby, West";

The player is in First Floor Lobby West.

Chapter 2 - Scenery

Instead of room-examining the info desk when in the first floor lobby west, placeholder "This should describe the graffiti option. I really like windows as a technique for tightening the interconnections in the game world. -POB"

A painted fireplace is scenery, in the First Floor Lobby West. "No-one uses it any more, of course, but it still looks nice.  Even with all that white paint slathered all over it."

The white paint is a backdrop, in the First Floor Lobby West. "It was the fashion, back in the 1950s, to try to make a place look more modern by painting it white.  It's not the 1950s anymore, but apparently nobody ever told the custodians that." Understand "50s", "fifties", "1950s", "nineteen-fifties", "nineteen fifties" as the white paint.

A bay window is scenery, in the First Floor Lobby West. "[if in chapter 1]Normally you can see all of the front lawn spread out from here, but right now there've been temporary walls set up all over the lawn[otherwise]It's dark outside.  You can see some of the temporary walls set up on the front lawn, but that's about it[end if]."

The elaborate wood molding is scenery, in the First Floor Lobby West. "It's pretty elaborate, and almost makes you dizzy as you follow the pattern across the -- oh wait, those are just air bubbles under the paint."

Some air bubbles are scenery, in the First Floor Lobby West. "They're annoyingly random.  You don't know why the original painters couldn't have taken the trouble to -- oh wait, that's actually an elaborate wood molding."

A plaque shaped like a shield is scenery, in the First Floor Lobby West. "It's shaped like a shield, and commemorates the memory of Damon Rose, one of the founders of LEAP.  You remember him quite well from last year.  It was quite a shock to hear about the accident, and there was some question as to whether LEAP could go on without him.  His sister, Claudia Rose, is in charge of LEAP now, and making sure that the good work goes on.  She seems like a nice lady, but she's just not quite as present as old Damon Rose used to be."

Chapter 3 - Michelle

Section 1 - description of Michelle

Counselor Michelle Close is a woman, in the First Floor Lobby West. The description of Michelle Close is "Michelle Close is one of the counselors.  She's slightly untidy-looking, with a big explosion of curly black hair and a pencil tucked behind one ear."

Understand "Counsellor" as Michelle Close.

Rule for printing the name of Michelle Close:
	say "Michelle";

Michelle Close wears Michelle's whistle.

Rule for writing a paragraph about Michelle Close:
	say "Michelle Close leans against the side of the desk, chewing on a pencil."

Michelle's whistle is improper-named. The printed name of Michelle's whistle is "whistle".

Michelle carries Michelle's pencil.  Michelle's pencil is improper-named scenery. The printed name of Michelle's pencil is "pencil".  

Michelle's hair is scenery part of Michelle. 

Section 2 - actions on Michelle

Instead of taking, pushing, [[moving,]] or pulling Michelle, say "Don't be rude."
Instead of eating, attacking, or kicking Michelle, say "That's a sure way to get yourself kicked out of LEAP, and you don't want that."
Instead of focusing on Michelle, say "You stare intently at Michelle.  She feels a little creeped out by this."

Section 3 - conversation with Michelle

The conversation table of Michelle is the table of Michelle's conversation.
The object-based conversation table of Michelle is the table of Michelle's replies.

Table of Michelle's replies
conversation 	reply	
an object [default]	"She does not reply."	
newspaper		"[about newspaper]"
vending machine		"[about newspaper]"
loose change	"'This?  Just a few odd coins that people find under the sofa or wherever.  Why?'"
red flag			"[about either flag]"
green flag		"[about either flag]"
feather			"[if player does not have the feather]'Birds of a feather flock together, or so they say.'[otherwise]'Good, that's another item off your list.'"
five-pointed star cutout	"[about either star]"
Charlie Chaplin cutout	"[about either star]"
diplodocus		"[if player does not have a diplodocus]'I always loved dinosaurs, ever since I was a little girl.  I always wondered, though, what they sound like.'[otherwise]'Rarr.  I'm checking that off your list.'"
little straw hat	"[about either hat]"
paper hat		"[about either hat]"
Brad			"'Brad's in charge of the flag football option right now,' says Michelle, gesturing vaguely in the direction of Calvin Field, to the southeast."
Aidan			"'I think I saw your brother heading upstairs for the Rap Session option.'"
Claudia			 "'Dr Rose had a little meeting with all the counselors before the first day of camp.  She seems like a nice lady; I'm sure you'll get to meet her eventually, if she ever manages to get away from the hospital.'"
yourself			"'You are yourself, of course.'  Michelle smiles encouragingly.  It's clear the only thing she really knows about you is your name."
Stacy			"[about anyone else]"
Ava  			"'Ava?  I think I heard her say something about the Ping Pong option, downstairs.  I'm a little surprised that she didn't go straight for the Music Jam option, really, given how much she likes to sing.'"
Hank			"[about anyone else]"
Joe  			"[about anyone else]"
Lucian			"[about anyone else]"
the scavenger hunt	"'You've got until 8:25 to find the things on your list, Daniel.  So if you haven't found everything yet, you'd better hurry.  And don't worry, we checked the lists beforehand and we know that everything is available one way or another around here.'"

Table of Michelle's conversation
conversation						topic
MICHELLE_ON_camp-flyer		"LEAP/flyer/camp"

Understand "jeremy/dolan" or "jeremy dolan" as "[jeremy]".
Understand "damon/rose" or "damon/professor rose/damon" as "[damon]".
Understand "antonia/long" or "antonia/professor long/antonia" or "robotics" as "[antonia]".

After asking MIchelle about "[jeremy]": say "[about anyone else][line break]" instead.
After asking Michelle about "[damon]": say "'It was terrible about what happened, wasn't it?'  Michelle is silent for a moment, then says, 'no use thinking about that now!  Don't you have a treasure hunt to do?'" instead.
After asking Michelle about "[antonia]": say "'Antonia's a good friend, and a very intelligent person.  You're registered for her robotics class, right?  I thought I saw your name on the registration form.'" instead.



MICHELLE_ON_camp-flyer is a conversation topic. The response text is "'You already know all about that, don't you?  I mean, it's your second year, after all.' "

To say about newspaper: say "[run paragraph on][if player has a newspaper]'Be careful you don't get ink all over your fingers!'[otherwise if the player has been able to see the vending machine]'Why Daniel, I am so very pleased that you're taking an interest in current events!'  She drops just enough change for the newspaper machine into your hand, and winks.  'At least, I'm sure that's why you want a newspaper, and it's not because of anything so silly as a scavenger hunt.'[otherwise]'You'll have to think outside the box for that one.'"

To say about either flag: say "[run paragraph on][if player does not have the green flag and the player does not have the red flag]'I really wouldn't know, Daniel, but perhaps you're just trying too hard.  Why don't you go take a look at how some of the other options are going?'[otherwise if player has the red flag and the player does not have the green flag]'Not bad!  That's another item off your list, isn't it?'[otherwise if player has the green flag and the player does not have the red flag]'Oh, very nice!  That's one solution we never thought of!'[otherwise if player has the green flag and the player has the red flag]'You know you only need one flag, right?'"

To say about either star: say "[run paragraph on][if player does not have five-pointed star cutout and the player does not have cutout Charlie Chaplin]'You know, stars are actually giant balls of flaming gas, a million times bigger than the Earth.  How's that for an off-the-wall fact?'[otherwise if player has five-pointed star cutout and the player does not have cutout Charlie Chaplin]'You're a star, Daniel!  Anything else on the list?'[otherwise if player has cutout Charlie Chaplin and player does not have five-pointed star cutout]Michelle laughs.  'A movie star?  I guess that counts....'[otherwise if player has cutout Charlie Chaplin and the player has five-pointed star cutout]'That's two different ways of reading it.  Bit of an overkill, I'd say.'"

To say about either hat: say "[run paragraph on][if player does not have little straw hat and the player does not have a paper hat]'There's bound to be someone who can help you out on this one.'  She looks down at her clipboard.  'Someone or something, somewhere.'[otherwise if player has little straw hat and the player does not have a paper hat]'Not quite your style, Daniel, but it's a nice one, all the same.'[otherwise if player does not have little straw hat and player has a paper hat]'Oh, now you're going to get ink all over your face, aren't you?  Better clean up properly tonight!'[otherwise if player has  little straw hat and the player has a paper hat]'You know you only need one hat, right?'"

To say about anyone else: say "'I don't really know who has signed up for what,' says Michelle, probably trying to cover up for not actually knowing who you're talking about.  "


After deciding the scope when Michelle is in the location: place loose change in scope. Procedural rule while asking Michelle for loose change: ignore the basic accessibility rule. [Grr]

Instead of asking michelle for loose change, start conversation with Michelle on MICHELLE-ON-CHANGE instead.  MICHELLE-ON-CHANGE is a quip. The display text is "'What do you want it for, Daniel?'"

MICHELLE-ON-SNACKS is a quip. The menu text is "'Snacks!'"  The display text is "Michelle frowns.  'That stuff will rot your teeth and spoil your appetite.'  Needless to say, you get no change out of her."
MICHELLE-ON-SODA is a quip. The menu text is "'Soda pop!'"  The display text is "Michelle frowns.  'That stuff will rot your teeth and spoil your appetite.'  Needless to say, you get no change out of her."
MICHELLE-ON-COFFEE is a quip. The menu text is "'Coffee!'"  The display text is "'Coffee?  Daniel, there aren't any coin-operated coffee machines here.  I know, I've checked.'  She glances back at the stairs and mutters, 'none that serve anything remotely drinkable, anyway.'"
MICHELLE-ON-NEWSPAPER is a quip. The menu text is "'Newspaper!'"  The display text is "[about newspaper]"

The response of MICHELLE-ON-CHANGE is { MICHELLE-ON-SNACKS, MICHELLE-ON-SODA, MICHELLE-ON-COFFEE, MICHELLE-ON-NEWSPAPER }.

After populating MICHELLE-ON-CHANGE when the player has not been able to see the vending machine, remove MICHELLE-ON-NEWSPAPER from the current conversation.

After firing MICHELLE-ON-NEWSPAPER: now the player carries the loose change. 

Talked to Michelle is a number that varies. 
Every turn conversing when the noun is Michelle:
	increase talked to Michelle by 1;
	if talked to MIchelle is 4, say "She glances at her watch and adds, 'Time's a-wasting, Daniel!  Have you found everything on your list yet?'"
 

Part 2 - Info Desk

Chapter 1 - Description

Info Desk is a room, north of First Floor Lobby West. "The main foyer of Jacobs Hall still looks a bit like the inside of a hundred-year-old mansion, though it's been a little bit beat up by the passing generations of students.  The information desk, an anomaly in glass and polished steel, sits beneath a portrait of Alexander Quaverley Jacobs, facing the main entrance to the west.  To the east, wide double doors open onto Calvin Field, while arches go south and southeast to the rest of the lobby area.  Much of the north wall has been chewed through to make a connection to the newer part of Jacobs Hall."

Chapter 2 - Scenery

Some stairs to administrative offices are scenery, in the Info Desk. "Of course there are stairs here.  But since they lead up to administrative offices which are off-limits to you, there didn't seem to be any point in mentioning them."

A portrait of Alexander Quaverley Jacobs is scenery, in the Info Desk. "Old AQJ, who left his mansion to the university, stares down benevolently from his portrait.  You never cease to be amazed at his enormous sidewhiskers."  Understand "picture" as portrait of Alexander.

Some sidewhiskers are scenery, part of the portrait of Alexander Quaverley Jacobs. "They're called Dundrearies, though you can't see anything remotely dreary about them.  Maybe one day you'll grow something like that, if Mom doesn't attack you with sheepshearing equipment first."

Some LEAP flyers are scenery in the info desk. "PLACEHOLDER."  Understand "flyer" or "camp" as LEAP flyers.

An information desk is a supporter, scenery, in the Info Desk. "It's very sleek and modern-looking, which means it's oddly shaped and doesn't fit anywhere.  A never-ending supply of LEAP flyers are stacked in a corner.  Tucked away into a corner is a small saucer for loose change.  (The receptionist usually keeps this in a corner of the desk where only she can see it, but apparently it's been moved.  She's only here during the school year, anyway.)"

Rule for printing a locale paragraph about the information desk:
	now the information desk is mentioned;

A saucer is on the information desk. Some loose change is singular-named, in the saucer. The indefinite article of the loose change is "some".

After printing the name of the saucer when the saucer contains loose change:
	say " full of loose change";

Rule for deciding whether all includes the saucer: it does not;

Understand "dish" as the saucer.
Understand "few", "random", "small", "coins", "coin" as the loose change.

Rule for printing the name of the loose change when the player has the loose change:
	say "small change";

Rule for printing the description of the saucer when the loose change has not been handled:
	say "Sitting in the saucer are a few random coins.  Funny, wasn't this dish empty when you passed by the desk this morning?";

Rule for printing the description of the saucer when nothing is in the saucer:
	say "Someone appears to have swiped all the loose change!";

Rule for printing the description of the saucer when the newspaper has been handled:
	say "[one of]Someone appears to have swiped -- hang on, t[or]T[stopping]he saucer's got a bunch of coins in it again.";

Rule for printing the description of the saucer when the loose change has been handled:
	say "Sitting in the saucer are a few oddly familiar coins.";

Rule for printing the description of the loose change when the player has the loose change:
	say "You have a handful of coins, conveniently just enough."

Instead of taking the loose change when the loose is in the saucer and the newspaper has NOT been handled:
	say "Michelle clears her throat and gives you a stern look.  Looks like petty thievery is going to have to wait another day.";

Instead of taking the loose change when the loose is in the saucer and the newspaper has been handled:
	say "No way, those reappearing coins are spooky.";

Instead of taking the saucer when the loose change is in the saucer:
	redirect the action from the saucer to the loose change, and try that;

After taking the loose change when the loose change was in the saucer and the newspaper has not been handled:
	say "You quickly swipe the loose change and hope that nobody saw you.";

After inserting the loose change into the saucer:
	say "Okay.  Your mother would be proud.";

Instead of putting something on the saucer:
	try inserting the noun into the second noun;


Instead of examining Michelle's pencil, say "It's a yellow stub of an HB pencil.  The eraser is gone from one end, and it looks like someone's been sharpening it with their teeth."
Instead of taking, pushing, [Moving,] or Pulling Michelle's pencil, say "After Michelle's been chewing on it?  Eww."
Instead of Eating Michelle's pencil, say "Sure, it's probably tastier than the dining hall chow, but Michelle isn't going to give it up so easily."
Instead of attacking Michelle's pencil, say "While Michelle's still chewing on it? That's just rude."
Instead of focusing on Michelle's pencil, say "You stare intently at the pencil.  It does not tie itself into a knot."

Instead of Examining Michelle's hair, say "It makes her head look three times its size."
Instead of Taking, [moving,] pushing, or pulling Michelle's hair, say "Surprisingly, it is not a wig."
Instead of Eating Michelle's hair, say "Eww!!"
Instead of focusing on Michelle's hair, say "You stare intently at Michelle's head.  Question now is, do you really want to creep out the counselors that badly?"


Part 3 - Lobby East

Chapter 1 - Description

First Floor Lobby East is a room, east of First Floor Lobby West, southeast of Info Desk. "This used to be a rather large dining room, once upon a time, and it still has a low-hanging chandelier right in the middle of the ceiling.  A piano's been pushed under the chandelier so that nobody accidentally gets a head full of crystal walking blindly around, and the place is generally used as a kind of music room now.  The info desk is back to the northwest, and to the west is the rest of the first floor lobby.  Wide picture windows look out on the front lawn and on the southern part of Calvin Field[if in Chapter 1]. The School of Rock option is in progress here, jamming away in the upper decibels[otherwise if in chapter 2]. A group of older kids seem to be discussing the psychology of cats in one corner[end if]."

Rule for printing the name of first floor lobby east:
	say "First Floor Lobby, East";

Chapter 2 - Scenery

A low-hanging chandelier is scenery, in first floor lobby east. "Pretty, but mostly useless.  You suspect that it's more glass than crystal these days, too: you distinctly remember someone (who certainly wasn't you, no sir!) knocking out part of it with an enthusiastic trombone slide last year, but this year there appears to be no sign of the damage."

A baby grand piano is scenery, in the first floor lobby east. "Ava says it's a baby grand, and she knows more about this sort of thing.  All grand pianos seem more or less alike to you.  The pile of plastic dinosaurs under the piano probably makes it unique, however."

Instead of playing the baby grand piano when in chapter 1, say "The piano is currently occupied by a couple of older kids in the School of Rock option.  You'll have to wait until later."

Instead of playing the baby grand piano when in chapter 2:
	if Ava is not in the location, say "You bang out a few bars of [SONG] before hitting a wrong note (it doesn't take long) and stopping.  The only reason you learned that tune was to annoy Ava, anyway: she hates that song.";
	otherwise say "You bang out a few bars of [SONG] before Ava stops you.  She really has no love for that particular song at all."


Some picture windows are scenery, in the first floor lobby east. "[if in chapter 1]The front lawn is littered with graffiti-covered temporary walls, but Calvin Field seems much as usual[otherwise]All you can see outside is darkness[end if]."

The School of Rock option is an option, scenery, in first floor lobby east. "It's a musical jam session.  The majority of the players are pretty good; thankfully, they drown out the ones who aren't."

Definition: a room is rocking:
	if it is the location of the school of rock option, yes;
	no;

After going to somewhere rocking during Scavenger Hunting:
	try looking;
	fire TRIG_SCHOOLOFROCK;

TRIG_SCHOOLOFROCK is a headache. 

TRIG_SCHOOLOFROCK can be primed or unprimed. TRIG_SCHOOLOFROCK is unprimed.

Last after firing unprimed TRIG_SCHOOLOFROCK:
	now TRIG_SCHOOLOFROCK is primed;
	now TRIG_SCHOOLOFROCK is unfired;

Rule for firing primed unfired TRIG_SCHOOLOFROCK:
	say "Someone takes a complicated trombone solo, and you are suddenly seized by a dizzy spell.  For a moment, everything seems to glow red and orange, and then, just as suddenly, everything snaps back to normal.";

Rule for firing primed fired TRIG_SCHOOLOFROCK:
	say "As you approach the musicians, you once again get that odd sense of vertigo.  The feeling passes within seconds.";


Cat psychologists are scenery in First Floor Lobby East. "They seem pretty absorbed in what they're doing."
Understand "kids/campers/students", "older kids" as the cat psychologists when in chapter 2.

Instead of listening to the cat psychologists, say "[one of]'...so when you see a cat twitching its tail, that means that it's kind of confused or frustrated...'[or]'...those laser pointers are fun, but too much of it just isn't good for the cat's brains, you know?'[or]'...I'm telling you, they're going to take over the world one day....'[or]'...stupid thing just stands at the open door and meows....'[or]'...there's this webcomic about this pair of cats, and....'[or]'...she was creeping across the linoleum floor, pretending to be an invisible ninja or something....'[or]'...so I looked in the litterbox --' and you stop listening right there.[at random]"


Chapter 3 - Purple Plastic Diplodocus

Section 1 - Dinosaur Pile

Some plastic dinosaurs are a dispenser, scenery, in the first floor lobby east. "Rarrr.  They're all very lifelike, despite being small, plastic, and a variety of colors unlikely to be found in nature."
The indefinite article of the plastic dinosaurs is "a pile of".

Understand "pile", "pile of" as the plastic dinosaurs.

After taking the plastic dinosaurs:
	say "You pick out a purple diplodocus from the pile of plastic dinosaurs.";

Instead of taking the plastic dinosaurs when the prize of the plastic dinosaurs is handled:
	say "You've already taken one dinosaur from the pile.  You don't need another one.";

The plastic dinosaurs are represented by the purple diplodocus.
The plastic dinosaurs vend the purple diplodocus.

Section 2 - Dinosaur

A purple diplodocus is a thing. The description is "You can't really get more generic, as far as dinosaurs go, as a diplodocus.  Never mind that there were thousands of other species of giant lizards roaming the earth once upon a time.  The purple color of this little plastic diplodocus is probably an example of artistic licence, however."

The purple diplodocus fulfills the dinosaur-goal.

Instead of attacking the purple diplodocus:
	say "Are you sure you want to be the cause of the extinction of the plastic diplodocus?";

Understand "generic", "little", "plastic", "dinosaur" as the purple diplodocus.

Rule for printing the name of the purple diplodocus:
	say "plastic dinosaur"

Part 4 - Second Avenue

Chapter 1 - Description

Second Avenue is an exterior room, west of the Info Desk. "Second Avenue runs north and south along the edge of a cliff: to the west is a sharp drop down (don't even try) onto the rooftops of the buildings along First Avenue, and beyond those are the jagged ridges of the Rockies.  Jacobs Hall -- the old part, anyway -- is open to the east, and its front lawn spreads out to the southeast.  You can also go northeast, squeezing around the newer part of Jacobs Hall to the courtyard beyond.[paragraph break]Conveniently, a bus shelter with a newspaper vending machine is almost directly outside the Hall."

After reading a command when the player's command includes "ave": replace the matched text with "avenue".

Chapter 2 - Scenery

First Avenue is scenery, in Second Avenue. "It's a good deal more interesting than Second Avenue, that's for sure.  Unless academia is your thing."

A building is a kind of backdrop. A university building is a kind of building.

Jacobs Hall is a university building, in Second Avenue. "The old part of Jacobs Hall used to be a millionaire's mansion, way back in ancient history.  It's all red sandstone and gargoyles and fancy stonework.  Then it got donated to the university and the first thing they did was to slap a huge, square-ish brick nonentity onto the north side; of course, the new part is where all the real business of Jacobs Hall gets done: the fancy, red sandstone mansion part is just where parents and newbies and visitors meet with the staff."

The Rocky Mountains are scenery, in Second Avenue. "You get some spectacular sunsets from here.  When you left the camp last year, you and just about everyone else stopped for the longest time, just watching the sun go down.  It was the best traffic jam ever."

A cliff is scenery, in Second Avenue. "It's more of an escarpment, really, or so Aidan told you once.  You not quite sure about the difference.  Anyway, Valmont is built on a mountainside, so you see this sort of thing all the time."

An escarpment is scenery, in Second Avenue. "It's more of a cliff, actually, or so you prefer to call it.  You're not quite sure about the difference.  Anyway, Valmont is built on a mountainside, so you see this sort of thing all the time."

A bus shelter is scenery, in Second Avenue. "You figure that the next bus should be showing up about one minute after you leave."

Chapter 3 - Vending Machine & Paper

A vending machine is scenery, closed, transparent, not openable, in Second Avenue. "Insert the appropriate change, get your daily dose of gloom and doom."

Instead of opening the vending machine, say "Until you insert some money, the vending machine remains stubbornly shut."

Instead of inserting the loose change into the vending machine:
	move the loose change to the saucer;
	now the player carries the newspaper;
	say "You insert the appropriate change, and the glass front of the vending machine clicks open just wide enough for you to extract the day's newspaper.  Then it snaps shut again.";

Instead of inserting something into the vending machine:
	say "It appears that the vending machine was not designed to accept [that or those for the noun].";

Instead of attacking the vending machine:
	say "Hooliganism is not the answer to this one.";

A newspaper is in the vending machine. The description of the newspaper is "You quickly scan the headlines.  War, pollution, corruption, crime, gas shortages... why anyone would want to start their day with such a sour note, you do not know." Understand "newspaper/paper machine/vendor" as the vending machine.

Rule for printing the description of the newspaper when the newspaper is in the vending machine:
	carry out the printing the description activity with the vending machine instead;

The newspaper fulfills the newspaper-goal.

Understand "paper" as the newspaper.
Understand "from [something related by reversed containment]" as the newspaper when the newspaper is in the vending machine.

Before buying the newspaper when the newspaper is in the vending machine and the player has loose change:
	try inserting the loose change into the vending machine instead;

Before buying the newspaper when the newspaper is in the vending machine and the player has the dollars:
	say "(with a dollar)[command clarification break]";
	try inserting the dollars into the vending machine instead;

Instead of folding the newspaper:
	now the player carries the paper hat;
	say "You pull out a section of the newspaper and quickly fold it into a sailboat.  Or a hat, one of the two: you never did figure out how to make those two things any different from each other.";

Instead of folding the newspaper when the paper hat is on-stage:
	say "You already have a paper hat (sailboat!) and you don't want to reduce the newspaper to a single page.  Not before you're supreme ruler of the world, anyway.";

A hat is a kind of thing. A hat is always wearable.

The paper hat is a hat. The description is "A hat, or possibly a boat, folded from newspaper.  Not bad, if you do say so yourself.  At least until the newsprint ink comes off on someone's forehead."

The paper hat fulfills the hat-goal.

Part 5 - Calvin Field South

Chapter 1 - Description

Calvin Field South is an exterior room. "During the school year, this part of Calvin Field gets pretty scuffed up by students playing football or whatever inter-department sports tickle their fancy at the time.  Right now, it's getting scuffed up by people playing flag football.  The university caretakers must be wondering why they even bother to replant the grass every Spring.  The less scuffed-up part of Calvin Field is to the north, and the front lawn of Jacobs Hall is to the west."

Calvin Field Region is a region. Calvin Field North and Calvin Field South are in Calvin Field Region.

Chapter 2 - Scenery

Some backdrop-grass is a backdrop, privately-named, in Calvin Field South, Calvin Field North, the Front Lawn.
Rule for printing the name of the backdrop-grass: 
	say "grass";

Understand "grass" as the backdrop-grass.

Rule for printing the description of the backdrop-grass when in Calvin Field South:
	say "It's green, which means it's not quite dead yet, despite the best efforts of the football players.";

Instead of taking the backdrop-grass:
	say "You pluck a few [if the player has the blades of grass]more [end if]blades of grass from the ground.";
	now the player carries the blades of grass;

Some blades of grass are a thing. The description is "They're green, at least for now." The indefinite article of the blades of grass is "a few".

The blades of grass fulfill the life-goal.

The Flag Football option is an option, privately-named, scenery, in Calvin Field South. "Football, in whatever form, is really more Aidan's thing than yours.  He's not taking the option today, though." Understand "flag football", "football", "option", "player", "players", "camper", "campers", "student", "students", "people" as the flag football option.

Chapter 3 - Red Flag

A red flag is a thing. The description is "It's a small red flag from the flag football option."

A pile of red flags is a scenery dispenser in Calvin field south. The pile of red flags vends the red flag.  Understand "flag" as the pile of red flags when the red flag is not enclosed by the location. 

Instead of waving the red flag, say "Only if you want to be dog-piled by a rabid gang of flag football players."

Instead of burning the red flag, say "Even if you had a source of fire, you're not exactly the flag-burning sort."

After dropping the red flag: say "It flutters to the ground.  No flag football players notice.  Thank goodness."

The red flag fulfills the flag-goal.

Rule for printing a locale paragraph about the red flag when the red flag is not handled:
	now the red flag is mentioned;

Chapter 4 - Brad


Section 1 - description of Brad

Counselor Brad Kramer is a man, in the Calvin Field South. The description of Brad Kramer is "[unless in chapter 8]Brad Kramer, your counselor for this year, looks like a typical jock, though he's been pretty awesome so far.  Normally, he's never seen without a baseball cap and that ever-present wad of chewing gum lodged in one cheek.  The gum's still there, and somehow he still manages to chew it while still holding his referee's whistle between his lips, but at the moment the cap is gone.[otherwise]Brad Kramer, your counselor for this year, normally looks like a typical jock, though at the moment he's lying unconscious by the wall.  He's wearing a set of pajamas with teddy bears printed on them, but you really don't have time right now to wonder how a cool dude like Brad could wear pajamas with teddy bears printed on them.  Oh, and in case you missed it the first time, he's also out cold, as you will be too if you keep hanging around."

Understand "Counsellor" as Brad Kramer.

Rule for printing the name of Brad Kramer: say "Brad".

Brad Kramer wears Brad's whistle.

Rule for writing a paragraph about Brad Kramer:
	say "Your counselor, Brad Kramer, stands beside a large pile of red flags, watching the flag football game with a whistle tucked between his lips."

Brad's whistle is improper-named. The printed name of Brad's whistle is "whistle".

Brad carries Brad's gum.  Brad's gum is improper-named scenery. The printed name of Brad's gum is "gum".

Brad's baseball cap is a thing.

Brad's pajamas are a wearable thing. Understand "pyjamas/PJs" as the pajamas.


Section 2 - actions on Brad  and his stuff

[Gum (chapter 1)]
Instead of Examining Brad's gum, say "Brad must go through a few hundred dollars['] worth of gum every year.  That, or he's been chewing on the same wad of gum since the beginning of time."
Instead of Eating Brad's gum, say "You're not in the mood for sharing anyone's gum, least of all Brad's."
Instead of Taking, pushing, pulling, [moving,] or touching Brad's gum, say "After Brad's been chewing on it?  Eww."
Instead of attacking or kicking Brad's gum, say "That would require you to actually touch it...."
Instead of focusing on Brad's gum, say "You'd really much rather not."

[Whistle (chapter1)]
Instead of Examining Brad's whistle, say "It's a standard-issue referee's whistle, the sort that high school coaches the world over have been blowing since time immemorial."
Instead of Taking, pushing, pulling, [moving,] touching, attacking, or kicking Brad's whistle, say "That would earn you a penalty for sure."
Instead of Eating Brad's whistle, say "No.  It would only get stuck in your throat and whistle every time you tried to talk, and that would be annoying."
Instead of Listening to Brad's whistle, say "It's loud enough to be heard all across the field!"
Instead of focusing on Brad's whistle, say "You stare intently at the whistle.  Suddenly, Brad blows it and starts yelling at one of the players, breaking your concentration."

Instead of examining the pile of red flags, say "A pile of red flags for the flag football game.  Maybe not as exciting as tackling, but definitely less likely to cause grievious bodily damage." 

[Check taking the pile of red flags when the player has a red flag, say "You don't need another one!"
Last check taking the pile of red flags,] 
After taking a red flag, say "Being careful to not be mistaken for another football player, you pick up one of the flags."
Instead of Eating, attacking, or kicking the pile of red flags, say "The football players, and your counselor, wouldn't take very kindly to that."
Instead of Pushing the pile of red flags, say "'Don't push it, Danny,' says Brad without even looking around."
Instead of Pulling, [moving,] or searching the pile of red flags, say "You find nothing under the flags but a few more flags, and some grass."
Instead of Touching the pile of red flags, say "Cloth."
Instead of focusing on the pile of red flags, say "You feel a little angry, for some reason."

[Pajamas, pyjamas (chapter 8)]
Instead of Examining or focusing on Brad's Pajamas when in chapter 8, say "Teddy bears!"
Instead of Taking or wearing Brad's Pajamas when in chapter 8, say "That's going to take more time and effort than it's worth, and anyway Aidan's not going to fall for such a flimsy disguise."

[what hat-hair?]
Instead of doing something with the baseball cap, say "There is no cap!"

[The Brad!]
Instead of Taking, [moving,] Pushing, or Pulling  The Brad, say "[unless in chapter 8]Don't be rude.[otherwise]He's too heavy!  Maybe you'd better lure Aidan out of the way and hope someone else will deal with Brad."
Instead of attacking or Kicking The Brad, say "[unless in chapter 8]That's a sure way to get yourself kicked out of LEAP, and you don't want that.[otherwise]He looks beat up enough as it is!"
Instead of Kissing The Brad, say "Somehow you don't think Brad would appreciate that at the moment."
Instead of focusing on The Brad, say "[unless in chapter 8]You stare intently at Brad.  He doesn't seem to notice.[otherwise]He's unconscious!  All you can sense is that he's certainly feeling no pain."


Section 3 - conversation with Brad

[The conversation table of Brad is the table of Brad's conversation.]
The object-based conversation table of Brad is the table of Brad's replies.

Asking Brad about is conversing w/Brad.
Asking Brad for is conversing w/Brad.
Inquiring Brad about is conversing w/Brad.
Talking to Brad is conversing w/Brad.
Telling Brad about is conversing w/Brad.

Instead of conversing w/Brad when in Chapter 8, say "Brad doesn't seem to hear you.  He's unconscious, remember?  And likely to be killed as well once Aidan's done with you!"

Instead of asking Brad for a red flag, try inquiring Brad about the noun.
Instead of asking Brad for the pile of red flags, try inquiring Brad about the noun.

Does the player mean inquiring Brad about Brad's baseball cap: it is likely. [as opposed to the deerstalker cap]
Does the player mean asking Brad for Brad's baseball cap: it is likely. [as opposed to the deerstalker cap]

Table of Brad's replies
conversation 	reply	
an object [default]	"Brad doesn't reply."	
baseball cap		"'Sorry, someone else already borrowed it.'"
Scavenger hunt	"'Yeah, sounds like fun.'  Brad seems quite focussed on the football game.  'That's Michelle's baby, though; I wouldn't know much about it.'"
the pile of red flags	"'There's a pile of red ones right over there,' Brad says, pointing to a heap of red flags.  'Feel free to help yourself; we've got tons.'"
the red flag   		"'There's a pile of red ones right over there,' Brad says, pointing to a heap of red flags.  'Feel free to help yourself; we've got tons.'"
Football 	"'You should pick up the option sometime, Dan.  A little bit of running around in the sun would do you good.  Hey, if you're anything like your brother, you should be pretty good at it, too!'"
Aidan		"'He's pretty cool, your brother.  We shoot a few hoops now and then, with a few other guys.  You're welcome to join anytime, you know.'"
Stacy		"'That's your friend with the hats, right?  I think I saw her dragging her roommate to one of the downstairs option.  Tell her for me that if she breaks anything, she's got to fix it herself.'"
Ava			"'That's your friend Stacy's roommate, right?  I don't know her much at all.'"
Michelle		"'What's to tell?  She's another counselor, just like me.'  Brad chuckles.  'We come mass-produced and packaged in boxes of six, don't you know.'"
Claudia		"'She's a medical doctor with more qualifications than I ever thought existed.  I don't know if running an educational camp like LEAP is one of them, but I think we'll all just keep doing exactly the same stuff we were doing before.'"
Hank		"[Brad quips BRAD-ON-Hank-and-Joe]"
Joe   		"[Brad quips BRAD-ON-Hank-and-Joe]"

[Table of Brad's conversation
conversation						topic
BRAD_ON_camp-flyer		"LEAP/flyer/camp"]


BRAD-ON-Hank-and-Joe is a quip. The display text is "Brad's lips tighten.  'Have Hank and Joe been giving you any trouble?'"

BRAD-ON-yesHJ is a quip. The menu text is "'Yes, they have!'"  The display text is "Liar, liar, pants on fire!  You hesitate, then admit that, after all, they haven't given you any trouble.  Brad nods grimly and turns his attention back to the football game."
BRAD-ON-noHJ is a quip. The menu text is "'No, they haven't.'"  The display text is "'Well, you be sure to tell me if they start picking on you, okay?'"
BRAD-ON-yetHJ is a quip. The menu text is "'Not yet...'"  The display text is "'Well, you be sure to tell me if they start picking on you, okay?'"
BRAD-ON-whoHJ is a quip. The menu text is "'I haven't even met them yet!'"  The display text is "'Their reputation precedes them, I see,' Brad says drily."

The response of BRAD-ON-Hank-and-Joe is { BRAD-ON-yesHJ, BRAD-ON-noHJ, BRAD-ON-yetHJ, BRAD-ON-whoHJ }.


Part 6 - Calvin Field North

Chapter 1 - Description

Calvin Field North is an exterior room, north of Calvin Field South, east of Info Desk. "Claremont Hall, to the north, looms over the entire length of Calvin Field, which continues to the south.  Jacobs Hall is back to the west, and the dining hall is to the east.  A fountain takes up space right where all the paths meet, so there usually aren't that many people running around and tearing up the grass.  Right now, though, there are several people running around, playing Myth Tag, and there's nothing the fountain can do about it."

Rule for printing the description of the backdrop-grass when in Calvin Field North:
	say "It's green, which means it's not quite dead yet, despite the best efforts of the Myth Tag players.";

Chapter 2 - Scenery

The Myth Tag option is an option, scenery, in Calvin Field North. "It's sort of like normal tag, except you can declare yourself 'safe' by crouching down and naming a mythological creature.  No repeats, though: one of the counsellors is keeping track of what's been named so far."

Claremont Hall is a university building, in Calvin Field North. "Claremont Hall looks very grand, standing on a rise at the north end of Calvin Field.  It's a red sandstone building with rounded arches and red shingles, and a huge clock tower right over the door."

A huge clock tower is scenery, part of Claremont Hall. "The Claremont Hall clock tower has never told the right time, not since it was built.  Someone told you last year that it's haunted, but that's the sort of thing people always tell kids on their first summer at camp."

A fountain is scenery, in Calvin Field North. "The fountain consists of a wide, shallow basin and a modern sculpture that, to you, looks a lot like Big Foot taking a shower.  It's not running right now."

Instead of searching the fountain when the player does not have a feather: say "You spot a lone feather just lying there, presumably lost from some passing pigeon.  You grab it before the wind blows it away."; now the player carries the feather. 


Part 7 - Front Lawn

Chapter 1 - Description

The Front Lawn is an exterior room, west of Calvin Field South, southeast of Second Avenue. "A whole bunch of walls have been temporarily erected all over the front lawn for the Graffiti Art option.  The smell of paint is everywhere, not to mention the hiss of spray cans.  Passersby on Second Avenue -- to the northwest -- will no doubt find this all very interesting.  A flagpole rises up from the maze of makeshift walls here, while Calvin Field and the more athletic options are off to the east."

Chapter 2 - Scenery

Rule for printing the description of the backdrop-grass when in Front Lawn:
	say "It's green, which probably means someone with a can of green spraypaint has been coloring outside the lines."

The graffiti option is an option, scenery, in Front Lawn. "Some of it is actually pretty good.  But is it Art?"

Some cans of spray paint are scenery, in Front Lawn. "A multitude of different colors, all of it in the hands of kids with instructions to just 'go wild'.  The bathrooms are going to be pretty jammed up this evening."

A flagpole is scenery in the front lawn. "[if the star-spangled banner is scenery]It's keeping the good ol['] Star-spangled Banner well out of the reach of the spraypaint-happy campers all around you.[otherwise if the star-spangled banner is fixed in place]The flag is at the bottom of the flagpole.[otherwise]The flagpole seems to be missing a flag."

The Star-Spangled Banner is [initially] fixed in place scenery in the front lawn. "[if the star-spangled banner is scenery]It's not exactly the dawn's early light, but you can see it quite clearly, drifting in the wind high overhead.[otherwise if the star-spangled banner is fixed in place]Up close, you realize it's bigger than you are!  How will you carry it?[otherwise]The camp's flag has seen some years of use.  It looks older than the camp itself." Understand "flag" or "great" or "old glory" as the Star-Spangled Banner. Rule for printing the name of the banner when taking inventory: say "Star-Spangled Banner (folded as a triangle)".

[the banner:  
"scenery" means it is up high
"fixed in place" means it is unfolded ]

Instead of climbing the flagpole, say "You're not that good an athlete."

[turning off the "scenery" bit]
Instead of doing something except examining with the Star-Spangled Banner when the star-spangled banner is fixed in place scenery, say "It's way too high to reach."

Understand "lower [Star-Spangled Banner]" or "raise [Star-Spangled Banner]" as turning.  Before turning the Banner: try turning the flagpole instead. [saves me creating a one-off Lower action]  

Instead of turning the flagpole when the Star-Spangled Banner is not enclosed by the location, say "There's little point without the Stars and Stripes to put up there."

Instead of turning the flagpole when the Star-Spangled Banner is scenery: say "You unwind the pulley rope, and lower the flag.  The great flag now within reach."; now the Star-Spangled Banner is not scenery; rule succeeds.  

Instead of turning the flagpole when the Star-Spangled Banner is not scenery and the star-spangled banner is enclosed by the location: say "Perhaps some things are more important than a scavenger hunt.  You raise the Star-spangled Banner to its rightful place."; now the Star-Spangled Banner is fixed in place scenery in the front Lawn; rule succeeds.

[the fixed in place bit]
Instead of doing something except examining or touching or folding with the Star-Spangled Banner when the star-spangled banner is fixed in place not scenery, say "It's way too big to carry when unfurled."

Before folding the Star-Spangled Banner: now the player carries the banner; now the banner is not fixed in place. [gets around annoying implicit take message]

Instead of folding the Star-Spangled Banner: say "It takes some time, but you get the whole flag into its traditional triangular shape."; now the time of day is the time of day plus 3 minutes.

Instead of dropping the Star-Spangled Banner, say "The flag must never touch the ground."

The Star-Spangled Banner fulfills the flag-goal.

Part 8 - Courtyard

Chapter 1 - Description

The Courtyard is an exterior room, northeast of Second Avenue, northwest of Calvin Field North. "The courtyard is a hard, concrete square ringed by bushes and trees.  It's not terribly interesting, but Aidan sometimes comes here to play basketball with his friends, as if the camp counselors didn't make you all run around enough already.  The other university buildings are visible beyond the treetops, and the blank north face of Jacobs Hall rises up to the south; paths southeast and southwest lead around Jacobs Hall, though there is no entrance to the building from here."

Chapter 2 - Scenery

Some prickly plantlife is scenery, in the Courtyard. "The plantlife around here seems quite peaceful and idyllic.  Also, prickly."

Understand "plant", "plants", "leaf", "leaves", "thorns", "stems", "bushes", "trees", "leaves", "plant", "life", "peaceful", "idyllic", "grass" as the prickly plantlife.

Instead of taking the prickly plantlife:
	say "You briefly consider the trees, but they're rather on the tall side.  Then you reach into the bushes and immediately back off thanks to the thorns[if the player does not have the blades of grass].  Finally, you settle on just grabbing a few blades of grass[end if].";
	now the player carries the blades of grass;

Some distant University Buildings are scenery, in the Courtyard. "Jacobs Hall is to the south, and Claremont Hall is to the east.  Neither of them can be entered directly from here.  Over the treetops to the north, you can also make out the Ridgeway Museum and the university library."

Jacobs Hall is in the Courtyard.

Rule for printing the description of Jacobs Hall when in the Courtyard:
	say "The north face of Jacobs Hall is a flat expanse of brick, interspersed with dorm room windows.  At the rooftop parapet, you can also make out a bunch of happy campers dropping things off the edge.  That must be the Egg Drop option, if you remember rightly.";

Claremont Hall is in the Courtyard.
Ridgeway Museum is a university building. The University Library is a university building.
Ridgeway Museum is in the Courtyard. The University Library is in the Courtyard.

Rule for printing the description of a university building (called X) when in the Courtyard and X is not Jacobs Hall:
	say "The university buildings aren't of much interest, at least not from here.";

Some scattered eggboxes are scenery, in the Courtyard. "Those belong to the Egg Drop option, going on up on the roof of Jacobs Hall.  Some appear more effective than others." Understand "boxes/containers/box/container/objects/object/debris" as the scattered eggboxes.

Instead of searching the eggboxes:
	if the player does not have a feather:
		say "Poking about the debris, you come across one that is stuffed full of blue feathers.  Guessing that the actual number of feathers is probably not part of the scientific data under examination, you help yourself to one.";
		now the player carries the feather;
	otherwise:
		say "Poking about the debris, you find nothing on your list that you do not already have."

Instead of doing something except searching when the scattered eggboxes are physically involved, say "Don't interfere with someone else's scientific data."

Chapter 3 - Ambient Messages

Every turn when in the Courtyard and a random chance of 1 in 3 succeeds:
	say "[one of]A box-like object crashes into the concrete close to the wall of Jacobs Hall.  Raw egg comes splattering out of its side, accompanied by loud groans from above.[or]A box-like object crashes into the concrete close to the wall of Jacobs Hall, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.  Egg yolk drips from a seam.[or]Someone runs into the courtyard from around the corner, gathers up the various boxes and containers, and runs off again.[or][one of]A box-like object crashes into the concrete close to the wall of Jacobs Hall.  Raw egg comes splattering out of its side, accompanied by loud groans from above.[or]A box-like object crashes into the concrete close to the wall of Jacobs Hall, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.  Egg yolk drips from a seam.[or]Someone runs into the courtyard from around the corner, gathers up the various boxes and containers, and runs off again.[at random][stopping]"

Part 9 - First Floor Midpoint

The West End of Jacobs Hall is a region. First Floor Rooms West, Second Floor Rooms West, Third Floor Rooms West, Pits West are in the West End of Jacobs Hall.  

The East End of Jacobs Hall is a region. First Floor Rooms East, Second Floor Rooms East, Third Floor Rooms East, Pits East are in the East End of Jacobs Hall.  

Chapter 1 - Description

First Floor Midpoint is a room, north of the Info Desk. "The first floor is where the older boys, including your brother Aidan, are housed.  The walls are plastered with images of winter sports, which makes perfect sense given that it's the middle of summer.  Between the skiers and the snowboarders, the hallway continues east and west, while the main stairs go up to the girls['] dorms and down to the younger boys['] dorms; and of course there's the info desk back to the south.  A friendly-looking cardboard cutout of Olympic ski champion Stephan Eberharter holds a pouch full of cutouts of all things winter-sporty, practically begging you to stick more of them up on the walls."

Chapter 2 - Scenery

Section 1 - Cut out Stephan Eberharter

Rule for printing the description of Stephan Eberharter: 
	say "He's been glued to the wall, no doubt because this particular junction sees a lot more traffic than most.";

Understand "olympic", "ski champ", "skiing", "champ", "champion" as Stephan Eberharter.

Instead of taking Stephan Eberharter:
	try examining Stephan Eberharter;

Section 2 - Cutout Pouch

Rule for printing the description of Stephan Eberharter's cutout pouch:
	say "It's full of cutouts of snowboards, skis, hockey sticks, skates, sleds and other things that make you want to put on your scarf and your warm, woolly mittens."

Stephan Eberharter's cutout pouch is represented by the images of winter sports.

Section 3 - Wall cutouts

Rule for printing the description of the images of winter sports:
	say "You see far too many of those here.".

Understand "ski/skis", "snowboard/snowboards", "snow board/boards", "skate/skates", "sled/sleds", "sledge/sledges", "sleigh/sleighs", "cutouts" as the images of winter sports.

Understand "hockey stick/sticks" as the images of winter sports when the player can not see the matching pair of hockey sticks.

Part 10 - First Floor Rooms, West

Chapter 1 - Description

First Floor Rooms West is a room, west of the First Floor Midpoint. "You're at the west end of the first floor dorm area.  The winter sports theme continues on in spite of the summer sunshine streaming in through the window.  Aidan's room is to the north, flanked by a pair of matching hockey sticks, and you could take the fire stairs up or down."

Chapter 2 - Scenery

Section 1 - East and West Windows

The windows of Jacobs Hall are a kind of backdrop. The windows of Jacobs Hall are privately-named. Understand "locked", "sealed", "window" as windows of Jacobs Hall.

Rule for printing the name of the windows of Jacobs Hall:
	say "window";

The western windows of Jacobs Hall are windows of Jacobs Hall, privately-named, in the West End of Jacobs Hall. 

A view of Second Avenue is a backdrop, in the West End of Jacobs Hall.

Rule for printing the description of the western windows of Jacobs Hall when in the First Floor Rooms West:
	say "It's locked, and sealed with a cutouts of cross-country skiers.  Through it, you can see Second Avenue.";

Rule for printing the description of the view of Second Avenue when in the First Floor Rooms West:
	say "There's not much traffic, this time of the day, and you find yourself wondering what it would be like to snowshoe from one end to the other.  In winter, of course.  Not now.";

Instead of searching the windows of Jacobs Hall:
	try examining the noun instead;

To decide if (c - person) is in dead end mentions:
	if C is in First Floor Rooms West, yes;
	if C is in First Floor Rooms East, yes;
	if C is in Pits West, yes;
	if C is in Pits East, yes;
	no.

Instead of going north when the player is in dead end mentions, mention dead end.
Instead of going south when the player is in dead end mentions, mention dead end.

To mention dead end: say "[if in Chapter 8]That would put you in a dead end!  And by dead end, I mean DEAD end!  Also, all the doors there are locked[otherwise]Most of the rooms are locked.  And the ones that aren't, are occupied by people you do not know[end if]."

Instead of examining a door when the player is in dead end mentions, say "No name tags, but each door has been decorated with cutouts of various sorts."


Section 2 - Hockey Sticks

The matching pair of matching hockey sticks is scenery, in the First Floor Rooms West.

Part 11 B - Aidan's Room

Aidan's Room is a dorm room. "Aidan shares this room with some guy whose name you never caught and whom you almost never see.  Aidan keeps his half of the room neat and spartan, almost as if he were expecting a military inspection at any moment.  The bedclothes look to be pulled tight enough to bounce a penny to the ceiling, and the desk is practically bare but for a few neatly regulationed necessities.  The door to the dorm corridor is back to the south."

Aidan's door is a door, scenery, closed, locked, north of First Floor Rooms West, south of Aidan's Room.

Instead of opening Aidan's Door during Scavenger Hunting:
	say "[if in Chapter 8]You jiggle the handle, but the door is locked![otherwise]Aidan isn't in right now, and you shouldn't be poking around in his room while he's gone.  Even if he is your brother.  Especially if he's your brother.  And anyway, the door is locked.";

Aidan's bed is a supporter, enterable, scenery, in Aidan's room. "Your father is a naval officer, and Aidan seems to take this fact rather more seriously than you do.  His bed is perfectly ship-shape, with shoes and boots lined up for inspection beside it.  You happen to know that Aidan also keeps a guitar stashed away under his bed, behind those perfect shoes and boots."

Aidan's boots are scenery, in Aidan's room. "If you kept your shoes and boots in such perfect order, you wouldn't have to hunt about for them every morning.  You'd also freak out your roommate... which Aidan no doubt has already done, seeing as how whats-his-name never seems to be around."

Aidan's guitar is scenery, in Aidan's room. "It's in its case, for now.  Aidan's quite good, though he doesn't practice as much as he really should.  You sometimes wonder where he finds the time to practice at all."

Instead of playing Aidan's guitar, say "You do a ridiculous imitation of your older brother, to your great amusement.[line break][line break]Then you put his guitar back, [italic type]exactly[roman type] as you found it."

Some neatly regulated necessities are scenery, plural-named, in Aidan's room. "Aidan's toiletries are so neatly laid out that you wonder if he ever actually uses them."  Understand "toiletries" as the neatly regulated necessities.

Instead of doing something to the neatly regulated necessities when the necessities are physically involved, say "It would be a sin to meddle with such perfect order."

Aidan's desk is scenery, a supporter, in Aidan's room.

Aidan's laptop is scenery, on Aidan's desk.

A ring is a kind of thing.  A ring is always wearable. Aidan wears 2 rings.


Part 12 - First Floor Rooms, East

Chapter 1 - Description

First Floor Rooms East is a room, east of the First Floor Midpoint. "This is the east end of the first floor dorm area.  Through the window at the end of the hall, you can see Calvin Field North and a bunch of campers running about in the summer sunshine.  In here, you are surrounded by images of people having snowball fights.  The fire stairs at this end of the hall go up and down."

Chapter 2 - Scenery

The eastern windows of Jacobs Hall are windows of Jacobs Hall, in the East End of Jacobs Hall.

Rule for printing the description of the eastern windows of Jacobs Hall when in the First Floor Rooms East:
	say "It's locked, and sealed with a large cutout of a dogsled pulled by more huskies than you thought was legal.  Through it, you can see Calvin Field North."

A view of Calvin Field is a backdrop, in the East End of Jacobs Hall.

Rule for printing the description of the view of Calvin Field:
	say "There seems to be an awful lot of running around over Calvin Field today.";

Understand "running", "around", "runners", "students", "campers", "myth tag", "tag", "game", "calvin field", "calvin field north", "field north" as the view of Calvin Field.



Part 13 B - Hank & Joe's Room

Hank's Room is a dorm room. "The less said about the mess in this room, the better.  The exit is back to the north."

Hank's door is a door, scenery, improper-named, locked, south of First Floor Rooms East, north of Hank's Room.

Rule for printing the name of Hank's room:
	say "Room";

Before printing the name of Hank's room:
	if Joe is identified and Hank is identified:
		say "Joe and Hank's ";
	otherwise if Joe is identified:
		say "Joe's ";
	otherwise if Hank is identified:
		say "Hank's ";
	otherwise:
		say "Dorm ";

Rule for printing the name of Hank's door:
	say "door";

Before printing the name of the proper-named Hank's door when Joe is identified or Hank is identified:
	if Joe is identified and Hank is identified:
		say "Joe and Hank's ";
	otherwise if Joe is identified:
		say "Joe's ";
	otherwise:
		say "Hank's ";

Hank is a man, unidentified, improper-named, in Hank's room.
Joe is a man, unidentified, improper-named, in Hank's room.

Rule for printing the name of unidentified Hank:
	say "boy";

Rule for printing the name of unidentified Joe:
	say "boy";

Before listing contents of Hank's room:
	group unidentified men together;

Rule for grouping together unidentified men when in Hank's Room:
	say "[listing group size in words] older boys";

Rule for writing a paragraph about Hank:
	placeholder "Room description text about [Hank].";

Rule for writing a paragraph about Joe:
	placeholder "Room description text about [Joe].";

Part 14 - Pits Stairwell

Chapter 1 - Description

The Pits Stairwell is a room, down from the First Floor Midpoint. "This is the Pits, and evidently someone thought it would be a good idea to decorate the area dedicated to housing newbies with images taken from classic horror movies.  Frankenstein's monster looms over the doorway to the south, as if standing guard outside the Pits Lobby, while werewolves and vampires romp away to the east and west.  The stairs themselves lead back upstairs to the wintery delights of the first floor."

Chapter 2 - Scenery

Section 1 - Cut out Frankenstein's Monster

Rule for printing the description of cutout Frankenstein's Monster:
	say "He's holding a pouch full of scary monster cutouts.  'Go on, be an evil scientist,' he seems to be saying, 'go make more monsters.  Mwahahaha.'"

Baron Frankenstein is scenery in the Pits Stairwell. Understand "frankenstein" as Baron Frankenstein.

Before doing something when Baron Frankenstein is involved:
	[a few sanity checks because of the 9-character parsing limit!]
	unless the player's command matches the text "Frankenstein's", case insensitively:
		if the player's command matches the text "Frankenstein", case insensitively:
			say "[one of]Frankenstein was the creator, not the monster... but never mind.  [or][stopping][run paragraph on]";
	redirect the action from Baron Frankenstein to cutout Frankenstein's Monster, and try that instead.

Section 2 - Cutout Pouch

Does the player mean doing something with Frankenstein's Monster's cutout pouch: it is unlikely. 

Rule for printing the description of Frankenstein's Monster's cutout pouch:
	say "It's full of pictures calculated to keep you awake all night."

Frankenstein's Monster's cutout pouch is represented by the images of classic horror. Frankenstein's Monster's cutout pouch vends cutout Frankenstein's Monster.

Section 3 - Wall cutouts

Rule for printing the description of the images of classic horror:
	say "Booga booga booga!". 

Understand "vampire/vampires", "ghoul/ghouls", "ghost/ghosts", "monstrous", "scary" as the images of classic horror.

Understand "werewolf/werewolves", "were wolf/wolves" as the images of classic horror when the player can not see the cutout werewolf.

Part 15 - Pits West

Chapter 1 - Description

Pits West is a room, west of the Pits Stairwell, down from First Floor Rooms West. "This end of the Pits hallway is somewhat less spooky than the rest: the paper skeletons dancing across the walls all seem quite cheerful and not at all threatening.  Dim light filters in through a high window, through which you can see the bushes and assorted shrubbery growing up against the building.  From here, you could also go back east to the main stairwell, or take the fire stairs upstairs."

Chapter 2 - Scenery

Rule for printing the description of the western windows of Jacobs Hall when in Pits West:
	say "It's rather high up in the wall, but you can see right under the bushes to Second Avenue.  If zombies attack, you could take out their kneecaps easy as anything, from here.";

Understand "dim light", "light", "high" as the western windows of Jacobs Hall when in Pits West.

Rule for printing the description of the view of Second Avenue when in Pits West:
	say "From here, it looks like a thin ribbon of asphalt.";

Understand "thin", "asphalt", "ribbon", "ribbon of", "asphalt", "road" as the view of Second Avenue when in Pits West.

Some cheery skeletons are scenery, in Pits West. "They do look like a cheery bunch, don't they?"

Rule for printing the name of the cheery skeletons:
	say "skeletons";

Understand "bunch", "bunch of", "happy", "friendly", "paper", "dancing", "skeleton" as the cheery skeletons.

The roots of some bushes are scenery, plural-named, in Pits West. "It feels almost indecent, looking at everything from between their roots like this."

Rule for printing the name of some bushes:
	say "bushes";

Understand "bush", "shrubs", "shrubbery" as the roots of some bushes.



Part 16 - Lucian's Room

Lucian's Room is a dorm room. "It's another dorm room, not much different from your own.  Lucian's desk and bed are on one side; a CD player, playing [SONG] over and over, sits on his desk beside a couple of framed photographs."

To say SONG:  [todo]
	placeholder "[bracket]SONG[close bracket]";

Chapter 1 - Scenery

Section 1 - Door

Lucian's door is a door, scenery, closed, locked, north of Lucian's Room, south of Pits West.

Section 2 - Beds

Lucian's bed is scenery, enterable, a supporter, in Lucian's room. "Standard, regulation LEAP beds."

Lucian's desk is scenery, a supporter, in Lucian's room. "Standard, regulation LEAP desks, littered with the odd personal items that save them from complete anonymity."

Lucian's photographs are scenery, on Lucian's desk. "There are two of them.  One appears to be a class photograph taken a year or two ago: there's an older man, maybe in his fifties, surrounded by a bunch of kids, in front of a blackboard.  The other is much older, judging by the clothes and hair, and shows a cheerful little old lady sitting on a bench in a colorful flower garden."

After examining Lucian's photographs during Chatting to Lucian:
	try asking Lucian about "photographs";

Lucian's CD player is scenery, on Lucian's desk. "How many times can one person listen to [SONG] at one go?"

Chapter 2 - Lucian

Lucian is a man, in Lucian's Room. The description is "Lucian's a little shrimp of a newbie.  He looks rather pale and colorless, with thin white-blonde hair plastered close to his scalp.  In short, he's rather typical bully-bait."

Instead of attacking Lucian:
	say "You've never been a bully, and you're not about to start now.";

Instead of kissing Lucian:
	say "Not on your life.";

Rule for writing a paragraph about Lucian:
	placeholder "Room description text about [Lucian].";

Part 17 - Pits East

Chapter 1 - Description

Pits East is a room, east of the Pits Stairwell, down from First Floor Rooms East. "Your room is at this end of the Pits hallway, just to the south of here.  You've elected to cover your door with the biggest cutout of a werewolf that you can find, because werewolves are cool.  The hallway continues west, and a high window on the east wall looks out across Calvin Field North.  Right beside your room door is the fire stair leading back upstairs."

Chapter 2 - Scenery

Rule for printing the description of the eastern windows of Jacobs Hall when in Pits East:
	say "The window is locked and sealed with a cutout you found of a werewolf gnawing on the leg of a skeleton.  From this angle, what you see through the window are mostly the legs of people running back and forth across Calvin Field North."

Rule for printing the description of the view of Calvin Field when in Pits East:
	say "There seems to be an awful lot of running around over Calvin Field today.";

A cutout werewolf is a wall cutout, in Pits East and Your Room. "Rowrr.  Sure, werewolves are supposed to be scary, but you can't help but think they're too cool to be lumped together with all the zombies and vampires and assorted creeps that make up the standard classic horror fare[if we have examined the portrait of Alexander Quaverley Jacobs].  This particular one has huge whiskers that somehow make you think of the portrait of AQJ up by the info desk[end if]."

Understand "whiskers" as the cutout werewolf when the location is Pits East.
Understand "wolfie", "werewolf", "were-wolf", "were wolf", "wolf" as the cutout werewolf.



Part 18 - Pits Lobby Central

Chapter 1 - Description

Pits Lobby Central is a room, south of Pits Stairwell. "This section of the Pits is part of the older part of Jacobs Hall, and therefore cut up into more interesting shapes.  There are a bunch of storerooms, all of them locked, and then two very large halls to the east and west.  A passage to the north leads back to the main stairwell.  Apparently there used to be another staircase here going up, but it was ripped out to give this place a little more elbow room."

Chapter 2 - Scenery

The storeroom doors are scenery in pits lobby central. "Aidan told you once that the storerooms are full of vampires in their coffins, and that campers who tried to sneak around after lights out had a habit of disappearing, never to be seen again.  Haha, he's such a joker ... you weren't fooled for a minute.  Not for a minute, no sir....  [line break]".  Understand "storerooms" as the storeroom doors.

Instead of going Up when in pits lobby central, say "There USED TO BE a staircase here.  Unless you have a time machine, going up from here is not going to get you anywhere."

Instead of opening or entering the storeroom doors, say "The storerooms are reassuringly locked tight."


Part 19 - Pits Lobby West

Chapter 1 - Description

Pits Lobby West is a room, west of Pits Lobby Central. "This windowless area used to be a wine cellar, but today it's like something out of science-fiction.  It's being used for the Virtuality option, and there are cables and computers and virtual reality equipment all over the place.  It's a little alarming, in fact, knowing that many of these campers -- the ones wearing the goggles, anyway -- can't actually see you.  The central lobby is back to the east."

Chapter 2 - Scenery

The Virtual Reality option is an option, scenery, in Pits Lobby West. "It's really quite amazing.  You'll have to sign up the next time this becomes available."

Understand "VR" as the virtual reality option.

Some powerful computers are scenery, in Pits Lobby West. "Clearly money was not an issue when supplying the program with computers.  These are all powerful, top-of-the-line models, as they have to be to run the virtual reality software.  They're also new this year: last year's computers, though pretty good, weren't exactly NASA quality."

Understand "amazing", "cables", "equipment", "goggles", "top-of-the-line", "top of the line", "models" as the powerful computers.

Rule for printing the name of the powerful computers:
	say "computers";

Part 20 - Pits Lobby East

Chapter 1 - Description

Pits Lobby East is a room, east of Pits Lobby Central. "This part of the Pits used to be the kitchen, once upon a time.  Imagine, having the kitchen in the basement, downstairs from the dining room!  All the kitchen equipment's been removed now, though, and the place is used as a sort of recreation room.  There are several Ping Pong tables here, and a Ping Pong tournament going in full swing.  The central lobby is back to the west.[paragraph break]Ava and Stacy have both taken this option and are waiting for their turn at the ping pong tables."

Chapter 2 - Scenery

Some regulation ping pong tables are scenery, in Pits Lobby East. "Regulation ping pong tables.  You could call them table tennis tables, but that sounds a little redundant."

Understand "table", "tennis", "game" as the ping pong tables.

Before doing something when the ping pong tables are involved and TRIG_TABLETENNIS is unfired and the player's command matches the text "table tennis tables":
	fire TRIG_TABLETENNIS;

TRIG_TABLETENNIS is a headache.

Rule for firing unfired TRIG_TABLETENNIS:
	say "(It does sound redundant, doesn't it?)[command clarification break]";

Rule for printing the description of the regulation ping pong tables when the player's command matches the text "table tennis tables":
	say "Regulation ping pong tables.";

Instead of taking the ping pong tables when the player can see the table tennis option:
	say "You'll have to take the option first.";

Understand "play [ping pong tables]" as taking.
Understand "play on [ping pong tables]" as taking.
Understand "play [table tennis option]" as taking.
Understand "play on/in [table tennis option]" as taking.

The table tennis option is an option, scenery, privately-named, in the Pits Lobby East. "It's still too early to say who's winning, but it looks like everybody's having fun.  So maybe everybody wins."

Understand "ping pong", "table tennis", "option" as the table tennis option when the player's command matches the text "option", case insensitively.

Understand "option", "tournament", "match" as the table tennis option.

Chapter 3 - Ava

Section 1 - Description

Ava Winters is a woman, in the Pits Lobby East. The description of Ava is "You met Ava last year, here at LEAP.  She's a rosy-cheeked girl with long, brown pigtails; since last year, she's also acquired a pair of glasses that, she claims, make her look like a young Nana Mouskouri."

Rule for printing the name of Ava Winters:
	say "Ava";

Rule for printing a locale paragraph about Ava Winters during Scavenger Hunting:
	now Ava is mentioned;

[ Rule for writing a paragraph about Ava Winters:
	placeholder "Room description text about [Ava Winters]."; ]

Chapter 4 - Stacy

Section 1 - Description

Stacy Alexander is a woman in the Pits Lobby East. The description of Stacy is "You met Stacy last year, here at LEAP.  She's a skinny blonde girl with freckles and rather prominent front teeth.  She likes playing with gadgets, and is so full of nervous energy she could probably swallow an elephant and not gain an ounce of weight[if Stacy wears the little straw hat].  She's also wearing a neat little straw hat with a pink ribbon trailing behind[end if]."

Rule for printing the name of Stacy Alexander:
	say "Stacy";

Stacy wears a little straw hat. The description of the straw hat is "PLACEHOLDER straw hat." A pink ribbon is part of the little straw hat. The description of the pink ribbon is "PLACEHOLDER ribbon." The little straw hat fulfills the hat-goal.

Rule for printing a locale paragraph about Stacy Alexander during Scavenger Hunting:
	now Stacy is mentioned;

[ Rule for writing a paragraph about Stacy Alexander:
	placeholder "Room description text about [Stacy Alexander]."; ]

Section 2 - Conversation

Instead of inquiring Stacy about the little straw hat, start conversation with Stacy on Q_STACY_0.

Q_STACY_0 is a quip. The display text is "'Hey, Stacy,' you say, 'I don't suppose I could borrow your hat for a bit, could I?'[paragraph break]'What?  What am I supposed to wear, then?'"

Q_STACY_1 is a quip. The display text is "'No.'"

Q_STACY_2 is a quip. The display text is "'No way, Ava and I will lose our place in the line if I run up to our dorm to get another hat.'"

Q_STACY_3 is a quip. The display text is "'No.'"

Q_STACY_4 is a quip. The display text is "Stacy hesitates a little, then sweeps the hat off her head.  'Okay, fine.  But if you ruin it, I'll kill you with a screwdriver.'"

Q_STACY_0a is a menu quip. The following quip is Q_STACY_1. The menu text is "'Please?'".
Q_STACY_0b is a menu quip. The following quip is Q_STACY_2. The menu text is "'I know you've got a bunch of other hats you could wear.'".
Q_STACY_0c is a menu quip. The following quip is Q_STACY_4. The menu text is "'Come on, it's for the scavenger hunt.  Please?'"

Q_STACY_1a is a menu quip. The following quip is Q_STACY_3. The menu text is "'Pretty please?'".

Q_STACY_3a is a menu quip. The following quip is Q_STACY_1. The menu text is "'P-p-p-please?'".

The response of Q_STACY_0 is {Q_STACY_0a, Q_STACY_0b, Q_STACY_0c}.
The response of Q_STACY_1 is {Q_STACY_1a, Q_STACY_0b, Q_STACY_0c}.
The response of Q_STACY_2 is {Q_STACY_0a, Q_STACY_0c}.
The response of Q_STACY_3 is {Q_STACY_3a, Q_STACY_0b, Q_STACY_0c}.

After firing Q_STACY_4:
	now the player carries the little straw hat;

Part 21 - Your Room

Chapter 1 - Description

Your Room is a dorm room. "You share this room with first-year camper Jeremy Dolan, who hates werewolves for some inexplicable reason.  He let you put the werewolf cutout on the outside of the door only because you let him put up a vampire cutout on the inside.  Jeremy's not around right now, though, so you'll have to wait before continuing your ongoing discussion as to whether vampires or werewolves are cooller.  In the meantime, there's your bed and your desk, and the door back to the north."  Understand "my" as your room.

Your dorm room door is a closed door, scenery, south of Pits East, north of Your Room. Understand "my" as your dorm room door.

First before going to a dorm room during Scavenger Hunting: say "Michelle said the dorm rooms are off-limits for the hunt." instead.

Before going north when in your room, say "You step out of the room, locking it behind you."

[Before going outside when in your room, say "You step out of the room, locking it behind you."]
[After exiting your room, say "You step out of the room, locking it behind you."]

Chapter 2 - Scenery

Instead of doing something when the cutout werewolf is involved and when in Your Room:
	say "[if the second noun is nothing]He[otherwise]Wolfie[end if]'s on the other side of the door.  Thinking about it now, maybe you should have let Jeremy put his vampire cutout on that side instead, and wolfie on this side.";

A cutout vampire is scenery, in Your Room. "It is a mystery to you why anyone would think these snotty, bloodless monsters are cool, except in the sense of being cold, dead bodies.  Also, this particular vampire cutout seems to have a disconcerting way of following you with his eyes, which is really creepy."

Your bed is scenery, a supporter, in Your Room. "A standard, regulation LEAP bed, with nothing under it but dust.  You've looked several times, especially in the mornings when you can't find your [one of]slippers[or]socks[or]shoes[or]keys[at random]."

Instead of Looking under your bed, say "Oh hey, someone's gone and swept under the bed."

Instead of hiding yourself under your bed when in chapter 8, say "Aidan may be pumped full of sedatives, but they're not going to make him stupid enough to miss you crawling under your bed!"


Instead of entering or lying on your bed, say "Now doesn't really seem to be the time for sleep."
Instead of sleeping,  say "Now doesn't really seem to be the time for sleep."


Some dust is scenery, in Your Room. 

Your desk is scenery, a supporter, in Your Room. "A standard, regulation LEAP desk, with a built-in electrical outlet for your laptop if you have one.  The actual outlet is probably in some inconvenient place behind the desk, but why they couldn't just supply you with a power bar, you don't know.  Well, you suppose desks with built-in outlets are pretty cool.  Just... not as cool as werewolves."

Understand "standard", "regulation", "LEAP", "laptop" as your desk.

The built-in electrical outlet is part of your desk. Understand "electric", "power", "socket" as the built-in electrical outlet.

Part 22 - Second Floor Lobby

Chapter 1 - Description

Second Floor Lobby is a room, up from First Floor Midpoint. "Hooray for Hollywood!  The words are emblazoned right across the wall, over a cutout of Audrey Hepburn holding a pouch full of smaller cutouts of other Hollywood stars.  The glamour continues east and west, to where the younger girl campers are roomed, while the stairs go up and down.[if in chapter 1][paragraph break]A few tables have been set up here for the RPG option, and the campers involved seem thoroughly absorbed in the unfolding story.[otherwise if in chapter 2][paragraph break]It looks like yesterday's RPG option is still going strong here."

Chapter 2 - Scenery

Understand "big-name", "A-list", "actors", "actresses", "past and present", "hollywood", "stars" as the images of Hollywood stars.

Rule for printing the description of Audrey Hepburn as Holly Golightly:
	say "It's Audrey Hepburn in her role as Holly Golightly in 'Breakfast at Tiffany's.'  You haven't seen that movie, but somehow you suspect that Holly Golightly never, at any point in the story, dangled a pouch of any sort from the end of her cigarette holder."

Understand "cigarette", "holder", "breakfast", "at", "tiffany's" as Audrey Hepburn as Holly Golightly.

Rule for printing the description of Audrey Hepburn as Holly Golightly's cutout pouch:
	say "It's full of big-name, A-list actors and actresses, past and present.";

Audrey Hepburn as Holly Golightly's cutout pouch is represented by the images of Hollywood stars.

Audrey Hepburn as Holly Golightly's cutout pouch vends the cutout picture of Charlie Chaplin.

After taking Audrey Hepburn as Holly Golightly's cutout pouch:
	say "You rummage around among the celebrities like a tabloid journalist questing for a scandal, and finally emerge with with a small cutout of Charlie Chaplin.";

Instead of taking Audrey Hepburn as Holly Golightly's cutout pouch when the prize of the noun is handled:
	say "A fellow can only take so much glamour in one go, don't you think?".

A cutout picture of Charlie Chaplin is a thing. The description is "It's a small cutout of Charlie Chaplin.  He looks alarmingly like Adolf Hitler, only with curly hair."

Instead of attacking the cutout Charlie Chaplin:
	say "Much as he looks like Hitler, you can't bring yourself to do anything so nasty to that lovable old tramp Charlie Chaplin.";

The cutout Charlie Chaplin fulfills the star-goal.

Chapter 3 - RPG Option

The RPG option is an option, scenery, in the Second Floor Lobby. "[if in chapter 1]You've not had much exposure to roleplaying games in the past, but they look quite interesting.  You'd have signed up for this option this evening if it hadn't filled up within seconds of being offered.  You'll get another chance some time later, though, never fear.  At any rate, this time round they're playing something called Seventh Sea, which seems to be all about swashbuckly goodness, arrr[otherwise]They must have really enjoyed themselves yesterday[end if]." 

Understand "role", "playing", "roleplaying", "role-playing", "game", "games", "gamer", "gamers", "seventh", "sea", "tables" as the RPG option.


Instead of listening to the second floor lobby when in chapter 1, try listening to the RPG option.

Instead of listening to the RPG option, say "[one of]'No way!  I should totally have made that roll!'[or]'Where's my drama die, then?'[or]'...one and one and two and two and one....'[or]'Excuse me, milady, but I must punch you in the face now.'[or]'It could be worse.  Okay, maybe that IS worse.'[or]'But I am not left-handed either!'[or]'What?  A gazebo?  How ... how big is it?'[or]'We confront the villainous villainess with the evidence!'[or]'He what?  That no-good scoundrel!'[or]'I hit it with my sword.'[at random] [line break]"


Part 23 - Second Floor Rooms West

Chapter 1 - Description

Second Floor Rooms West is a room, west from Second Floor Lobby, up from First Floor Rooms West. "The large window at this end of the corridor would normally look out over Second Avenue, but someone's gone and plastered it over with cutouts of every actor who's ever played James Bond.  There's definitely a spy thriller motif going on here: the only surfaces not covered with more of the same are the doors to the rooms and the door to the fire stairs, which continue up and down from here.  The way back to the east looks significantly less cloak-and-dagger."

Chapter 2 - Scenery

Bond is a kind of thing, scenery. The Bonds are defined by the table of actors who played Bond. Understand "007", "spy", "spies", "bonds" as [not just any Bond, but...] James Bond [avoiding disambiguation requests].

Table of actors who played Bond
Bond
James Bond
Sean Connery
George Lazenby
Pierce Brosnan
Timothy Dalton
Roger Moore
Daniel Craig
David Niven

Rule for printing the description of a Bond:
	say "Someone clearly thinks this is the spy who loved her.";

Rule for printing the description of David Niven:
	say "Oh hey, someone's even counted the 1967 not-entirely-serious version of 'Casino Royale'!";

When play begins, now every Bond is in Second Floor Rooms West.

Rule for printing the description of the western windows of Jacobs Hall when in Second Floor Rooms West:
	say "The view is clearly for someone else's eyes only.";

Rule for printing the description of the view of Second Avenue when in Second Floor Rooms West:
	say "The view is clearly for someone else's eyes only.";

Part 24 - Second Floor Rooms, East

Chapter 1 - Description

Second Floor Rooms East is a room, east from Second Floor Lobby, up from First Floor Rooms East. "The girls at this end of the corridor seem to prefer movie posters to cutouts of actors.  The only cutout here is a lifesize Humphrey Bogart, on the door to the fire stairs.  Opposite Bogey, to the north, is Ava and Stacy's room, while behind Bogey are stairs going up and down.  And at the end of the corridor is, of course, the window overlooking Calvin Field, and stardom continues back to the west."

Chapter 2 - Scenery

Rule for printing the description of the eastern windows of Jacobs Hall when in Second Floor Rooms East:
	say "From here, you can see people running around on Calvin Field below.  The window itself is locked, of course."

A life-size cutout of Humphrey Bogart as Sam Spade is scenery, in the Second Floor Rooms East. "Humphrey Bogart as Sam Spade in 'The Maltese Falcon': trenchcoat, fedora, world-weary expression, and a general air of noir-ness.  Apparently he's guarding the stairs."

Understand "detective", "trenchcoat", "fedora", "world-weary", "world weary", "weary", "expression", "Bogey", "Bogie", "The Maltese Falcon", "in The Maltese Falcon" as the life-size cutout of Humphrey Bogart.

Some movie posters are scenery, in the Second Floor Rooms East. "You haven't heard of half of these films.  You wouldn't watch most of the others.  The remaining few are pretty good, though: you know that those were put up by your friends Ava and Stacy, who at least have some sense in them."

Understand "films", "film", "movies" as the movie posters.

Part 25 B - Stacy & Ava's Room

Stacy's Room is a dorm room. "Ava and Stacy both keep their respective sides of the room perfectly tidy; it's rather intimidating, actually.  You can tell whose side is whose by the stuff they keep on their desks: Ava has a CD player, an assortment of CDs, and a few books; Stacy has a few broken gadgets that she's fixing, probably because she broke them to begin with.  One of them has taped a poster for 'Casablanca' on the door to the south."

Stacy's door is a door, scenery, closed, locked. 
Stacy's Room is north of Stacy's door.
Stacy's door is north of Second Floor Rooms East.

Rule for printing the name of Stacy's door:
	say "Ava and Stacy's door";

Rule for printing the name of Stacy's room:
	say "Ava and Stacy's room";

Understand "Ava and", "Stacy and", "Ava's", "Stacy's" as Stacy's door.

Instead of opening Stacy's door during Scavenger Hunting:
	say "Ava and Stacy aren't in right now, and it wouldn't be right to go poking around in other people's rooms while they're gone.  And anyway, the door is locked.";

The poster for Casablanca is scenery, in Stacy's Room. "Here's lookin' at you, kid." 
The printed name of the poster for Casablanca is "poster for 'Casablanca'". 

Stacy's tools are scenery, plural-named, in Stacy's Room. "Rule one: never touch Stacy's tools.  Rule two: see rule one."


Ava's desk is scenery, in Stacy's Room.
Ava's CD player is scenery, on Ava's desk. "It also plays MP3s.  Ava loves her music."
Ava's CDs are scenery, plural-named, on Ava's desk. "Ava's on a folksong kick right now.  It's only a matter of time before she turns country-and-western, you think."
A few of Ava's books are scenery, plural-named, on Ava's desk. "A little light reading, mostly cosy little mysteries set in small New England towns."

Stacy's desk is scenery, in Stacy's Room.
A few broken gadgets are scenery, plural-named, on Stacy's desk. "Stacy's very fond of taking things apart and putting them back together again.  She's going to become a mad scientist and take over the world one day, if you and Ava don't watch her."




Part 26 - Third Floor Lobby

Chapter 1 - Description

Third Floor Lobby is a room, up from Second Floor Lobby. "This is where the older girls have their rooms.  The walls are painted a very dark blue, and there are planets, stars and all things space-age stuck all over the place.  A cutout of an astronaut holds out a pouch full of astronomical bits; the corridor itself extends east and west, and the stairs continue down to the rest of the dorms and up to the roof.[paragraph break]Under a particularly starry patch of ceiling, a group of campers, including your brother Aidan, are engaged in some freeform improvised poetry.  This is the Rap Session option, you think."

Chapter 2 - Scenery

Rule for printing the description of the astronaut:
	say "You can't tell who it is behind the visor, but it's almost certainly Neil Armstrong."

Understand "spaceman", "space man" as the astronaut.

Neil Armstrong is scenery, in the Third Floor Lobby. "One small step for a man, one giant LEAP... well, clearly someone thought they were being awfully clever."

Rule for printing the description of the astronaut's cutout pouch:
	say "A bag full of constellations.";

The astronaut's cutout pouch is represented by the images of stellar bodies.
The astronaut's cutout pouch vends the five-pointed star cutout.

Understand "stars", "constellations", "astronomical", "bits" as the images of stellar bodies.

Understand "star" as the images of stellar bodies when the player can not see the five-pointed star cutout.

After taking the astronaut's cutout pouch:
	say "You rummage around in the pouch and eventually pull out a large, five-pointed star.";
	now the player carries the five-pointed star cutout;

Instead of taking the astronaut's cutout pouch when the five-pointed star cutout is handled:
	say "No, people will think you're planning on decorating the girls['] dorms, and that's just wrong on too many levels.";

A five-pointed star cutout is a thing. The description is "It's a five-pointed star from the third floor decorations pouch.  You wonder which star it's supposed to be.  Probably one of those dull ones with lots of greek letters and numbers in its name."

The five-pointed star cutout fulfills the star-goal.

Section 1 - Rap Option

The rap session option is an option, scenery, in the Third Floor Lobby. "Rap or beat poetry, there's not that much difference that you can see here.  People are basically talking about their lives in an improvised rhythmic fashion."

Instead of taking the rap session option:
	say "Maybe after your improv theatre class.";

Instead of listening when the rap session option is in the location, placeholder "The sound of music!"


Chapter 3 - Event on Entering

Definition: a room is rapping if it is the location of the rap session option.

After going to somewhere rapping during Scavenger Hunting:
	try looking;
	fire TRIG_RAPSESSION;

TRIG_RAPSESSION is a headache.

Rule for firing unfired TRIG_RAPSESSION:
	say "As you enter the area, you experience a momentary headache and the urge to sneeze.  The feeling disappears quickly, but evidently not quickly enough because Aidan clearly seems to have noticed something wrong.  He breaks away from the rest of his option and comes up to you. [paragraph break]";
	move Aidan to the Location;
	start conversation with Aidan on Q_AIDAN_0;

Rule for firing fired TRIG_RAPSESSION:
	say "There it is, that funny throbbing feeling in the back of your head.  And there, it's gone again.";

Chapter 4 - Aidan

Section 1 - description of Aidan

Aidan is a man. The description of Aidan is "[if in chapters 1 through 5]Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He's pretty cool; he just turned 15 a couple of months ago, but hasn't gotten too cool to be seen with you yet.  On the other hand, if your secret plot to grow up just like him works out, he'll never get too cool for you[otherwise if in chapter 6]Robin Hood is thy brother in arms -- and indeed, thy brother Aidan.  There is not a nobler fellow in all of merry old England.[otherwise if in chapter 7][PLACEHOLDER see Focusing action].[otherwise if in chapter 10]Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He's pretty cool when he isn't a raving murderous monster, which Dr Rose says is never going to happen again.  For now, he just looks grateful that anyone at all is willing to still be friends with him after everything that's happened in the past week[end if]."  

To say PLACEHOLDER see Focusing action: placeholder "see Focusing action".

Instead of examining Aidan when in chapter 8, say "Aidan looks a bit drugged out, but no less dangerous.  [if Aidan has been able to see Brad]His right hand is clenched in a fist around his room keys, which he seems intent on sending to the back of your skull[otherwise]His hands are clenched into fists, and he seems intent on pounding you into applesauce[end if]."

Instead of examining Aidan when in chapter 9 and the player is in land of the dead: say "[if Aidan does not wear a ring] He looks grey and cold and lifeless.  His hands are crossed at the wrist, over his chest, fingers splayed.  For some reason, he's dressed up as Robin Hood[otherwise if Aidan wears two rings]He looks feverish, like he's in pain.  He's wearing a pair of matching rings[otherwise]He looks like he's asleep.  His hands are crossed at the wrist, over his chest, fingers splayed.  For some reason, he's dressed up as Robin Hood.  A single gold ring glints on one finger[end if]."

Instead of examining Aidan when in chapter 9 during battle with the Thief: say "Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He also seems to know kung fu, though that isn't really giving him much of an edge over the Thief."

Instead of examining Aidan when in chapter 9 and the player is not in the mindscape: say "He doesn't look very happy to be here.  Then again, who would?  Fortunately for everyone, he's also unconscious and drooling slightly.  He's being kept sedated, but goodness only knows how long that will last."[ go to ">Focus on Aidan"] [todo?]


Understand "big bro/brother", "bro/brother", "taller", "broader", "aiden" as Aidan.

Rule for writing a paragraph about Aidan when in chapter 1: say "Your brother Aidan is here, having signed up for the Rap Session option."

Rule for writing a paragraph about Aidan when in chapter 2 and the player is in Aidan's room: say "Aidan is sitting at his desk, clearly in the middle of a computer game of some sort."

Rule for writing a paragraph about Aidan when in chapter 2: say "Your brother Aidan is here."

Rule for writing a paragraph about Aidan when in chapter 6: say "Robin Hood, thy brother-in-arms, standeth before thee."

Rule for writing a paragraph about Aidan when in chapter 7: say "Aidan's here, and he looks seriously psychotic!"

Rule for writing a paragraph about Aidan when in chapter 8: say "Aidan is here, swaying a little and looking like an enraged bull with a killer headache."

Rule for writing a paragraph about Aidan when in chapter 9 and the player is in Deepest Place: say "Aidan's here, and he looks normal.  Except he knows kung fu, which isn't quite normal."

Rule for writing a paragraph about Aidan: do nothing. [is Scenery]


Section 2 - non-conversation with Aidan

Instead of conversing when in chapters 7 through 8 and Aidan is the noun, say "Aidan does not appear to be in any mood to listen to you.  He probably can't even hear you over the pounding blood in his ears."

Instead of conversing when in chapter 3 and Aidan is the noun, say "Aidan's too far away to speak to, at the moment.  You'll have to wait until later this evening."  Instead of conversing when in chapter 5 and Aidan is the noun, say "Aidan's too far away to speak to, at the moment.  You'll have to wait until later this evening."

Instead of conversing when Aidan is the noun and in chapter 6, say "Forsooth, such existeth not within the bounds of this simulation."

section 3 - conversation with Aidan

The conversation table of Aidan is the table of Aidan's conversation.
The object-based conversation table of Aidan is the table of Aidan's replies.

Table of Aidan's replies
conversation 	reply	
an object [default]	"He does not reply."	
Claudia Rose	"[if in Chapters 1 thorugh 2]'She seems like a nice lady.  Kind of like everybody's favorite auntie, eh?'"
Brad Kramer		"[if in Chapters 1 through 2]'I never had him as a counselor, but he joins some of us for a game of basketball now and then.  He's pretty cool, actually.'"
Ava			"[Aidan on Ava & Stacy]"
Stacy		"[Aidan on Ava & Stacy]"
Lucian		"[if in Chapter 1]'Who?'[otherwise if in Chapter 2 and Crystal Quest is not happening]'Sorry, Daniel, I don't see how I can help, there.'[otherwise if in chapter 2 and Crystal Quest is happening][about Joe and Hank and bullying][otherwise if in Chapters 2 through 5]'I hope getting back that crystal makes your friend feel better.'[otherwise if in Chapter 6]This Lucian of whom thou speaketh, existeth not in the time of Robin Hood."
Joe		"[about Joe and Hank and bullying]"
Hank	"[about Joe and Hank and bullying]"
Aidan's guitar	"[if in Chapter 1 through 2]'I should practice my guitar more, but there's just way too much other stuff to do here.'"

A woman can be asked about.  A woman is usually not asked about.

To say Aidan on Ava & Stacy: 
	now the second noun is asked about;
	if in chapter 1, say "'Oh yeah, she's your girlfriend, isn't she?'[paragraph break]'She is not!'[paragraph break]'Sure she isn't.' Aidan grins in a way that makes you want to smack him. [if Ava is asked about and Stacy is asked about] 'You're going to have to choose between one of those two girls one of these days, you know.'[end if][paragraph break]'She is NOT my girlfriend!'";
	otherwise say "[if in chapter 2]It wouldn't be polite to talk about her while she's standing right there.  Anyway, Aidan's probably going to give you the ribbing of your life later about how all the girls just fawn over you, bleagh.[otherwise if in chapter 6]And who, pray tell, is this maiden of whom thou asketh?  She appeareth not in the script."


To say about Joe and Hank and bullying: say "[if in Chapter 1]'Look, if anyone starts picking on you, you be sure to tell me, okay?'[otherwise if in Chapter 2 and Crystal Quest has not happened]'Sorry, Daniel.  I mean, I could just tell them to stop picking on people, but that's never worked before.  Unless there's something else you need from them, we're out of luck.'[otherwise if in chapter 2 and Crystal Quest is happening][Aidan quips CT_AIDAN_HELP][otherwise if in Chapter 6]Such craven villains existeth not in the time of Robin Hood; or if they did, thou shalt surely vanquish them ere the tale is told."

Understand "help", "bullies/bully/bullying", "crystal", "earth crystal", "hank and/& joe", or "joe and/& hank" as "[bullying]".

After asking Aidan about "[damon]" when in chapters 1 through 2: say "Yeah, he was a pretty cool dude.  You remember, you met him last year.  I was kind of worried about how things were going to be this year, now he's gone and his sister's in charge, but so far it's been okay, I think."
After asking Aidan about "[bullying]" when in chapters 1 through 2: say "[about Joe and Hank and bullying]".
After asking Aidan about "much" when in chapter 6: say "Much may be made of muchness, but thy comrade appeareth not in the humor to humor thy question."
After asking Aidan about "longbow/bow/archery" when in chapter 6: say "I'm Robin Hood.  That means I'm the best there is with a longbow."
After asking Aidan about "nottingham" when in Chapter 6: say "The town of Nottingham isn't too far off.  We can get there in plenty of time."
After asking Aidan about "mass/church" when in chapter 6: say "Only a real villain would dare to try and pick a fight in a church, so we'll be fine."
After asking Aidan about "oboe" when in chapters 1 through 2: say "'I don't play the oboe.  Why do you ask?'"
After asking Aidan about "music/oboe" when in Chapter 6: say "Such things are the province of Alan-a-Dale. The chosen instrument of thy brother-in-arms is the longbow."
After asking Aidan about "music" when in chapters 1 through 2: say "I should practice my guitar more, but there's just way too much other stuff to do here."
After asking Aidan about "mom/dad/parents/family/home": say "[if in Chapter 1 through 2]'I wonder how Mom is enjoying things in Djibouti.  I know Dad's going to be there for however long the Navy wants him there, but Mom should be back before camp's out.'[otherwise if in Chapter 6]The house of Locksley is both old and noble, and Robin of Locksley its noble scion."
After asking Aidan about "djibouti" when in chapters 1 through 2: say "'Your guess is as good as mine.  We'll have to wait to see Mom's pictures.'"
After asking Aidan about "navy" when in chapters 1 through 2: say "Aidan smiles.  You already know he wants to join up as soon as he can; he'd do it right out of high school if Mom and Dad didn't insist he spend some time in college first."
After asking Aidan about "zork/laptop/game": say "[if in chapter 1]'I've got to show you this Zork game that we're doing for the classic Interactive Fiction class some time.  I started it up on the laptop last night, and it's pretty cool.'[otherwise if in Chapter 2]'Check it out, this is what adventure games on the computer looked like way back before they figured out how to get pictures in.  This one here is Zork; you're this nameless adventurer dude on a treasure hunt in this great network of caves, and there's this thief who keeps popping up and stealing your stuff ... I bet you've got to defeat him somehow, but I haven't gotten that far yet.'[otherwise if in chapter 6] Such is of a different simulation from this."


Table of Aidan's conversation
conversation						topic
Aidan-on-camp			"LEAP/flyer/camp"

[Chapter 1, 2:] Aidan-on-camp is a quip. The display text is "Yeah, I always have a great time here.  How about you?" 

Aidan-camp1 is a quip. The menu text is "Yeah, it's been awesome!"  The display text is "Hey, you don't have to tell me.  But if anything goes wrong, give me a shout, okay?". 

Aidan-camp2 is a quip. The menu text is "Not so good...."  

The response of Aidan-on-camp is { aidan-camp1, aidan-camp2 }.

After populating Aidan-camp2 when in chapter 1: 
	remove aidan-camp-2b from the current conversation. 
After populating Aidan-camp2 when in chapter 2: 
	remove aidan-camp-2a from the current conversation.

Aidan-camp-2a is a quip. The display text is "Aidan looks a little concerned.  'What's wrong?' he asks, and you're about to tell him everything when you realize that the whole Rap Session option is watching the two of you, clearly waiting for Aidan to take his turn.  'I'll tell you later,' you say at last, figuring that things can probably wait a while."

Aidan-camp-2b is a quip. The display text is "Aidan looks a little concerned.  'What's wrong?' he asks."  

The response of Aidan-camp2 is {aidan-camp-2a, aidan-camp-2b}. 

aidan-camp-2b1 is a quip. The menu text  is "'I've been getting these headaches....'". The display text  is "You tell Aidan some of what's been going on.  He frowns a bit, and says, 'Sounds like a migraine headache to me.  You'd better go lie down, and call your counselor if it gets any worse.'".
aidan-camp-2b2 is a transitional quip. The menu text is "'Well, there are these bullies...'" The following quip is CT_AIDAN_HELP. After populating aidan-camp-2b2 when crystal quest has not happened: remove aidan-camp-2b2 from the current conversation.
aidan-camp-2b3 is a quip. The menu text is "(shrug) 'Oh, nothing much, really....'"  The display text is "'Yeah, right.  Look, Daniel, if something's bothering you, you know you can always talk to me about it, right?  Or there's your counselor ... Brad, right?  He's pretty cool with things, and he won't tell a soul if you ask him not to.'"
	
The response of aidan-camp-2b is { aidan-camp-2b1, aidan-camp-2b2, aidan-camp-2b3 }.


CT_AIDAN_HELP is a quip. The display text is "'Hank and Joe up to their old tricks again, huh?  I'll deal with them.'  Aidan gets up from his desk (he doesn't even hit 'pause'!  What kind of game doesn't need to be paused when you leave it?) and sets off down the hallway."


[Upon entering the room with the Rap Session option that Aidan is a part of. ]
Q_AIDAN_0 is a quip. The display text is "'Hey, Daniel, you okay?'". 

Q_AIDAN_1 is a quip. The display text is "'You sure?  You looked a bit green for a moment there.'".

Q_AIDAN_2 is a quip. The display text is "Aidan frowns.  'Could be something you ate.  Brad Kramer's your counselor, isn't he?  Want me to go get him?'".

Q_AIDAN_3 is a quip. The display text is "'Whatever you say, tough guy.'  Aidan ruffles your hair, and for a moment, but only a moment, something buzzes in your ears.  Aidan resumes his seat with the other rappers.".

Q_AIDAN_0a is a menu quip. The following quip is Q_AIDAN_1. The menu text is "'Yeah, I'm fine.'".
Q_AIDAN_0b is a menu quip. The following quip is Q_AIDAN_2. The menu text is "'No, I'm getting these dizzy spells and headaches.'".

Q_AIDAN_1a is a menu quip. The following quip is Q_AIDAN_3. The menu text is "'Really, I'll be fine.'".
Q_AIDAN_1b is a menu quip. The following quip is Q_AIDAN_2. The menu text is "'Well, I felt a bit funny for a moment, but I'm better now.'".

Q_AIDAN_2a is a menu quip. The following quip is Q_AIDAN_3. The menu text is "'Thanks, but I think I'll be able to find him myself.'". 
Q_AIDAN_2b is a menu quip. The following quip is Q_AIDAN_3. The menu text is "'No, I'll be fine.  It's nothing, really.'".
Q_AIDAN_2c is a menu quip. The following quip is Q_AIDAN_3. The menu text is "'Uh, no, thanks.  (Aidan, you're embarrassing me!)'".

The response of Q_AIDAN_0 is {Q_AIDAN_0a, Q_AIDAN_0b}.
The response of Q_AIDAN_1 is {Q_AIDAN_1a, Q_AIDAN_1b}.
The response of Q_AIDAN_2 is {Q_AIDAN_2a, Q_AIDAN_2b, Q_AIDAN_2c}.

Last before firing a quip (called Q) (this is the print menu text as part of conversation rule):
	unless the menu text of Q is empty:
		say the menu text of Q, paragraph break;



Section 4 - actions on Aidan

Instead of attacking or kicking Aidan when in Chapter 9 and the player is not in the dreamscape, say "No way.  Somewhere inside that monster is the brother who helped you with the bullies and who carried you all the way to the hospital himself when you collapsed.  Right now, he needs your help more than anything."

Instead of attacking or kicking Aidan when in chapter 9 and the player is in dreamscape: say "Aidan certainly isn't expecting that, but he's quick enough to dodge your attack.  You've distracted him just enough, however."; Go straight to section "You Fail To Give Aidan The Sword" in Chapter 09 text.

Instead of attacking or kicking Aidan, say "[if in chapters 1 through 5]No way, Mom would kill you.  After she's done killing Aidan for killing you, because, let's face it, Aidan could probably break you in two with both hands tied behind his back.[otherwise if in chapter 6]Nay, [']twould get thee kicked from the simulation.[otherwise if in chapters 7 through 8]Are you out of your mind?"

Instead of kissing Aidan, say "[if in chapters 1 through 5]You're a little too old for that sort of soppiness, don't you think?[otherwise if in chapter 6]Thou art past the age for such sop, dost thou not think?[otherwise if in chapters 7 through 8] That's not going to change his mind![otherwise if in chapter 9]Sadly, you lack the magical Mom power of kissing away owies."

Instead of pushing Aidan, say "[if in chapters 1 through 2]You nudge Aidan with your elbow.  He nudges you back without thinking.[otherwise if in chapters 3 through 5]He's too far away, and probably wouldn't appreciate it anyway.[otherwise if in chapter 6]The script doth proceed apace without recourse to aught additional effort on thy part.[otherwise if in chapter 7 through 8]Are you out of your mind?[otherwise if in chapter 9]Aidan isn't going anywhere without your help, and this isn't helping."
	
Instead of pulling [or moving] Aidan while in chapters 1 through 2, say "Aidan's quite capable of moving on his own, thank you very much."

[todo: default message for Pulling Aidan otherwise!]

Instead of focusing on Aidan when in chapters 1 through 6, say "[if in chapter 1]You stare intently at your brother.  'Hey, didn't we stop playing those staring games years and years ago?'[otherwise if in chapter 2 through 3]You think you can hear someone playing an oboe.  Somewhere.[otherwise if in chapter 5]Aidan seems a little more irritable than usual.  You're not sure what it is, but there's something new and dangerous about him, lurking just under the surface.[otherwise if in chapter 6]Thy brother is in a temper, and thou shouldst tread carefully about him."

Instead of focusing on Aidan when in chapter 7 for the first time: say "You sense rage and anger and frustration and hatred and more rage, so much so that you almost feel the same emotions yourself.  Just when you think you're going to fall into the same emotional whirlpool as Aidan has, you become aware that Aidan has paused in his assault on Lucian, and instead is swaying a little, a confused look on his face.  As you register this, Aidan shakes his head and returns his attention to Lucian.

Ava looks from you to Aidan and back.  'What did you just do?'"; rule succeeds.

Instead of focusing on Aidan when in chapter 7 for the second time: say "Rage and anger and hatred and rage and nothing else and suddenly you find yourself somewhere else entirely...."; In The Battlefield see Chapter 07; rule succeeds.

Instead of focusing on Aidan when in chapter 8, say "[if Aidan has not been able to see Daniel's photograph]So much anger!  He's like a walking explosion of anger and aggression and more anger and it's every bit as scary as the fact that he's trying to kill you![otherwise]So much anger!  But ... there, underneath it all, is that a hint of that brotherly love and concern that made him carry you all the way to the hospital last week?[end if]  [line break]"

Instead of focusing on Aidan when in chapter 9 and the player is NOT in the dreamscape and the player has been [expelled]in the mindscape: say "You take a deep breath and focus again on your brother's emotions.  The sensations are beginning to seem all too familiar, and once again you find yourself in...."; does a chapter change go here.

Instead of focusing on Aidan when in chapter 9 and the player is NOT in the dreamscape: say "[one of]You can sense raw, directionless rage and aggression, mixed with a large dose of confusion, all of it fortunately damped down by the sedatives.  Now that you're aware of it, it becomes rather hard to ignore.  Dr Rose, watching you intently, encourages you to go on.  'You can do it, Daniel.  I know you can.'[or]It's just like the last time, only the aggressive emotions seem much more muted.  There is confusion and fear as well.  As you focus, Aidan's emotions become the only ones you are aware of, and then you're somewhere else...[stopping]"; does a chapter change go here.

Instead of focusing on Aidan when in chapter 9 and the player is in the dreamscape, say "Given that you're currently inside his mind, that would probably not be a good idea."

Instead of focusing on Aidan when in chapter 10, say "You sense nothing.  And thank goodness for that."



Part 27 - Third Floor Rooms West

Chapter 1 - Description

Third Floor Rooms West is a room, west of Third Floor Lobby, up from Second Floor Rooms West. "In defiance of the prescribed decoration scheme, someone has stuck a large poster of one of Van Gogh's 'Starry Night' paintings on the wall here.  The scattering of constellations around seem small and weak by comparison.  There is also the window overlooking Second Avenue, surrounded by a thicket of stars; meanwhile, the fire stairs only go down from here, and the corridor continues back to the east."

Chapter 2 - Scenery

Rule for printing the description of the western windows of Jacobs Hall when in Third Floor Rooms West:
	say "It overlooks Second Avenue, and it's locked.  The ground may be a lot closer than the general decor here would have you believe, but it's still not close enough to jump.";

Rule for printing the description of the view of Second Avenue when in Third Floor Rooms West:
	say "There's not much traffic, this time of the day.";

The poster of Vincent Van Gogh's painting Starry Night is scenery, in the Third Floor Rooms West. "It's very much an artistic interpretation of the subject; generally, the cutouts provided here tend to take more of a scientific, or at least science-fictional, approach."

Rule for printing the name of the poster of Van Gogh's Starry Night:
	say "'Starry Night' poster";

Part 28 - Third Floor Rooms East

Chapter 1 - Description

Third Floor Rooms East is a room, east of Third Floor Lobby, up from Second Floor Rooms East. "This end of the corridor looks like the inside of a space shuttle.  Someone's gone to great care to create window-like frames for the stars and planets and whatnot; even the window overlooking Calvin Field has been made to look like a space shuttle viewport.  Outer Space is back to the west; presumably the planet Earth is down the stairs."

Chapter 2 - Scenery

Some window-like frames are scenery, in Third Floor Rooms East. "You have to wonder what the Powers That Be think of people actually applying paint to the walls.  I mean, there's a reason they provided cutouts to paste onto the walls, and that you can take off again.  Then again, well, there's no way anyone could have done all this in the short time you've been here, so quite probably it was done by the college kids during the semester and the Powers That Be decided to just go with the theme rather than call in the graffiti removal squad."

Understand "space", "shuttle", "stars", "planets", "viewport", "paint", "painted", "graffiti" as the window-like frames.

Rule for printing the description of the eastern windows of Jacobs Hall when in Third Floor Rooms East:
	say "Through the constellation of Orion, you can see Calvin Field below and the people running around on it.";

The constellation of Orion is scenery, in Third Floor Rooms East. "The mighty hunter... he's the only constellation you can recognise in the night sky."

Understand "mighty", "hunter", "star", "Orion's belt", "belt", "Betelgeuse", "Rigel" as the constellation of Orion.

Instead of searching the constellation of Orion [> LOOK THROUGH ORION]:
	try searching the eastern windows of Jacobs Hall.

Part 29 - Rooftop

Chapter 1 - Description

The Jacobs Hall Rooftop is an exterior room, up from the Third Floor Lobby. "The rooftop is only accessible when there's an activity or option that uses it.  Otherwise, it's off-limits, not that you can really imagine why anyone would want to come up here.  It's all black gravel and tar.  The courtyard downstairs is way more pleasant.  [if in chapter 1][paragraph break]The Eggdrop option is busy tossing boxes of eggs over the parapet: a table has been set up as well, and is covered with artsy-craftsy materials with which a number of campers are building egg-preservation containers. [end if] [line break]"

Rule for printing the name of Jacobs Hall Rooftop:
	say "Rooftop";

instead of Jumping when in Jacobs Hall rooftop, say "Don't do it, Daniel!  You have so much to live for!"

Instead of attacking yourself,  say "Don't do it!  You have so much to live for!"


Chapter 2 - Scenery

Section 1 - Courtyard

The distant courtyard is scenery, in the Jacobs Hall Rooftop. "It's three storeys down, and made of hard concrete.  Jumping is not advisable: take the stairs like a normal person."

Understand "hard", "concrete" as the distant courtyard.

The rooftop parapet is scenery, in the Jacobs Hall Rooftop. "It's all that's keeping you from a three-storey drop onto a very hard surface."

Section 2 - Table and supplies

The eggdrop option table is a privately-named supporter, scenery, in the Jacobs Hall Rooftop. "It's covered with artsy-craftsy materials: cardboard boxes, egg cartons, feathers, bits of cloth, sticks, rubber bands, and so on.  There are also several cartons of eggs."

Understand "table" as the eggdrop option table.

Some egg cartons are a privately-named container, open, openable, scenery, on the eggdrop option table. "Some are still full of eggs.  Others have been cut up to form other egg containment units."

Understand "box", "boxes", "cartons", "carton", "egg carton", "egg cartons", "of eggs" as the egg cartons.

The indefinite article of the cartons of eggs is "several".

Some white eggs are scenery, in the cartons of eggs. "There's something vaguely wrong about how they're all the exact same shade of white."

A large bottle of white glue is scenery, on the eggdrop option table. "There is a large bottle of white glue here, available for use and constantly in use."

Section 3 - Green cloth

The lots of green cloth is scenery, a dispenser, on the eggdrop option table. "There must have been a sale on green cloth somewhere in town this last week.  There's enough cloth here to make a dozen wedding dresses.  Green wedding dresses, admittedly, but you get the picture."

The small square of green fabric is a thing. The description is "You have a small, square bit of green cloth.  It's barely big enough to serve as a handkerchief for a garden gnome."

Understand "cloth" as the small square of green fabric.

The lots of green cloth is represented by the small square of green fabric.
The lots of green cloth vends the small square of green fabric.

After taking the lots of green cloth:
	say "You help yourself to a small square of the green fabric.  No-one notices or cares."

Instead of taking the lots of green cloth when the small square of green fabric is handled:
	say "You've already helped yourself to some of that cloth.  No sense in taking any more.";

Understand "glue [something] to/on/onto [something]" as tying it to when the player can see the large bottle of white glue.
Understand "glue [something] on to [something]" as tying it to when the player can see the large bottle of white glue.
Understand "stick [something] to/on/onto [something]" as tying it to when the player can see the large bottle of white glue.
Understand "stick [something] on to [something]" as tying it to when the player can see the large bottle of white glue.

Instead of tying the small square of green fabric to the wooden stick when the player can see the large bottle of white glue:
	try tying the second noun to the noun instead;

Instead of tying the wooden stick to the small square of green fabric when the noun is part of the green flag or the second noun is part of the green flag:
	placeholder "They're already well glued together."

Instead of tying the wooden stick to the small square of green fabric when the player can see the large bottle of white glue:
	placeholder "You stick the cloth to the short skewer with the glue. It makes a pretty nifty flag!";
	now the wooden stick is part of the green flag;
	now the small square of green fabric is part of the green flag;
	now the player carries the green flag;

Instead of tying the wooden stick to the small square of green fabric:
	placeholder "You try wrapping the cloth around the stick a few times, but it doesn't stay put.";

The green flag is a thing. The description is "It's a stick with a bit of green fabric stuck on one end.  Not bad, if you do say so yourself; not bad at all.".

The green flag fulfills the flag-goal.

Section 4 - Kebab Skewers

Some shish-kebab skewers are a dispenser, on the eggdrop option table. "Shish-kebab skewers, only without the shish-kebab."

Understand "sticks" as the shish-kebab skewers.

The wooden stick is a thing. The description is "It's a wooden skewer, the sort used to make shish-kebab.  You like to think of it as an overgrown toothpick.".

Understand "kebab", "skewer", "overgrown", "toothpick", "tooth pick" as the wooden stick.

The shish-kebab skewers are represented by the wooden stick.
The shish-kebab skewers vend the wooden stick.

After taking the shish-kebab skewers:
	say "You help yourself to one of the wooden skewers.  No-one notices or cares.";

Instead of taking the shish-kebab skewers when the wooden stick is handled:
	say "You've already helped yourself to a skewer.  You don't need another one.";

Section 5 - Feather Boa

A boa is a dispenser, scenery, on the eggdrop option table. "Someone's gone and raided the theatrical costumes and dragged up a few multi-colored feather boas for the option.  Every now and then, someone wrenches a bunch of feathers from a boa to stick into their egg boxes."

A feather is a thing. The description is "You have a feather.  It's a rather strange shade of blue that probably doesn't exist in nature."

The boa is represented by the feather. 
The boa vends the feather.
The feather fulfills the feather-goal.

Instead of taking the boa when the feather is handled:
	say "You only need one feather.  No sense in taking another one, unless you plan on taking the option.";

After taking the boa:
	say "You pluck a feather from one of the boas.  No-one notices or cares.";

Section 6 - Eggdrop Option

The eggdrop-option is an option, scenery, privately-named, in Jacobs Hall Rooftop. "The idea is to build a container that will enable an egg to survive a three-storey drop onto the concrete below.  Everybody seems to be very deeply involved in the project."

Understand "eggdrop", "option", "people", "campers" as the eggdrop-option.

Chapter 3 - Event on Entering

After going to Jacobs Hall Rooftop during Scavenger Hunting:
	try looking;
	fire TRIG_EGGDROP;

TRIG_EGGDROP is a headache.

Rule for firing unfired TRIG_EGGDROP:
	say "As you emerge into the sunlight, you feel a momentary dizziness that makes you almost want to hurl.  The feeling is gone very quickly, but your heart is left pumping as though you'd just run a couple of miles.";

Rule for firing fired TRIG_EGGDROP:
	say "There's that dizzy feeling again; this time you're ready for it.  As it fades away, you almost swear you taste something vaguely sour in the air.";

Book 1 - Scavenger Hunt

Scavenger Hunting is a scene. Scavenger Hunting begins when play begins.

Scavenger Hunting ends naturally when the time of day is 8:25 PM.
Scavenger Hunting ends victoriously when every scavenger hunt goal is achieved and the player can see Michelle.

When Scavenger Hunting ends naturally:
	say "8:25!  Time's up!  You hurry back to the starting point with your list[if the player has something that fulfills a goal] and everything you've found so far[end if]....";
	move the player to First Floor Lobby West;
	if every scavenger hunt goal is achieved:
		say "Michelle takes your list, then searches about herself for a pencil (completely missing the one behind her ear and the two pens in her pocket) before finally pulling out a magic marker.  She nods as she ticks off the items from the list.  'Nice going, Daniel,' she says, smiling, 'that's everything on the list.  You win!'  She slaps a blue ribbon on your chest and turns to address the next camper.[paragraph break]The numb sensation in the side of your head takes a few moments to clear completely.";
	otherwise if at least one scavenger hunt goal is achieved:
		say "Michelle scans your list, looks over your findings, and shakes her head.  'Well, it was a[if most of the scavenger hunt goals are achieved]n excellent effort[else] good try[end if], Daniel, but I'm afraid you haven't [if almost all of the scavenger hunt goals are achieved]quite [end if]found everything.  Better luck next time!'[paragraph break]It takes you a few moments to realize that 'the bitter taste of defeat' is, in this case, not a figure of speech: the air literally does taste bitter.";
	otherwise:
		bug "The player hasn't found anything.";
		placeholder "Michelle shakes her head.  'None of the items on the list? Better luck next time!'[paragraph break]It takes you a few moments to realize that 'the bitter taste of defeat' is, in this case, not a figure of speech: the air literally does taste bitter.";
	pause the game;

When Scavenger Hunting ends victoriously:
	say "Michelle takes your list, then searches about herself for a pencil (completely missing the one behind her ear and the two pens in her pocket) before finally pulling out a magic marker.  She nods as she ticks off the items from the list.  'Nice going, Daniel,' she says, smiling, 'that's everything on the list.  You win!'  She slaps a blue ribbon on your chest and turns to address the next camper.[paragraph break]The numb sensation in the side of your head takes a few moments to clear completely.";
	pause the game;

When Scavenger Hunting ends (this is the clear the player's inventory of scavenger hunt items rule):
	remove the items list for the Scavenger Hunt from play;
	repeat with treasure running through things which fulfill a scavenger hunt goal:
		if the player has the treasure:
			remove the treasure from play;

GOAL_SCAVENGER_HUNT is a goal, major, achieved.

Rule for printing the name of GOAL_SCAVENGER_HUNT when every scavenger hunt goal is achieved:
	say "winning the scavenger hunt";

Rule for printing the name of GOAL_SCAVENGER_HUNT when almost all scavenger hunt goals are achieved:
	say "runner up in the scavenger hunt";

Rule for printing the name of GOAL_SCAVENGER_HUNT when most scavenger hunt goals are achieved:
	say "doing well in the scavenger hunt";

Rule for printing the name of GOAL_SCAVENGER_HUNT :
	say "participating in the scavenger hunt";

When Scavenger Hunting ends:
	add GOAL_SCAVENGER_HUNT to the recently achieved goals, if absent;
	consider the goal-tidying rules;

Book 2 - Lucian's Secret

Lucian's Secret is a scene. Lucian's Secret begins when Scavenger Hunting ends.
Lucian's Secret ends when Crystal Return ends.

Part 1 - Introduction

Visiting Stacy-and-Ava is a scene. Visiting Stacy-and-Ava begins when Lucian's Secret begins. Visiting Stacy-and-Ava ends when the location is Stacy's room.

GOAL_AVA_STACY is a goal.

Rule for printing the name of GOAL_AVA_STACY:
	say "visit Ava & Stacy";

A goal-scoring rule for GOAL_AVA_STACY:
	if the location is Stacy's room:
		goal achieved;

When Lucian's Secret begins:
	change the current term day to day 3;
	change the time of day to 8:32 PM;
	change the current goals to {GOAL_AVA_STACY};
	say "Well, that was odd.[paragraph break]Those sudden flashes of sensory hallucination (what else would you call them?) seem to die down over the course of the next day.  The headaches and dizzy spells are so mild now as to be practically gone, but on the other hand, the frequency seems to be increasing.  It's all somewhere in the back of your head: if you focus, you can almost always find... something.  A smell, or a sound that isn't there.  A peculiar flavour hanging in the air.[paragraph break]Even so, you're not entirely sure you want to speak to a doctor.  I mean, it's not as if it's laying you flat on your back on anything like that.  You could talk to Aidan, but he'd probably just march you straight up to the hospital.  He'd even carry you there if he had to.  So where does that leave you?[paragraph break]";
	pause the game;
	say "[paragraph break]LEAP, Day 3 (Tuesday) - Dorm Time[paragraph break]Your roommate, Jeremy, went off with some friends after dinner, which leaves you alone for now.  It's dorm time, which means you have maybe a couple of hours or so before lights-out, all to yourself.  Some people spend the time reading, or listening to music, or visiting friends.  Which reminds you, maybe talking to Stacy and Ava about this would be the best thing to do.  Maybe they'll tell you it's all part of being eleven years old, or something.[paragraph break]Yeah.  You can hope.";
	consider the new goal notification rule;
	move the player to Your Room;
	repeat with opt running through options:
		remove opt from play;
	remove Michelle Close from play;
	move Ava to Stacy's Room;
	move Stacy to Stacy's Room;
	now Ava is not scenery;
	now Stacy is not scenery;
	if Stacy wears the little straw hat:
		remove the little straw hat from play;
	now Stacy's door is unlocked;
	move Aidan to Aidan's room;

Part 2 - Stacy & Ava's Room

Instead of opening Stacy's door when in Second Floor Rooms East during Visiting Stacy-and-Ava:
	say "You don't think either of the girls would appreciate you just barging in on them like that.";

Instead of knocking on Stacy's door when in Second Floor Rooms East during Visiting Stacy-and-Ava:
	now Stacy's door is open;
	say "Ava peeks out and breaks into a smile when she sees you.  'Hey, Daniel!'  She pulls you inside.  'What's up?'";
	move the player to Stacy's Room;
	start conversation with Ava on Q_STACY_AVA_0;

Rule for printing a locale paragraph about Stacy Alexander when in Stacy's Room during Visiting Stacy-and-Ava:
	now Stacy is mentioned;

Rule for printing a locale paragraph about Ava Winters when in Stacy's Room during Visiting Stacy-and-Ava:
	now Ava is mentioned;

Chapter 1 - Conversation

Stacy-and-Ava Dorm Chat is a scene. Stacy-and-Ava Dorm Chat begins when Visiting Stacy-and-Ava ends. Stacy-and-Ava Dorm Chat ends when Q_STACY_AVA_10 is fired.

Q_STACY_AVA_0 is a quip. The display text is "Stacy looks up from her desk, where a few hundred tiny electronic parts are scattered.  'We were just talking about how lately you seem distracted all the time.  Is something wrong?'[paragraph break]Ava looks a little embarrassed.  'We're just concerned.  You know.'"

Q_STACY_AVA_0A is a menu quip. The following quip is Q_STACY_AVA_1. The menu text is "'I don't know what's happening....'".
Q_STACY_AVA_0B is a menu quip. The following quip is Q_STACY_AVA_1. The menu text is "'Well, I'm getting these headaches....'".
Q_STACY_AVA_0C is a menu quip. The following quip is Q_STACY_AVA_9. The menu text is "'There's nothing wrong.  Can't a guy visit his friends every now and then?'".

Q_STACY_AVA_1 is a quip. The display text is "You tell Ava and Stacy about the headaches, the dizzy spells, and the hallucinations.  Only of course you don't call them hallucinations, because they'd think you're going nuts for sure.  Ava says, 'that sounds serious.  Maybe you should see a doctor.'"

Q_STACY_AVA_1A is a menu quip. The following quip is Q_STACY_AVA_2. The menu text is "'Over my dead body.'".
Q_STACY_AVA_1B is a menu quip. The following quip is Q_STACY_AVA_3. The menu text is "'I'm not that sick.'".

Q_STACY_AVA_2 is a transitional quip. The following quip is Q_STACY_AVA_4. The display text is "'Then you'd be seeing a coroner,' says Stacy, 'and it would be an autopsy.'".

Q_STACY_AVA_3 is a transitional quip. The following quip is Q_STACY_AVA_4. The display text is "'That's what they all say,' says Stacy, 'right before they keel over dead.'".

Q_STACY_AVA_4 is a quip. The display text is "'I don't know,' says Ava, 'it sounds pretty serious to me.  And we've noticed you sometimes stopping in the hallway with your eyes sort of glazed over.'"

Q_STACY_AVA_4A is a menu quip. The following quip is Q_STACY_AVA_5. The menu text is "'Is it that obvious?'".
Q_STACY_AVA_4B is a menu quip. The following quip is Q_STACY_AVA_8. The menu text is "'Have you two been spying on me?'".

Q_STACY_AVA_5 is a quip. The display text is "'Mostly to Ava, says Stacy, 'because Ava notices these things.  I would have totally missed it if she hadn't pointed it out as we were coming back from dinner earlier.'  You remember feeling a little nauseous as you walked by the Info Desk.  You thought it might have been something you ate.  'Personally,' Stacy continues, 'I'm kind of wondering if maybe it could be real.  The sounds and stuff you told us about, I mean.'[paragraph break]Ava frowns.  'Stacy, how can it possibly be real?  Nobody else noticed anything.'[paragraph break]'Nobody else noticed Daniel getting all glassy-eyed and green either.  Look, Daniel, there's a very easy way to find out.  If there's something at the Info Desk that's making you sick, then going there again will bring back the same feeling, right?  So we could just go there and see how consistent these feelings are.'"

Q_STACY_AVA_5A is a menu quip. The following quip is Q_STACY_AVA_6. The menu text is "'They're pretty consistent, now I think about it.  Always at the same place... sort of.  I mean, unless something's changed about the place since.'".
Q_STACY_AVA_5B is a menu quip. The following quip is Q_STACY_AVA_7. The menu text is "'Consistent? They're just random.  I never know when I'm going to suddenly get this feeling, whatever it is.'". 

Q_STACY_AVA_6 is a transitional quip. The following quip is Q_STACY_AVA_10. The display text is "Ava looks thoughtful.  'It could be some sort of allergy, I suppose.  Maybe we could find out exactly what's causing this, and fix it.'".

Q_STACY_AVA_7 is a transitional quip. The following quip is Q_STACY_AVA_10. The display text is "Ava looks doubtful.  'Are you sure?  I mean, it's not like you're taking notes, is it?  I think Stacy has a point.  If we can find out what's causing this, we can fix it.'"

Q_STACY_AVA_8 is a quip. The display text is "'Oh, don't get all paranoid,' says Ava, 'you're our friend!  Of course we look out for you!'[paragraph break]'The question is,' Stacy says, 'what are we going to do about it?'  You recognise the look on her face: it's the one she gets when she's decided that something needs fixing.  'I think we should see if this is being triggered by anything.  Ava noticed you going all green and glassy-eyed by the Info Desk after dinner earlier, so maybe we should go back there and see if there's any sort of pattern going on.'"

Q_STACY_AVA_8A is a menu quip. The following quip is Q_STACY_AVA_6. The menu text is "'They're pretty consistent, now I think about it.  Always at the same place... sort of.  I mean, unless something's changed about the place since.'". 
Q_STACY_AVA_8B is a menu quip. The following quip is Q_STACY_AVA_7. The menu text is "'Consistent? They're just random.  I never know when I'm going to suddenly get this feeling, whatever it is.'".

Q_STACY_AVA_9 is a transitional quip. The following quip is Q_STACY_AVA_4. The display text is "Both girls look rather doubtful at this, and you finally sigh and describe all the strange sensations that have been assailing you since yesterday.  'But really, it's nothing serious.  The feelings are almost gone now.'"

Q_STACY_AVA_10 is a quip. The display text is "'Okay, then!'  Stacy grins cheerfully as she pulls a deerstalker cap out of her dresser.  'I'd say we have a mystery to solve.'[paragraph break]Ava gets out a notebook and pen.  'Just try to focus, Daniel.  We'll get to the bottom of this.'"

The response of Q_STACY_AVA_0 is { Q_STACY_AVA_0A, Q_STACY_AVA_0B, Q_STACY_AVA_0C}.
The response of Q_STACY_AVA_1 is { Q_STACY_AVA_1A, Q_STACY_AVA_1B }.
The response of Q_STACY_AVA_4 is { Q_STACY_AVA_4A, Q_STACY_AVA_4B }.
The response of Q_STACY_AVA_5 is { Q_STACY_AVA_5A, Q_STACY_AVA_5B }.
The response of Q_STACY_AVA_8 is { Q_STACY_AVA_8A, Q_STACY_AVA_8B }.

After firing Q_STACY_AVA_10:
	now Stacy Alexander wears a deerstalker cap;

Instead of going from Stacy's Room when the current conversationalist is Ava:
	placeholder "The player shouldn't be able to leave until this conversation is over.";

The deerstalker cap is a thing. Understand "hat" as the deerstalker cap.

Rule for printing the description of the deerstalker cap:
	placeholder "Description of the deerstalker.";

Part 3 - Trailing Lucian

Trailing Lucian is a scene. Trailing Lucian begins when Stacy-and-Ava Dorm Chat ends. Trailing Lucian ends when the location is Lucian's room.

The lachrymose trail is an emotional residue. The lachrymose trail taints Pits West, Pits Stairwell, the First Floor Midpoint, and the Info Desk. The description of the lachrymose trail is "There is a sour, vaguely nauseating taste in the air. "

When Trailing Lucian begins:
	now the player can sense the lachrymose trail;
	now Stacy Alexander follows the player;
	now Ava Winters follows the player;
	add GOAL_FOCUS to the current goals, if absent;

GOAL_FOCUS is a goal. The printed name is "investigate odd sensations".

A goal-scoring rule for GOAL_FOCUS:
	if we have focused on the lachrymose trail:
		goal achieved;

After printing the description of the lachrymose trail during Trailing Lucian:
	fire TRIG_FOCUS_HINT;

TRIG_FOCUS_HINT is a trigger. TRIG_FOCUS_HINT can be relevant. TRIG_FOCUS_HINT is relevant.

Rule for firing relevant TRIG_FOCUS_HINT:
	say paragraph break;
	say "'Daniel,' says Ava, 'Daniel, you're getting that funny look again.  Is whatever-it-is somewhere around here?'[paragraph break]'Try to focus,' says Stacy. ";

A focusing rule for the lachrymose trail when in Info Desk:
	say "Concentrating on the flavour, you sense an undercurrent of something salty as well, like tears.  You can also tell that this is all definitely part of a trail of some sort, going off to the east and the north. [paragraph break]";

A focusing rule for the lachrymose trail when in First Floor Midpoint:
	say "Concentrating on the flavour, you sense an undercurrent of salt tears.  Both sour and salt seem to form a line between the Info Desk and the stairs going down. [paragraph break]"

A focusing rule for the lachrymose trail when in Pits Stairwell:
	say "Concentrating on the flavour, you sense an undercurrent of salt tears.  Both sour and salt seem to trail off to the west and to the stairs going up. [paragraph break]"

A focusing rule for the lachrymose trail when in Pits West:
	say "Concentrating on the flavour, you sense an undercurrent of salt tears.  They trail off to the east, but seem strongest around one of the doors to the south. [paragraph break]";

Last focusing rule for the lachrymose trail:
	fire TRIG_TRAIL;

TRIG_TRAIL is a trigger.

Rule for firing unfired TRIG_TRAIL when in Info Desk:
	say "'It's a trail,' you say.  'It runs off that way, outside, and that way, back to the dorms.'[paragraph break]'Well,' says Stacy, 'we can't very well leave the building at this time of the night.  We'd best investigate the other direction.'";

Rule for firing unfired TRIG_TRAIL when in First Floor Midpoint:
	say "'It's a trail,' you say.  'It goes down the stairs and back to the Info Desk.'[paragraph break]'I know we said we'd go look around the Info Desk,' says Stacy, 'but if this is a trail of some sort, I wonder where it leads.'[paragraph break]Ava shrugs.  'Up to you, Daniel.  Off to the Info Desk, or down the stairs?'";

Rule for firing unfired TRIG_TRAIL when in Pits Stairwell:
	say "'It's a trail,' you say.  'It goes up the stairs and that way down the hall.'[paragraph break]'I know we said we'd go look around the Info Desk,' says Stacy, 'but if this is a trail of some sort, I wonder where it leads.'[paragraph break]'I'm guessing the trail up the stairs goes back to the Info Desk.'  Ava shrugs.  'Up to you, Daniel.  Off to the Info Desk, or do we see what's at the end of the hall?'";

Rule for firing TRIG_TRAIL when in Pits West:
	say "'Whatever it is, it's strongest around that door.'[paragraph break]Ava and Stacy exchange glances, and before you can stop her, Stacy is knocking on the door.  'We've come this far.  I want to know what's at the end of --'[paragraph break]Stacy quickly shuts up when the door opens a crack, and a rather timid little guy peeks out at you.  He fairly reeks of that mysterious sour-salty air.  And now you think you can hear some sort of twittering in the background, too[if the eggdrop-option has been apparent].  It occurs to you that you remember seeing him up at the egg-drop option yesterday, though he certainly wasn't giving off this... whatever it is... back then[end if].[paragraph break]'Hi,' says Ava, who seems to recognise the guy.  'Lucian, isn't it?  We met yesterday at the sign-ups.  Anyway, these are my friends Daniel and Stacy.  May we come in for a moment?'[paragraph break]Lucian lets the door swing half-open and sighs resignedly.  'Sure, if you want,' he says, retreating back into the room.  The three of you follow him inside.";
	now Lucian's Door is open;
	move the player to Lucian's Room;

When Trailing Lucian ends:
	now Stacy Alexander follows no-one;
	now Ava Winters follows no-one;

Part 4 - Conversation with Lucian

Chatting to Lucian is a scene. Chatting to Lucian begins when Trailing Lucian ends. Chatting to Lucian ends when SE_LUCIAN_1 is fired.

When Chatting to Lucian begins:
	add GOAL_LUCIAN to the current goals, if absent;

GOAL_LUCIAN is a goal. The printed name is "find out what happened to Lucian".

A goal-scoring rule for GOAL_LUCIAN:
	if Q_LUCIAN_EARTH_CRYSTAL is fired:
		goal achieved;

When Chatting to Lucian ends:
	now the lachrymose trail taints nothing;
	now the player can sense nothing;

Chapter 1 - Conversation Table

Rule for choosing the conversation table of Lucian during Lucian's Secret:
	change the chosen conversation table to the Table of Lucian's conversation

Table of Lucian's conversation
conversation			topic
Q_LUCIAN_FAMILY		"himself" or "his family/father/mother" or "family/father/mother"
Q_LUCIAN_SONG		"CD" or "song" or "music" or "record" or "compact" or "disc"
Q_LUCIAN_PHOTOS		"framed" or "photos" or "photographs"
Q_LUCIAN_EGGDROP		"eggdrop" or "egg drop" or "egg-drop" or "option" or "options"
Q_LUCIAN_LEAP			"LEAP" or "camp" or "school" or "here" or "dorm" or "room" or "his dorm/room"
Q_LUCIAN_BULLIES		"bullies"
Q_LUCIAN_GRANDMOTHER	"grandmother" or "gran" or "granny" or "grannie" or "grandma" or "granma" or "gramps" or "grandparent" or "grandparents" or "old lady"
Q_LUCIAN_PETER		"peter" or "school" or "teacher" or "class" or "class photo"
Q_LUCIAN_EARTH_CRYSTAL	"earth crystal" or "crystal"

Rule for choosing the conversation topic for Lucian:
	repeat through the chosen conversation table:
		if the topic understood includes topic entry:
			if there is a conversation entry:
				if the conversation entry is available:
					change the chosen conversation topic to the conversation entry;
					rule succeeds;
	carry out the choosing the default conversation topic activity with Lucian;

Chapter 2 - Conversation Quips

Rule for speaking with Lucian:
	start conversation with Lucian on the chosen conversation topic;

Section 0 - Song

Q_LUCIAN_FAMILY is a quip. The display text is "Lucian rolls his eyes.  'What's to know?  My dad is an airline steward and my mom works in a hardware store.  We're just ordinary people.'".

Section 1 - Song

Q_LUCIAN_SONG is a quip. The display text is "Lucian shrugs.  'I just like the song.  It makes me feel better when I'm feeling unhappy.'"

Q_LUCIAN_1A is a menu quip. The following quip is Q_LUCIAN_2. The menu text is "'Are you feeling very unhappy?'"
Q_LUCIAN_1B is a menu quip. The following quip is Q_LUCIAN_3. The menu text is "'It's a nice song....'" 

The response of Q_LUCIAN_SONG is { Q_LUCIAN_1A, Q_LUCIAN_1B }.

Q_LUCIAN_2 is a quip. The display text is "'I don't know anybody here and I'm all alone.  Why shouldn't I be unhappy?  Let's talk about something else.'"

Q_LUCIAN_3 is a quip. The display text is "'It was my grandmother's favourite song.  She used to sing it to me when I was little.'  Lucian's glance strays to one of the photographs on his desk, of an old lady in her garden."

After firing Q_LUCIAN_3:
	now Q_LUCIAN_GRANDMOTHER is available;

Section 2 - Photos

Q_LUCIAN_PHOTOS is a quip. The display text is "You look at the two photographs.  There's one of a little old lady in a garden.  The other is a class photograph.";

After firing Q_LUCIAN_PHOTOS:
	now Q_LUCIAN_GRANDMOTHER is available;
	now Q_LUCIAN_PETER is available;

Q_LUCIAN_PHOTOS_A is a menu quip. The following quip is Q_LUCIAN_PETER. The menu text is "'Is that your class picture?  What was your teacher like?'"
Q_LUCIAN_PHOTOS_B is a menu quip. The following quip is Q_LUCIAN_GRANDMOTHER. The menu text is "'Who's the lady in that picture?  Is she your grandmother?'"

The response of Q_LUCIAN_PHOTOS is { Q_LUCIAN_PHOTOS_A, Q_LUCIAN_PHOTOS_B }.

Section 3 - Egg-drop Option

Rule for firing Q_LUCIAN_EGGDROP:
	start conversation with Lucian on Q_LUCIAN_EGGDROP;

Q_LUCIAN_EGGDROP is a quip. The display text is "'The egg-drop thing wasn't so bad,' Lucian says, grudgingly.  'I even managed to make a box that saved all the eggs inside, so that was nice.  I really thought I was going to have fun here after all.'".

Q_LUCIAN_EGGDROP_A is a menu quip. The following quip is Q_LUCIAN_6. The menu text is "'Aren't you having fun, then?'".
Q_LUCIAN_EGGDROP_B is a menu quip. The following quip is Q_LUCIAN_7. The menu text is "'Hey, congratulations!  I never managed to do it when I tried that option, last year.'".

Q_LUCIAN_6 is a quip. The display text is "'No.'  It looks like Lucian's not going to say anything more, but just when you're about to move on, he says, 'people are so mean.  Peter said that there wouldn't be any bullies here, but I should have known better.'"

After firing Q_LUCIAN_6:
	now Q_LUCIAN_BULLIES is available;
	now Q_LUCIAN_PETER is available;

Q_LUCIAN_6A is a menu quip. The following quip is Q_LUCIAN_8. The menu text is "'Who's Peter?'". 
Q_LUCIAN_6B is a menu quip. The following quip is Q_LUCIAN_9. The menu text is "'Bullies?  Has someone here been giving you a hard time?'".

The response of Q_LUCIAN_6 is { Q_LUCIAN_6A, Q_LUCIAN_6B };

Q_LUCIAN_7 is a quip. The display text is "Lucian shrugs.  'Yeah, whatever.'"

Q_LUCIAN_8 is a transitional quip. The following quip is Q_LUCIAN_PETER.

Q_LUCIAN_9 is a quip. The display text is "Lucian looks annoyed.  'Yeah.  You.  Why don't you leave me alone?'[paragraph break]'We're just trying to help, Lucian,' says Ava gently.[paragraph break]Stacy, meanwhile, looks like she's losing patience.  'You know, if you don't you tell us what's upsetting you, we can't help you.  So why don't you just spit it out and get it over with?'"

Section 4 - LEAP

Q_LUCIAN_LEAP is a quip. The display text is "'It's just school pretending to be camp, isn't it?  I suppose it's more interesting than normal school, but I think I'd rather be home for the summer.  I don't have to worry about bullies when I'm at home.'".

Q_LUCIAN_LEAP_A is a menu quip. The following quip is Q_LUCIAN_9. The menu text is "'Bullies?  Has someone here been giving you a hard time?'"
Q_LUCIAN_LEAP_B is a menu quip. The following quip is Q_LUCIAN_6.  The menu text is "'Aren't you having fun, then?'"

The response of Q_LUCIAN_LEAP is { Q_LUCIAN_LEAP_A, Q_LUCIAN_LEAP_B }.

After firing Q_LUCIAN_LEAP:
	now Q_LUCIAN_BULLIES is available;

Section 5 - Bullies

Q_LUCIAN_BULLIES is an unavailable transitional quip.

The following quip of Q_LUCIAN_BULLIES is Q_LUCIAN_10.

Rule for firing fired Q_LUCIAN_BULLIES:
	change the following quip of Q_LUCIAN_BULLIES to nothing;
	say "'I don't want to talk about that any more.'";

Section 6 - Grandmother

Q_LUCIAN_GRANDMOTHER is an unavailable quip. The display text is "'Yeah.  She died.'  The sour taste in the air is almost overwhelmed by a different, marshy sort of smell, yet you somehow know that the two sensations are somehow related.  Ava is instantly consoling Lucian, and finding all the right words that you can't think of.[paragraph break]'Was she a gardener?' asks Ava.  'That's a beautiful garden she's in.'[paragraph break]'Yeah, yeah she was.  She was an environmentalist.  That's why she....'  Lucian stops.  'Never mind.'".

Q_LUCIAN_GRANDMOTHER_A is a menu quip. The following quip is Q_LUCIAN_10. The menu text is "'Why what?'".

The response of Q_LUCIAN_GRANDMOTHER is { Q_LUCIAN_GRANDMOTHER_A }.

Section 7 - Goal

Q_LUCIAN_10 is a transitional quip. The following quip is Q_LUCIAN_11. The display text is "Lucian shakes his head.  Stacy looks a little annoyed and says, 'you know, if you don't tell us what's upsetting you, we can't help you.  So why don't you just spit it out and get it over with?'"

Q_LUCIAN_11 is a quip. The display text is "Lucian looks a little angry and says, 'stop picking on me!  You're just like those bullies at dinner!  They made me give them my grandmother's earth crystal and I bet you want me to pay some sort of fine for being a loser.  Well I've had it.  Just go away and leave me alone!'"

After firing Q_LUCIAN_11:
	now Q_LUCIAN_BULLIES is available;
	now Q_LUCIAN_EARTH_CRYSTAL is available;

Section 8 - Peter

Q_LUCIAN_PETER is an unavailable quip. The display text is "Lucian picks up the class photo.  'That's Peter,' he says, pointing to the teacher smiling up from one side of the group.  For a moment, the sour taste in the air disappears.  'He lets us call him by his first name, and he's the most awesome teacher ever.'  Then Lucian looks sad again.  'He's the one who said I was smart enough to come here, and he went and pulled all sorts of strings.  I should be grateful, I suppose.'".

Q_LUCIAN_PETER_A is a menu quip. The following quip is Q_LUCIAN_2. The menu text is "'But you're not?  Why?'".

The response of Q_LUCIAN_PETER is { Q_LUCIAN_PETER_A }.

Section 9 - Earth Crystal

Q_LUCIAN_EARTH_CRYSTAL is an unavailable quip.

Rule for firing Q_LUCIAN_EARTH_CRYSTAL:
	say "'It's a crystal cube with a 3-D image of the earth etched inside it.  My grandmother gave it to me just before she died, so it means a lot to me.  Those bullies didn't care, though, they just took it.  I don't know how to get it back, I mean, I don't want to go crying to the camp counselors like a little crybaby.'  Lucian sniffles and wipes his sleeve across his nose, then reaches over to the CD player to turn the volume up. ";
	if Q_LUCIAN_SONG is unfired:
		say "[paragraph break]'Isn't it loud enough for you already?' asks Stacy pointedly.  'It's not even a very good song!  Ava says it makes her sick.'[paragraph break]Ava turns bright red.  'Only because I had to sing it in my voice lessons over and over again,' she says quickly. ";
	say paragraph break;

Last after populating Q_LUCIAN_EARTH_CRYSTAL when Q_LUCIAN_SONG is unfired:
	fire Q_LUCIAN_SONG;
	carry out the populating activity with Q_LUCIAN_SONG;

After firing unfired Q_LUCIAN_EARTH_CRYSTAL:
	add { SE_LUCIAN_0, SE_LUCIAN_1 } to the current script;

SE_LUCIAN_0 is a scripted event.
SE_LUCIAN_1 is a scripted event.

Rule for firing SE_LUCIAN_1:
	say "Stacy pulls you and Ava aside.  'Okay,' she says, 'I think I know how to fix this.  We've got to get that earth crystal away from the bullies and give it back to Lucian here.  Daniel, I think we should let you handle this part.  You can track them from the info desk the same way you tracked Lucian.'";

Part 5 - Reclaiming the Crystal

Crystal quest is a scene. Crystal quest begins when Chatting to Lucian ends. Crystal Quest ends when the player has the Earth Crystal.

When Crystal Quest begins:
	now Hank's door is open;

When Crystal Quest begins:
	add GOAL_CRYSTAL to the current goals, if absent;
	consider the new goal notification rule;

GOAL_CRYSTAL is a goal. The printed name is "[if the Earth Crystal is not handled]retrieve Lucian's crystal[otherwise]give Lucian back his crystal[end if]".

A goal-scoring rule for GOAL_CRYSTAL:
	if the player can see Lucian and the player has the Earth Crystal:
		goal achieved;

Chapter 1 - New trail

Instead of focusing on a room during Crystal Quest:
	say "Now that you think about it, there are so many alien sensations swirling around, most of them so faint you're not sure if you're just imagining them.  You really don't know which sensation you really want.";

Before focusing on Info Desk during Crystal Quest:
	now the player can sense the oily trail;
	redirect the action from the Info Desk to the oily trail, and try that instead;

The oily trail is an emotional residue. The oily trail taints Info Desk, First Floor Midpoint, First Floor Rooms East. The description of the oily trail is "Some sort of oily, burnt stench seems to coil about your legs here, and you think you can hear some sort of low-pitched chatter."

Understand "burnt", "stench", "engine oil", "oil", "monkey's chatter", "chatter", "path" as the oily trail.

A focusing rule for the oily trail when in Info Desk:
	say "[one of]You close your eyes and stand near the door to Calvin Field.  You know Lucian's trail begins just outside this door.  Concentrating on the area in question, you[or]You[stopping] sense the beginning of another trail, one that smells of burnt engine oil and sounds like a monkey's chatter dropped several octaves and sped up.  It traces the same path back towards the dorms to the north. [paragraph break]";

A focusing rule for the oily trail when in First Floor Midpoint:
	say "That unpleasant smell, and its accompanying sound, seems to trace a path from the Info Desk to the eastern end of the hallway. [paragraph break]";

A focusing rule for the oily trail when in First Floor Rooms East:
	say "You can trace that unpleasant smell, and its accompanying sound, to one of the rooms to the south.  The door is open on an already messy room, and with a shock you realise that you are not sensing that burnt-oil smell with your nose at all: it's just registering in your mind as a smell.  Same goes for the sound of low-pitched chattering. [paragraph break]";

Chapter 2 - Bullies

Section 1 - Initial encounter

Last focusing rule for the oily trail when in First Floor Rooms East and TRIG_BULLIES is unfired during Crystal Quest:
	fire TRIG_BULLIES;

TRIG_BULLIES is a trigger.

Rule for firing unfired TRIG_BULLIES:
	move Joe to the location;
	start conversation with Joe on Q_JOE_0;

Q_JOE_0 is a quip. The display text is "One of the boys inside the room notices you gawking outside the door, and comes out.  'Yeah, what do you want?'"

Q_JOE_0A is a menu quip. The following quip is Q_JOE_1. The menu text is "'Uh.  Nothing in particular....'". 
Q_JOE_0B is a menu quip. The following quip is Q_JOE_1. The menu text is "'I was following this, uh, smell, and I was wondering....'". 
Q_JOE_0C is a menu quip. The following quip is Q_JOE_2. The menu text is "'Um, Have you seen an earth crystal -- sort of like a glass cube, about so big, with the earth etched inside...?'". 

The response of Q_JOE_0 is { Q_JOE_0A, Q_JOE_0B, Q_JOE_0C }.

Q_JOE_1 is a quip. The display text is "'Shove off before I dunk you in the toilet, loserboy.'  The boy retreats into the room to resume his conversation with his roommate."

Q_JOE_2 is a quip. The display text is "'Oh, that?  Hey, Hank, loserboy here wants to know about the world cube.'[paragraph break]The other boy, Hank, comes to the door and sneers at you.  'Yeah? Too bad, it's ours now.  Ain't it, Joe?  So you can just go home and ask your mommy to kiss you and make it all better.  Now shove off.'  Hank and Joe retreat back into the room to resume their conversation."

After firing Q_JOE_1:
	move Joe to Hank's Room;

After firing Q_JOE_2:
	identify Hank; identify Joe;
	identify Hank's Door;
	move Joe to Hank's Room;

Instead of going from First Floor Rooms East to Hank's Room when Joe is the current conversationalist:
	placeholder "The boy is blocking the door.";

First after going from First Floor Rooms East when Joe is the current conversationalist:
	fire Q_JOE_1;
	continue the action;

Section 2 - In Joe & Hank's Room

After going to Hank's Room during Crystal Quest:
	try looking;
	start conversation with Hank on Q_HANK_0;

Q_HANK_0 is a quip. The display text is "'Hey, Joe, did we give loserboy permission to enter our room?'[paragraph break]'Why no, Hank, I don't believe we did.  Maybe we'll have to make him pay a fine.'[paragraph break]'Aw, but that would be mean!  We shouldn't make little loserboys give us stuff for trespassing.  I think we should punish them instead.'"

After firing Q_HANK_0:
	identify Hank; identify Joe;
	identify Hank's door;
	move Joe to Hank's Room;

Q_HANK_0A is a menu quip. The following quip is Q_HANK_1. The menu text is "'Um, about that earth crystal....'".
Q_HANK_0B is a menu quip. The following quip is Q_HANK_3. The menu text is "'What, a fine?'". 
Q_HANK_0C is a menu quip. The following quip is Q_HANK_4. The menu text is "'What do you mean, [']punish them[']?'".

The response of Q_HANK_0 is { Q_HANK_0A, Q_HANK_0B, Q_HANK_0C }

Q_HANK_1 is a quip. The display text is "Joe smirks.  'It's yours if you can take us both in a fair fight with both hands tied behind you and a blindfold on.'"

Q_HANK_1A is a menu quip. The following quip is Q_HANK_2. The menu text is "'That's not a fair fight!'".
Q_HANK_1B is a menu quip. The following quip is Q_HANK_5. The menu text is "'Sounds fair enough.'". 
Q_HANK_1C is a menu quip. The following quip is Q_HANK_6. The menu text is "'It's not yours to begin with!'".

The response of Q_HANK_1 is { Q_HANK_1A, Q_HANK_1B, Q_HANK_1C }

First before firing Q_HANK_1B:
	change the menu text of Q_HANK_1B to ""; [We don't really say that.]

Q_HANK_2 is a quip. The display text is "'Too bad, so sad.  Now get lost.'"

Q_HANK_3 is a quip. The display text is "'Yeah.  You came here uninvited, so now you got to give us something.  To compensate us for the distress of having to breathe the same air as you.'  Joe looks at Hank.  'What d'you think?'[paragraph break]'I think I could use a nice laptop computer.'[paragraph break]'Sounds about right.  So what're you waiting for, loserboy?  Scram!'"

Q_HANK_4 is a quip. The display text is "'I signed up for boxing classes and I need to practice.'  Hank flexes his fists.  'So why don't you make yourself useful and stand where I can reach you for, oh, half an hour or so?'  You backpedal out of the room before either of them decides they're being serious.'"

Q_HANK_5 is a quip. The display text is "You open your mouth to say something phenomenally stupid, but visions of yourself missing out on the rest of the LEAP camp, due to being in traction, stop you.  Hank and Joe snicker, but say nothing further."

Q_HANK_6 is a quip. The display text is "'Yeah?  Possession is nine-tenths of the law, loserboy.  That means that if we possess it, as we do, then it's 90% ours.  You think your 10% stake is gonna do anything?  Shove off.'"

Section 3 - Timeouts and triggers

After terminating conversation with Hank when the location is Hank's Room during Crystal Quest:
	now Hank's door is open;
	try going north;
	fire TRIG_NEED_HELP;

TRIG_NEED_HELP is a trigger.

Rule for firing unfired TRIG_NEED_HELP:
	say "Ava shakes her head.  'I think we need help, Daniel.  Should we call a counselor?'[paragraph break]You shake your head.  'No way.  We'll be called snitches and rats until the day we die.'";

TIMER_KICKOUT is a repeating timer. The top end is 3.

After going to Hank's Room during Crystal Quest:
	change the internal value of TIMER_KICKOUT to 0;
	continue the action;

Last every turn when in Hank's Room during Crystal Quest:
	increment TIMER_KICKOUT;

Rule for firing TIMER_KICKOUT:
	say "'Are you still here?' Joe says.  'Get out and go bother somebody else!'  The two bullies hustle you to the door and send you sprawling in the hallway outside.";
	now Hank's door is open;
	try going north;
	fire TRIG_NEED_HELP;

Section 4 - The Earth Crystal

The Earth Crystal is scenery, in Hank's room. "This is a rather heavy cube of pure crystal, with an image of the earth etched into its interior.  Though it appears clear when you look down at it, it seems to glow slightly violet when you hold it up to the light."

The indefinite article of the Earth Crystal is "Lucian's".

Rule for printing the description of the Earth Crystal when the Earth Crystal is in Hank's Room:
	try taking the Earth Crystal instead;

Instead of doing something when the Earth Crystal is involved and the Earth Crystal is in Hank's Room:
	say "The bullies snatch the crystal out of your reach, laugh in your face, and hustle you out of the room.";
	now Hank's door is open;
	try going north;

Section 5 - Help from Aidan

Instead of knocking on Aidan's door when Hank's room is visited during Crystal Quest:
	say "Aidan opens the door.  'Hey, Daniel!  What's up?'  He ushers you into the room and sits down at his desk.  'Sorry if I'm a little distracted.  We just had our first class on old-school text adventures today, and I'm kind of caught up in the homework.  Seriously, this is kind of cool.'  Turning back to his laptop, he begins typing away.";
	now Aidan's door is open;
	move the player to Aidan's room;

[Rule for choosing the conversation table of Aidan during Crystal Quest:
	change the chosen conversation table to the Table of help needed from Aidan;

Table of help needed from Aidan
conversation			topic]


Aidan's warpath is a scene. Aidan's warpath begins when CT_AIDAN_HELP is fired. Aidan's warpath ends when the number of entries in the warpath of Aidan is 0.

Every turn during Aidan's warpath:
	let X be entry 1 of the warpath of Aidan;
	if the location of Aidan is Aidan's room:
		move Aidan to X;
	otherwise:
		let d be the quick best route from the location of Aidan to X;
		try Aidan going d;
	remove entry 1 from the warpath of Aidan;

Aidan has a list of objects called the warpath.

The warpath of Aidan is {First Floor Rooms West, First Floor Midpoint, First Floor Rooms East, Hank's Room}.

When Aidan's warpath ends:
	if the location is First Floor Rooms East or the location is First Floor Midpoint:
		say "'Yo, Hank!  Joe!'  Aidan strides into the bullies['] room as if he owned the place[if the location is First Floor Rooms East] and perches on the edge of a desk[end if].  'I hear you've been bothering the younger campers again.'[paragraph break]Hank looks out the door, sees you, and gives you the evil eye.  'So?'[paragraph break]'So I figure you gotta either pay a fine or get yourselves ratted out to the counselors.  Me, I don't like ratting on people, so I figure it's gonna be the fine for you guys[if the location is First Floor Rooms East].'  He picks up the earth crystal.  '[otherwise].  [end if]This will do nicely, especially since I gather you took it from one of the younger campers to begin with.'[paragraph break]'Shove off, Aidan.  Unless you want a mouthful of knuckles.'[paragraph break]Aidan gives a short bark of laughter.  'Dude.  My dad chews out Navy SEALs for a living, remember?  They taught me how to kill jerks like you with a pencil when I was five.'  Catching Hank glaring out the door at you, he adds, 'that's my little brother, in case you're wondering.  Only reason he hasn't whupped your sorry asses to hell and back is because he takes the whole [']only pick on people who can fight back['] thing a lot more seriously than I do.'[paragraph break][if the location is First Floor Rooms East]Joe looks like he's about to call Aidan's bluff, but Aidan stares him down.  The two bullies finally look away, muttering something rude.  [end if]Aidan swaggers out of the room and pulls the door shut behind him.  He grins and passes the earth crystal to you.  'There you go.  Problem solved.  Now, I better get back to Zork.'";
	otherwise:
		say "'Hey, Daniel!'  Aidan jogs up to you and holds up the earth crystal, grinning.  'This the crystal thingy you told me about?  Here, problem solved.  Hank and Joe are a couple of pushovers, once you convince them you're tougher than both of them put together.  After camp, I'm asking Dad to enroll you in some martial arts classes or something.  I've already told Hank and Joe you're a black belt.'[paragraph break]'Er, thanks.'[paragraph break]'Anytime, bro.'  Aidan musses up your hair and [if the location is not Aidan's room]strolls back to his room[otherwise]settles back in front of his computer[end if].";
	now the player carries the Earth Crystal;
	move Aidan to Aidan's room;
	now Hank's door is closed;
	now Hank's door is locked;

Part 6 - Returning the Crystal

Crystal Return is a scene. Crystal return begins when Crystal Quest ends. Crystal Return ends when the player can see Lucian and the player has the Earth Crystal.

When Crystal Return ends:
	say "Lucian looks up from his desk as you enter the room, and his mouth drops open when he sees the earth crystal in your hands.  'You did it!  You got it back!'  He leaps from his chair and throws his arms around you -- the room glows mauve for an instant, and something stabs in the back of your eye.  You vaguely hear Stacy telling Lucian to take it easy, and you feel Ava's arms catching you as you stumble back, off-balance, from Lucian.[paragraph break]'I don't know if we're any closer to figuring out what's going on,' you say to the girls as you leave Lucian's room.  'I mean, so now I'm some sort of psychic bloodhound?  Why me?'[paragraph break]'It could turn out useful,' says Stacy.  'Just think of the things you could do now!'[paragraph break]Ava doesn't say anything.  She just looks worried.";
	consider the goal assessment rule;
	add GOAL_HELP_LUCIAN to the recently achieved goals, if absent;
	consider the goal-tidying rules;
	remove the Earth Crystal from play;
	now the oily trail taints nothing;
	now the player can sense nothing;
	pause the game;

GOAL_HELP_LUCIAN is a major goal, achieved.

Rule for printing the name of GOAL_HELP_LUCIAN:
	say "helping Lucian retrieve his crystal";

Book 3 - Here Comes The Flood

Part 1 - Scene set-up

Here Comes The Flood is a scene.

Here Comes The Flood begins when Lucian's Secret ends.

Here Comes The Flood ends when Lost In The Maelstrom ends.

When Here Comes The Flood begins:
	say "The headaches are now nothing more than a faint but constant pressure in the back of your skull.  The dizzy spells are gone, and in their place is a vague sense of unease.  The last time you felt perfectly normal would have to be shortly before falling asleep last night.[paragraph break]If you concentrate even a little bit, you can conjure up those unreal sensations around everybody you meet.  And you're beginning to notice a definite relationship between what you sense and how everybody feels.  This is definitely some sort of empathic thing that's waking up inside you.  You'll have to discuss this with Ava and Stacy and Aidan later tonight.";
	pause the game;
	say "LEAP, Day 4 (Wednesday) - Dinner[paragraph break]You usually have your meals with Ava and Stacy, but they're in a different time slot for dinner today.  Aidan's with his own friends at the other end of the dining hall, which leaves you alone with your readings for your class on satirical writing.  Hopefully Aristophanes and Moliere will be enough to distract you from the rather unpleasant substances on your plate pretending to be meat and potatoes.";
	change the current term day to Day 4;
	change the time of day to 5:08 PM;
	now the player carries the readings for your Satirical Writing class;
	move the player to the Dining Hall;
	move Aidan to the Dining Hall;
	add GOAL_DINNER to the current goals;
	Lucian appears in two turns from now;

Some readings for your Satirical Writing class are a thing. The description is "Aristophanes, Rabelais, Moliere... if you didn't find this sort of thing as fascinating as you do, you'd be comatose after the first page."

Rule for printing the description of Aidan during Here Comes The Flood:
	say "He's sitting with a crowd of older campers, at the other side of the hall.  You're not so insecure that you absolutely have to sit beside him at every meal.  Not now that you're a mature second-year camper, anyway.";

Instead of doing something when Aidan is physically involved during Here Comes The Flood:
	placeholder "Aidan's away with his friends on the other side of the hall." instead;

GOAL_DINNER is a goal. The printed name is "eat dinner in peace".

A goal-scoring rule for GOAL_DINNER:
	if Lost In The Maelstrom is happening:
		goal thwarted;

Part 2 - Dining Hall

The Dining Hall is east of Calvin Field North. "The dining hall is a large room lined with long tables and chairs.  It is crowded with campers discussing just about everything under the sun."

After printing the description of the Dining Hall during Here Comes The Flood:
	say "You are alone at the southeast corner of the room, with a few readings for your satirical writing class.  You can see Aidan somewhere off to the west, eating with his friends.";

A plural-named thing called some dining tables and chairs are scenery, in the dining hall.

Your dining table is scenery, in the dining hall.
Your dinner is scenery, on your dining table.

Before printing the description of your dinner:
	display the boxed quotation
		"Don't eat school dinners, just toss them aside!
		A lot of kids didn't, a lot of kids died!
		The meat is of metal, the spuds are of steel,
		And if they don't kill you, the pudding will!";

The description of your dinner is "Seriously, the food's about the only down side to the LEAP camp.  It looks okay, but there's this sickly sweet aftertaste, like they used fake sugar in everything.";

Before eating your dinner:
	say "You shovel another forkful of your dinner into your mouth and swallow it as quickly as you can.  Unfortunately, you still don't quite manage to escape the aftertaste." instead;

Instead of smelling your dinner:
	say "It smells innocent enough, anyway.  But smells can be deceiving.";

Part 3 - Lucian Again

At the time when Lucian appears:
	move Lucian to the dining hall;
	start conversation with Lucian on Q_LUCIAN2_0;

Chapter 1 - Conversation

Q_LUCIAN2_0 is a quip. The display text is "'Hi, Daniel!'  It's Lucian, looking a lot more chipper than he did yesterday.  'Hey, where are Ava and Stacy?  Are you sitting alone?  Can I sit with you?'".

Q_LUCIAN2_0A is a menu quip. The following quip is Q_LUCIAN2_1. The menu text is "'Sure....'".
Q_LUCIAN2_0B is a menu quip. The following quip is Q_LUCIAN2_7. The menu text is "'No.'".
Q_LUCIAN2_0C is a menu quip. The following quip is Q_LUCIAN2_1. The menu text is "'Uh....'".

The response of Q_LUCIAN2_0 is { Q_LUCIAN2_0A, Q_LUCIAN2_0B, Q_LUCIAN2_0C }.

Q_LUCIAN2_1 is a quip. The display text is "'Really?  You're so cool!  Hey, I don't know what you said to those bullies yesterday, but you have to tell me how you did it!  Is there a special class for dealing with bullies?  They have all sorts of classes here... hey, maybe you could teach me!'".

Q_LUCIAN2_1A is a menu quip. The following quip is Q_LUCIAN2_5. The menu text is "'Uh....'".
Q_LUCIAN2_1B is a menu quip. The following quip is Q_LUCIAN2_6. The menu text is "'Actually, I asked my brother Aidan....'".
Q_LUCIAN2_1C is a menu quip. The following quip is Q_LUCIAN2_4. The menu text is "'You really need to settle down.'".
Q_LUCIAN2_1D is a menu quip. The following quip is Q_LUCIAN2_5. The menu text is "'There's nothing to teach.'".

The response of Q_LUCIAN2_1 is { Q_LUCIAN2_1A, Q_LUCIAN2_1B, Q_LUCIAN2_1C , Q_LUCIAN2_1D }.

Q_LUCIAN2_2 is a quip. The display text is "Hey, we should hang out!  We can play checkers.  Do you play checkers?  I bet you're really good at it.  We can play tonight, during dorm time!  How about it, Daniel?  Will you come play checkers with me?'".

Q_LUCIAN2_2A is a menu quip. The following quip is Q_LUCIAN2_3. The menu text is "'I'm sorta busy tonight....'".
Q_LUCIAN2_2B is a menu quip. The following quip is Q_LUCIAN2_4. The menu text is "'For goodness['] sakes, settle down!'".
Q_LUCIAN2_2C is a menu quip. The following quip is Q_LUCIAN2_7. The menu text is "'No, you're really creeping me out here.'".
Q_LUCIAN2_2D is a menu quip. The following quip is Q_LUCIAN2_8. The menu text is "'Uh, sure, why not....'".
Q_LUCIAN2_2E is a menu quip. The following quip is Q_LUCIAN2_8. The menu text is "'I love checkers!'".

The response of Q_LUCIAN2_2 is { Q_LUCIAN2_2A, Q_LUCIAN2_2B, Q_LUCIAN2_2C, Q_LUCIAN2_2D, Q_LUCIAN2_2E }.

Q_LUCIAN2_3 is a quip. The display text is "'Oh, well I guess that's true.  You've got all these things to read.  Gosh, you must be smart.  How about tomorrow, huh?  I've got nothing to do tomorrow, we can hang out then!  How's that sound?'".

Q_LUCIAN2_3A is a menu quip. The following quip is Q_LUCIAN2_8. The menu text is "'That sounds nice....'".
Q_LUCIAN2_3B is a menu quip. The following quip is Q_LUCIAN2_7. The menu text is "'That sounds slightly nicer than being dunked in battery acid.  Stop bothering me!'".

The response of Q_LUCIAN2_3 is { Q_LUCIAN2_3A, Q_LUCIAN2_3B }.

Q_LUCIAN2_4 is a quip. The display text is "'Peter, my teacher back in school, used to say the same thing.  I'm just happy to have made friends!  You ARE going to be my friend, right?'".

Q_LUCIAN2_4A is a menu quip. The following quip is Q_LUCIAN2_7. The menu text is "'Are you out of your mind?'".
Q_LUCIAN2_4B is a menu quip. The following quip is Q_LUCIAN2_8. The menu text is "'Friends ... uh, sure....'".

The response of Q_LUCIAN2_4 is { Q_LUCIAN2_4A, Q_LUCIAN2_4B }.

Q_LUCIAN2_5 is a transitional quip. The following quip is Q_LUCIAN2_2.

Rule for firing Q_LUCIAN2_5:
	say "'See, you're just that awesome.  [run paragraph on]";

Q_LUCIAN2_6 is a transitional quip. The following quip is Q_LUCIAN2_2.

Rule for firing Q_LUCIAN2_6:
	say "'Oh?  Who's he?  Nah, I still think you're the coollest.  [run paragraph on]";

Q_LUCIAN2_7 is a quip. The display text is "Lucian's eyes nearly fall out of their sockets.  'But... but... I thought we were going to be friends!'  You try to respond but at that moment you hear a little snicker from somewhere -- no doubt one of the other first-years of Lucian's acquaintance -- and Lucian, absolutely mortified, leaves his tray on the table and makes a break for the dining hall doors.  You try to stand but are knocked back into your seat by a wave of bitterness and a strange, slick feeling that makes your skin crawl.  The headache, which you thought was all but gone, throbs to life and the room seems to whirl into a maelstrom of sound and color and smell and flavour and touch.  You're vaguely aware of Aidan, somewhere off to the west, getting to his feet before he disappears into a complicated flurry of woodwinds."

Q_LUCIAN2_8 is a quip. The display text is "Lucian's eyes light up.  'I knew you were different from the others!'  He goes on about his delight at making a friend, but you can't hear him: you've been nearly bowled out of your seat by a wall of fluttering mauve butterfly wings exploding from Lucian.  You fight to regain your balance, but the explosion of color drives you reeling away from the table.  All around you, colors and sounds and smells and flavours and disconcerting sensations thrilling along your skin all erupt into being, leaving you unable to see what's actually there.  You are vaguely aware of Aidan, somewhere off to the west, getting to his feet before you lose him to a complicated flurry of woodwinds."

After firing Q_LUCIAN2_7:
	move the player to the Maelstrom;

After firing Q_LUCIAN2_8:
	move the player to the Maelstrom;

Part 4 - Emotional Maelstrom

Chapter 1 - Scene setting

Lost in the Maelstrom is a scene. Lost in the Maelstrom begins when the location is the Maelstrom. Lost in the Maelstrom ends when the x part of the coordinate of the Maelstrom is at least 4.

Chapter 2 - Goals

When Lost in the Maelstrom begins:
	add GOAL_ESCAPE to the current goals, if absent;

GOAL_ESCAPE is a goal. The printed name is "escape from Lucian's emotions".

A goal-scoring rule for GOAL_ESCAPE:
	if the x part of the coordinate of the Maelstrom is not 1 or the y part of the coordinate of the Maelstrom is not 1:
		add GOAL_ESCAPE_2 to the current goals;
		goal achieved;

GOAL_ESCAPE_2 is a goal. The printed name is "find your way to Aidan".

A goal-scoring rule for GOAL_ESCAPE_2:
	if the x part of the coordinate of the Maelstrom is 4:
		goal achieved;

Chapter 3 - Definitions

Section 1 - Coordinate system

A coordinate is a kind of value. (100, 100) specifies a coordinate with parts x (without leading zeros) and y (without leading zeros).

Maelstrom is a room.
Maelstrom has a coordinate. The coordinate of Maelstrom is (1, 1). 
Maelstrom has a coordinate called the boundary. The boundary of the Maelstrom is (4, 4).

Section 2 - Some emotional impressions

Emotional impression is a kind of thing. The emotional impressions are defined by the table of overwhelming emotions.

Table of overwhelming emotions
emotional impression	short description
doorbells		"seems to be a wall of excitedly jangling doorbells"
songbirds		"sounds like a crowd of chattering songbirds"
swamp			"smells like a swamp, all sulphur and mud and wet"
burnt engine oil		"smells too strongly of burnt engine oil for anyone's tastes"
dazzling blaze		"is a blaze of dazzling, gaily swirling oranges and reds"
drunken singing		"is a whirl of blues and greens, and you think you hear drunken singing there as well"
spicy flavour		"seems to taste sour and bitter and spicy all at once"
sweet flavour		"has an uncomfortably too-sweet taste in the air"
prickly sensation		"feels inexplicably, well, prickly"
electrical buzz		"feels electrically charged, you can almost hear the buzz"

Understand "sound of", "wall of", "excited", "excitedly", "jangling", "jangle", "door", "bells", "bell", "doorbell", "noise", "sound", "noises", "sounds" as the doorbells.

Understand "crowd", "crowd of", "chatter", "chattering", "song", "birds", "bird", "songbird", "swooping", "shadow", "shadow", "noises", "sounds", "singing" as the songbirds.

Understand "smell", "aroma", "stench", "stink", "perfume", "smell of", "aroma of", "stench of", "stink of", "swamps", "mud", "sulphur", "sulphurous", "muddy", "wet", "smelly", "smells", "aromas" as the swamp.

Understand "strong", "smell", "smell of", "smells", "aromas" as the burnt engine oil.

Understand "gay", "festive", "gaily", "swirling", "orange", "oranges", "red", "reds", "color/colour", "colors", "colours" as the dazzling blaze.

Understand "whirl", "whirl of", "blue", "green", "blues", "greens", "mock-german", "german", "images", "images of", "people dancing", "dancing people", "dancing", "around", "song", "colors", "colours", "noises", "sounds" as the drunken singing.

Understand "sour", "bitter", "taste", "flavor", "tastes", "flavors", "flavours" as the spicy flavour.

Understand "sweet", "pink", "too-sweet", "too sweet", "taste", "flavor", "tastes", "flavors", "flavours" as the sweet flavour.

Understand "feeling", "sensation", "feelings", "sensations" as the prickly sensation.

Understand "electric", "electricity", "charge", "charged", "charged air", "feeling", "sensation", "buzzing", "sound", "noise", "tastes", "flavors", "flavours", "sounds", "noises" as the electrical buzz.

Rule for printing the description of doorbells:
	say "You can't see them, but you can hear them jangling and buzzing in a cacophony of excitement and anticipation.";

Rule for printing the description of songbirds:
	say "They're accompanied by swooping shadows, and seem to be leaping from one curiosity to another.";

Rule for printing the description of swamp:
	bug "This response is wrong.";
	say "They're accompanied by swooping shadows, and seem to be leaping from one curiosity to another.";

Rule for printing the description of burnt engine oil:
	say "The air there is black and menacing.";

Rule for printing the description of dazzling blaze:
	say "They're very gay and festive, but more than you can take right now.";

Rule for printing the description of drunken singing:
	say "It sounds vaguely mock-german, and conjures images of people dancing around in circles.";

Rule for printing the description of spicy flavour:
	say "You can taste it in the air, like storm warnings.";

Rule for printing the description of sweet flavour:
	say "It's even worse than the dining hall food.  Somehow you know it's pink and hiding something unpleasant underneath.";

Rule for printing the description of prickly sensation:
	say "You just know you'll get an awful case of pins and needles if you head off in that direction.";

Rule for printing the description of electrical buzz:
	say "It seems to keep bouncing between two sources, growing or changing with each bounce.";

Chapter 4 - Maze Implementation

Section 1 - Available exits

The Maelstrom has a list of objects called the accessible directions.
The Maelstrom has a list of objects called the blocked directions.

Before printing the description of the Maelstrom:
	let the potential directions be the list of orthogonal directions;
	if the x part of the coordinate of the Maelstrom is 1:
		remove east from the potential directions, if present;
	if the y part of the coordinate of the Maelstrom is 1:
		remove south from the potential directions, if present;
	if the x part of the coordinate of the Maelstrom is the x part of the boundary of the Maelstrom:
		remove west from the potential directions, if present;
	if the y part of the coordinate of the Maelstrom is the y part of the boundary of the Maelstrom:
		remove north from the potential directions, if present;
	change the accessible directions of the Maelstrom to the potential directions;
	sort the potential directions in random order;
	remove entry 1 from the potential directions;
	sort the potential directions;
	change the blocked directions of the Maelstrom to the potential directions;

Rule for printing the description of the Maelstrom:
	say "You are lost in a swirl of sensory stimuli. ";
	repeat with D running through the blocked directions of the Maelstrom:
		say "[The D] [short description of the feeling of D]. ";
	say paragraph break;
	say "Somewhere off to the west, above the noise and color and inexplicable smells, you think you hear something -- a low-pitched reed instrument of some kind, possibly an oboe -- calling out to you.";

Rule for printing the description of the Maelstrom when the x part of the coordinate of the Maelstrom is 4:
	do nothing instead;

Before going an orthogonal direction in Maelstrom:
	if the noun is not listed in the accessible directions of the Maelstrom:
		say "There's a wall in that direction, isn't there?  You stop before you hurt yourself; there is a brief burst of [one of]low-pitched woodwinds[or]songbird chatter[purely at random] nearby, which is quickly lost in the maelstrom." instead;
	otherwise if the noun is listed in the blocked directions of the Maelstrom:
		say "You take a step in that direction but are almost overwhelmed by the sensations." instead;
	otherwise:
		consider the emotion-setting rule;
		consider the coordinate-updating rule;
		move the player to the Maelstrom instead; [illusion of true movement]

Section 2 - Exits have an impression

Emotionally-impressing relates one emotional impression (called the feeling) to one direction. The verb to feel (he feels, they feel) implies the reversed emotionally-impressing relation.

When play begins:
	consider the emotion-setting rule;

This is the emotion-setting rule:
	let the emotions be the list of emotional impressions;
	let the ways be the list of orthogonal directions;
	sort the emotions in random order;
	repeat with i running from 1 to 4:
		now entry i of the ways feels entry i of the emotions;

Definition: a direction is maelstrom-blocked if it is listed in the blocked directions of the Maelstrom.

Definition: a direction is maelstrom-accessible if it is listed in the accessible directions of the Maelstrom.

Understand "[something related by reversed emotionally-impressing]" as a direction when the location is the Maelstrom and the item described is maelstrom-blocked.

Understand "focus [direction]" as facing when the location is the Maelstrom.

Instead of facing a planar direction when in the Maelstrom:
	carry out the printing the description activity with the noun instead;

Rule for printing the description of a maelstrom-blocked direction (called d) when in the Maelstrom:
	carry out the printing the description activity with the feeling of d;

Rule for printing the description of a maelstrom-accessible direction when in the Maelstrom:
	placeholder "You sense nothing significant in that direction.";

Rule for printing the description of an orthogonal direction when in the Maelstrom:
	placeholder "There's a wall in that direction, isn't there?";

Rule for printing the description of a planar direction when in the Maelstrom:
	placeholder "You sense nothing significant in that direction.";

Section 3 - Movement

This is the coordinate-updating rule:
	let XX be the x part of the coordinate of the Maelstrom;
	let YY be the y part of the coordinate of the Maelstrom;
	if the noun is:
		-- north: increment YY by 1;
		-- south: decrease YY by 1;
		-- west: increment XX by 1;
		-- east: decrease XX by 1;
	change the coordinate of the Maelstrom to the coordinate with x part XX y part YY;

Chapter 5 - End

When Lost In The Maelstrom ends:
	say "You finally stumble into the edge of what looks like a long, sustained note played on an oboe and sounds like a cone of bright, white light.  It leaps about you, and you feel someone catch hold of you -- it takes you a moment to realise that this is real, and not a product of your out-of-control senses.  It's Aidan, you can hear his voice over the buzzing of all the other sounds that aren't really there.  The relief is overwhelming, and you finally allow yourself to collapse.";
	consider the goal assessment rule;
	say "Just as you lose consciousness, you are startled by the appearance of something ominously black and alien, spinning about in the centre of the whiteness surrounding you....";
	pause the game;

Book 4 - Hospital

Hospital is a scene. Hospital begins when Here Comes The Flood ends.

When Hospital begins:
	say "The first thing you try to do when you regain consciousness is open your eyes.  This fails because they're already open.  You're in absolute darkness, and there's this smell -- not that you can really trust your senses anymore -- like disinfectant.[paragraph break]Rather more alarmingly, for some odd reason, is the fact that you feel perfectly fine.  When was the last time you felt that way?";
	pause the game;
	say "Location unknown, Day unknown - Time un-- you know it's entirely possible that you're dead, right?[paragraph break]You are in darkness.";
	move the player to the coffin case, without printing a room description;
	change the current term day to Day 5;
	change the left hand status line to "Day ??: ??";
	change the right hand status line to "??:??";
	add GOAL_FIND_OUT_ABOUT_YOU to the current goals, if absent;

GOAL_FIND_OUT_ABOUT_YOU is a goal. The printed name is "find out what's happened to you".

Rule for printing the announcement of darkness when in the coffin case:
	do nothing;

Part 1 - Inside Case

Hospital Room is a room. "You are in a hospital room, equipped with a single bizarre-looking coffin-case thing attached to a bewildering wall of medical equipment.  The walls are painted a sterile white.  Huge windows look out to the south, while a pale green door, equipped with a small viewing window, is to the north."

The coffin case is an enterable container, openable, closed, in the Hospital Room.

Cased In is a scene.
Cased In begins when the player is in the coffin case.
Cased In ends eventually when the time since Cased In began is 10 minutes.
Cased In ends prematurely when the coffin case is open.

When Cased In ends:
	fire TRIG_EXIT_CASE;
	change left hand status line to "Day ??: [location]";

Instead of shouting at the location during Cased In, now the coffin case is open.

TRIG_EXIT_CASE is a trigger.

Rule for firing unfired TRIG_EXIT_CASE:
	now the coffin case is open;
	say "The top of the coffin flies open, and you're momentarily blinded by a flood of bright light.  As you try to blink away the spots, a face swims into view -- it takes you a few moments to register the curly white hair, the rosy cheeks and the clear blue eyes, and the fact that said face is talking to you.";
	move the player to the Hospital Room, without printing a room description;
	start conversation with Doctor Claudia Rose on Q_DOC_ROSE_0;

Part 2 - Conversation with Doctor Rose

Chapter 1 - Doctor Rose

Doc Rose Chat is a scene. Doc Rose Chat begins when Cased In ends. Doc Rose chat ends when Q_DOC_ROSE_14 is fired.

Doctor Claudia Rose is an unidentified woman, improper-named, in the Hospital Room.

Rule for writing a paragraph about Doctor Claudia Rose:
	placeholder "Room description text about [the Doctor Rose].";

Rule for printing the name of unidentified Doctor Claudia Rose:
	say "doctor";

Rule for printing the name of identified Doctor Claudia Rose:
	say "Dr Rose";

Chapter 2 - Conversation

Q_DOC_ROSE_0 is a quip. The display text is "'Hullo, Daniel.  My goodness, you gave us a scare.  How are you feeling?'"

Q_DOC_ROSE_0A is a menu quip. The following quip is Q_DOC_ROSE_1. The menu text is "'I'm alive, I think.'".
Q_DOC_ROSE_0B is a menu quip. The following quip is Q_DOC_ROSE_2. The menu text is "'What just happened?'".
Q_DOC_ROSE_0C is a menu quip. The following quip is Q_DOC_ROSE_3. The menu text is "'What the hell just happened?'".
Q_DOC_ROSE_0D is a menu quip. The following quip is Q_DOC_ROSE_3. The menu text is "'I just woke up in a coffin!  I thought I was being buried alive!  How do you think I feel?'".

The response of Q_DOC_ROSE_0 is { Q_DOC_ROSE_0A, Q_DOC_ROSE_0B, Q_DOC_ROSE_0C, Q_DOC_ROSE_0D }.

Q_DOC_ROSE_1 is a transitional quip. The following quip is Q_DOC_ROSE_5. The display text is "'That's the spirit!'  The face breaks into a smile, complete with dimples."

Q_DOC_ROSE_2 is a transitional quip. The following quip is Q_DOC_ROSE_5. The display text is "'Now, then, that's a rather complicated question.  Let's see if I can make the answer a little less complicated.'  The face pauses thoughtfully before continuing."

Q_DOC_ROSE_3 is a quip. The display text is "'Tsk tsk, I do know you're upset, but I do think it best if you try to calm down and consider that this sort of stress might be what put you here in the first place.'"

Q_DOC_ROSE_3A is a menu quip. The following quip is Q_DOC_ROSE_4. The menu text is "'Where am I?'".
Q_DOC_ROSE_3B is a menu quip. The following quip is Q_DOC_ROSE_5. The menu text is "'Okay, fine, I'll calm down.  See?  All calmed down.  Now this had better be good.'".

The response of Q_DOC_ROSE_3 is { Q_DOC_ROSE_3A, Q_DOC_ROSE_3B }.

Q_DOC_ROSE_4 is a quip. The display text is "'You're in the university hospital, dear, and I'm Dr Claudia Rose.  We've had you and your brother under observation all night, and I really hope you'll both be well enough to return to the camp today.  You should be, if nothing goes wrong.'"

Q_DOC_ROSE_4A is a menu quip. The following quip is Q_DOC_ROSE_7. The menu text is "'Aidan's under observation?  Whatever for?'".
Q_DOC_ROSE_4B is a menu quip. The following quip is Q_DOC_ROSE_6. The menu text is "'What do you mean, [']if nothing goes wrong[']?  What's happening?'".

After firing Q_DOC_ROSE_4:
	identify Doctor Claudia Rose;

The response of Q_DOC_ROSE_4 is { Q_DOC_ROSE_4A, Q_DOC_ROSE_4B }.

Q_DOC_ROSE_5 is a quip. The display text is "'Here, sit up.  I'm Dr Claudia Rose, by the way, and you and your brother are very lucky that your particular condition happens to be a specialty of mine.'"

Q_DOC_ROSE_5A is a menu quip. The following quip is Q_DOC_ROSE_6. The menu text is "'Condition?  What condition?'".
Q_DOC_ROSE_5B is a menu quip. The following quip is Q_DOC_ROSE_7. The menu text is "'What... has something happened to Aidan?'".

After firing Q_DOC_ROSE_5:
	identify Doctor Claudia Rose;

The response of Q_DOC_ROSE_5 is { Q_DOC_ROSE_5A, Q_DOC_ROSE_5B }.

Q_DOC_ROSE_6 is a quip. The display text is "'You're developing some rather unique abilities, Daniel.  As far as I can tell, based on what your friends have told me, you are gaining the ability to sense the emotions of the people around you.  At the moment, your brain is trying to cope with the influx of these new senses and trying to interpret them using the template of the other five; before long, you should start recognising emotions for what they are, rather than sensing them as flavours or colours or smells.'"

Q_DOC_ROSE_6A is a menu quip. The following quip is Q_DOC_ROSE_9. The menu text is "'So ... what, I'm going to be some sort of mind-reader?'"
Q_DOC_ROSE_6B is a menu quip. The following quip is Q_DOC_ROSE_10. The menu text is "'So what DID happen at dinner?'"
Q_DOC_ROSE_6C is a menu quip. The following quip is Q_DOC_ROSE_10. The menu text is "'So I've got to avoid people now or I'll wind up here again?'"
Q_DOC_ROSE_6D is a menu quip. The following quip is Q_DOC_ROSE_11. The menu text is "'That sounds kind of cool, actually....'"

The response of Q_DOC_ROSE_6 is { Q_DOC_ROSE_6A, Q_DOC_ROSE_6B, Q_DOC_ROSE_6C, Q_DOC_ROSE_6D }.

Q_DOC_ROSE_7 is a quip. The display text is "'Your brother Aidan carried you here after you collapsed at dinner last night.'  Dr Rose pauses.  'A distance of about a mile, running at 30 miles an hour, he was here before anyone at the camp could fully explain over the phone what had happened.'"

Q_DOC_ROSE_7A is a menu quip. The following quip is Q_DOC_ROSE_12. The menu text is "'Where is he?  I want to see him.'"
Q_DOC_ROSE_7B is a menu quip. The following quip is Q_DOC_ROSE_10. The menu text is "'So what DID happen?'"

The response of Q_DOC_ROSE_7 is { Q_DOC_ROSE_7A, Q_DOC_ROSE_7B }.

Q_DOC_ROSE_8 is a transitional quip. The following quip is Q_DOC_ROSE_14. The display text is "Dr Rose nods.  'This sort of thing must be expected as you're first getting used to your new abilities, I suppose.  In the meantime, I've set up this device here to help you out.'  She indicates what appears to be a steampunk salon hair dryer.  'This is a cranial crown.  It will flood your brain with an electromagnetic frequency that should dampen the new sensory stimulus going to your brain, giving it a rest and allowing it to recuperate enough so it doesn't go out of control again.  You'll have to undergo this treatment at least once a week, I'd say.'"

Q_DOC_ROSE_9 is a transitional quip. The following quip is Q_DOC_ROSE_11. The display text is "Dr Rose chuckles.  'If you want to put it that way.  You won't be reading minds, exactly, but otherwise it's not such a bad analogy.'"

Q_DOC_ROSE_10 is a quip. The display text is "'What happened at dinner was a sensory overload.  Too many people, too many emotions, not enough experience.  You should develop the ability to handle this sort of thing, with time, but in the meantime it is absolutely vital that you come back here once a week for ... well, this device here.'  Dr Rose waves a hand at what appears to be a steampunk salon hair dryer.  'This is a cranial crown that will flood your brain with an electromagnetic frequency that should dampen the new sensory stimulus going to your brain -- giving it a rest, as it were -- and prevent it from going out of control again.'"

Q_DOC_ROSE_10A is a menu quip. The following quip is Q_DOC_ROSE_13. The menu text is "'It's not going to also give me a hair helmet, is it?'"
Q_DOC_ROSE_10B is a menu quip. The following quip is Q_DOC_ROSE_11. The menu text is "'Well, that's a drag.  I suppose there's nothing I can do about it, is there?'"

The response of Q_DOC_ROSE_10 is { Q_DOC_ROSE_10A, Q_DOC_ROSE_10B }.

Q_DOC_ROSE_11 is a quip. The display text is "'Your friends tell me you've been able to track people using the emotional debris they leave in their wake.  That's really quite impressive.  You should also be able to get an idea of how a person feels by examining them, and possibly more if you focus on those emotions.  Eventually, I think you might even be able to amplify or muffle whatever emotion you find, though right now that ability may only manifest in times of extreme stress, as it was with the manifestation of Aidan's abilities.'"

Q_DOC_ROSE_11A is a menu quip. The following quip is Q_DOC_ROSE_7. The menu text is "'Aidan's abilities?  What do you mean?'"
Q_DOC_ROSE_11B is a menu quip. The following quip is Q_DOC_ROSE_12. The menu text is "'Can I see Aidan?'"
Q_DOC_ROSE_11C is a menu quip. The following quip is Q_DOC_ROSE_8. The menu text is "'I guess that sort of went out of control at dinner....'"

The response of Q_DOC_ROSE_11 is { Q_DOC_ROSE_11A, Q_DOC_ROSE_11B, Q_DOC_ROSE_11C }.

After populating Q_DOC_ROSE_11:
	if Q_DOC_ROSE_7 is fired:
		remove Q_DOC_ROSE_11A from the current conversation;
	if Q_DOC_ROSE_12 is fired:
		remove Q_DOC_ROSE_11B from the current conversation;
	if Q_DOC_ROSE_8 is fired:
		remove Q_DOC_ROSE_11C from the current conversation;
	if the current conversation is empty:
		carry out the firing activity with Q_DOC_ROSE_14;
		carry out the populating activity with Q_DOC_ROSE_14;

Q_DOC_ROSE_12 is a quip. The display text is "'Your conditions are quite delicate, Daniel, and I don't want you to experience a relapse or anything of the sort.  The exertion may be too much, and I don't want you to excite yourself.  So please stay in your room, refrain from exerting yourself, and wait until I'm sure that your condition is stable.'"

Q_DOC_ROSE_12A is a menu quip. The following quip is Q_DOC_ROSE_11. The menu text is "'What exactly is my condition, anyway?'"

The response of Q_DOC_ROSE_12 is { Q_DOC_ROSE_12A  }.

After populating Q_DOC_ROSE_12:
	if Q_DOC_ROSE_11 is fired:
		remove Q_DOC_ROSE_12A from the current conversation;
	if the current conversation is empty:
		carry out the firing activity with Q_DOC_ROSE_14;
		carry out the populating activity with Q_DOC_ROSE_14;

Q_DOC_ROSE_13 is a quip. The display text is "'A hair helmet?'  Dr Rose looks at the cranial crown again.  'Oh!  I suppose it does rather look like a salon hair dryer, doesn't it?  Well, function before form, I suppose.  The important thing is that it will allow your abilities to develop without overwhelming you in the process.'"

Q_DOC_ROSE_13A is a menu quip. The following quip is Q_DOC_ROSE_11. The menu text is "'My abilities?'"

The response of Q_DOC_ROSE_13 is { Q_DOC_ROSE_13A  }.

Q_DOC_ROSE_14 is a quip. The display text is "'I have spoken to your parents, by the way, and explained everything to them.  As you know, they're overseas and cannot return at the moment, at least not on such short notice.  In the meantime, they've left me in charge of your health and welfare.  So, Daniel, if anything bothers you at all, I hope you will tell me about it.  I'll do anything I can to make sure you're safe.'[paragraph break]Dr Rose pats you on the shoulder and is about to say something more when there's a resounding crash from somewhere else in the hospital.  At the same time, the pager on Dr Rose's belt goes off.  You catch a glimpse of a number, R15, flashing on its face as Dr Rose looks down at it.  She frowns.  'I'm sorry to have to cut our little chat short, Daniel, but it seems I'm urgently needed elsewhere.  Remember, stay where you are, and don't exert yourself.'  With that, she hurries out of the room, leaving a cloud of apprehension (or is it anxiety?) in her wake.[paragraph break]As the door closes behind her, Ava and Stacy slip into the room.  'Daniel!' says Ava, 'what happened?  Are you going to be okay?'[paragraph break]'Ava, stop worrying and let him answer already.'  Stacy's eye wanders over to the cranial crown contraption.  You don't need super emo-detector powers to see that her curiosity is piqued.";

When Doc Rose Chat ends:
	remove Doctor Claudia Rose from play;
	move Ava to the location;
	move Stacy to the location;

Part 3 - Conversation with Ava and Stacy

Chapter 1 - Scene

Hospital chat is a scene. Hospital chat begins when Doc Rose chat ends.

Hospital Chat ends when Q_AVA_HO_2 is fired or Q_AVA_HO_3 is fired or Q_AVA_HO_4 is fired.

Rule for choosing the conversation table of Ava during Hospital chat:
	change the chosen conversation table to the Table of Ava and Stacy's hospital conversation;

Rule for choosing the conversation table of Stacy during Hospital chat:
	change the chosen conversation table to the Table of Ava and Stacy's hospital conversation;

Before printing the name of Stacy while constructing the status line during Hospital Chat:
	say "Ava and ";

After printing the name of Ava while constructing the status line during Hospital Chat:
	say " and Stacy";

Understand "ava and stacy" as ava when the player can see Ava and the player can see Stacy.
Understand "stacy and ava" as ava when the player can see Ava and the player can see Stacy.

Chapter 2 - Conversation

Table of Ava and Stacy's hospital conversation
conversation		topic
CT_AVA_HOSP_CROWN	"cranial" or "crown" or "helmet" or "contraption" or "machine" or "device"
CT_AVA_HOSP_AIDAN	"aidan" or "my brother/bro" or "brother/bro"
CT_AVA_HOSP_CRASH	"crashing" or "crash" or "smash" or "noise" or "sound"
Q_AVA_HOSP_R15	"R15" or "room 15" or "room r15"

CT_AVA_HOSP_CROWN is a conversation topic. The response text is "You tell Stacy about the cranial crown and the need for regular treatments.  'Sorry to hear that,' Stacy says, still peering at the cranial crown and not sounding very convincing, 'that sort of thing always sucks.'"

CT_AVA_HOSP_AIDAN is a conversation topic. 

Rule for firing CT_AVA_HOSP_AIDAN:
	start conversation with Ava on Q_AVA_HO_0;

CT_AVA_HOSP_CRASH is a conversation topic. 

Q_AVA_HOSP_R15 is a transitional quip. The following quip is Q_AVA_HO_10.

Q_AVA_HO_0 is a quip. The display text is "'Ava went to look in on him while we were waiting to see you,' says Stacy.  'He's somewhere on this floor too, isn't he?'[paragraph break]'They wouldn't let me in to see him, either,' Ava says, 'and it's not as if anything had happened to him or anything.  He's in room R15.'"

Q_AVA_HO_0_A is a menu quip. The following quip is Q_AVA_HO_1. The menu text is "'R15?  That's the number I saw flashing on Dr Rose's pager!'"

First before firing Q_AVA_HO_0_A:
	change the menu text of Q_AVA_HO_0_A to ""; [We don't really say it.]

The response of Q_AVA_HO_0 is { Q_AVA_HO_0_A }.

Q_AVA_HO_1 is a quip. The display text is "'Something must have happened,' you say, 'I'll bet it has something to do with that crash I heard ... I've got to see what's going on!'[paragraph break]'No, wait,' Ava says, 'you're supposed to be resting!'"

Q_AVA_HO_1_A is a menu quip. The following quip is Q_AVA_HO_2. The menu text is "'I'll rest after I've checked in on Aidan!'"
Q_AVA_HO_1_B is a menu quip. The following quip is Q_AVA_HO_3. The menu text is "'I feel fine!'"
Q_AVA_HO_1_C is a menu quip. The following quip is Q_AVA_HO_4. The menu text is "'I suppose you're right.  Someone will tell me if it's something to do with Aidan.'"

The response of Q_AVA_HO_1 is { Q_AVA_HO_1_A, Q_AVA_HO_1_B, Q_AVA_HO_1_C }.

Q_AVA_HO_2 is a quip. The display text is "Ava tries to stop you, but you push past her to the door.  You don't stop to look back as you slip out onto the corridor.[paragraph break]For a moment, you feel a bit lost as you realise that you have no idea where room R15 might be, but then you sense Stacy and Ava joining you.  'Aidan's room is that way,' Ava says quietly, pointing off to the northwest."

Q_AVA_HO_3 is a quip. The display text is "'Well you don't know that you actually are fine!'  Ava moves to block your way.[paragraph break]'I'd like to know what that noise was, too,' Stacy says, 'and, come on, aren't you the least bit concerned?  It might have something to do with Aidan!'[paragraph break]Ava looks anxious and uncertain, then finally backs down.  'Okay, fine, but we better not get caught.'[paragraph break]Stacy opens the door, and you all slip out into the corridor.  Ava points off to the northwest.  'Aidan's room is that way.'"

Q_AVA_HO_4 is a quip. The display text is "Stacy frowns.  'Maybe.  But I want to know what that crash was.  I mean, it's not the sort of thing you want to hear in a hospital.'  She goes to the door and prepares to step out.  'Ava, are you coming?  You're the one who knows where room R15 is.'[paragraph break]Ava glances at you, and hesitates.  Stacy rolls her eyes and says, 'come on, Daniel, don't you want to find out if your brother is all right?'[paragraph break]You don't need that much encouragement.  Half a second later, the three of you are in the corridor.  Ava points off to the northwest.  'Aidan's room is that way.'"

Q_AVA_HO_10 is a quip. The display text is "'That's Aidan's room,' says Ava, 'I tried to drop in on him earlier.  You don't think...?'[paragraph break]'That something's happened to Aidan?'  It's an alarming thought.  'I'd better go find out.'[paragraph break]'But Daniel, you're supposed to be resting!'"

The response of Q_AVA_HO_10 is [reusing the Quip 1 responses] { Q_AVA_HO_1_A, Q_AVA_HO_1_B, Q_AVA_HO_1_C }.

Part 4 - Hospital Map

A hospital corridor is a kind of room.

[ A hospital door is a kind of door. A viewing window is a kind of thing.
A viewing window is part of every hospital door.

Instead of searching a hospital door (called the portal):
	redirect the action from the portal to a random viewing window which is part of the portal, and try that instead; ]

South T-intersection is a hospital corridor, north of Hospital Room. "You are in a featureless hospital corridor stretching from east to west.  Another corridor goes off to the north.  The door to your hospital room is to the south."

Southwest Corner is a hospital corridor, west of South T-intersection.  "The corridor makes a bend here, going east and north.  There are hospital rooms, apparently empty, to the west and south."

Southeast Corner is a hospital corridor, east of South T-intersection. "The corridor makes a bend here, going west and north.  There are hospital rooms, apparently empty, to the east and south."

West T-intersection is a hospital corridor, north of Southwest Corner. "You are in a featureless hospital corridor stretching north and south.  Another corridor goes off to the east.  A door marked 'EXIT' is to the west."

Crossroads is a hospital corridor, east of West T-intersection, north of South T-intersection. "This is the heart of this particular wing of the hospital, with corridors running off in all four cardinal directions."

East T-intersection is a hospital corridor, east of Crossroads, north of Southeast corner. "You are in a featureless hospital corridor stretching north and south.  Another corridor goes off to the west.  A pair of elevator doors are set into the east wall."

Northwest Corner is a hospital corridor, north of West T-intersection.  "The corridor makes a bend here, going east and south.  There are hospital rooms to the west and north, although the sounds coming from the north suggest that that particular hospital room is not quite as empty as all the others have been."

North T-intersection is a hospital corridor, east of Northwest Corner, north of Crossroads.  "You are in a featureless hospital corridor stretching north and south.  Another corridor goes off to the south."

Northeast Corner is a hospital corridor, east of North T-intersection, north of East T-intersection.  "The corridor makes a bend here, going west and south.  There are hospital rooms, apparently empty, to the east and north."

A hospital ward is a kind of room.

Ward-A is a hospital ward, north of North T-intersection.
Ward-B is a hospital ward, north of Northeast Corner.
Ward-C is a hospital ward, west of Northwest Corner.
Ward-D is a hospital ward, east of Northeast Corner.
Ward-E is a hospital ward, east of East T-intersection.
Ward-F is a hospital ward, west of Southwest Corner.
Ward-G is a hospital ward, east of Southeast Corner.
Ward-H is a hospital ward, south of Southwest Corner.
Ward-I is a hospital ward, south of Southeast Corner.

Instead of facing towards a hospital ward:
	say "A glance through the viewing windows shows that the rooms beyond are quite unoccupied.";

Understand "door", "doors", "viewing window", "view", "window" as a direction when the item described is headed towards a hospital ward.

After printing the name of a direction that is headed towards a hospital ward:
	say " door";

Before searching a direction that is headed towards a hospital ward:
	try facing the noun instead;

Part 5 - Wandering (Dis)Orderly

Wandering Disorderly is a scene. Wandering Disorderly begins when Hospital Chat ends.

The wandering orderly is a person. The wandering orderly is in North T-intersection.
The wandering orderly can be stopped. The wandering orderly is not stopped.

The wandering orderly has a room called the previous location. The previous location of the wandering orderly is North T-intersection.

The wandering orderly can be wandering-freely or capturing. The wandering orderly is wandering-freely.

Every turn during Wandering Disorderly (this is the wandering disorderly rule):
	abide by the disorderly decision rules;
	consider the disorderly movement rules;

The disorderly decision rules are a rulebook.

A disorderly decision rule when the wandering orderly was stopped:
	now the wandering orderly is not stopped instead;

A disorderly decision rule when the wandering orderly is stopped:
	rule fails;

A disorderly decision rule when the wandering orderly is in a hospital ward:
	if a random chance of 3 in 8 succeeds:
		unless the location of the wandering orderly is adjacent:
			rule fails;

The disorderly movement rules are a rulebook.

First disorderly movement rule when the wandering orderly is in an adjacent room and the wandering orderly is capturing (this is the wandering orderly capture rule):
	let x be the location of the wandering orderly;
	let d be the quick best route from x to the location of the player;
	change the previous location of the wandering orderly to x;
	try the wandering orderly trying going d;
	rule fails;

A disorderly movement rule (this is the disorderly wandering rule):
	now the wandering orderly is wandering-freely;
	let the proposed directions be { north, south, east, west };
	sort the proposed directions in random order;
	repeat with dir running through the proposed directions:
		let x be the room dir from the location of the wandering orderly;
		if x is a room:
			consider the disorderly motion rules for x;
			if the rule succeeded:
				change the previous location of the wandering orderly to the location of the wandering orderly;
				try the wandering orderly trying going the result of the rule;
				rule succeeds;

The disorderly motion rules are an object-based rulebook.

A disorderly motion rule for the Northwest Corner:
	rule fails;

A disorderly motion rule for the Hospital Room:
	rule fails;

A disorderly motion rule for a room (called r) when the wandering orderly is in a Hospital Ward and r is not the location:
	rule succeeds with result the quick best route from the location of the wandering orderly to r;

A disorderly motion rule for a room (called r) when r is not the location:
	if r is not the previous location of the wandering orderly:
		rule succeeds with result the quick best route from the location of the wandering orderly to r;

After the wandering orderly trying going to an adjacent hospital corridor (called R) from a room that is not the location:
	now the wandering orderly is capturing;
	say "You notice an orderly pushing a gurney out into the corridor, off to the [quick best route from the location to R].  It looks like he's about to head this way!" instead;

After the wandering orderly trying going:
	if the room gone to is the location:
		placeholder "A gurney is pushed right into you by an orderly who, though surprised, is not too surprised to immediately sound the alarm.  Within seconds, Ava and Stacy have been bundled out of the hospital and you're locked into your room.  It's a couple of hours before Dr Rose comes back, frowning in a very concerned manner.";
		fire TRIG_DR_ROSE_DEATH;

After going to a hospital corridor:
	if the room gone to contains the capturing wandering orderly:
		placeholder "You run right into an orderly who, though surprised, is not too surprised to immediately sound the alarm.  Within seconds, Ava and Stacy have been bundled out of the hospital and you're locked into your room.  It's a couple of hours before Dr Rose comes back, frowning in a very concerned manner.";
		fire TRIG_DR_ROSE_DEATH;
	otherwise if the room gone to contains the wandering orderly:
		consider the disorderly wandering rule;
	continue the action;

Instead of going to a hospital ward:
	if the room gone to contains the wandering orderly:
		say "You open the door and run right into an orderly who, though surprised, is not too surprised to immediately sound the alarm.  Within seconds, Ava and Stacy have been bundled out of the hospital and you're locked into your room.  It's a couple of hours before Dr Rose comes back, frowning in a very concerned manner.";
		fire TRIG_DR_ROSE_DEATH;
	otherwise if the wandering orderly is in an adjacent room (called R):
		let x be a random adjacent hospital corridor;
		while x is the location of the wandering orderly:
			change x to a random adjacent hospital corridor;
		let d be the quick best route from the location to x;
		move the wandering orderly to x;
		change the previous location of the wandering orderly to the location;
		now the wandering orderly is stopped;
		now the wandering orderly is wandering-freely;
		say "You quickly duck into the empty hospital room as an orderly [if R is a Hospital Ward]comes out of the other room[otherwise]approaches[end if].  You wait until the footsteps fade away to [the d] before emerging again into the corridor.";
	otherwise:
		say "You quickly duck into the empty hospital room.  After a few moments, when nothing happens, you creep back out again.";

TRIG_DR_ROSE_DEATH is a trigger.

Rule for firing TRIG_DR_ROSE_DEATH:
	say "'I do wish you wouldn't insist on running around unsupervised, Daniel.  You need your rest, we need to monitor your condition, and this last adventure of yours might very possibly have interfered terribly with ... well, with everything.  The data may have been compromised.  I'm afraid we'll have to keep you under observation a little longer.'  She shakes her head sadly. 'Believe me, Daniel, I'd have liked to let you go back to the camp every bit as much as you would, but under the circumstances, I'm afraid it just can't be done.'";
	end the game saying "The story is over.";

Part 6 - Finding Aidan

Outward Journey is a scene. Outward Journey begins when Hospital Chat ends. Outward Journey ends when the location is Northwest Corner.

Return Journey is a scene. Return Journey begins when Outward Journey ends. Return Journey ends when the location is Hospital Room.

When Outward Journey begins:
	now Stacy Alexander follows the player;
	now Ava Winters follows the player;
	move the player to South T-Intersection;

Last report going to Northwest Corner when TRIG_FOUND_R15 is unfired during Outward Journey:
	fire TRIG_FOUND_R15;

TRIG_FOUND_R15 is a trigger.

Rule for firing unfired TRIG_FOUND_R15:
	say "'Here we are,' whispers Ava, pointing to a door to the north.  'That's room R15.  Aidan's in there.'";

The room R15 door is a door, scenery, north of Northwest Corner, south of Ward R15.

Rule for printing the name of the room R15 door:
	say "door to R15";

Understand "window", "viewing window", "view", "ward" as the room R15 door.

Instead of searching the room R15 door:
	try going the room R15 door;

Instead of opening the room R15 door:
	fire TRIG_FOUND_AIDAN;

TRIG_FOUND_AIDAN is a trigger.

Rule for firing unfired TRIG_FOUND_AIDAN:
	say "Looking through the window, you see a room equipped in much the same way your room was, complete with the silvery, high-tech coffin thing.  That's where the resemblance ends.  The lid of the coffin thing has been broken off and lies at the far end of the room, a huge crack down its middle, and smoke billows out from one broken monitor.  Aidan himself is lying near the coffin, unconscious, while a bunch of orderlies stand at a very safe distance away from him.[paragraph break]Fear, shock, whatever, it's thick in the air and feels like you just snorted hot salsa up your nose.[paragraph break]In the middle of all this is Dr Rose.  You can't hear what she's saying but ... oh, well, it looks like she's done lecturing the orderlies and now she's heading for the door.  You pull back before she sees you.  You've got to get back to your room before she notices you're gone, but you're in a corner and there's no way to know which way she'll turn when she comes out, and if you hide in the empty room to the west Dr Rose will almost certainly get to your room before you.[paragraph break]'Go that way,' Stacy whispers, shoving you eastwards.  'I'll distract them.'  Before you can say anything, Stacy has run off to the south.";

Rule for firing fired TRIG_FOUND_AIDAN:
	fire TRIG_DR_ROSE_DEATH2;

TRIG_DR_ROSE_DEATH2 is a trigger.

Rule for firing TRIG_DR_ROSE_DEATH2:
	say "'Daniel Wayne!' Dr Rose catches you by the collar and frowns, clearly disappointed.  'What are you doing out of your room?  Come on, back you go.'  She marches you back to your room, where she proceeds to put you through a battery of seemingly unnecessary tests.  Pursing her lips as she reads the data scrolling by on the monitors, she says, [run paragraph on]";
	fire TRIG_DR_ROSE_DEATH;

Hospital ends when Return Journey ends.

When Hospital ends:
	say "And not a moment too soon.  When Dr Rose comes bustling in, you and Ava are sitting beside the coffin thing, looking as if you'd just spent the past half hour talking about the weather.  Dr Rose frowns a bit when she checks the readouts on the various monitors, but no-one can look as innocent as Ava when she has to, and in the end Dr Rose decides that nothing suspicious has been going on after all.[paragraph break]Aidan, she says, is still undergoing observation of some kind, but you're free to go back to camp.  Brad picks you up after lunch (it turns out that the hospital food tastes just as nasty as the camp food) and you're back in time for your afternoon classes.  It's dinner time before Aidan is back at camp; and whatever it was that happened to him in the hospital, he either doesn't remember, or doesn't want to tell you.";
	pause the game;
	
Book 5 - Robotics Class

Robot Fun is a scene. Robot Fun begins when Hospital ends.

When Robot Fun begins:
	change the current term day to day 3;
	change the time of day to 10:25 PM;
	say "Things settle down, more or less, over the next day or so.  People are trying very hard to not give you funny looks when they see you, which pretty much comes to the same thing, really.  Aidan's probably going through the same sort of thing too.  He's certainly rather a bit more moody than he used to be.[paragraph break]LEAP, Day 6 (Friday) - Class Period 2[paragraph break]Robotics class, the wave of the future, because everyone knows that some day we're going to have giant killer robots laying waste to downtown Tokyo or something like that, and it would be a good thing to know how to deal with them.  No-one's really capable of making a giant killer robot: right now, you're all just doing a basic project to program a robot to do a certain simple task.  Except Stacy, who seems to be dead set on making a midget killer robot she calls the 'Stacy Alexander Robot Guy', or SARG for short.";
	move the player to Robotics Class;
	move Stacy Alexander to Robotics Class;
	move Aidan to Robotics Class;
	remove Ava Winters from play;

Robotics Class is a room. "You are sitting at a table in a perfectly ordinary classroom, surrounded by electronic parts.  Antonia Long, your Robotics instructor, has been cornered elsewhere by students with issues, leaving you to your own electronic, robotic devices.  Stacy is sitting beside you with her own robot project, SARG, while Aidan is at another table with the older students."

Part 1 - The Robot

Your robot is in Robotics Class. 

Part 2 - Logic Blocks

A logic block is a kind of thing, improper-named. Some logic blocks in Robotics Class are defined by the table of robot logic blocks.

Understand "programming", "logic block", "code", "block" as a logic block.

Before listing contents:
	group logic blocks together;

After printing the name of a logic block while not grouping together:
	say " logic block";

Before grouping together logic blocks:
	say "some programming logic blocks, all different colors: "

Table of robot logic blocks
logic block		braces	pseudocode
a copper-colored		-1	"[tab][tab][tab][tab]last used = left;[line break][tab][tab][tab]}"
a royal purple		0	"[tab][tab][tab][tab]pick_up_with_left;"
a hot pink		-1	"[tab]}[line break]end loop"
a scarlet			-1	"[tab][tab]}[line break][tab]} else {"
a saffron			1	"[tab][tab][tab]turn_to_destination_basket;[line break][tab][tab]} else {[line break][tab][tab][tab]if (last_used == left) {[line break][tab][tab][tab][tab]pick_up_with_right;"
a golden			-1	"[tab][tab]}[line break][tab][tab]turn_to_source_basket;"
a mint green		2	"begin loop[line break][tab]if (facing_source_basket) {[line break][tab][tab]if (holding_marble) {[line break]"
a magenta		1	"[tab][tab]if (holding_marble) {[line break][tab][tab][tab]drop_marble_in_basket;"
a baby blue		0	"[tab][tab][tab]holding_marble = true;[line break][tab][tab][tab]turn_to_destination_basket;"
a forest green		0	"[tab][tab][tab][tab]last_used = right;[line break][tab][tab][tab]} else {"

To say tab:
	say "    ";

Rule for printing the description of a logic block (called X):
	placeholder "[The X] is labeled with the program logic it contains, in pseudo-code form. This one reads:[paragraph break]";
	say fixed letter spacing;
	say "[pseudocode of X]";
	say variable letter spacing;
	say paragraph break;

Understand "copper", "copper-coloured" as the copper-colored.
Understand "red" as the scarlet.
Understand "orange" as the saffron.
Understand "gold", "yellow" as the golden.

Part 3 - Slots

A slot is a kind of container. Some slots are defined by the table of programming slots.

When play begins:
	now every slot is part of your robot.

Table of programming slots
slot		running order
slot 1		1
slot 2		2
slot 3		3		
slot 4		4
slot 5		5
slot 6		6
slot 7		7
slot 8		8
slot 9		9
slot 10		10

Definition: a slot is plugged if it contains a logic block.
Definition: a logic block is placed if it is in a slot.

A procedural rule when inserting a logic block into a slot:
	ignore the can't insert what's not held rule;

Instead of inserting something into a slot when the noun is not a logic block:
	placeholder "The slots are designed to each hold one logic block[if the second noun is plugged]. Besides, that one is already full[end if].";

Instead of inserting something into a plugged slot:
	placeholder "That slot is full.";

After inserting something into a slot:
	placeholder "Ker-chunk[one of]! [The noun] fills the slot snugly.[or]. Another block fits neatly into place.[or]. You put [the noun] in the slot.[or].[or].[or] - isn't this fun?[or].[stopping]";

Part 4 - The program

The program is part of your robot. Understand "slots" as the program.

Rule for printing the description of the program when every slot is not plugged:
	placeholder "All the program slots are empty.";

Rule for printing the description of the program:
	placeholder "Reading down the slots, the program reads as follows:[line break]";
	say fixed letter spacing;
	repeat with B running through the current program:
		say line break, pseudocode of B;
	say variable letter spacing, paragraph break;

Instead of entering the program [that is to say, by > RUN PROGRAM or similar...!]:
	consider the robotic rulebook;

The robotic rules is a rulebook.

[ First robotic rule when a slot is not plugged:
	placeholder "That can't be right. You need every single one of these blocks."; ]

A robotic rule:
	unless braces are matched:
		placeholder "Your robot buzzes and whirrs sadly[one of]. Stacy peers over. 'That's no good,' she says. 'Your braces don't match. Every opening brace needs a closing one.'[or].[or][if a random chance of 1 in 4 succeeds]. 'Braces!' calls Stacy helpfully.[otherwise].[end if][stopping]" instead;

To decide which number is the position of (b - a logic block):
	if b is in a slot (called the holster):
		decide on the running order of the holster;
	otherwise:
		decide on -1;

To decide which list of objects is the current program:
	let zblocks be a list of objects;
	repeat with i running from 1 to 10:
		if a logic block (called B) is in position i:
			add B to zblocks;
	decide on zblocks;

Block-ordering relates a logic block (called X) to a number (called Y) when the position of X is Y. The verb to be in position implies the block-ordering relation.

To decide whether braces are matched:
	let the brace count be 0;
	repeat with B running through the current program:
		let the temporary adjustment be 0;
		increment the brace count by the braces of B; 
		if B is:
			-- scarlet: change the temporary adjustment to -1;
			-- saffron: change the temporary adjustment to -1;
			-- forest green: change the temporary adjustment to -1;
		increment the brace count by the temporary adjustment;
		if the brace count is less than 0:
			decide no;
		decrement the brace count by the temporary adjustment;
	decide on whether or not the brace count is 0;

To decide whether loop is matched:
	let the brace count be 0;
	repeat with B running through the current program:
		let the temporary adjustment be 0;
		increment the brace count by the braces of B; 
		if B is:
			-- scarlet: change the temporary adjustment to -1;
			-- saffron: change the temporary adjustment to -1;
			-- forest green: change the temporary adjustment to -1;
		increment the brace count by the temporary adjustment;
		if the brace count is less than 0:
			decide no;
		decrement the brace count by the temporary adjustment;
	decide on whether or not the brace count is 0;

Book W - Walkthrough

Test hunt with "e/get dinosaur/nw/get change/n/u/u/u/get feather/get cloth/get stick/glue cloth to stick/d/get cutout/d/d/s/w/put change in machine/get paper/ne/get grass/se/w/s/fold paper".

Test lucian with "n/u/u/knock/1/2/1/1/s/d/d/w/w/focus/ask lucian about leap/ask lucian about bullies/ask lucian about crystal/2/n/e/u/s/focus/n/e/s/3/w/w/knock/aidan, help/s/e/e/w/w/d/s".

Test maelstrom with "random/eat dinner/g/1/3/2/w/l/l/w/l/l/l/w".

Book X - Not For Release - Fixing the RNG

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

