"A Gift of Empathy" by Textfyre

[
Include (- Constant DEBUG; -) after "Definitions.i6t".
]

[  Change Log
When		Who		What
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
Include Conversation Topics by Textfyre.
Include Scripted Events by Textfyre.
Include Goals by Textfyre.

Include Test Suite by Textfyre.
Include Parse List by Textfyre.

Book - Initialisation

Part 0 - Beating memory constraints

Use MAX_STATIC_DATA of 400000.

Part 00 - Fixing the index map

Index map with Courtyard mapped north of first floor midpoint.
Index map with Front Lawn mapped south of first floor lobby west.
Index map with Second Avenue mapped southwest of first floor rooms west.
Index map with Calvin Field North mapped northeast of First Floor Lobby East.
Index map with Calvin Field South mapped southeast of First Floor Lobby East.
Index map with Info Desk mapped south of First Floor Midpoint.
Index map with Info Desk mapped north of First Floor Lobby West.

Part 1 - Set up

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
	say "Inform 7 Story Programming by Graeme Jefferis[line break]";
	say "Testing by ____[line break]";
	say "User Interface Programming by Thomas Lynge[line break]";
	say "Special thanks to Graham Nelson and Emily Short[line break]";
	say "for all of their hard work on Inform 7.[line break]";
	say "All rights reserved[line break]";
	select the main channel;

Chapter 2 - Passage of Time

A term day is a kind of value. Day 10 specifies a term day.

The current term day is a term day that varies. The current term day is Day 2.

When play begins:
	change left hand status line to "[Current term day]: [location]";
	change right hand status line to "[time of day]";

Chapter 3 - Options

Rule for deciding whether all includes scenery:
	it does not;

Part 2 - The player

Chapter 1 - Description

[...]

Chapter 2 - Belongings

The player carries the list of items for the scavenger hunt.

A list of items for the Scavenger Hunt is a thing. The description is "A newspaper[line break]A feather[line break]A flag[line break]A star[line break]A dinosaur[line break]A hat[line break]Something that was once alive"

The player carries some dollar notes. The indefinite article of the dollar notes is "a few".

Understand "few", "dollars", "note", "money", "cash", "greenbacks", "buck", "bucks" as the dollar notes.

Last carry out taking inventory:
	list the player's goals;

Part 3 - Introduction

The time of day is 7:05 PM.

When play begins:
	say "It's your second year at the LEAP summer camp, and so far it's been as great as you remember last year to have been.  Ava Winters and Stacy Alexander, whom you met last year (and whom your brother Aidan calls 'your girlfriends', much to your embarrassment) are here again.  You spent yesterday catching up on the news in between options and classes, and now you're settling in with the smug sensation of not being a raw newbie any more.[paragraph break]The LEAP summer camp isn't quite the same as most summer camps.  LEAP is an acronym for 'Learning Enrichment Activity Programme'; the brainchild of world-renowned educator Professor Damon Rose, it is housed on the campus of the University of Colorado at Valmont, and was created for Gifted and Talented Kids (gosh, that sounds impressive) to expand their horizons and encourage them to stretch their mental capabilities.[paragraph break]Whatever. That's all in the promotional flyers. You just know that you're in for two weeks of the sort of interesting classes you don't get in school, and a bunch of fun options with which to fill up the free time after classes.  This evening, for instance, you've signed up for a scavenger hunt...";
	pause the game;
	say "LEAP, Day 2.  Evening.[paragraph break]'Okay, kids!' Michelle, the counselor in charge of the scavenger hunt option waves her hands to settle the crowd around you, before finally remembering her whistle.  A brief [i]fweep[r] sweeps through the room.  'Okay, does everyone have their list?  Everyone good?  Okay!  You have until 8:25 pm to find everything on your lists, return here, and show me your lists so I can check them.  So synchronise your watches... are we all in sync?  Good!  Your time starts... now!'[paragraph break]Michelle's whistle gives another sharp fweep, and the room practically empties as everyone else runs off to begin their hunt.";

Book - Actions

Part 1 - Folding (newspaper)

Folding is an action applying to one carried thing.

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

Part 2 - Knocking

Knocking on is an action applying to one thing.

Understand "knock [door]" as knocking on.
Understand "knock on/at [door]" as knocking on.

Instead of attacking a door:
	try knocking on the noun;

Check knocking on:
	placeholder "Knock knock.[paragraph break]No reply.";

Book - Definitions

Part 1 - Scavenger Hunt

Scavenger Hunting is a scene. Scavenger Hunting begins when play begins.

Scavenger Hunting ends naturally when the time of day is 8:25 PM.
Scavenger Hunting ends victoriously when every scavenger hunt goal is achieved and the player can see Michelle.

When Scavenger Hunting ends naturally:
	say "8:25!  Time's up!  You hurry back to the starting point with your list[if the player has something that fulfills a goal] and everything you've found so far[end if]...";
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

GOAL_SCAV_HUNT is an achieved goal.

Rule for printing the name of GOAL_SCAV_HUNT when every scavenger hunt goal is achieved:
	say "winning the scavenger hunt";

Rule for printing the name of GOAL_SCAV_HUNT when almost all scavenger hunt goals are achieved:
	say "runner up in the scavenger hunt";

Rule for printing the name of GOAL_SCAV_HUNT when most scavenger hunt goals are achieved:
	say "doing well in the scavenger hunt";

Rule for printing the name of GOAL_SCAV_HUNT :
	say "participating in the scavenger hunt";

When Scavenger Hunting ends:
	change the current goals to {};
	change the recently achieved goals to { GOAL_SCAV_HUNT  };

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

Instead of taking an option:
	say "Maybe tomorrow.";

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

A dispenser is a kind of thing. 

Understand "[something related by reversed representation]" as a dispenser.

A procedural rule when taking a dispenser:
	ignore the can't take scenery rule;
	ignore the can't take what's fixed in place rule;
	ignore the can't take component parts rule;

Check taking a dispenser when nothing is vended by the noun:
	say "No need." instead;

Check taking a dispenser when the prize of the noun is on-stage:
	say "You already have [a prize of the noun].";

Carry out taking a dispenser when the prize of the noun is off-stage:
	now the player carries the prize of the noun instead;

Report taking a dispenser:
	say "You take [a prize of the noun]." instead;

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

Instead of searching a cutout pouch:
	try examining the noun;

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

[One of the things Inform does brilliantly well:]

An emotional residue is a kind of thing.

Tainting relates various emotional residues to various rooms. The verb to taint (he taints, they taint, he tainted) implies the tainting relation.

Emotional-Awareness relates one person to various emotional residues.
The verb to be aware of implies the emotional-awareness relation.
The verb to be able to sense (it is sensed) implies the emotional-awareness relation.

Definition: an emotional residue is salient:
	if the player can sense it and it taints the location, yes;
	no;

After printing the description of a room (called R) when an emotional residue is salient:
	if R is the location:
		repeat with E running through salient emotional residues:
			carry out the printing the description activity with E;

Section 2 - Actions

Focussing on is an action applying to one visible thing. 

Understand "focus" as focussing on when the player has been aware of an emotional residue.
Understand "feel" as focussing on when the player has been aware of an emotional residue.
Understand "sense" as focussing on when the player has been aware of an emotional residue.

Rule for supplying a missing noun when focussing on:
	if there is a salient emotional residue:
		change the noun to a random salient emotional residue;
	otherwise:
		change the noun to the location;

Report focussing on an emotional residue:
	consider the focussing rules for the noun;

Report focussing on a room:
	placeholder "You sense nothing untoward or out of the ordinary here.";

The focussing rules are an object-based rulebook.

Book 1 - Jacobs Hall

Part 1 - Lobby West

Chapter 1 - Description

First Floor Lobby West is a room. "This used to be the living room, back when [one of]Alexander Quaverley Jacobs, the eccentric old coot who donated this place to the university[or]old AQJ[stopping] was still alive and the university was just starting up.  It's got a huge fireplace, and a big bay window looking out onto the front lawn.  It's also been painted completely white from floor to ceiling, so thickly that you're not sure if some of the molding is not actually just bubbles under the paint.  The info desk is back through the arch to the north, and the lobby continues, through another arch, to the west.[paragraph break]A large brass plaque has been fixed into the space over the fireplace."

Rule for printing the name of first floor lobby west:
	say "First Floor Lobby, West";

The player is in First Floor Lobby West.

Chapter 2 - Scenery

A painted fireplace is scenery, in the First Floor Lobby West. "No-one uses it any more, of course, but it still looks nice.  Even with all that white paint slathered all over it."

The white paint is a backdrop, in the First Floor Lobby West. "It was the fashion, back in the 1950s, to try to make a place look more modern by painting it white.  It's not the 1950s anymore, but apparently nobody ever told the custodians that." Understand "50s", "fifties", "1950s", "nineteen-fifties", "nineteen fifties" as the white paint.

A bay window is scenery, in the First Floor Lobby West. "Normally you can see all of the front lawn spread out from here, but right now there've been temporary walls set up all over the lawn."

The elaborate wood molding is scenery, in the First Floor Lobby West. "It's pretty elaborate, and almost makes you dizzy as you follow the pattern across the -- oh wait, those are just air bubbles under the paint."

Some air bubbles are scenery, in the First Floor Lobby West. "They're annoyingly random.  You don't know why the original painters couldn't have taken the trouble to -- oh wait, that's actually an elaborate wood molding."

A plaque shaped like a shield is scenery, in the First Floor Lobby West. "It's shaped like a shield, and commemorates the memory of Damon Rose, one of the founders of LEAP.  You remember him quite well from last year.  It was quite a shock to hear about the accident, and there was some question as to whether LEAP could go on without him.  His sister, Claudia Rose, is in charge of LEAP now, and making sure that the good work goes on.  She seems like a nice lady, but she's just not quite as present as old Damon Rose used to be."

Chapter 3 - Michelle

Michelle Close is a woman, in the First Floor Lobby West. The description of Michelle Close is "Michelle Close is one of the counselors.  She's slightly untidy-looking, with a big explosion of curly black hair and a pencil tucked behind one ear."

Rule for printing the name of Michelle Close:
	say "Michelle";

Michelle Close wears Michelle's whistle.

Michelle's whistle is improper-named. The printed name of Michelle's whistle is "whistle".

Part 2 - Info Desk

Chapter 1 - Description

Info Desk is a room, north of First Floor Lobby West. "The main foyer of Jacobs Hall still looks a bit like the inside of a hundred-year-old mansion, though it's been a little bit beat up by the passing generations of students.  The information desk, an anomaly in glass and polished steel, sits beneath a portrait of Alexander Quaverley Jacobs, facing the main entrance to the west.  To the east, wide double doors open onto Calvin Field, while arches go south and southeast to the rest of the lobby area.  Much of the north wall has been chewed through to make a connection to the newer part of Jacobs Hall."

Chapter 2 - Scenery

Some stairs to administrative offices are scenery, in the Info Desk. "Of course there are stairs here.  But since they lead up to administrative offices which are off-limits to you, there didn't seem to be any point in mentioning them."

A portrait of Alexander Quaverley Jacobs is scenery, in the Info Desk. "Old AQJ, who left his mansion to the university, stares down benevolently from his portrait.  You never cease to be amazed at his enormous sidewhiskers."

Some sidewhiskers are scenery, part of the portrait of Alexander Quaverley Jacobs. "They're called Dundrearies, though you can't see anything remotely dreary about them.  Maybe one day you'll grow something like that, if Mom doesn't attack you with sheepshearing equipment first."

An information desk is a supporter, scenery, in the Info Desk. "It's very sleek and modern-looking, which means it's oddly shaped and doesn't fit anywhere.  A never-ending supply of LEAP flyers are stacked in a corner.  Tucked away into a corner is a small saucer for loose change.  (The receptionist usually keeps this in a corner of the desk where only she can see it, but apparently it's been moved.  She's only here during the school year, anyway.)"

Rule for printing a locale paragraph about the information desk:
	now the information desk is mentioned;

A saucer is on the information desk. Some loose change is singular-named, in the saucer. The indefinite article of the loose change is "some".

After printing the name of the saucer when the saucer contains loose change:
	say " full of loose change";

Rule for deciding whether all includes the saucer: it does not;

Understand "dish" as the saucer.
Understand "few", "random", "small", "coins" as the loose change.

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

Part 3 - Lobby East

Chapter 1 - Description

First Floor Lobby East is a room, east of First Floor Lobby West, southeast of Info Desk. "This used to be a rather large dining room, once upon a time, and it still has a low-hanging chandelier right in the middle of the ceiling.  A piano's been pushed under the chandelier so that nobody accidentally gets a head full of crystal walking blindly around, and the place is generally used as a kind of music room now.  The info desk is back to the northwest, and to the west is the rest of the first floor lobby.  Wide picture windows looks out on the front lawn and on the southern part of Calvin Field."

Rule for printing the name of first floor lobby east:
	say "First Floor Lobby, East";

Chapter 2 - Scenery

A low-hanging chandelier is scenery, in first floor lobby east. "Pretty, but mostly useless.  You suspect that it's more glass than crystal these days, too: you distinctly remember someone (who certainly wasn't you, no sir!) knocking out part of it with an enthusiastic trombone slide last year, but this year there appears to be no sign of the damage."

A baby grand piano is scenery, in the first floor lobby east. "Ava says it's a baby grand, and she knows more about this sort of thing.  All grand pianos seem more or less alike to you.  The pile of plastic dinosaurs under the piano probably makes it unique, however."

Some picture windows are scenery, in the first floor lobby east. "The front lawn is littered with graffiti-covered temporary walls, but Calvin Field seems much as usual."

The School of Rock option is an option, scenery, in first floor lobby east. "It's a musical jam session.  The majority of the players are pretty good; thankfully, they drown out the ones who aren't."

Definition: a room is rocking:
	if it is the location of the school of rock option, yes;
	no;

After going to somewhere rocking during Scavenger Hunting:
	try looking;
	fire TRIG_SCHOOLOFROCK;

TRIG_SCHOOLOFROCK is a trigger.

Rule for firing unfired TRIG_SCHOOLOFROCK:
	do nothing;

Rule for firing fired TRIG_SCHOOLOFROCK:
	say "[one of]Someone takes a complicated trombone solo, and you are suddenly seized by a dizzy spell.  For a moment, everything seems to glow red and orange, and then, just as suddenly, everything snaps back to normal.[or]As you approach the musicians, you once again get that odd sense of vertigo.  The feeling passes within seconds.[stopping]";

Chapter 3 - Purple Plastic Diplodocus

Section 1 - Dinosaur Pile

Some plastic dinosaurs are a dispenser, scenery, in the first floor lobby east. "Rarrr.  They're all very lifelike, despite being small, plastic, and a variety of colours unlikely to be found in nature."
The indefinite article of the plastic dinosaurs is "a pile of".

Understand "pile", "pile of" as the plastic dinosaurs.

After taking the plastic dinosaurs:
	say "You pick out a purple diplodocus from the pile of plastic dinosaurs.";

Instead of taking the plastic dinosaurs when the prize of the plastic dinosaurs is handled:
	say "You've already taken one dinosaur from the pile.  You don't need another one.";

The plastic dinosaurs are represented by the purple diplodocus.
The plastic dinosaurs vend the purple diplodocus.

Section 2 - Dinosaur

A purple diplodocus is a thing. The description is "You can't really get more generic, as far as dinosaurs go, as a diplodocus.  Never mind that there were thousands of other species of giant lizards roaming the earth once upon a time.  The purple colour of this little plastic diplodocus is probably an example of artistic licence, however."

The purple diplodocus fulfills the dinosaur-goal.

Instead of attacking the purple diplodocus:
	say "Are you sure you want to be the cause of the extinction of the plastic diplodocus?";

Understand "generic", "little", "plastic", "dinosaur" as the purple diplodocus.

Rule for printing the name of the purple diplodocus:
	say "plastic dinosaur"

Part 4 - Second Avenue

Chapter 1 - Description

Second Avenue is a room, west of the Info Desk. "Second Avenue runs north and south along the edge of a cliff: to the west is a sharp drop down (don't even try) onto the rooftops of the buildings along First Avenue, and beyond those are the jagged ridges of the Rockies.  Jacobs Hall -- the old part, anyway -- is open to the east, and its front lawn spreads out to the southeast.  You can also go northeast, squeezing around the newer part of Jacobs Hall to the courtyard beyond.[paragraph break]Conveniently, a bus shelter with a newspaper vending machine is almost directly outside the Hall."

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

Instead of inserting the loose change into the vending machine:
	move the loose change to the saucer;
	move the newspaper to the location;
	say "You insert the appropriate change, and the glass front of the vending machine clicks open to spit the day's newspaper out at your feet.";

Instead of inserting something into the vending machine:
	say "It appears that the vending machine was not designed to accept [that or those for the noun].";

Instead of attacking the vending machine:
	say "Hooliganism is not the answer to this one.";

A newspaper is in the vending machine. The description of the newspaper is "You quickly scan the headlines.  War, pollution, corruption, crime, gas shortages... why anyone would want to start their day with such a sour note, you do not know."

Rule for printing the description of the newspaper when the newspaper is in the vending machine:
	carry out the printing the description activity with the vending machine instead;

The newspaper fulfills the newspaper-goal.

Understand "paper" as the newspaper.

Before buying the newspaper when the newspaper is in the vending machine and the player has loose change:
	try inserting the loose change into the vending machine instead;

Before buying the newspaper when the newspaper is in the vending machine and the player has the dollar notes:
	say "(with a dollar note)[command clarification break]";
	try inserting the dollar notes into the vending machine instead;

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

Calvin Field South is a room. "During the school year, this part of Calvin Field gets pretty scuffed up by students playing football or whatever inter-department sports tickle their fancy at the time.  Right now, it's getting scuffed up by people playing flag football.  The university caretakers must be wondering why they even bother to replant the grass every Spring.  The less scuffed-up part of Calvin Field is to the north, and the front lawn of Jacobs Hall is to the west."

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

A red flag is in Calvin Field South. "It's a small red flag from the flag football option."

Instead of waving the red flag:
	say "Only if you want to be dog-piled by a rabid gang of flag football players.";

Instead of burning the red flag:
	say "Even if you had a source of fire, you're not exactly the flag-burning sort.";

After dropping the red flag:
	say "It flutters to the ground.  No flag football players notice.  Thank goodness.";

The red flag fulfills the flag-goal.

Rule for printing a locale paragraph about the red flag when the red flag is not handled:
	now the red flag is mentioned;

Part 6 - Calvin Field North

Chapter 1 - Description

Calvin Field North is a room, north of Calvin Field South, east of Info Desk. "Claremont Hall, to the north, looms over the entire length of Calvin Field, which continues to the south.  Jacobs Hall is back to the west, and the dining hall is to the east.  A fountain takes up space right where all the paths meet, so there usually aren't that many people running around and tearing up the grass.  Right now, though, there are several people running around, playing Myth Tag, and there's nothing the fountain can do about it."

Rule for printing the description of the backdrop-grass when in Calvin Field North:
	say "It's green, which means it's not quite dead yet, despite the best efforts of the Myth Tag players.";

The Myth Tag option is an option, scenery, in Calvin Field North. "It's sort of like normal tag, except you can declare yourself 'safe' by crouching down and naming a mythological creature.  No repeats, though: one of the counsellors is keeping track of what's been named so far."

Claremont Hall is a university building, in Calvin Field North. "Claremont Hall looks very grand, standing on a rise at the north end of Calvin Field.  It's a red sandstone building with rounded arches and red shingles, and a huge clock tower right over the door."

A huge clock tower is scenery, part of Claremont Hall. "The Claremont Hall clock tower has never told the right time, not since it was built.  Someone told you last year that it's haunted, but that's the sort of thing people always tell kids on their first summer at camp."

A fountain is scenery, in Calvin Field North. "The fountain consists of a wide, shallow basin and a modern sculpture that, to you, looks a lot like Big Foot taking a shower.  It's not running right now."

Chapter 2 - Scenery

Part 7 - Front Lawn

Chapter 1 - Description

The Front Lawn is a room, west of Calvin Field South, southeast of Second Avenue. "A whole bunch of walls have been temporarily erected all over the front lawn for the Graffiti Art option.  The smell of paint is everywhere, not to mention the hiss of spray cans.  Passersby on Second Avenue -- to the northwest -- will no doubt find this all very interesting.  A flagpole rises up from the maze of makeshift walls here, while Calvin Field and the more athletic options are off to the east."

Chapter 2 - Scenery

Rule for printing the description of the backdrop-grass when in Front Lawn:
	say "It's green, which probably means someone with a can of green spraypaint has been colouring outside the lines."

The graffiti option is an option, scenery, in Front Lawn. "Some of it is actually pretty good.  But is it Art?"

Some cans of spray paint are scenery, in Front Lawn. "A multitude of different colors, all of it in the hands of kids with instructions to just 'go wild'.  The bathrooms are going to be pretty jammed up this evening."

A flagpole is scenery, in Front Lawn. "It's keeping the good ol' Star-spangled Banner well out of the reach of the spraypaint happy campers all around you."

Instead of climbing the flagpole:
	say "You're not that good an athlete.";

The Star-Spangled Banner is scenery, part of the flagpole. "It's not exactly the dawn's early light, but you can see it quite clearly, drifting in the wind high overhead." Understand "flag" as the Star-Spangled Banner.

The Star-Spangled Banner fulfills the flag-goal.

Part 8 - Courtyard

Chapter 1 - Description

The Courtyard is a room, northeast of Second Avenue, northwest of Calvin Field North. "The courtyard is a hard, concrete square ringed by bushes and trees.  It's not terribly interesting, but Aidan sometimes comes here to play basketball with his friends, as if the camp counselors didn't make you all run around enough already.  The other university buildings are visible beyond the treetops, and the blank north face of Jacobs Hall rises up to the south; paths southeast and southwest lead around Jacobs Hall, though there is no entrance to the building from here."

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

Some scattered eggboxes are scenery, in the Courtyard. "Those belong to the Egg Drop option, going on up on the roof of Jacobs Hall.  Some appear more effective than others."

Instead of doing something when the scattered eggboxes are physically involved:
	say "Don't interfere with someone else's scientific data.";

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

Understand "ski/skis", "snowboard/snowboards", "snow board/boards", "skate/skates", "sled/sleds", "sledge/sledges", "sleigh/sleighs" as the images of winter sports.

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

Section 2 - Hockey Sticks

The matching pair of matching hockey sticks is scenery, in the First Floor Rooms West.

Part 10 B - Aidan's Room

Aidan's Room is a dorm room. "Aidan shares this room with some guy whose name you never caught and whom you almost never see.  Aidan keeps his half of the room neat and spartan, almost as if he were expecting a military inspection at any moment.  The bedclothes look to be pulled tight enough to bounce a penny to the ceiling, and the desk is practically bare but for a few neatly regulationed necessities.  The door to the dorm corridor is back to the south."

Aidan's door is a door, scenery, closed, locked, north of First Floor Rooms West, south of Aidan's Room.

Instead of opening Aidan's Door during Scavenger Hunting:
	say "Aidan isn't in right now, and you shouldn't be poking around in his room while he's gone.  Even if he is your brother.  Especially if he's your brother.  And anyway, the door is locked.";

Part 11 - First Floor Rooms, East

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

Part 12 - Pits Stairwell

Chapter 1 - Description

The Pits Stairwell is a room, down from the First Floor Midpoint. "This is the Pits, and evidently someone thought it would be a good idea to decorate the area dedicated to housing newbies with images taken from classic horror movies.  Frankenstein's monster looms over the doorway to the south, as if standing guard outside the Pits Lobby, while werewolves and vampires romp away to the east and west.  The stairs themselves lead back upstairs to the wintery delights of the first floor."

Chapter 2 - Scenery

Section 1 - Cut out Frankenstein's Monster

Frankenstein's Monster is privately-named.

Understand "frankenstein's monster", "monster", "monsters" as Frankenstein's Monster. [but not 'frankenstein' - see below for that.]

Rule for printing the description of Frankenstein's Monster:
	say "He's holding a pouch full of scary monster cutouts.  'Go on, be an evil scientist,' he seems to be saying, 'go make more monsters.  Mwahahaha.'"

Does the player mean taking Frankenstein's Monster:
	it is likely;

Baron Frankenstein is scenery, privately-named in the Pits Stairwell. Understand "frankenstein" as Baron Frankenstein.

Before doing something when Baron Frankenstein is involved:
	[a few sanity checks because of the 9-character parsing limit!]
	unless the player's command matches the text "Frankenstein's", case insensitively:
		if the player's command matches the text "Frankenstein", case insensitively:
			say "[one of]Frankenstein was the creator, not the monster... but never mind.  [or][stopping][run paragraph on]";
	redirect the action from Baron Frankenstein to Frankenstein's Monster, and try that instead;

Section 2 - Cutout Pouch

Rule for printing the description of Frankenstein's Monster's cutout pouch:
	say "It's full of pictures calculated to keep you awake all night."

Frankenstein's Monster's cutout pouch is represented by the images of classic horror.

Section 3 - Wall cutouts

Rule for printing the description of the images of classic horror:
	say "Booga booga booga!". 

Understand "vampire/vampires", "ghoul/ghouls", "ghost/ghosts", "monstrous", "scary" as the images of classic horror.

Understand "werewolf/werewolves", "were wolf/wolves" as the images of classic horror when the player can not see the cutout werewolf.

Part 13 - Pits West

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

Part 13B - Lucian's Room

Lucian's Room is a dorm room. "It's another dorm room, not much different from your own.  Lucian's desk and bed are on one side; a CD player, playing [SONG] over and over, sits on his desk beside a couple of framed photographs."

To say SONG:
	say "[bracket]SONG[close bracket]";

Lucian's door is a door, scenery, closed, locked, north of Lucian's Room, south of Pits West.

Lucian is a man, in Lucian's Room. The description is "Lucian's a little shrimp of a newbie.  He looks rather pale and colorless, with thin white-blonde hair plastered close to his scalp.  In short, he's rather typical bully-bait."

Instead of attacking Lucian:
	say "You've never been a bully, and you're not about to start now.";

Instead of kissing Lucian:
	say "Not on your life.";

Part 14 - Pits East

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

Part 15 - Pits Lobby Central

Chapter 1 - Description

Pits Lobby Central is a room, south of Pits Stairwell. "This section of the Pits is part of the older part of Jacobs Hall, and therefore cut up into more interesting shapes.  There are a bunch of storerooms, all of them locked, and then two very large halls to the east and west.  A passage to the north leads back to the main stairwell.  Apparently there used to be another staircase here going up, but it was ripped out to give this place a little more elbow room."

Chapter 2 - Scenery

Part 16 - Pits Lobby West

Chapter 1 - Description

Pits Lobby West is a room, west of Pits Lobby Central. "This windowless area used to be a wine cellar, but today it's like something out of science-fiction.  It's being used for the Virtuality option, and there are cables and computers and virtual reality equipment all over the place.  It's a little alarming, in fact, knowing that many of these campers -- the ones wearing the goggles, anyway -- can't actually see you.  The central lobby is back to the east."

Chapter 2 - Scenery

The Virtual Reality option is an option, scenery, in Pits Lobby West. "It's really quite amazing.  You'll have to sign up the next time this becomes available."

Understand "VR" as the virtual reality option.

Some powerful computers are scenery, in Pits Lobby West. "Clearly money was not an issue when supplying the program with computers.  These are all powerful, top-of-the-line models, as they have to be to run the virtual reality software.  They're also new this year: last year's computers, though pretty good, weren't exactly NASA quality."

Understand "amazing", "cables", "equipment", "goggles", "top-of-the-line", "top of the line", "models" as the powerful computers.

Rule for printing the name of the powerful computers:
	say "computers";

Part 17 - Pits Lobby East

Chapter 1 - Description

Pits Lobby East is a room, east of Pits Lobby Central. "This part of the Pits used to be the kitchen, once upon a time.  Imagine, having the kitchen in the basement, downstairs from the dining room!  All the kitchen equipment's been removed now, though, and the place is used as a sort of recreation room.  There are several Ping Pong tables here, and a Ping Pong tournament going in full swing.  The central lobby is back to the west.[paragraph break]Ava and Stacy have both taken this option and are waiting for their turn at the ping pong tables."

Chapter 2 - Scenery

Some regulation ping pong tables are scenery, in Pits Lobby East. "Regulation ping pong tables.  You could call them table tennis tables, but that sounds a little redundant."

Understand "table", "tennis", "game" as the ping pong tables.

Before doing something when the ping pong tables are involved and TRIG_TABLETENNIS is unfired and the player's command matches the text "table tennis tables":
	fire TRIG_TABLETENNIS;

TRIG_TABLETENNIS is a trigger.

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

Ava is a woman, in the Pits Lobby East. The description of Ava is "You met Ava last year, here at LEAP.  She's a rosy-cheeked girl with long, brown pigtails; since last year, she's also acquired a pair of glasses that, she claims, make her look like a young Nana Mouskouri."

Rule for printing a locale paragraph about Ava:
	now Ava is mentioned;

Chapter 4 - Stacy

Section 1 - Description

Stacy is a woman in the Pits Lobby East. The description of Stacy is "You met Stacy last year, here at LEAP.  She's a skinny blonde girl with freckles and rather prominent front teeth.  She likes playing with gadgets, and is so full of nervous energy she could probably swallow an elephant and not gain an ounce of weight[if Stacy wears the little straw hat].  She's also wearing a neat little straw hat with a pink ribbon trailing behind[end if]."

Stacy wears a little straw hat. A pink ribbon is part of the little straw hat. The little straw hat fulfills the hat-goal.

Rule for printing a locale paragraph about Stacy:
	now Stacy is mentioned;

Section 2 - Conversation

Instead of asking Stacy about "hat":
	start conversation with Stacy on Q_STACY_0;

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

Part 18 - Your Room

Chapter 1 - Description

Your Room is a dorm room. "You share this room with first-year camper Jeremy Dolan, who hates werewolves for some inexplicable reason.  He let you put the werewolf cutout on the outside of the door only because you let him put up a vampire cutout on the inside.  Jeremy's not around right now, though, so you'll have to wait before continuing your ongoing discussion as to whether vampires or werewolves are cooller.  In the meantime, there's your bed and your desk, and the door back to the north."

Your dorm room door is a closed door, scenery, south of Pits East, north of Your Room.

Instead of going to a dorm room during Scavenger Hunting:
	say "";

Chapter 2 - Scenery

Instead of doing something when the cutout werewolf is involved and when in Your Room:
	say "[if the second noun is nothing]He[otherwise]Wolfie[end if]'s on the other side of the door.  Thinking about it now, maybe you should have let Jeremy put his vampire cutout on that side instead, and wolfie on this side.";

A cutout vampire is scenery, in Your Room. "It is a mystery to you why anyone would think these snotty, bloodless monsters are cool, except in the sense of being cold, dead bodies.  Also, this particular vampire cutout seems to have a disconcerting way of following you with his eyes, which is really creepy."

Your bed is scenery, a supporter, in Your Room. "A standard, regulation LEAP bed, with nothing under it but dust.  You've looked several times, especially in the mornings when you can't find your [one of]slippers[or]socks[or]shoes[or]keys[at random]."

Some dust is scenery, in Your Room. 

Your desk is scenery, a supporter, in Your Room. "A standard, regulation LEAP desk, with a built-in electrical outlet for your laptop if you have one.  The actual outlet is probably in some inconvenient place behind the desk, but why they couldn't just supply you with a power bar, you don't know.  Well, you suppose desks with built-in outlets are pretty cool.  Just... not as cool as werewolves."

Understand "standard", "regulation", "LEAP", "laptop" as your desk.

The built-in electrical outlet is part of your desk. Understand "electric", "power", "socket" as the built-in electrical outlet.

Part 19 - Second Floor Lobby

Chapter 1 - Description

Second Floor Lobby is a room, up from First Floor Midpoint. "Hooray for Hollywood!  The words are emblazoned right across the wall, over a cutout of Audrey Hepburn holding a pouch full of smaller cutouts of other Hollywood stars.  The glamour continues east and west, to where the younger girl campers are roomed, while the stairs go up and down.[paragraph break]A few tables have been set up here for the RPG option, and the campers involved seem thoroughly absorbed in the unfolding story."

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

The RPG option is an option, scenery, in the Second Floor Lobby. "You've not had much exposure to roleplaying games in the past, but they look quite interesting.  You'd have signed up for this option this evening if it hadn't already been filled up by the time you got to the sign-up sheets.  You'll get another chance some time later, though, never fear.  At any rate, this time round they're playing something called Seventh Sea, which seems to be all about swashbuckly goodness, arrr." 

Understand "role", "playing", "roleplaying", "role-playing", "game", "games", "gamer", "gamers", "seventh", "sea", "tables" as the RPG option.

Part 20 - Second Floor Rooms West

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

When play begins:
	now every Bond is in Second Floor Rooms West; 

Rule for printing the description of the western windows of Jacobs Hall when in Second Floor Rooms West:
	say "The view is clearly for someone else's eyes only.";

Rule for printing the description of the view of Second Avenue when in Second Floor Rooms West:
	say "The view is clearly for someone else's eyes only.";

Part 21 - Second Floor Rooms, East

Chapter 1 - Description

Second Floor Rooms East is a room, east from Second Floor Lobby, up from First Floor Rooms East. "The girls at this end of the corridor seem to prefer movie posters to cutouts of actors.  The only cutout here is a lifesize Humphrey Bogart, on the door to the fire stairs.  Opposite Bogey, to the north, is Ava and Stacy's room, while behind Bogey are stairs going up and down.  And at the end of the corridor is, of course, the window overlooking Calvin Field, and stardom continues back to the west."

Chapter 2 - Scenery

Rule for printing the description of the eastern windows of Jacobs Hall when in Second Floor Rooms East:
	say "From here, you can see people running around on Calvin Field below.  The window itself is locked, of course."

A life-size cutout of Humphrey Bogart as Sam Spade is scenery, in the Second Floor Rooms East. "Humphrey Bogart as Sam Spade in 'The Maltese Falcon': trenchcoat, fedora, world-weary expression, and a general air of noir-ness.  Apparently he's guarding the stairs."

Understand "detective", "trenchcoat", "fedora", "world-weary", "world weary", "weary", "expression", "Bogey", "Bogie", "The Maltese Falcon", "in The Maltese Falcon" as the life-size cutout of Humphrey Bogart.

Some movie posters are scenery, in the Second Floor Rooms East. "You haven't heard of half of these films.  You wouldn't watch most of the others.  The remaining few are pretty good, though: you know that those were put up by your friends Ava and Stacy, who at least have some sense in them."

Understand "films", "film", "movies" as the movie posters.

Part 21 B - Stacy & Ava's Room

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

Part 22 - Third Floor Lobby

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

Section 3 - Rap Option

The rap session option is an option, scenery, in the Third Floor Lobby. "Rap or beat poetry, there's not that much difference that you can see here.  People are basically talking about their lives in an improvised rhythmic fashion."

Instead of taking the rap session option:
	say "Maybe after your improv theatre class.";

Chapter 3 - Event on Entering

Definition: a room is rapping:
	if it is the location of the rap session option, yes;
	no;

After going to somewhere rapping during Scavenger Hunting:
	try looking;
	fire TRIG_RAPSESSION;

TRIG_RAPSESSION is a trigger.

Rule for firing unfired TRIG_RAPSESSION:
	say "As you enter the area, you experience a momentary headache and the urge to sneeze.  The feeling disappears quickly, but evidently not quickly enough because Aidan clearly seems to have noticed something wrong.  He breaks away from the rest of his option and comes up to you. [paragraph break]";
	move Aidan to the Location;
	start conversation with Aidan on Q_AIDAN_0;

Rule for firing fired TRIG_RAPSESSION:
	say "There it is, that funny throbbing feeling in the back of your head.  And there, it's gone again.";

Chapter 4 - Conversation with Aidan

Aidan is a person. The description of Aidan is "Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He's pretty cool; he just turned 15 a couple of months ago, but hasn't gotten too cool to be seen with you yet.  On the other hand, if your secret plot to grow up just like him works out, he'll never get too cool for you."

Understand "big bro/brother", "bro/brother", "taller", "broader" as Aidan.

Rule for printing a locale paragraph about Aidan:
	now Aidan is mentioned;

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

Last before firing a quip (called Q):
	unless the menu text of Q is empty:
		say the menu text of Q, paragraph break;

Part 23 - Third Floor Rooms West

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

Part 24 - Third Floor Rooms East

Chapter 1 - Description

Third Floor Rooms East is a room, east of Third Floor Lobby, up from Second Floor Rooms East. "This end of the corridor looks like the inside of a space shuttle.  Someone's gone to great care to create window-like frames for the stars and planets and whatnot; even the window overlooking Calvin Field has been made to look like a space shuttle viewport.  Outer Space is back to the west; presumably the planet Earth is down the stairs."

Chapter 2 - Scenery

Some window-like frames are scenery, in Third Floor Rooms East. "You have to wonder what the Powers That Be think of people actually applying paint to the walls.  I mean, there's a reason they provided cutouts to paste onto the walls, and that you can take off again.  Then again, well, there's no way anyone could have done all this in the short time you've been here, so quite probably it was done by the college kids during the semester and the Powers That Be decided to just go with the theme rather than call in the graffiti removal squad."

Understand "space", "shuttle", "stars", "planets", "viewport", "paint", "painted", "graffiti" as the window-like frames.

Rule for printing the description of the eastern windows of Jacobs Hall when in Third Floor Rooms East:
	say "Through the constellation of Orion, you can see Calvin Field below and the people running around on it.";

The constellation of Orion is scenery, in Third Floor Rooms East. "The mighty hunter... he's the only constellation you can recognise in the night sky."

Understand "mighty", "hunter", "star", "Orion's belt", "belt",	"Betelgeuse", "Rigel" as the constellation of Orion.

Instead of searching the constellation of Orion [> LOOK THROUGH ORION]:
	try searching the eastern windows of Jacobs Hall.

Part 25 - Rooftop

Chapter 1 - Description

The Jacobs Hall Rooftop is a room, exterior, up from the Third Floor Lobby. "The rooftop is only accessible when there's an activity or option that uses it.  Otherwise, it's off-limits, not that you can really imagine why anyone would want to come up here.  It's all black gravel and tar.  The courtyard downstairs is way more pleasant.[paragraph break]The Eggdrop option is busy tossing boxes of eggs over the parapet: a table has been set up as well, and is covered with artsy-craftsy materials with which a number of campers are building egg-preservation containers."

Rule for printing the name of Jacobs Hall Rooftop:
	say "Rooftop";

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

Understand "glue [something] to [something]" as tying it to when the player can see the large bottle of white glue.

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

TRIG_EGGDROP is a trigger.

Rule for firing unfired TRIG_EGGDROP:
	say "As you emerge into the sunlight, you feel a momentary dizziness that makes you almost want to hurl.  The feeling is gone very quickly, but your heart is left pumping as though you'd just run a couple of miles.";

Rule for firing fired TRIG_EGGDROP:
	say "There's that dizzy feeling again; this time you're ready for it.  As it fades away, you almost swear you taste something vaguely sour in the air.";

Book 2 - Lucian's Secret

Part 1 - Introduction

Lucian's Secret is a scene. Lucian's Secret begins when Scavenger Hunting ends.

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
	move the player to Your Room;
	repeat with opt running through options:
		remove opt from play;
	remove Michelle Close from play;
	move Ava to Stacy's Room;
	move Stacy to Stacy's Room;
	now Stacy's door is unlocked;
	move Aidan to Aidan's room;

Part 2 - Stacy & Ava's Room

Instead of opening Stacy's door when in Second Floor Rooms East during Lucian's Secret:
	say "You don't think either of the girls would appreciate you just barging in on them like that.";

Instead of knocking on Stacy's door when in Second Floor Rooms East during Lucian's Secret:
	now Stacy's door is open;
	say "Ava peeks out and breaks into a smile when she sees you.  'Hey, Daniel!'  She pulls you inside.  'What's up?'";
	move the player to Stacy's Room;
	start conversation with Ava on Q_STACY_AVA_0;

Chapter 2 - Conversation

Q_STACY_AVA_0 is a quip. The display text is "Stacy looks up from her desk, where a few hundred tiny electronic parts are scattered.  'We were just talking about how lately you seem distracted all the time.  Is something wrong?'[paragraph break]Ava looks a little embarrassed.  'We're just concerned.  You know.'"

Q_STACY_AVA_0A is a menu quip. The following quip is Q_STACY_AVA_1. The menu text is "'I don't know what's happening...'".
Q_STACY_AVA_0B is a menu quip. The following quip is Q_STACY_AVA_1. The menu text is "'Well, I'm getting these headaches...'".
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

Instead of going from Stacy's Room when the current conversationalist is Ava:
	placeholder "The player shouldn't be able to leave until this conversation is over.";

Part 3 - Trailing Lucian

Trailing Lucian is a scene. Trailing Lucian begins when Q_STACY_AVA_10 is fired. Trailing Lucian ends when the location is Lucian's room.

The lachrymose trail is an emotional residue. The lachrymose trail taints Pits West, Pits Stairwell, the First Floor Midpoint, and the Info Desk. The description of the lachrymose trail is "There is a sour, vaguely nauseating taste in the air. "

When Trailing Lucian begins:
	now the player can sense the lachrymose trail;
	add GOAL_FOCUS to the current goals, if absent;

GOAL_FOCUS is a goal. The printed name is "investigate odd sensations".

A goal-scoring rule for GOAL_FOCUS:
	if we have focussed on the lachrymose trail:
		goal achieved;

After printing the description of the lachrymose trail during Trailing Lucian:
	fire TRIG_FOCUS_HINT;

TRIG_FOCUS_HINT is a trigger. TRIG_FOCUS_HINT can be relevant. TRIG_FOCUS_HINT is relevant.

Rule for firing relevant TRIG_FOCUS_HINT:
	say paragraph break;
	say "'Daniel,' says Ava, 'Daniel, you're getting that funny look again.  Is whatever-it-is somewhere around here?'[paragraph break]'Try to focus,' says Stacy. ";

A focussing rule for the lachrymose trail when in Info Desk:
	say "Concentrating on the flavour, you sense an undercurrent of something salty as well, like tears.  You can also tell that this is all definitely part of a trail of some sort, going off to the east and the north.";

A focussing rule for the lachrymose trail when in First Floor Midpoint:
	say "Concentrating on the flavour, you sense an undercurrent of salt tears.  Both sour and salt seem to form a line between the Info Desk and the stairs going down."

A focussing rule for the lachrymose trail when in Pits Stairwell:
	say "Concentrating on the flavour, you sense an undercurrent of salt tears.  Both sour and salt seem to trail off to the west and to the stairs going up."

A focussing rule for the lachrymose trail when in Pits West:
	say "Concentrating on the flavour, you sense an undercurrent of salt tears.  They trail off to the east, but seem strongest around one of the doors to the south.";

Last focussing rule for the lachrymose trail:
	fire TRIG_TRAIL;

TRIG_TRAIL is a trigger.

Rule for firing unfired TRIG_TRAIL when in Info Desk:
	say "[paragraph break]'It's a trail,' you say.  'It runs off that way, outside, and that way, back to the dorms.'[paragraph break]'Well,' says Stacy, 'we can't very well leave the building at this time of the night.  We'd best investigate the other direction.'";

Rule for firing unfired TRIG_TRAIL when in First Floor Midpoint:
	say "[paragraph break]'It's a trail,' you say.  'It goes down the stairs and back to the Info Desk.'[paragraph break]'I know we said we'd go look around the Info Desk,' says Stacy, 'but if this is a trail of some sort, I wonder where it leads.'[paragraph break]Ava shrugs.  'Up to you, Daniel.  Off to the Info Desk, or down the stairs?'";

Rule for firing unfired TRIG_TRAIL when in Pits Stairwell:
	say "[paragraph break]'It's a trail,' you say.  'It goes up the stairs and that way down the hall.'[paragraph break]'I know we said we'd go look around the Info Desk,' says Stacy, 'but if this is a trail of some sort, I wonder where it leads.'[paragraph break]'I'm guessing the trail up the stairs goes back to the Info Desk.'  Ava shrugs.  'Up to you, Daniel.  Off to the Info Desk, or do we see what's at the end of the hall?'";

Rule for firing TRIG_TRAIL when in Pits West:
	say "[paragraph break]'Whatever it is, it's strongest around that door.'[paragraph break]Ava and Stacy exchange glances, and before you can stop her, Stacy is knocking on the door.  'We've come this far.  I want to know what's at the end of --'[paragraph break]Stacy quickly shuts up when the door opens a crack, and a rather timid little guy peeks out at you.  He fairly reeks of that mysterious sour-salty air.  And now you think you can hear some sort of twittering in the background, too[if the eggdrop-option has been apparent].  It occurs to you that you remember seeing him up at the egg-drop option yesterday, though he certainly wasn't giving off this... whatever it is... back then[end if].[paragraph break]'Hi,' says Ava, who seems to recognise the guy.  'Lucian, isn't it?  We met yesterday at the sign-ups.  Anyway, these are my friends Daniel and Stacy.  May we come in for a moment?'[paragraph break]Lucian lets the door swing half-open and sighs resignedly.  'Sure, if you want,' he says, retreating back into the room.  The three of you follow him inside.";
	now Lucian's Door is open;
	move the player to Lucian's Room;

Part 4 - Conversation with Lucian

Chatting to Lucian is a scene. Chatting to Lucian begins when Trailing Lucian ends. Chatting to Lucian ends when SE_LUCIAN_1 is fired.

When Chatting to Lucian ends:
	now the lachrymose trail taints nothing;
	now the player can not sense the lachrymose trail;
	now the player can sense nothing;

Chapter 1 - Conversation Table

Rule for choosing the conversation table of Lucian during Lucian's Secret:
	change the chosen conversation table to the Table of Lucian's conversation

Table of Lucian's conversation
conversation			available		topic
Q_LUCIAN_FAMILY		true		"himself" or "his family/father/mother" or "family/father/mother"
Q_LUCIAN_SONG		true		"CD" or "song" or "music" or "record" or "compact" or "disc"
Q_LUCIAN_PHOTOS		true		"framed" or "photos" or "photographs"
Q_LUCIAN_EGGDROP		true		"eggdrop" or "egg drop" or "egg-drop" or "option" or "options"
Q_LUCIAN_LEAP		true		"LEAP" or "camp" or "school" or "here" or "dorm" or "room" or "his dorm/room"
Q_LUCIAN_BULLIES		false		"bullies"
Q_LUCIAN_GRANDMOTHER	false		"grandmother" or "gran" or "granny" or "grannie" or "grandma" or "granma" or "gramps" or "grandparent" or "grandparents" or "old lady"
Q_LUCIAN_PETER		false		"peter" or "school" or "teacher" or "class" or "class photo"
Q_LUCIAN_EARTH_CRYSTAL	false		"earth crystal" or "crystal"

Rule for choosing the conversation topic for Lucian:
	repeat through the chosen conversation table:
		if the topic understood includes topic entry:
			if the available entry is true:
				if there is a conversation entry:
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
Q_LUCIAN_1B is a menu quip. The following quip is Q_LUCIAN_3. The menu text is "'It's a nice song...'" 

Q_LUCIAN_2 is a quip. The display text is "'I don't know anybody here and I'm all alone.  Why shouldn't I be unhappy?  Let's talk about something else.'"

Q_LUCIAN_3 is a quip. The display text is "'It was my grandmother's favourite song.  She used to sing it to me when I was little.'  Lucian's glance strays to one of the photographs on his desk, of an old lady in her garden."

After firing Q_LUCIAN_3:
	choose a row with a conversation of Q_LUCIAN_GRANDMOTHER in the table of Lucian's conversation;
	change the available entry to true;

The response of Q_LUCIAN_SONG is { Q_LUCIAN_1A, Q_LUCIAN_1B }.

Section 2 - Photos

Q_LUCIAN_PHOTOS is a quip. The display text is "You look at the two photographs.  There's one of a little old lady in a garden.  The other is a class photograph.";

After firing Q_LUCIAN_PHOTOS:
	choose a row with a conversation of Q_LUCIAN_GRANDMOTHER in the table of Lucian's conversation;
	change the available entry to true;
	choose a row with a conversation of Q_LUCIAN_PETER in the table of Lucian's conversation;
	change the available entry to true;

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
	choose a row with a conversation of Q_LUCIAN_BULLIES in the table of Lucian's conversation;
	change the available entry to true;
	choose a row with a conversation of Q_LUCIAN_PETER in the table of Lucian's conversation;
	change the available entry to true;

Q_LUCIAN_6A is a menu quip. The following quip is Q_LUCIAN_8. The menu text is "'Who's Peter?'". 
Q_LUCIAN_6B is a menu quip. The following quip is Q_LUCIAN_9. The menu text is "'Bullies?  Has someone here been giving you a hard time?'".

Q_LUCIAN_7 is a quip. The display text is "Lucian shrugs.  'Yeah, whatever.'"

Q_LUCIAN_8 is a transitional quip. The following quip is Q_LUCIAN_PETER.

Q_LUCIAN_9 is a quip. The display text is "Lucian looks annoyed.  'Yeah.  You.  Why don't you leave me alone?'[paragraph break]'We're just trying to help, Lucian,' says Ava gently.[paragraph break]Stacy, meanwhile, looks like she's losing patience.  'You know, if you don't you tell us what's upsetting you, we can't help you.  So why don't you just spit it out and get it over with?'"

Section 4 - LEAP

Q_LUCIAN_LEAP is a quip. The display text is "'It's just school pretending to be camp, isn't it?  I suppose it's more interesting than normal school, but I think I'd rather be home for the summer.  I don't have to worry about bullies when I'm at home.'".

Q_LUCIAN_LEAPA is a quip. The menu text is "'Bullies?  Has someone here been giving you a hard time?'"
Q_LUCIAN_LEAPB is a quip. The menu text is "'Aren't you having fun, then?'"

Rule for firing Q_LUCIAN_LEAPA:
	fire Q_LUCIAN_9;

Rule for firing Q_LUCIAN_LEAPB:
	fire Q_LUCIAN_6;

Section 5 - Bullies

Q_LUCIAN_BULLIES is a quip.

Rule for firing Q_LUCIAN_BULLIES:
	if Q_LUCIAN_11 is unfired:
		fire Q_LUCIAN_10 instead; [10 -> 11]
	otherwise:
		say "'I don't want to talk about that any more.'";

Section 5 - Grandmother

Q_LUCIAN_GRANDMOTHER is a quip. The display text is "'Yeah.  She died.'  The sour taste in the air is almost overwhelmed by a different, marshy sort of smell, yet you somehow know that the two sensations are somehow related.  Ava is instantly consoling Lucian, and finding all the right words that you can't think of.[paragraph break]'Was she a gardener?' asks Ava.  'That's a beautiful garden she's in.'[paragraph break]'Yeah, yeah she was.  She was an environmentalist.  That's why she....'  Lucian stops.  'Never mind.'".

Q_LUCIAN_GRANDMOTHER_A is a menu quip. The following quip is Q_LUCIAN_10. The menu text is "'Why what?'".

The response of Q_LUCIAN_GRANDMOTHER is { Q_LUCIAN_GRANDMOTHER_A }.

Q_LUCIAN_10 is a transitional quip. The following quip is Q_LUCIAN_11. The display text is "Lucian shakes his head.  Stacy looks a little annoyed and says, 'you know, if you don't tell us what's upsetting you, we can't help you.  So why don't you just spit it out and get it over with?'"

Q_LUCIAN_11 is a quip. The display text is "Lucian looks a little angry and says, 'stop picking on me!  You're just like those bullies at dinner!  They made me give them my grandmother's earth crystal and I bet you want me to pay some sort of fine for being a loser.  Well I've had it.  Just go away and leave me alone!'"

After firing Q_LUCIAN_11:
	choose a row with a conversation of Q_LUCIAN_BULLIES in the table of Lucian's conversation;
	change the available entry to true;
	choose a row with a conversation of Q_LUCIAN_EARTH_CRYSTAL in the table of Lucian's conversation;
	change the available entry to true;

Section 6 - Peter

Q_LUCIAN_PETER is a quip. The display text is "Lucian picks up the class photo.  'That's Peter,' he says, pointing to the teacher smiling up from one side of the group.  For a moment, the sour taste in the air disappears.  'He lets us call him by his first name, and he's the most awesome teacher ever.'  Then Lucian looks sad again.  'He's the one who said I was smart enough to come here, and he went and pulled all sorts of strings.  I should be grateful, I suppose.'".

Q_LUCIAN_PETER_A is a menu quip. The following quip is Q_LUCIAN_2. The menu text is "'But you're not?  Why?'".

Section 7 - Earth Crystal

Q_LUCIAN_EARTH_CRYSTAL is a quip.

Rule for firing Q_LUCIAN_EARTH_CRYSTAL:
	say "'It's a crystal cube with a 3-D image of the earth etched inside it.  My grandmother gave it to me just before she died, so it means a lot to me.  Those bullies didn't care, though, they just took it.  I don't know how to get it back, I mean, I don't want to go crying to the camp counselors like a little crybaby.'  Lucian sniffles and wipes his sleeve across his nose, then reaches over to the CD player to turn the volume up.";
	if Q_LUCIAN_SONG is unfired:
		say "'Isn't it loud enough for you already?' asks Stacy pointedly.  'It's not even a very good song!  Ava says it makes her sick.'[paragraph break]Ava turns bright red.  'Only because I had to sing it in my voice lessons over and over again,' she says quickly.";

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

Crystal quest is a scene. Crystal quest begins when Chatting to Lucian ends. 

Instead of focussing on a room during Crystal Quest:
	say "Now that you think about it, there are so many alien sensations swirling around, most of them so faint you're not sure if you're just imagining them.  You really don't know which sensation you really want.";

Before focussing on Info Desk during Crystal Quest:
	now the player can sense the oily trail;
	redirect the action from the Info Desk to the oily trail, and try that instead;

The oily trail is an emotional residue. The oily trail taints Info Desk, First Floor Midpoint, First Floor Rooms East. The description of the oily trail is "Some sort of oily, burnt stench seems to coil about your legs here, and you think you can hear some sort of low-pitched chatter."

Understand "burnt", "stench", "engine oil", "oil", "monkey's chatter", "chatter", "path" as the oily trail.

A focussing rule for the oily trail when in Info Desk:
	say "[one of]You close your eyes and stand near the door to Calvin Field.  You know Lucian's trail begins just outside this door.  Concentrating on the area in question, you[or]You[stopping] sense the beginning of another trail, one that smells of burnt engine oil and sounds like a monkey's chatter dropped several octaves and sped up.  It traces the same path back towards the dorms to the north.";

A focussing rule for the oily trail when in First Floor Midpoint:
	say "That unpleasant smell, and its accompanying sound, seems to trace a path from the Info Desk to the eastern end of the hallway.";

A focussing rule for the oily trail when in First Floor Rooms East:
	say "You can trace that unpleasant smell, and its accompanying sound, to one of the rooms to the south.  The door is open on an already messy room, and with a shock you realise that you are not sensing that burnt-oil smell with your nose at all: it's just registering in your mind as a smell.  Same goes for the sound of low-pitched chattering.";

Book W - Walkthrough

Test hunt with "e/get dinosaur/nw/get change/n/u/u/u/get feather/get cloth/get stick/glue cloth to stick/d/get cutout/d/d/s/w/put change in machine/get paper/ne/get grass/se/w/s/fold paper".

