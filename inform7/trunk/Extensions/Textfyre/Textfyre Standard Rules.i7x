Version 1 of Textfyre Standard Rules by Textfyre begins here.

"A few stock phrases, verbs, synonyms and grammar tweaks which work differently to the standard Inform model but which should work the same across Textfyre games."

Use authorial modesty.

Include Pronouns by Textfyre.

Volume 1 - For universal use

Book 1 - Definitions

Part 1 - Properties of actions

Definition: something is involved:
	if it is the noun:
		yes;
	if it is the second noun:
		yes;
	no;

Definition: something is physically involved:
	if it is the noun and the action requires a touchable noun:
		yes;
	if it is the second noun and the action requires a touchable second noun:
		yes;
	no;

To redirect the action from (this - a thing) to (that - a thing):
	if this is the noun, change the noun to that;
	if this is the second noun, change the second noun to that;

To decide whether the action is physical:
	if the current action is listening to the location, no;
	if the current action is smelling the location, no;
	if the action requires a touchable noun, yes;
	if the action requires a touchable second noun, yes;
	no;

Part 2 - Properties of things

Definition: a person is other unless it is the player.
Definition: a person is another if it is other.

Part 3 - Properties of directions

Chapter 1 - Clockwise and Anticlockwise rotation of directions

To decide what direction is clockwise of (dir - a direction):
	if dir is:
	 -- north: decide on northeast;
	 -- northeast: decide on east;
	 -- east: decide on southeast;
	 -- southeast: decide on south;
	 -- south: decide on southwest;
	 -- southwest: decide on west;
	 -- west: decide on northwest;
	 -- northwest: decide on north;
	 -- otherwise: decide on dir;

To decide what direction is anticlockwise of (dir - a direction):
	if dir is:
	 -- north: decide on northwest;
	 -- northeast: decide on north;
	 -- east: decide on northeast;
	 -- southeast: decide on east;
	 -- south: decide on southeast;
	 -- southwest: decide on south;
	 -- west: decide on southwest;
	 -- northwest: decide on west;
	 -- otherwise: decide on dir;

Chapter 2 - Horizontal mirroring of directions

To decide what direction is (dir - a direction) in the mirror:
	if dir is:
	 -- northeast: decide on northwest;
	 -- east: decide on west;
	 -- southeast: decide on southwest;
	 -- northwest: decide on northeast;
	 -- west: decide on east;
	 -- southwest: decide on southeast;
	 -- otherwise: decide on dir;

Chapter 3 - Planar and Vertical directions

Definition: a direction is planar:
	if it is up, no;
	if it is down, no;
	if it is inside, no;
	if it is outside, no;
	yes.

Definition: a direction is vertical:
	if it is up, yes;
	if it is down, yes;
	no;

Chapter 4  - Orthogonal and Diagonal directions

Definition: a direction is orthogonal:
	if it is north, yes;
	if it is south, yes;
	if it is east, yes;
	if it is west, yes;
	no.

Definition: a direction is not orthogonal:
	if it is orthogonal, no;
	otherwise yes;

Definition: a direction is diagonal:
	if it is northeast, yes;
	if it is northwest, yes;
	if it is southeast, yes;
	if it is southwest, yes;
	no.

Definition: a direction is not diagonal:
	if it is diagonal, no;
	otherwise yes;

Chapter 5 - Vagueness of directions

To decide if (that way - a direction) is due (bearing - a direction):
	if that way is the bearing, yes;
	if that way is clockwise of the bearing, yes;
	if that way is anticlockwise of the bearing, yes;
	no;

Part 3 - Activity bug fix

