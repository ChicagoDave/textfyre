"A Gift of Empathy" by Textfyre

[
Include (- Constant DEBUG; -) after "Definitions.i6t".
]

[  Change Log
When		Who		What
14-Jul-2009	G. Jefferis	Start Project
]

Use no scoring, American dialect and full-length room descriptions.
The story creation year is 2009.

Include FyreVM Support by Textfyre.
Include Punctuation Removal by Emily Short.
Include Basic Screen Effects by Emily Short.

Include Textfyre Standard Rules by Textfyre.
Include Textfyre Standard Backdrops by Textfyre.

Include Test Suite by Textfyre.
Include Parse List by Textfyre.

Book - Initialisation

Part 0 - Beating memory constraints

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

Part 2 - The player

Chapter 1 - Description

[...]

Chapter 2 - Belongings

The player carries the list of items for the scavenger hunt.

A list of items for the Scavenger Hunt is a thing. The description is "A newspaper[line break]A feather[line break]A flag[line break]A star[line break]A dinosaur[line break]A hat[line break]Something that was once alive"

Rule for printing the description of the list of items for the Scavenger Hunt:
	repeat with particular goal running through scavenger hunt goals:
		say "[A particular goal][if the particular goal is achieved] ([the list of things that achieve the particular goal])[end if][line break]";

The player carries some dollar notes. The indefinite article of the dollar notes is "a few".

Part 3 - Introduction

The time of day is 7:05 PM.

When play begins:
	say "It's your second year at the LEAP summer camp, and so far it's been as great as you remember last year to have been.  Ava Winters and Stacy Alexander, whom you met last year (and whom your brother Aidan calls 'your girlfriends', much to your embarrassment) are here again.  You spent yesterday catching up on the news in between options and classes, and now you're settling in with the smug sensation of not being a raw newbie any more.[paragraph break]The LEAP summer camp isn't quite the same as most summer camps.  LEAP is an acronym for 'Learning Enrichment Activity Programme'; the brainchild of world-renowned educator Professor Damon Rose, it is housed on the campus of the University of Colorado at Valmont, and was created for Gifted and Talented Kids (gosh, that sounds impressive) to expand their horizons and encourage them to stretch their mental capabilities.[paragraph break]Whatever. That's all in the promotional flyers. You just know that you're in for two weeks of the sort of interesting classes you don't get in school, and a bunch of fun options with which to fill up the free time after classes.  This evening, for instance, you've signed up for a scavenger hunt...";
	pause the game;
	say "LEAP, Day 2.  Evening.[paragraph break]'Okay, kids!' Michelle, the counselor in charge of the scavenger hunt option waves her hands to settle the crowd around you, before finally remembering her whistle.  A brief [i]fweep[r] sweeps through the room.  'Okay, does everyone have their list?  Everyone good?  Okay!  You have until 8:25 pm to find everything on your lists, return here, and show me your lists so I can check them.  So synchronise your watches ... are we all in sync?  Good!  Your time starts ... now!'[paragraph break]Michelle's whistle gives another sharp fweep, and the room practically empties as everyone else runs off to begin their hunt.";

Book - Definitions

Part 1 - Scavenger Hunt

Scavenger Hunting is a scene. Scavenger Hunting begins when play begins.
Scavenger Hunting ends naturally when the time of day is 8:25 PM.
[ Scavenger Hunt ends in victory when all scavenger hunt goals have been uniquely achieved. ]

At the time when Scavenger Hunting ends naturally:
	move the player to First Floor Lobby West;

A scavenger hunt goal is a kind of thing. Some scavenger hunt goals are defined by the table of scavenger-hunt-goals.

Table of scavenger-hunt-goals
scavenger hunt goal	printed name
the newspaper goal	"newspaper"
the feather goal		"feather"
the flag goal		"flag"
the star goal		"star"
the dinosaur goal		"dinosaur"
the hat goal		"hat"
the life goal		"Something"

The life goal is proper-named.

After printing the name of the life goal:
	say " that was once alive";

Definition: A scavenger hunt goal is achieved:
	decide on whether or not the player has something that fulfills it;

