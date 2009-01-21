Version 1 of Textfyre Standard Rules by Textfyre begins here.

"A few stock phrases, verbs, synonyms and grammar tweaks which work differently to the standard Inform model but which should work the same across Textfyre games."

Use authorial modesty.

Book 1 - Definitions

Part 1 - Involvement & Redirection

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

Part 2 - Properties of directions

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

Book 2 - Disambiguations

Part 1 - Clothing

Does the player mean taking off something worn by the player:
	it is very likely;

Does the player mean wearing something worn by the player:
	it is very unlikely;

Does the player mean wearing something wearable:
	it is very likely;

Does the player mean wearing something not wearable:
	it is very unlikely;

Part 2 - Food and drink

Does the player mean eating something edible:
	it is very likely;

Does the player mean eating something inedible:
	it is very unlikely;

Part 3 - Doors and boxes

Chapter 1 - Opening and Closing

[This is not quite right in the way the rules interact.]

Does the player mean opening or closing something openable:
	it is very likely;

Does the player mean opening something closed:
	it is likely;

Does the player mean closing something open:
	it is very likely;

Does the player mean closing something closed:
	it is unlikely;

Does the player mean opening something open:
	it is unlikely;

Does the player mean opening or closing something unopenable:
	it is very unlikely;

Book 3 - Verbs

Part 1 - Enterables

Standing on is an action applying to one thing.
Sitting on is an action applying to one thing.

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

Check standing on something:
	abide by the enterable checks rule;
	
Check sitting on something:
	abide by the enterable checks rule;

Carry out standing on something:
	abide by the enterable carry out rule;

Carry out sitting on something:
	abide by the enterable carry out rule;

Report standing on something:
	abide by the enterable reports rule;

Report sitting on something:
	abide by the enterable reports rule;

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

Volume 2A (for use without Custom Library Messages by David Fisher)

[This space reserved for changes to standard library messages]

Volume 2B (for use with Custom Library Messages by David Fisher)

[This space also reserved for changes to standard library messages; it would need to be done differently.]

Textfyre Standard Rules ends here.

---- DOCUMENTATION ----

This extension is in no way meant as a replacement for the Standard Rules, but really just as a collection of tweaks, refinements and best practices that can eventually be shared across Textfyre games to allow a degree of uniformity and robustness. At the moment, though, it's incomplete, incorrect, and laughably trivial.