[This is a bug with David Fisher's Custom Library Messages; a conflict with the standard rules definition for 'going on' (adj. of an activity.)]

To decide whether currently running (A - activity) activity:
	(- (TestActivity({A})) -).

Part 4 - Better 'best route' finding

[Not always - but very frequently - when we ask for a best route, we are already adjacent to the target destination.]

To decide which direction is the quick best route from (here - a room) to (there - a room):
	if here is adjacent to there:
		let the possibilities be {north, east, south, west, northeast, southeast, northwest, southwest, up, down, inside, outside};
		repeat with d running through the possibilities:
			if the room d from here is there:
				decide on d;
	decide on the best route from here to there;

Book 2 - Disambiguations and (Mis)-understandings

Part 1 - Clothing

Does the player mean taking off something worn by the player (this is the very likely to mean taking off worn things rule):
	it is very likely;

Does the player mean wearing something worn by the player (this is the very unlikely to mean wearing worn things rule):
	it is very unlikely;

Does the player mean wearing something wearable (this is the very likely to mean wearing wearable things rule):
	it is very likely;

Does the player mean wearing something not wearable (this is the very unlikely to mean wearing unwearable things rule):
	it is very unlikely;

Part 2 - Food and drink

Understand "drink" as drinking.
Understand "eat" as eating.

Does the player mean eating something edible (this is the very likely to mean eating edible things rule):
	it is very likely;

Does the player mean eating something inedible (this is the very unlikely to mean eating inedible things rule):
	it is very unlikely;

Part 3 - Doors

[This is not quite right in the way the rules interact.]

Does the player mean opening or closing something openable (this is the very likely to mean opening or closing openable things rule):
	it is very likely;

Does the player mean opening something closed (this is the likely to mean opening closed things rule):
	it is likely;

Does the player mean closing something open (this is the very likely to mean closing open things rule):
	it is very likely;

Does the player mean closing something closed (this is the unlikely to mean closing closed things rule):
	it is unlikely;

Does the player mean opening something open (this is the unlikely to mean opening open things rule):
	it is unlikely;

Does the player mean opening or closing something unopenable (this is the very unlikely to mean opening or closing unopenable things rule):
	it is very unlikely;

Part 4 - Taking

Does the player mean taking something had by the player (this is the very unlikely to mean taking possessions rule):
	it is very unlikely;

Book 3 - Rulebooks

Part 1 - People vs scenery

The can't turn people rule is listed before the can't turn what's fixed in place rule in the check turning rulebook.
The can't push people rule is listed before the can't push what's fixed in place rule in the check pushing rulebook.
The can't pull people rule is listed before the can't pull what's fixed in place rule in the check pulling rulebook.

Book 4 - Verbs

Part 1 - Enterables

Standing on is an action applying to one thing.
Sitting on is an action applying to one thing.
Lying on is an action applying to one thing.

Understand the command "get" as something new.
Understand "get out/off/up" as exiting.
Understand "get [things]" as taking.
Understand "get on/onto [supporter]" as standing on.
Understand "get on top of [supporter]" as standing on.
Understand "get in/into/on/onto [something]" as entering.
Understand "get off [something]" as getting off.
Understand "get [things inside] from [something]" as removing it from.

Understand the command "stand" as something new.
Understand "stand" or "stand up" as exiting.
Understand "stand on [supporter]" as standing on.
Understand "stand on/in [something]" as entering.

Understand the command "go" as something new.
Understand "go" as going.
Understand "go [direction]" as going.
Understand "go [supporter]" as standing on. [Not quite sure about this line, nor the line below it -- lifted from the standard rules and kept by benefit of doubt, but I've a feeling it's a legacy thing that might be best forgotten.]
Understand "go [something]" as entering.
Understand "go into/in/inside/through [something]" as entering.

Understand the command "enter" as something new.
Understand "enter [supporter]" as standing on.
Understand "enter [something]" as entering.

Understand the command "sit" as something new.
Understand "sit on top of [supporter]" as sitting on.
Understand "sit on/in/inside [supporter]" as sitting on.
Understand "sit on/in/inside [something]" as entering.

Understand "lie on/in [something]" as lying on.
Understand "lie down on/in [something]" as lying on.
Understand "lay on/in [something]" as lying on.
Understand "lay down on/in [something]" as lying on.
Understand "lie down" as sleeping.
Understand "lay down" as sleeping.
Understand "lie down to/and sleep" as sleeping.
Understand "lay down to/and sleep" as sleeping.
Understand "lay me down to/and sleep" as sleeping.
Understand "go to sleep" as sleeping.

This is the enterable checks rule:
	abide by the can't enter what's already entered rule;
	abide by the can't enter what's not enterable rule;
	abide by the can't enter closed containers rule;
	abide by the can't enter something carried rule;
	abide by the implicitly pass through other barriers rule;

This is the enterable carry out rule:
	abide by the standard entering rule;

This is the enterable reports rule:
	abide by the standard report entering rule;
	abide by the describe contents entered into rule;

The enterable checks rule is listed in the check standing on rules.
The enterable checks rule is listed in the check sitting on rules.
The enterable checks rule is listed in the check lying on rules.

The enterable carry out rule is listed in the carry out standing on rules.
The enterable carry out rule is listed in the carry out sitting on rules.
The enterable carry out rule is listed in the carry out lying on rules.

The enterable reports rule is listed in the report standing on rules.
The enterable reports rule is listed in the report sitting on rules.
The enterable reports rule is listed in the report lying on rules.

[Carry out standing on something:
	abide by the enterable carry out rule;

Carry out sitting on something:
	abide by the enterable carry out rule;

Report standing on something:
	abide by the enterable reports rule;

Report sitting on something:
	abide by the enterable reports rule;]

Part 2 - Climbing

[All sorts of subtleties, depending on how one would interpret 'climb up' and 'climb down', and I don't think I've quite got it right yet. But I think it's better, and I think it's worth the effort.]

Understand the command "climb" as something new.

Ascending is an action applying to one visible thing.
Descending is an action applying to one visible thing.

Understand "climb" as climbing.
Understand "climb up" as ascending.
Understand "climb down" as descending.
Understand "climb [something]" as climbing.
Understand "climb over/through [something]" as climbing.
Understand "climb on/onto [supporter]" or "climb on to [supporter]" as standing on.
Understand "climb on/onto [something]" or "climb on to [something]" as climbing.
Understand "climb up [something]" as ascending.
Understand "climb down [something]" as descending.
Understand the command "clamber" as "climb".

Understand "descend" as descending.
Understand "descend [something]" as descending.
Understand "abseil down" as descending.
Understand "abseil down [something]" as descending.

Understand "ascend" as ascending.
Understand "ascend [something]" as ascending.

Understand "run up [something]" as going.
Understand "go up [something]" as going.

Understand "run down [something]" as going.
Understand "go down [something]" as going.

Check climbing when the noun is up: [e.g. > CLIMB UP ]
	try going up instead;

Check climbing when the noun is down: [ e.g. > CLIMB DOWN ]
	try going down instead;

Rule for supplying a missing noun when ascending:
	change the noun to up;

Rule for supplying a missing noun when descending:
	change the noun to down;

Check ascending when the noun is up: [e.g. > ASCEND ]
	try going up instead;

Check descending when the noun is down: [e.g. > DESCEND ]
	try going down instead;

Carry out descending something: try climbing the noun instead.
Carry out ascending something: try climbing the noun instead.

Part 3 - Eating

Understand the command "bite" as "eat".
Understand the command "lick" as "taste".

Part 4 - Reading

Reading is an action applying to one thing, requiring light. 

Check reading (this is the redirect reading to examining rule):
	try examining the noun instead;

Understand the command "read" as something new.
Understand "read [something]" as reading.
Understand "read about [text] in [something]" as consulting it about (with nouns reversed).
Understand "read [text] in [something]" as consulting it about (with nouns reversed).

Part 5 - Examining

Understand "look [something]" as examining.
Understand "look for [something]" as examining.
Understand "search for [something]" as examining.

Part 6 - Clothes

Understand "take off [things preferably held]" as taking off.
Understand "remove [things preferably held]" as taking off.
Understand "disrobe [things preferably held]" as taking off.

Understand "wear [things preferably held]" as wearing.
Understand "put on [things preferably held]" as wearing.
Understand "put [something preferably held] on" as wearing.
Understand "put [things preferably held] on" as wearing.

Part 7 - Taking Inventory

[It's unfortunately hard to jig about with the I7 list writer, and probably easier just not to bother. Thus:]

Instead of taking inventory (this is the Textfyre Standard replacement inventory rule):
	[The difference between this and the standard inventory style is that we do not show inventory information.]
	say "You are carrying: [line break]";
	list the contents of the player, with newlines, indented, including contents, with extra indentation;

After printing the name of something (called x) while taking inventory:
	carry out the printing inventory information activity with x;

Printing inventory information of something is an activity.

Rule for printing inventory information of something worn by the player:
	say " (being worn)";

Rule for printing inventory information of an open container (called x):
	if x is openable:
		say " (which [is or are for x] open, [unless x encloses something]but empty[otherwise]containing:[end if])";
	otherwise:
		say " ([unless x encloses something]which [is or are for x] empty[otherwise]containing:[end if])";

Rule for printing inventory information of a closed container (called x):
	if x is openable:
		say " (which [is or are for x] closed[if x does not enclose something and x is transparent], and empty[otherwise if x is transparent], containing:[end if])";
	otherwise:
		say "[if x does not enclose something and x is transparent](which [is or are for x] empty)[otherwise if x is transparent](containing:)[end if]";

Part 8 - Doors

Chapter 1 - Implicitly opening

Implicitly opening something is an activity.

Rule for implicitly opening something (called the unopened item):
	say "(first opening [the unopened item])[command clarification break]";
	try silently opening the unopened item; 

Rule for implicitly opening something locked (called the locked item):
	consider the unlocking rules for the locked item;
	if the rule succeeded:
		let the chosen key be the result of the rule;
		say "(first unlocking [the locked item] with [the chosen key])[command clarification break]";
		try silently unlocking the locked item with the chosen key;
		if the locked item is unlocked and the locked item is closed:
			try silently opening the locked item; 

Before going through a closed door (called the obstacle):
	carry out the implicitly opening activity with the obstacle;
	if the obstacle is closed, stop the action;

Chapter 2 - Implicitly unlocking

The unlocking rules are an object-based rulebook.

First unlocking rule for something lockable (called l) (this is the matching key rule):
	if the player carries something (called k) that fits l:
		rule succeeds with result k;

Rule for supplying a missing second noun while unlocking something (called the locked item) with:
	consider the unlocking rules for the locked item;
	if the rule succeeded:
		let the chosen key be the result of the rule;
		begin the clarifying the parser's choice activity with the chosen key;
		if handling the clarifying the parser's choice activity with the chosen key:
			say "(with [the chosen key])[command clarification break]";
		end the clarifying the parser's choice activity with the chosen key;
		change the second noun to the chosen key;

Chapter 3 - Locking and unlocking

Matching relates a thing (called the key in question) to a thing (called the lock) when the lock provides the property matching key and the matching key of the lock is the key in question.
The verb to fit (it fits, they fit, it fitted) implies the matching relation.

Definition: a thing is a key:
	if it fits something, yes;
	no;

Definition: a thing is a lock:
	if it is not lockable, no;
	if it provides the property matching key:
		yes;
	no;

Understand "unlock [something]" as unlocking it with;
Understand "put [key thing] in/into [lock thing]" as unlocking it with (with nouns reversed);
Understand "insert [key thing] in/into [lock thing]" as unlocking it with (with nouns reversed);

Part 9 - Inserting and Removing

[ We let the player try these things and fail them: the default message that occurs otherwise is 'you can't see any such thing', which seems somewhat worse. ]

Understand "take [things] from [something]" as removing it from.
Understand "get [things] from [something]" as removing it from.
Understand "remove [things] from [something]" as removing it from.

Understand "take [things] out of/from [something]" as removing it from.
Understand "get [things] out of/from [something]" as removing it from.
Understand "remove [things] out of/from [something]" as removing it from.

Understand "put [things] in/inside/into [something]" as inserting it into.
Understand "insert [things] in/inside/into [something]" as inserting it into.
Understand "drop [things] in/inside/down/into/behind [something]" as inserting it into.
Understand "hide [things] in/inside/down/under/into/behind [something]" as inserting it into.

Part 10 - Facing Directions (for use without Adjacent Rooms by Textfyre)

[Adapted from manual example #66, "A View of Green Hills".]

Printing the distant description of something is an activity.

Facing is an action applying to one visible thing.
The facing action has an object called the viewed item (matched as "towards").
The facing action has an object called the aperture viewed through (matched as "through").

Understand "look [direction]" as facing. 
Understand "examine [direction]" as facing. 

Setting action variables for facing:
	now the viewed item is the room-or-door noun from the location of the actor; 
	if the viewed item is a door:
		change the aperture viewed through to the viewed item;
		change the viewed item to the other side of the aperture viewed through;

Check facing through something closed:
	say "[The aperture viewed through] [is-are] closed." instead;

Check facing towards nothing:
	say "You see nothing of interest in that direction." instead;

Report facing up towards a room:
	say "[The viewed item] lies above.";

Report facing down towards a room:
	say "[The viewed item] lies below.";

Report facing inside towards a room:
	say "[The viewed item] lies inwards.";

Report facing outside towards a room:
	say "[The viewed item] lies outwards.";

Report facing towards a room:
	say "[The viewed item] lies to [the noun].";

Book 5 - Kinds

Part 1 - Doorways

A doorway is a kind of door. A doorway is usually open, not openable, unlocked, not lockable, privately-named, scenery. The specification of a doorway is "A kind of door which can be referred to by its direction."

Before printing the name of a doorway (called the portal):
	let d be the direction of the portal from the location;
	unless d is nothing:
		say "[d] ";

Rule for printing the name of a doorway:
	say "doorway";

Understand "n/north/northern" as a doorway when the direction of the item described from the location is north.
Understand "s/south/southern" as a doorway when the direction of the item described from the location is south.
Understand "e/east/eastern" as a doorway when the direction of the item described from the location is east.
Understand "w/west/western" as a doorway when the direction of the item described from the location is west.

Understand "nw/northwest" as a doorway when the direction of the item described from the location is northwest.
Understand "sw/southwest" as a doorway when the direction of the item described from the location is southwest.
Understand "ne/northeast" as a doorway when the direction of the item described from the location is northeast.
Understand "se/southeast" as a doorway when the direction of the item described from the location is southeast.

Understand "doorway" as a doorway.
Understand "doorways" as the plural of doorways.
Understand "exits" as the plural of doorways.

Part 2 - Staircases

A staircase is a kind of backdrop. The specification of a staircase is "A flight of stairs that runs continuously between several rooms, that tries to make sense of attempts to CLIMB it."

A staircase has a room called the head. A staircase has a room called the foot.

The block climbing rule is not listed in any rulebook;

Check climbing (this is the slightly more lenient block climbing rule):
	if the noun is not a staircase:
		abide by the block climbing rule;

Check climbing a staircase (this is the clarify ambiguity of staircases rule):
	unless the location is the head of the noun or the location is the foot of the noun:
		say "[The noun] run[s] up and down from here[one of]. Which way do you want to go?[or].[stopping]" instead;

Carry out climbing a staircase:
	if the location is the head of the noun:
		try going down instead;
	otherwise if the location is the foot of the noun:
		try going up instead;

Check ascending a staircase:
	if the location is the head of the noun:
		say "[The noun] only run[s] down from here." instead;

Carry out ascending a staircase:
	try going up instead;

Check descending a staircase:
	if the location is the foot of the noun:
		say "[The noun] only run[s] up from here." instead;

Carry out descending a staircase:
	try going down instead;

Book X - Miscellany

Chapter 1 - No swearing

Understand the commands "shit", "fuck", "damn", "sod", "curses", "drat", "bother", and "darn" as something new

Volume 2A (for use without Custom Library Messages by David Fisher)

[This space reserved for changes to standard library messages]

Chapter 1 - Parser Errors

Rule for printing a parser error when the parser error is noun did not make sense in that context:
	say "I can't see any such thing." instead;

Volume 2B (for use with Custom Library Messages by David Fisher)

[This space also reserved for changes to standard library messages; it would need to be done differently.]

Volume 3A (for use without FyreVM Support by Textfyre)

To output chapter heading (header - text):
	say "[bold type][header] [roman type][paragraph break]";

To select theme (theme - text):
	do nothing;

Volume 3B (for use with FyreVM Support by Textfyre)

To output chapter heading (header - text):
	if FyreVM is present:
		select the chapter channel;
		say header;
		select the main channel;
	otherwise:
		say "[bold type][header] [roman type][paragraph break]";

To select theme (theme - text):
	if FyreVM is present:
		select the theme channel;
		say theme;
		select the main channel;

Textfyre Standard Rules ends here.

---- DOCUMENTATION ----

This extension is in no way meant as a replacement for the Standard Rules, but really just as a collection of tweaks, refinements and best practices that can eventually be shared across Textfyre games to allow a degree of uniformity and robustness. At the moment, though, it's incomplete, incorrect, and laughably trivial.