After taking something that fulfills a scavenger hunt goal during Scavenger Hunting:
	abide by the scavenging rules for the noun;

The scavenging rules are an object-based rulebook.

A scavenging rule for the blades of grass:
	say "They were once alive, weren't they? You tick that off the list." instead;

A scavenging rule for something (called X) that fulfills exactly one scavenger hunt goal:
	say "[A list of scavenger hunt goals fulfilled by X] is on the list." in sentence case, paragraph break;

A scavenging rule for something (called X) that fulfills more than one scavenger hunt goal:
	say "[A list of scavenger hunt goals fulfilled by X] are on the list." in sentence case, paragraph break;

Fulfillment relates various things to various scavenger hunt goals.

The verb to be fulfilled by implies the reversed fulfillment relation.
The verb to fulfill (he fulfills, they fulfill) implies the fulfillment relation.

Achievement relates a thing (called X) to a scavenger hunt goal (called Y) when Y is achieved and X fulfills Y.

The verb to be achieved by implies the reversed achievement relation.
The verb to achieve (it achieves, they achieve) implies the achievement relation.

Book 1 - Jacobs Hall

Part 1 - Lobby West

Chapter 1 - Description

First Floor Lobby West is a room. "This used to be the living room, back when [one of]Alexander Quaverley Jacobs, the eccentric old coot who donated this place to the university[or]old AQJ[stopping] was still alive and the university was just starting up.  It's got a huge fireplace, and a big bay window looking out onto the front lawn.  It's also been painted completely white from floor to ceiling, so thickly that you're not sure if some of the molding is not actually just bubbles under the paint.  The info desk is back through the arch to the north, and the lobby continues, through another arch, to the west.[paragraph break]A large brass plaque has been fixed into the space over the fireplace."

Rule for printing the name of first floor lobby west:
	say "First Floor Lobby, West";

Chapter 2 - Scenery

A painted fireplace is scenery, in the First Floor Lobby West. "No-one uses it any more, of course, but it still looks nice.  Even with all that white paint slathered all over it."

The white paint is a backdrop, in the First Floor Lobby West. "It was the fashion, back in the 1950s, to try to make a place look more modern by painting it white.  It's not the 1950s anymore, but apparently nobody ever told the custodians that." Understand "50s", "fifties", "1950s", "nineteen-fifties", "nineteen fifties" as the white paint.

A bay window is scenery, in the First Floor Lobby West. "Normally you can see all of the front lawn spread out from here, but right now there've been temporary walls set up all over the lawn."

The elaborate wood molding is scenery, in the First Floor Lobby West. "It's pretty elaborate, and almost makes you dizzy as you follow the pattern across the -- oh wait, those are just air bubbles under the paint."

Some air bubbles are scenery, in the First Floor Lobby West. "They're annoyingly random.  You don't know why the original painters couldn't have taken the trouble to -- oh wait, that's actually an elaborate wood molding."

A plaque shaped like a shield is scenery, in the First Floor Lobby West. "It's shaped like a shield, and commemorates the memory of Damon Rose, one of the founders of LEAP.  You remember him quite well from last year.  It was quite a shock to hear about the accident, and there was some question as to whether LEAP could go on without him.  His sister, Claudia Rose, is in charge of LEAP now, and making sure that the good work goes on.  She seems like a nice lady, but she's just not quite as present as old Damon Rose used to be."

Part 2 - Info Desk

Chapter 1 - Description

Info Desk is a room, north of First Floor Lobby West. "The main foyer of Jacobs Hall still looks a bit like the inside of a hundred-year-old mansion, though it's been a little bit beat up by the passing generations of students.  The information desk, an anomaly in glass and polished steel, sits beneath a portrait of Alexander Quaverley Jacobs, facing the main entrance to the west.  To the east, wide double doors open onto Calvin Field, while arches go south and southeast to the rest of the lobby area.  Much of the north wall has been chewed through to make a connection to the newer part of Jacobs Hall."

Chapter 2 - Scenery

Some stairs to administrative offices are scenery, in the Info Desk. "Of course there are stairs here.  But since they lead up to administrative offices which are off-limits to you, there didn't seem to be any point in mentioning them."

