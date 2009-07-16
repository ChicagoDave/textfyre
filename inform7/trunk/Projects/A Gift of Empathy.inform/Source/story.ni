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

[Use MAX_STATIC_DATA of 400000;
Use MAX_PROP_TABLE_SIZE of 400000.
Use MAX_DICT_ENTRIES of 2500.
Use MAX_OBJECTS of 1280.
Use MAX_SYMBOLS of 26000.]

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

Part 2 - Introduction

The time of day is 7:05 PM.

When play begins:
	say "It's your second year at the LEAP summer camp, and so far it's been as great as you remember last year to have been.  Ava Winters and Stacy Alexander, whom you met last year (and whom your brother Aidan calls 'your girlfriends', much to your embarrassment) are here again.  You spent yesterday catching up on the news in between options and classes, and now you're settling in with the smug sensation of not being a raw newbie any more.[paragraph break]The LEAP summer camp isn't quite the same as most summer camps.  LEAP is an acronym for 'Learning Enrichment Activity Programme'; the brainchild of world-renowned educator Professor Damon Rose, it is housed on the campus of the University of Colorado at Valmont, and was created for Gifted and Talented Kids (gosh, that sounds impressive) to expand their horizons and encourage them to stretch their mental capabilities.[paragraph break]Whatever. That's all in the promotional flyers. You just know that you're in for two weeks of the sort of interesting classes you don't get in school, and a bunch of fun options with which to fill up the free time after classes.  This evening, for instance, you've signed up for a scavenger hunt...";
	pause the game;
	say "LEAP, Day 2.  Evening.[paragraph break]'Okay, kids!' Michelle, the counselor in charge of the scavenger hunt option waves her hands to settle the crowd around you, before finally remembering her whistle.  A brief [i]fweep[r] sweeps through the room.  'Okay, does everyone have their list?  Everyone good?  Okay!  You have until 8:25 pm to find everything on your lists, return here, and show me your lists so I can check them.  So synchronise your watches ... are we all in sync?  Good!  Your time starts ... now!'[paragraph break]Michelle's whistle gives another sharp fweep, and the room practically empties as everyone else runs off to begin their hunt.";

Book 1 - Jacobs Hall

Part 1 - Lobby West

First Floor Lobby West is a room. "This used to be the living room, back when [one of]Alexander Quaverley Jacobs, the eccentric old coot who donated this place to the university[or]old AQJ[stopping] was still alive and the university was just starting up.  It's got a huge fireplace, and a big bay window looking out onto the front lawn.  It's also been painted completely white from floor to ceiling, so thickly that you're not sure if some of the molding is not actually just bubbles under the paint.  The info desk is back through the arch to the north, and the lobby continues, through another arch, to the west.[paragraph break]A large brass plaque has been fixed into the space over the fireplace."

Rule for printing the name of first floor lobby west:
	say "First Floor Lobby, West";

A painted fireplace is scenery, in the First Floor Lobby West. "No-one uses it any more, of course, but it still looks nice.  Even with all that white paint slathered all over it."

The white paint is a backdrop, in the First Floor Lobby West. "It was the fashion, back in the 1950s, to try to make a place look more modern by painting it white.  It's not the 1950s anymore, but apparently nobody ever told the custodians that." Understand "50s", "fifties", "1950s", "nineteen-fifties", "nineteen fifties" as the white paint.

A bay window is scenery, in the First Floor Lobby West. "Normally you can see all of the front lawn spread out from here, but right now there've been temporary walls set up all over the lawn."

The elaborate wood molding is scenery, in the First Floor Lobby West. "It's pretty elaborate, and almost makes you dizzy as you follow the pattern across the -- oh wait, those are just air bubbles under the paint."

Some air bubbles are scenery, in the First Floor Lobby West. "They're annoyingly random.  You don't know why the original painters couldn't have taken the trouble to -- oh wait, that's actually an elaborate wood molding."

A plaque shaped like a shield is scenery, in the First Floor Lobby West. "It's shaped like a shield, and commemorates the memory of Damon Rose, one of the founders of LEAP.  You remember him quite well from last year.  It was quite a shock to hear about the accident, and there was some question as to whether LEAP could go on without him.  His sister, Claudia Rose, is in charge of LEAP now, and making sure that the good work goes on.  She seems like a nice lady, but she's just not quite as present as old Damon Rose used to be."

Part 2 - Info Desk

Info Desk is a room, north of First Floor Lobby West. "The main foyer of Jacobs Hall still looks a bit like the inside of a hundred-year-old mansion, though it's been a little bit beat up by the passing generations of students.  The information desk, an anomaly in glass and polished steel, sits beneath a portrait of Alexander Quaverley Jacobs, facing the main entrance to the west.  To the east, wide double doors open onto Calvin Field, while arches go south and southeast to the rest of the lobby area.  Much of the north wall has been chewed through to make a connection to the newer part of Jacobs Hall."

Part 3 - Lobby East

First Floor Lobby East is a room, east of First Floor Lobby West, southeast of Info Desk. "This used to be a rather large dining room, once upon a time, and it still has a low-hanging chandelier right in the middle of the ceiling.  A piano's been pushed under the chandelier so that nobody accidentally gets a head full of crystal walking blindly around, and the place is generally used as a kind of music room now.  The info desk is back to the northwest, and to the west is the rest of the first floor lobby.  Wide picture windows looks out on the front lawn and on the southern part of Calvin Field."

Rule for printing the name of first floor lobby east:
	say "First Floor Lobby, East";

Part 4 - Second Avenue

Second Avenue is a room, west of the Info Desk. "Second Avenue runs north and south along the edge of a cliff: to the west is a sharp drop down (don't even try) onto the rooftops of the buildings along First Avenue, and beyond those are the jagged ridges of the Rockies.  Jacobs Hall -- the old part, anyway -- is open to the east, and its front lawn spreads out to the southeast.  You can also go northeast, squeezing around the newer part of Jacobs Hall to the courtyard beyond.[paragraph break]Conveniently, a bus shelter with a newspaper vending machine is almost directly outside the Hall."

Part 5 - Calvin Field South

Calvin Field South is a room. "During the school year, this part of Calvin Field gets pretty scuffed up by students playing football or whatever inter-department sports tickle their fancy at the time.  Right now, it's getting scuffed up by people playing flag football.  The university caretakers must be wondering why they even bother to replant the grass every Spring.  The less scuffed-up part of Calvin Field is to the north, and the front lawn of Jacobs Hall is to the west."

Part 6 - Calvin Field North

Calvin Field North is a room, north of Calvin Field South, east of Info Desk. "Claremont Hall, to the north, looms over the entire length of Calvin Field, which continues to the south.  Jacobs Hall is back to the west, and the dining hall is to the east.  A fountain takes up space right where all the paths meet, so there usually aren't that many people running around and tearing up the grass.  Right now, though, there are several people running around, playing Myth Tag, and there's nothing the fountain can do about it."

Part 7 - Front Lawn

The Front Lawn is a room, west of Calvin Field South, southwest of Second Avenue. "A whole bunch of walls have been temporarily erected all over the front lawn for the Graffiti Art option.  The smell of paint is everywhere, not to mention the hiss of spray cans.  Passersby on Second Avenue -- to the northwest -- will no doubt find this all very interesting.  A flagpole rises up from the maze of makeshift walls here, while Calvin Field and the more athletic options are off to the east."

Part 8 - Courtyard

The Courtyard is a room, northeast of Second Avenue, northwest of Calvin Field North. "The courtyard is a hard, concrete square ringed by bushes and trees.  It's not terribly interesting, but Aidan sometimes comes here to play basketball with his friends, as if the camp counselors didn't make you all run around enough already.  The other university buildings are visible beyond the treetops, and the blank north face of Jacobs Hall rises up to the south; paths southeast and southwest lead around Jacobs Hall, though there is no entrance to the building from here."

Part 9 - First Floor Midpoint