A portrait of Alexander Quaverley Jacobs is scenery, in the Info Desk. "Old AQJ, who left his mansion to the university, stares down benevolently from his portrait.  You never cease to be amazed at his enormous sidewhiskers."

Some sidewhiskers are scenery, part of the portrait of Alexander Quaverley Jacobs. "They're called Dundrearies, though you can't see anything remotely dreary about them.  Maybe one day you'll grow something like that, if Mom doesn't attack you with sheepshearing equipment first."

An information desk is a supporter, scenery, in the Info Desk. "It's very sleek and modern-looking, which means it's oddly shaped and doesn't fit anywhere.  A never-ending supply of LEAP flyers are stacked in a corner."

Part 3 - Lobby East

Chapter 1 - Description

First Floor Lobby East is a room, east of First Floor Lobby West, southeast of Info Desk. "This used to be a rather large dining room, once upon a time, and it still has a low-hanging chandelier right in the middle of the ceiling.  A piano's been pushed under the chandelier so that nobody accidentally gets a head full of crystal walking blindly around, and the place is generally used as a kind of music room now.  The info desk is back to the northwest, and to the west is the rest of the first floor lobby.  Wide picture windows looks out on the front lawn and on the southern part of Calvin Field."

Rule for printing the name of first floor lobby east:
	say "First Floor Lobby, East";

Chapter 2 - Scenery

A low-hanging chandelier is scenery, in first floor lobby east. "Pretty, but mostly useless.  You suspect that it's more glass than crystal these days, too: you distinctly remember someone (who certainly wasn't you, no sir!) knocking out part of it with an enthusiastic trombone slide last year, but this year there appears to be no sign of the damage."

A baby grand piano is scenery, in the first floor lobby east. "Ava says it's a baby grand, and she knows more about this sort of thing.  All grand pianos seem more or less alike to you.  The pile of plastic dinosaurs under the piano probably makes it unique, however."

Some plastic dinosaurs are scenery, in the first floor lobby east. "Rarrr.  They're all very lifelike, despite being small, plastic, and a variety of colours unlikely to be found in nature."
The indefinite article of the plastic dinosaurs is "a pile of".

[ >Take dinosaur
[First time:] You pick out a purple diplodocus from the pile of plastic dinosaurs.
[Afterwards:] You've already taken one dinosaur from the pile.  You don't need another one. ]

Some picture windows are scenery, in the first floor lobby east. "The front lawn is littered with graffiti-covered temporary walls, but Calvin Field seems much as usual."

The School of Rock option is scenery, in first floor lobby east. "It's a musical jam session.  The majority of the players are pretty good; thankfully, they drown out the ones who aren't."

Instead of taking the school of rock option:
	say "Maybe tomorrow.";

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

A newspaper vending machine is scenery, in Second Avenue. "Insert the appropriate change, get your daily dose of gloom and doom."