First Floor Midpoint is a room, north of the Info Desk. "The first floor is where the older boys, including your brother Aidan, are housed.  The walls are plastered with images of winter sports, which makes perfect sense given that it's the middle of summer.  Between the skiers and the snowboarders, the hallway continues east and west, while the main stairs go up to the girls' dorms and down to the younger boys' dorms; and of course there's the info desk back to the south.  A friendly-looking cardboard cutout of Olympic ski champion Stephan Eberharter holds a pouch full of cutouts of all things winter-sporty, practically begging you to stick more of them up on the walls."

Part 10 - First Floor Rooms, West

First Floor Rooms West is a room, west of the First Floor Midpoint. "You're at the west end of the first floor dorm area.  The winter sports theme continues on in spite of the summer sunshine streaming in through the window.  Aidan's room is to the north, flanked by a pair of matching hockey sticks, and you could take the fire stairs up or down."

Part 11 - First Floor Rooms, East

First Floor Rooms East is a room, east of the First Floor Midpoint. "This is the east end of the first floor dorm area.  Through the window at the end of the hall, you can see Calvin Field North and a bunch of campers running about in the summer sunshine.  In here, you are surrounded by images of people having snowball fights.  The fire stairs at this end of the hall go up and down."

Part 12 - Pits Stairwell

The Pits Stairwell is a room, down from the First Floor Midpoint. "This is the Pits, and evidently someone thought it would be a good idea to decorate the area dedicated to housing newbies with images taken from classic horror movies.  Frankenstein's monster looms over the doorway to the south, as if standing guard outside the Pits Lobby, while werewolves and vampires romp away to the east and west.  The stairs themselves lead back upstairs to the wintery delights of the first floor."

Part 13 - Pits West

Pits West is a room, west of the Pits Stairwell. "This end of the Pits hallway is somewhat less spooky than the rest: the paper skeletons dancing across the walls all seem quite cheerful and not at all threatening.  Dim light filters in through a high window, through which you can see the bushes and assorted shrubbery growing up against the building.  From here, you could also go back east to the main stairwell, or take the fire stairs upstairs."

Part 14 - Pits East

Pits East is a room, east of the Pits Stairwell. "Your room is at this end of the Pits hallway, just to the south of here.  You've elected to cover your door with the biggest cutout of a werewolf that you can find, because werewolves are cool.  The hallway continues west, and a high window on the east wall looks out across Calvin Field North.  Right beside your room door is the fire stair leading back upstairs."

Part 15 - Pits Lobby Central

Pits Lobby Central is a room, south of Pits Stairwell. "This section of the Pits is part of the older part of Jacobs Hall, and therefore cut up into more interesting shapes.  There are a bunch of storerooms, all of them locked, and then two very large halls to the east and west.  A passage to the north leads back to the main stairwell.  Apparently there used to be another staircase here going up, but it was ripped out to give this place a little more elbow room."

Part 16 - Pits Lobby West

Pits Lobby West is a room, west of Pits Lobby Central. "This windowless area used to be a wine cellar, but today it's like something out of science-fiction.  It's being used for the Virtuality option, and there are cables and computers and virtual reality equipment all over the place.  It's a little alarming, in fact, knowing that many of these campers -- the ones wearing the goggles, anyway -- can't actually see you.  The central lobby is back to the east."

Part 17 - Pits Lobby East

Pits Lobby East is a room, east of Pits Lobby Central. "This part of the Pits used to be the kitchen, once upon a time.  Imagine, having the kitchen in the basement, downstairs from the dining room!  All the kitchen equipment's been removed now, though, and the place is used as a sort of recreation room.  There are several Ping Pong tables here, and a Ping Pong tournament going in full swing.  The central lobby is back to the west.[paragraph break]Ava and Stacy have both taken this option and are waiting for their turn at the ping pong tables."

Part 18 - Your Room

Your Room is a room, south of Pits Rooms East. "You share this room with first-year camper Jeremy Dolan, who hates werewolves for some inexplicable reason.  He let you put the werewolf cutout on the outside of the door only because you let him put up a vampire cutout on the inside.  Jeremy's not around right now, though, so you'll have to wait before continuing your ongoing discussion as to whether vampires or werewolves are cooller.  In the meantime, there's your bed and your desk, and the door back to the north."

Part 19 - Second Floor Lobby

Second Floor Lobby is a room, up from First Floor Midpoint. "Hooray for Hollywood!  The words are emblazoned right across the wall, over a cutout of Audrey Hepburn holding a pouch full of smaller cutouts of other Hollywood stars.  The glamour continues east and west, to where the younger girl campers are roomed, while the stairs go up and down.[paragraph break]A few tables have been set up here for the RPG option, and the campers involved seem thoroughly absorbed in the unfolding story."

Part 20 - Second Floor Rooms West

Second Floor Rooms West is a room, west from Second Floor Lobby, up from First Floor Rooms West. "The large window at this end of the corridor would normally look out over Second Avenue, but someone's gone and plastered it over with cutouts of every actor who's ever played James Bond.  There's definitely a spy thriller motif going on here: the only surfaces not covered with more of the same are the doors to the rooms and the door to the fire stairs, which continue up and down from here.  The way back to the east looks significantly less cloak-and-dagger."

Part 21 - Second Floor Rooms, East

Second Floor Rooms East is a room, east from Second Floor Lobby, up from First Floor Rooms East. "The girls at this end of the corridor seem to prefer movie posters to cutouts of actors.  The only cutout here is a lifesize Humphrey Bogart, on the door to the fire stairs.  Opposite Bogey, to the north, is Ava and Stacy's room, while behind Bogey are stairs going up and down.  And at the end of the corridor is, of course, the window overlooking Calvin Field, and stardom continues back to the west."

Part 22 - Third Floor Lobby

Third Floor Lobby is a room, up from Second Floor Lobby. "This is where the older girls have their rooms.  The walls are painted a very dark blue, and there are planets, stars and all things space-age stuck all over the place.  A cutout of an astronaut holds out a pouch full of astronomical bits; the corridor itself extends east and west, and the stairs continue down to the rest of the dorms and up to the roof.[paragraph break]Under a particularly starry patch of ceiling, a group of campers, including your brother Aidan, is engaged in some freeform improvised poetry.  This is the Rap Session option, you think."

Part 23 - Third Floor Rooms West

Third Floor Rooms West is a room, west of Third Floor Lobby, up from Second Floor Rooms West. "In defiance of the prescribed decoration scheme, someone has stuck a large poster of one of Van Gogh's 'Starry Night' paintings on the wall here.  The scattering of constellations around seem small and weak by comparison.  There is also the window overlooking Second Avenue, surrounded by a thicket of stars; meanwhile, the fire stairs only go down from here, and the corridor continues back to the east."

Part 24 - Third Floor Rooms East

Third Floor Rooms East is a room, east of Third Floor Lobby, up from Second Floor Rooms East. "This end of the corridor looks like the inside of a space shuttle.  Someone's gone to great care to create window-like frames for the stars and planets and whatnot; even the window overlooking Calvin Field has been made to look like a space shuttle viewport.  Outer Space is back to the west; presumably the planet Earth is down the stairs."

Part 25 - Rooftop

The Jacobs House Rooftop is a room, up from the Third Floor Lobby. "The rooftop is only accessible when there's an activity or option that uses it.  Otherwise, it's off-limits, not that you can really imagine why anyone would want to come up here.  It's all black gravel and tar.  The courtyard downstairs is way more pleasant.[paragraph break]The Eggdrop option is busy tossing boxes of eggs over the parapet: a table has been set up as well, and is covered with artsy-craftsy materials with which a number of campers are building egg-preservation containers." The printed name of Jacobs House Rooftop is "Rooftop".

Book 2 - Scavenger Hunt

Scavenger Hunt is a scene. Scavenger Hunt begins when play begins. Scavenger Hunt ends naturally when the time of day is 8:25 PM.

At the time when Scavenger Hunt ends naturally:
	move the player to First Floor Lobby West;

A list of items for the Scavenger Hunt is a thing. The description is "A newspaper[line break]A feather[line break]A flag[line break]A star[line break]A dinosaur[line break]A hat[line break]Something that was once alive"

The player carries the list of items for the scavenger hunt.

The dollar notes are a thing. The player carries the dollar notes. The indefinite article of the dollar notes is "a few".