[>Put small change in vending machine
You insert the appropriate change, and the glass front of the vending machine clicks open to spit the day's newspaper out at your feet.]

Instead of inserting something into the newspaper vending machine:
	say "It appears that the vending machine was not designed to accept that.";

Instead of attacking the newspaper vending machine:
	say "Hooliganism is not the answer to this one.";

Part 5 - Calvin Field South

Chapter 1 - Description

Calvin Field South is a room. "During the school year, this part of Calvin Field gets pretty scuffed up by students playing football or whatever inter-department sports tickle their fancy at the time.  Right now, it's getting scuffed up by people playing flag football.  The university caretakers must be wondering why they even bother to replant the grass every Spring.  The less scuffed-up part of Calvin Field is to the north, and the front lawn of Jacobs Hall is to the west."

Calvin Field Region is a region. Calvin Field North and Calvin Field South are in Calvin Field Region.

Chapter 2 - Scenery

Some backdrop-grass is a backdrop, privately-named, in Calvin Field South, Calvin Field North, the Front Lawn. The printed name of the backdrop-grass is "grass".

Understand "grass" as the backdrop-grass.

Rule for printing the description of the backdrop-grass when in Calvin Field South:
	say "It's green, which means it's not quite dead yet, despite the best efforts of the football players.";

Instead of taking the backdrop-grass:
	say "You pluck a few [if the player had the blades of grass]more [end if]blades of grass from the ground.";
	move the blades of grass to the location;
	try taking the blades of grass instead;

Some blades of grass are a thing. The description is "They're green, at least for now." The indefinite article of the blades of grass is "a few".

The blades of grass fulfill the life goal.

The Flag Football option is scenery, in Calvin Field South. "Football, in whatever form, is really more Aidan's thing than yours.  He's not taking the option today, though."

Part 6 - Calvin Field North

Chapter 1 - Description

Calvin Field North is a room, north of Calvin Field South, east of Info Desk. "Claremont Hall, to the north, looms over the entire length of Calvin Field, which continues to the south.  Jacobs Hall is back to the west, and the dining hall is to the east.  A fountain takes up space right where all the paths meet, so there usually aren't that many people running around and tearing up the grass.  Right now, though, there are several people running around, playing Myth Tag, and there's nothing the fountain can do about it."

Rule for printing the description of the backdrop-grass when in Calvin Field North:
	say "It's green, which means it's not quite dead yet, despite the best efforts of the Myth Tag players.";

The Myth Tag option is scenery, in Calvin Field North. "It's sort of like normal tag, except you can declare yourself 'safe' by crouching down and naming a mythological creature.  No repeats, though: one of the counsellors is keeping track of what's been named so far."

Claremont Hall is a university building, in Calvin Field North. "Claremont Hall looks very grand, standing on a rise at the north end of Calvin Field.  It's a red sandstone building with rounded arches and red shingles, and a huge clock tower right over the door."

A huge clock tower is scenery, part of Claremont Hall. "The Claremont Hall clock tower has never told the right time, not since it was built.  Someone told you last year that it's haunted, but that's the sort of thing people always tell kids on their first summer at camp."

A fountain is scenery, in Calvin Field North. "The fountain consists of a wide, shallow basin and a modern sculpture that, to you, looks a lot like Big Foot taking a shower.  It's not running right now."

Chapter 2 - Scenery

Part 7 - Front Lawn

Chapter 1 - Description

The Front Lawn is a room, west of Calvin Field South, southwest of Second Avenue. "A whole bunch of walls have been temporarily erected all over the front lawn for the Graffiti Art option.  The smell of paint is everywhere, not to mention the hiss of spray cans.  Passersby on Second Avenue -- to the northwest -- will no doubt find this all very interesting.  A flagpole rises up from the maze of makeshift walls here, while Calvin Field and the more athletic options are off to the east."

Chapter 2 - Scenery

Rule for printing the description of the backdrop-grass when in Front Lawn:
	say "It's green, which probably means someone with a can of green spraypaint has been colouring outside the lines."

The graffiti option is scenery, in Front Lawn. "Some of it is actually pretty good.  But is it Art?"

Some cans of spray paint are scenery, in Front Lawn. "A multitude of different colors, all of it in the hands of kids with instructions to just 'go wild'.  The bathrooms are going to be pretty jammed up this evening."

A flagpole is scenery, in Front Lawn. "It's keeping the good ol' Star-spangled Banner well out of the reach of the spraypaint happy campers all around you."

Instead of climbing the flagpole:
	say "You're not that good an athlete.";

The Star-Spangled Banner is scenery, part of the flagpole. "It's not exactly the dawn's early light, but you can see it quite clearly, drifting in the wind high overhead." Understand "flag" as the Star-Spangled Banner.

The Star-Spangled Banner fulfills the flag goal.

Part 8 - Courtyard

Chapter 1 - Description

The Courtyard is a room, northeast of Second Avenue, northwest of Calvin Field North. "The courtyard is a hard, concrete square ringed by bushes and trees.  It's not terribly interesting, but Aidan sometimes comes here to play basketball with his friends, as if the camp counselors didn't make you all run around enough already.  The other university buildings are visible beyond the treetops, and the blank north face of Jacobs Hall rises up to the south; paths southeast and southwest lead around Jacobs Hall, though there is no entrance to the building from here."

Chapter 2 - Scenery

Some prickly plantlife is scenery, in the Courtyard. "The plantlife around here seems quite peaceful and idyllic.  Also, prickly."

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
	say "[one of]A box-like object crashes into the concrete close to the wall of Jacobs Hall.  Raw egg comes splattering out of its side, accompanied by loud groans from above.[or]A box-like object crashes into the concrete close to the wall of Jacobs Hall, and lies still.[or] Something falls onto the concrete, bounces twice, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.  Egg yolk drips from a seam.[or]Someone runs into the courtyard from around the corner, gathers up the various boxes and containers, and runs off again.[or][eggdrop-continuation][stopping]"

To say eggdrop-continuation:
	say "[one of]A box-like object crashes into the concrete close to the wall of Jacobs Hall.  Raw egg comes splattering out of its side, accompanied by loud groans from above.[or]A box-like object crashes into the concrete close to the wall of Jacobs Hall, and lies still.[or] Something falls onto the concrete, bounces twice, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.  Egg yolk drips from a seam.[or]Someone runs into the courtyard from around the corner, gathers up the various boxes and containers, and runs off again.[at random]";

Part 9 - First Floor Midpoint

The West End of Jacobs Hall is a region. First Floor Rooms West, Second Floor Rooms West, Third Floor Rooms West, Pits West are in the West End of Jacobs Hall.  

The East End of Jacobs Hall is a region. First Floor Rooms East, Second Floor Rooms East, Third Floor Rooms East, Pits East are in the East End of Jacobs Hall.  

Chapter 1 - Description

First Floor Midpoint is a room, north of the Info Desk. "The first floor is where the older boys, including your brother Aidan, are housed.  The walls are plastered with images of winter sports, which makes perfect sense given that it's the middle of summer.  Between the skiers and the snowboarders, the hallway continues east and west, while the main stairs go up to the girls['] dorms and down to the younger boys['] dorms; and of course there's the info desk back to the south.  A friendly-looking cardboard cutout of Olympic ski champion Stephan Eberharter holds a pouch full of cutouts of all things winter-sporty, practically begging you to stick more of them up on the walls."

Chapter 2 - Scenery

Section 1 - Cut out Stephan Eberharter

A cardboard cutout of Olympic ski champion Stephan Eberharter is scenery, privately-named, in the First Floor Midpoint. "He's been glued to the wall, no doubt because this particular junction sees a lot more traffic than most."

Understand "olympic", "ski champ", "ski champion", "skiing", "champion", "stephan", "eberharter" as Olympic ski champion Stephan Eberharter.

Understand "cardboard", "card", "board", "card board", "cut out", "cut outs", "cutout", "cutouts" as "[cutouts]".

Understand "[cutouts]" as the cardboard cutout of Olympic ski champion Stephan Eberharter.

Instead of taking the cardboard cutout of Olympic ski champion Stephan Eberharter:
	try examining the cardboard cutout of Olympic ski champion Stephan Eberharter;

Does the player mean taking the cardboard cutout of Olympic ski champion Stephan Eberharter:
	it is likely;

Section 2 - Cutout Pouch

A cutout pouch is a kind of container.

Representation relates one thing to another.
The verb to represent (it represents, they represent) implies the representation relation.

Understand "pouch" as a cutout pouch.

Understand "pouch of", "[something related by representation]" as a cutout pouch when the player's command matches the text "pouch", case insensitively.

A pouch of winter-sports-themed cutouts is a cutout pouch, privately-named, scenery, in the First Floor Midpoint. "It's full of cutouts of snowboards, skis, hockey sticks, skates, sleds and other things that make you want to put on your scarf and your warm, woolly mittens."

The pouch of winter-sports-themed cutouts represents the images of winter sports.

Section 3 - Wall cutouts

Some images of winter sports are a backdrop, in the First Floor Midpoint, First Floor Rooms West, First Floor Rooms East. "You see far too many of those here.". The printed name of the images of winter sports are "cutouts".

Understand "ski/skis", "snowboard/snowboards", "snow board/boards", "hockey stick/sticks", "skate", "skate/skates", "sled/sleds", "sledge/sledges", "[cutouts]" as the images of winter sports.

Part 10 - First Floor Rooms, West

Chapter 1 - Description

First Floor Rooms West is a room, west of the First Floor Midpoint. "You're at the west end of the first floor dorm area.  The winter sports theme continues on in spite of the summer sunshine streaming in through the window.  Aidan's room is to the north, flanked by a pair of matching hockey sticks, and you could take the fire stairs up or down."

Chapter 2 - Scenery

The windows of Jacobs Hall are a kind of backdrop. The windows of Jacobs Hall are privately-named. The printed name of the windows of Jacobs Hall is usually "window". Understand "locked", "sealed", "window" as windows of Jacobs Hall.

The western windows of Jacobs Hall are windows of Jacobs Hall, privately-named, in the West End of Jacobs Hall. 

A view of Second Avenue is a backdrop, in the West End of Jacobs Hall.

Rule for printing the description of the western windows of Jacobs Hall when in the First Floor Rooms West:
	say "It's locked, and sealed with a cutouts of cross-country skiers.  Through it, you can see Second Avenue.";

Rule for printing the description of the view of Second Avenue when in the First Floor Rooms West:
	say "There's not much traffic, this time of the day, and you find yourself wondering what it would be like to snowshoe from one end to the other.  In winter, of course.  Not now.";

Part 11 - First Floor Rooms, East

Chapter 1 - Description

First Floor Rooms East is a room, east of the First Floor Midpoint. "This is the east end of the first floor dorm area.  Through the window at the end of the hall, you can see Calvin Field North and a bunch of campers running about in the summer sunshine.  In here, you are surrounded by images of people having snowball fights.  The fire stairs at this end of the hall go up and down."

Chapter 2 - Scenery

The eastern windows of Jacobs Hall are windows of Jacobs Hall, in the East End of Jacobs Hall.

Rule for printing the description of the eastern windows of Jacobs Hall when in the First Floor Rooms East:
	say "It's locked, and sealed with a large cutout of a dogsled pulled by more huskies than you thought was legal.  Through it, you can see Calvin Field North."

A view of Calvin Field is a backdrop, in the East End of Jacobs Hall.

Rule for printing the description of the view of Calvin Field when in the First Floor Rooms East:
	say "There seems to be an awful lot of running around over Calvin Field today.";

Part 12 - Pits Stairwell

Chapter 1 - Description

The Pits Stairwell is a room, down from the First Floor Midpoint. "This is the Pits, and evidently someone thought it would be a good idea to decorate the area dedicated to housing newbies with images taken from classic horror movies.  Frankenstein's monster looms over the doorway to the south, as if standing guard outside the Pits Lobby, while werewolves and vampires romp away to the east and west.  The stairs themselves lead back upstairs to the wintery delights of the first floor."

Chapter 2 - Scenery

Section 1 - Cut out Frankenstein's Monster

A cardboard cutout of Frankenstein's Monster is scenery, privately-named, in the Pits Stairwell. "He's holding a pouch full of scary monster cutouts.  'Go on, be an evil scientist,' he seems to be saying, 'go make more monsters.  Mwahahaha.'"

Understand "frankenstein's monster", "monster" as the cardboard cutout of Frankenstein's Monster.

Understand "[cutouts]" as the cardboard cutout of Frankenstein's Monster.

Does the player mean taking the cardboard cutout of Frankenstein's Monster:
	it is likely;

Baron Frankenstein is scenery in the Pits Stairwell.

Before doing something when Frankenstein is involved:
	[a few sanity checks because of the 9-character parsing limit!]
	unless the player's command matches the text "Frankenstein's", case insensitively:
		if the player's command matches the text "Frankenstein", case insensitively:
			say "[one of]Frankenstein was the creator, not the monster... but never mind.  [or][stopping][run paragraph on]";
	redirect the action from Frankenstein to the cardboard cutout of Frankenstein's Monster, and try that instead;

Section 2 - Cutout Pouch

A pouch of scary cutouts is a cutout pouch, privately-named, scenery, in the Pits Stairwell. "It's full of pictures calculated to keep you awake all night."

The pouch of scary cutouts represents the images of classic horror.

Section 3 - Wall cutouts

Some images of classic horror are a backdrop, in the Pits Stairwell, Pits West, Pits East. "Booga booga booga!". The printed name of the images of classic horror are "cutouts".

Understand "vampires", "werewolves", "monsters", "ghouls", "ghosts", "[cutouts]" as the images of classic horror.

Part 13 - Pits West

Chapter 1 - Description

Pits West is a room, west of the Pits Stairwell. "This end of the Pits hallway is somewhat less spooky than the rest: the paper skeletons dancing across the walls all seem quite cheerful and not at all threatening.  Dim light filters in through a high window, through which you can see the bushes and assorted shrubbery growing up against the building.  From here, you could also go back east to the main stairwell, or take the fire stairs upstairs."

Chapter 2 - Scenery

Rule for printing the description of the western windows of Jacobs Hall when in Pits West:
	say "It's rather high up in the wall, but you can see right under the bushes to Second Avenue.  If zombies attack, you could take out their kneecaps easy as anything, from here.";

Rule for printing the description of the view of Second Avenue when in Pits West:
	say "From here, it looks like a thin ribbon of asphalt.";

Some cheery skeletons are scenery, in Pits West. "They do look like a cheery bunch, don't they?" The printed name of the cheery skeletons is "skeletons". Understand "paper", "dancing", "skeleton", "[cutouts]" as the cheery skeletons.

Part 14 - Pits East

Chapter 1 - Description

Pits East is a room, east of the Pits Stairwell. "Your room is at this end of the Pits hallway, just to the south of here.  You've elected to cover your door with the biggest cutout of a werewolf that you can find, because werewolves are cool.  The hallway continues west, and a high window on the east wall looks out across Calvin Field North.  Right beside your room door is the fire stair leading back upstairs."

Chapter 2 - Scenery

Rule for printing the description of the eastern windows of Jacobs Hall when in Pits East:
	say "The window is locked and sealed with a cutout you found of a werewolf gnawing on the leg of a skeleton.  From this angle, what you see through the window are mostly the legs of people running back and forth across Calvin Field North."

Rule for printing the description of the view of Calvin Field when in Pits East:
	say "There seems to be an awful lot of running around over Calvin Field today.";

Part 15 - Pits Lobby Central

Chapter 1 - Description

Pits Lobby Central is a room, south of Pits Stairwell. "This section of the Pits is part of the older part of Jacobs Hall, and therefore cut up into more interesting shapes.  There are a bunch of storerooms, all of them locked, and then two very large halls to the east and west.  A passage to the north leads back to the main stairwell.  Apparently there used to be another staircase here going up, but it was ripped out to give this place a little more elbow room."

Chapter 2 - Scenery

Part 16 - Pits Lobby West

Chapter 1 - Description

Pits Lobby West is a room, west of Pits Lobby Central. "This windowless area used to be a wine cellar, but today it's like something out of science-fiction.  It's being used for the Virtuality option, and there are cables and computers and virtual reality equipment all over the place.  It's a little alarming, in fact, knowing that many of these campers -- the ones wearing the goggles, anyway -- can't actually see you.  The central lobby is back to the east."

Chapter 2 - Scenery

Part 17 - Pits Lobby East

Chapter 1 - Description

Pits Lobby East is a room, east of Pits Lobby Central. "This part of the Pits used to be the kitchen, once upon a time.  Imagine, having the kitchen in the basement, downstairs from the dining room!  All the kitchen equipment's been removed now, though, and the place is used as a sort of recreation room.  There are several Ping Pong tables here, and a Ping Pong tournament going in full swing.  The central lobby is back to the west.[paragraph break]Ava and Stacy have both taken this option and are waiting for their turn at the ping pong tables."

Chapter 2 - Scenery

Part 18 - Your Room

Chapter 1 - Description

Your Room is a room, south of Pits Rooms East. "You share this room with first-year camper Jeremy Dolan, who hates werewolves for some inexplicable reason.  He let you put the werewolf cutout on the outside of the door only because you let him put up a vampire cutout on the inside.  Jeremy's not around right now, though, so you'll have to wait before continuing your ongoing discussion as to whether vampires or werewolves are cooller.  In the meantime, there's your bed and your desk, and the door back to the north."

Chapter 2 - Scenery

Part 19 - Second Floor Lobby

Chapter 1 - Description

Second Floor Lobby is a room, up from First Floor Midpoint. "Hooray for Hollywood!  The words are emblazoned right across the wall, over a cutout of Audrey Hepburn holding a pouch full of smaller cutouts of other Hollywood stars.  The glamour continues east and west, to where the younger girl campers are roomed, while the stairs go up and down.[paragraph break]A few tables have been set up here for the RPG option, and the campers involved seem thoroughly absorbed in the unfolding story."

Chapter 2 - Scenery

Part 20 - Second Floor Rooms West

Chapter 1 - Description

Second Floor Rooms West is a room, west from Second Floor Lobby, up from First Floor Rooms West. "The large window at this end of the corridor would normally look out over Second Avenue, but someone's gone and plastered it over with cutouts of every actor who's ever played James Bond.  There's definitely a spy thriller motif going on here: the only surfaces not covered with more of the same are the doors to the rooms and the door to the fire stairs, which continue up and down from here.  The way back to the east looks significantly less cloak-and-dagger."

Chapter 2 - Scenery

Bond is a kind of thing, scenery. The Bonds are defined by the table of actors who played Bond. Understand "[cutouts]", "007", "spy", "spies", "bonds" as James Bond.

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

Part 22 - Third Floor Lobby

Chapter 1 - Description

Third Floor Lobby is a room, up from Second Floor Lobby. "This is where the older girls have their rooms.  The walls are painted a very dark blue, and there are planets, stars and all things space-age stuck all over the place.  A cutout of an astronaut holds out a pouch full of astronomical bits; the corridor itself extends east and west, and the stairs continue down to the rest of the dorms and up to the roof.[paragraph break]Under a particularly starry patch of ceiling, a group of campers, including your brother Aidan, are engaged in some freeform improvised poetry.  This is the Rap Session option, you think."

Chapter 2 - Scenery

Part 23 - Third Floor Rooms West

Chapter 1 - Description

Third Floor Rooms West is a room, west of Third Floor Lobby, up from Second Floor Rooms West. "In defiance of the prescribed decoration scheme, someone has stuck a large poster of one of Van Gogh's 'Starry Night' paintings on the wall here.  The scattering of constellations around seem small and weak by comparison.  There is also the window overlooking Second Avenue, surrounded by a thicket of stars; meanwhile, the fire stairs only go down from here, and the corridor continues back to the east."

Chapter 2 - Scenery

Rule for printing the description of the western windows of Jacobs Hall when in Third Floor Rooms West:
	say "It overlooks Second Avenue, and it's locked.  The ground may be a lot closer than the general decor here would have you believe, but it's still not close enough to jump.";

Rule for printing the description of the view of Second Avenue when in Third Floor Rooms West:
	say "There's not much traffic, this time of the day.";

Part 24 - Third Floor Rooms East

Chapter 1 - Description

Third Floor Rooms East is a room, east of Third Floor Lobby, up from Second Floor Rooms East. "This end of the corridor looks like the inside of a space shuttle.  Someone's gone to great care to create window-like frames for the stars and planets and whatnot; even the window overlooking Calvin Field has been made to look like a space shuttle viewport.  Outer Space is back to the west; presumably the planet Earth is down the stairs."

Chapter 2 - Scenery

Rule for printing the description of the eastern windows of Jacobs Hall when in Second Floor Rooms East:
	say "Through the constellation of Orion, you can see Calvin Field below and the people running around on it."

Part 25 - Rooftop

Chapter 1 - Description

The Jacobs Hall Rooftop is a room, up from the Third Floor Lobby. "The rooftop is only accessible when there's an activity or option that uses it.  Otherwise, it's off-limits, not that you can really imagine why anyone would want to come up here.  It's all black gravel and tar.  The courtyard downstairs is way more pleasant.[paragraph break]The Eggdrop option is busy tossing boxes of eggs over the parapet: a table has been set up as well, and is covered with artsy-craftsy materials with which a number of campers are building egg-preservation containers." The printed name of Jacobs Hall Rooftop is "Rooftop".

Chapter 2 - Scenery

