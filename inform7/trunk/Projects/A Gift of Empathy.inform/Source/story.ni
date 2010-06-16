"The Empath's Gift" by Textfyre.

[
Include (- Constant DEBUG; -) after "Definitions.i6t".
]

[  Change Log

When	Who	What
16-May-2010 	R. Newcomb  	walkthroughs to end of game done. Chapter 1 4/20; 
29-Apr-2010 	R. Newcomb  	Inform 7 build 6E36
23-Apr-2010 	R. Newcomb  	refactor code:  replace all (or combine) Instead, Before, After, Every Turn, and Procedural rules with Check (etc.) equivalents; replace Print Desc. Of, Locale, Paragraph About, Check Examining rules with properties; rewrite how Goals extension works for O(n) running time rather than O(n-squared); 
22-Apr-2010 	R. Newcomb  	robot sim partial rewrite
21-Apr-2010 	R. Newcomb  	Chapter 08 & 10
20-Apr-2010 	R. Newcomb  	Chapter 07
19-Apr-2010 	R. Newcomb  	Room03  4/7/09
12-Apr-2010 	R. Newcomb  	Rooms02 4/7/09 finished.  Chapter 6 4/20/09. 
10-Apr-2010 	R. Newcomb 		Code cleanup.  Source code headings saner.
07-Apr-2010 	R. Newcomb  	Ava 3/29,  Paul's trascript of 2010-01-23, various bug fixes & improvements
05-Apr-2010 	R. Newcomb  	Michelle 3/29, Aidan 3/02, Rooms01 3/09, Paul's transcript 2010-01-23
28-Feb-2010 	R. Newcomb  	Michelle, Brad, Inquiring it about, various improvements
1-Sep-2009  	G. Jefferis		Wandering orderly
31-Aug-2009	G. Jefferis		Chapter 4 - Hospital scene
26-Aug-2009	G. Jefferis		Chapter 3 mostly done - Maelstrom maze.
25-Aug-2009	G. Jefferis		Chapter 2 mostly done.
24-Aug-2009	G. Jefferis		Chapter 2 begun: FOCUS command, conversations with Stacy & Ava, chat with Lucian.
17-Aug-2009	G. Jefferis		Chapter 1 tidied up and now solvable
03-Aug-2009	G. Jefferis		Conversation points
29-Jul-2009  	G. Jefferis		Option events on entering
25-Jul-2009  	G. Jefferis		More scenery
23-Jul-2009  	G. Jefferis		Scenery and goals extension
22-Jul-2009  	G. Jefferis		Map for first chapter and scenery
14-Jul-2009  	G. Jefferis		Start Project
]

Volume 1 - Map & Code

Use no scoring, American dialect and full-length room descriptions.
The story creation year is 2010.

Include FyreVM Support by Textfyre.
Include Punctuation Removal by Emily Short.
Include Basic Screen Effects by Emily Short.

Include Textfyre Standard Rules by Textfyre.
Include Textfyre Standard Backdrops by Textfyre.
Include Triggers by Textfyre.
Include Quips by Textfyre.
Include Basic Followers by Textfyre.
[Include Conversation Topics by Textfyre.]
Include Goals by Textfyre.

Include Test Suite by Textfyre.
[Include Parse List by Textfyre.]
 
[Every turn : show future events.   TO show future events: (- sfe(); -).
Include (-
[ sfe i rule;
	print (TimedEventsTable-->0), " pending events: ";
	for (i=1: i<=(TimedEventsTable-->0): i++)
		!if ((rule=TimedEventsTable-->i) ~= 0)
		{ rule=TimedEventsTable-->i;
  		  print (RulePrintingRule) rule, "(", (TimedEventTimesTable-->i), "), "; }
	print "^";

];-).]

Book 1 - Initialization

Part 1 - Set up

Chapter 1 - odds and ends

Section 1 - expand memory limits

Use MAX_STATIC_DATA of 400000.
Use MAX_OBJECTS of 1024.
Use MAX_DICT_ENTRIES of 2500.
Use MAX_PROP_TABLE_SIZE of 350000.
Use MAX_ZCODE_SIZE of 300000.
Use MAX_LABELS of 30000.
Use MAX_ARRAYS of 2000.
Use MAX_NUM_STATIC_STRINGS of 30000.

Section 2 - debugging aids

Use numbered rules.

[these I wrap around anything that I don't want in the debug build, such as PAUSE THE GAME which breaks re-runs]
To ifndef debug: do nothing. [(- #ifndef DEBUG; -).]
To enddef debug: do nothing. [ (-  #endif; -). ]

To say placeholder -- beginning say_placeholder:
	say "[bracket]placeholder text: '";

To say end placeholder -- ending say_placeholder:
	say "'[close bracket][paragraph break]";

Section 3 - teleport to a room - not for release

Understand "teleport [any room]" or "teleport to [any room]" as teleporting to. Teleporting to is an action out of world applying to one visible thing. Check teleporting to the location: say "[bracket]Asserted being at [the noun].[close bracket][line break]" instead. Carry out teleporting to: move the player to the noun. 

Section 4 - minor programming aids

To say try (act - an action) -- running on:  (- RunParagraphOn();  meta = 0; {act}; RunParagraphOn(); -).  [from Understand as Mistake, the whole action will be done out  of world]

[used within "Understand...as a mistake" and Ask About replies to effect how-to-play instructions and gamestate change. Very handy.]


When play begins:
	change the looking action to out of world;
	change the taking inventory action to out of world.

To change (act - an action-name) to out of world: (- MakeOOW({act}); -).

Include (- 
[ MakeOOW act  at;
    at = FindAction(act); 
    ActionData-->(at+AD_REQUIREMENTS) = ActionData-->(at+AD_REQUIREMENTS) | OUT_OF_WORLD_ABIT;
];-).


Chapter 2 - cribbed from extension Mentioned In Room Descriptions

The initialise locale description rule is not listed in the before printing the locale description rules.

The initialise locale description rule is listed first in the carry out looking rules.

First before printing the locale description of something while not looking (this is the initialise non-look locale description rule):
	consider the initialise locale description rule.

The don't mention player's supporter in room descriptions rule is not listed in any rulebook. [ unnecessary now that "mentioned" is initialized so early. ]
	
To say (x - an object) mentioned: now x is mentioned; if x is a scenery supporter, now everything supported by x is mentioned. [useful for combining several people into the room description:  see Ava&Stacy at the ping-pong room]

Chapter 3 - Banner Text

Rule for printing the banner text:
	select the title channel;
	say "[b][story title][r][line break]";
	select the credits channel;
	say "[story title] by [story author][line break]";
	say "Copyright [story creation year] by [story author][line break]";
	say "Designed by Paul O'Brian[line break]";
	say "Written by Christopher Huang[line break]";
	say "Game Engine (FyreVM) by Jesse McGrew[line break]";
	say "Inform 7 Programming by Ron Newcomb[line break] and Graeme Jefferis[line break]";
	say "Testing by ____[line break]";
	say "Special thanks to Graham Nelson and Emily Short[line break]";
	say "for all of their hard work on Inform 7.[line break]";
	say "All rights reserved.[line break]";

Chapter 4 - Passage of Time

Section 1 - in-fiction time

A term day is a kind of value. Day 10 specifies a term day.

The current term day is a term day that varies. The current term day is Day 2.

When play begins:
	change left hand status line to "[Current term day]: [the location in title case]";
	change right hand status line to "[time of day]".

Section 2 - narrative time

The chapter number is a number that varies. The chapter number is usually 1. 

[OUTLINE
Chapter 1 - Scavenger Hunting
Chapter 2 - Lucian's Secret (incl. the bullies, Crystal Quest)
Chapter 3 - Here Comes the Flood (incl. Lost in Maelstrom)
Chapter 4 - Hospital (incl. Cased In, Doc Rose Chat, Hospital Chat, Outward Journey, Return Journey) 
Chapter 5 - Robot Fun
Chapter 6 - Not So Merry Ol' England
Chapter 7 - Lucian's Bad Day (Ava gets Daniel's help, tracking Lucian, coaxing Lucian out of the vents, Saving Lucian from Aidan)
Chapter 8 - Night Terrors
Chapter 9 - The Poisoned Mind (.. the Battle with the Thief)
Chapter 10 - Breakfast of Champions
]

To decide whether in chapter/chapters (N - a number): decide on whether or not the chapter number is N.
To decide whether in chapters/chapter (N - a number) through/thru/thorugh (M - a number): decide on whether or not the chapter number is at least N and the chapter number is not greater than M.

[The dreamscape is a room. [TODO]] [try the "mindscape" region]

There is a scene called the Battle with the Thief.  [TODO]

To Go straight to section (txt - some text) in Chapter 09 text: placeholder "Go straight to section ['][txt]['] in Chapter 09 text."


section 3 - CHAPTER testing command - not for release
	
Understand "chapter" as a mistake ("Currently in chapter [the chapter number]."). Understand "chapter [number]" as a mistake ("Now pretending we're in chapter [set chapter number to number understood][the chapter number]."). To say set chapter number to (N - a number): now the chapter number is N; if the chapter number > 10, now the chapter number is 10; if the chapter number < 1, now the chapter number is 1.

Understand "puzzle [number]" as a mistake ("[set puzzle-touch to 7]"). To say set puzzle-touch to (n - number): now puzzle-touch is n. Puzzle-touch is a number that varies. [scenes begin on this number]


Chapter 5 - What does ALL mean

Section 1 - TAKE ALL ALL to test messages - not for release

Rule for deciding whether all includes scenery when the player's command includes "all all": it does.


Chapter 6 - Convert Telling and Answering to Asking

Replaceable-action-name is an action name that varies. Replaceable-action-name variable translates into I6 as "action".

First before telling: change the Replaceable-action-name to the asking it about action.
First before answering: change the Replaceable-action-name to the asking it about action.

[these actions are hard-coded into the inform parser, so using "Understand the command.... as something new." won't work. Changing the action produces better performance than re-trying a whole new action.]



Part 2 - The player

Chapter 1 - Description

The description of yourself is "[placeholder]A description of the player[end placeholder]."

The player is scenery, not fixed in place.   
The don't mention undescribed items in room descriptions rule is not listed in any rulebook. [slight performance improvement]



Chapter 2 - Initial Belongings

The player is in the info desk.

The player carries the items list for the scavenger hunt.  The items list for the Scavenger Hunt is a thing. The description is "A newspaper[line break]A feather[line break]A flag[line break]A star[line break]A dinosaur[line break]A hat[line break]Something that was once alive".  The printed name of the items list for the Scavenger Hunt is "[if we have not examined the item described]unread [end if]list of items for the Scavenger Hunt".  Understand "item", "of items" as the items list for the Scavenger Hunt.

Carry out examining the list for the scavenger hunt: change the current goals to the list of scavenger hunt goals.

Last carry out taking inventory when we have examined the items list for the scavenger hunt: list the player's goals.

After printing the name of something lit while taking inventory, say ", providing light".

The player carries some dollars. The indefinite article of the dollars is "a few".  Understand "few", "dollar", "note", "money", "cash", "greenbacks", "buck", "bucks" as the dollars. 


Part 3 - Introduction

The time of day is 7:05 PM.

When play begins:
	say "It's your second year at the LEAP summer camp, and so far it's been as great as you remember last year to have been.  Ava Winters and Stacy Alexander, whom you met last year (and whom your brother Aidan calls 'your girlfriends', much to your embarrassment) are here again.  You spent yesterday catching up on the news in between options and classes, and now you're settling in with the smug sensation of not being a raw newbie any more.[paragraph break]The LEAP summer camp isn't quite the same as most summer camps.  LEAP is an acronym for 'Learning Enrichment Activity Program'; the brainchild of world-renowned educator Professor Damon Rose, it is housed on the campus of the University of Colorado at Valmont, and was created for Gifted and Talented Kids (gosh, that sounds impressive) to expand their horizons and encourage them to stretch their mental capabilities.[paragraph break]Whatever. That's all in the promotional flyers. You just know that you're in for two weeks of the sort of interesting classes you don't get in school, and a bunch of fun options with which to fill up the free time after classes.  This evening, for instance, you've signed up for a scavenger hunt....";
	ifndef debug;
	pause the game;  [this breaks the skein otherwise]
	enddef debug;
	say "LEAP, Day 2.  Evening.[paragraph break]'Okay, kids!' Michelle, the counselor in charge of the scavenger hunt option waves her hands to settle the crowd around you, before finally remembering her whistle.  A brief [i]fweep[r] sweeps through the room.  'Okay, does everyone have their list?  Everyone good?  Okay!  You have until 8:25 pm to find everything on your lists, return here, and show me your lists so I can check them.  So synchronize your watches... are we all in sync?  Good!  Your time starts... now!'[paragraph break]Michelle's whistle gives another sharp fweep, and the room practically empties as everyone else runs off to begin their hunt.  Everyone except you: there's a sudden pressure in the back of your throat, and you feel dizzy ... it only lasts a moment, but by then everyone else is gone, leaving you alone."; 

Book 2 - Actions

Part 1 - tweaking the standard actions 

Chapter 1 - getting containers and supporters confused

First check inserting something into a supporter (called parent): if the parent is not [also] a container, try putting the noun on the second noun instead.

First check putting something on a container (called parent): if the parent is not [also] a supporter, try inserting the noun into the second noun instead.

Understand the command "place" as "put".
Understand the command "peek" as "look".

Chapter 2 - pat yourself down

[this game uses FOCUS/SENSE/FEEL for its main dramatic action. But it's a transitive verb, so its only a matter of time until the typical kid types FEEL ME or TOUCH ME.  In that case, INVENTORY, as a sentence.]

First check touching yourself: say "You pat yourself down.  You have "; list the contents of the player, as a sentence, including contents; say "." instead.

Chapter 3 - looking and inventory out of world



Chapter 4 - (not) Unlocking dorm doors

Understand "unlock [dorm door]" as a mistake ("Your room key won't unlock this door.").

Chapter 5 - kicking

Understand "i know kung fu" as a mistake ("Show me.").

Understand the commands "kick" as "attack".
Understand "kung fu [something]", "karate chop/kick [something]", or "judo chop/kick [something]" as attacking.

Last check attacking when in chapter 9: say "You [one of]karate[or]judo[or]flying[purely at random] [one of]chop[or]kick[or]punch[purely at random] [the noun]." instead.
Last check attacking: say "You don't know kung fu!" instead.

The block attacking rule is not listed in the check attacking rules.

Chapter 6 - cutting and shooting

Understand the commands "slice", "prune", "cut" and "chop" as something new.
Understand the commands "slice", "prune", "cut" and "chop" as "attack".

Understand the commands "shoot" and "fire" as "attack".

Understand "aim" or "aim [text]" as a mistake ("[if in chapter 6]Thy mind cleareth...[otherwise]Your mind clears...")


Chapter 7 - fine means yes

Understand "i'm fine" or "fine" or "i am fine" as saying yes. [someone's "how are you" was rhetorical ]

Chapter 8 - singing

The block singing rule is not listed in any rulebook. 
Last check singing (this is the braying mule rule): say "[if Visiting Stacy-and-Ava has not happened]Your friend [end if]Ava's the singer, not you." instead.

Chapter 9 - looking through binoculars at

Understand "look inside/in/into/through [something] at/toward [something]" as a mistake ("[try searching the noun]").
Understand "use [something] to look inside/in/into/through/at/to/toward [something]" as a mistake ("[try searching the noun]").
Understand "look at/-- [something] by/using/via/with [something]" as a mistake ("[try searching the second noun]").


Part 1 - Focusing on

Focusing on is an action applying to one visible thing. 

Understand "focus", "focus on", "feel", "sense", "concentrate", "focus on [something]", "focus [something]", "concentrate on [something]", "sense [something]" as focusing on.
Understand "focus [text]", "focus on [text]", "sense [text]", "concentrate on [text]" as a mistake ("[run paragraph on][try focusing on the location][run paragraph on]  ").[ when the player has been aware of an emotional residue].   [removed the condition to remove parser error on FOCUS commands -- it set up false expectations that the words are unknown by the game]

Understand "focus [direction]", "focus on [direction]", "concentrate on [direction]", "sense [direction]" as facing when the location is the Maelstrom.

Rule for supplying a missing noun when focusing on:
	if there is a salient emotional residue:
		change the noun to a random salient emotional residue;
	otherwise:
		change the noun to the location;

Check focusing on yourself: placeholder "Snark." instead.

Last check focusing on something which is a part of someone (called the target): try focusing on the target instead.

Last report focusing on an emotional residue: consider the focusing rules for the noun instead.

Last report focusing on: say "You sense nothing untoward or out of the ordinary here." instead.

The focusing rules are an object-based rulebook.

Part 2 - Amplifying others' emotions

A toolbox emotion is a kind of value. The toolbox emotions are calm, anger, fear, curiosity, love. [As opposed to Contentment, as any writer will tell you that happy characters are boring characters.  :) ]

Understand "soothe/sooth/placid/calmness/normal" as calm.
Understand "rage/enrage/angered/angry/mad/madder/hate/hatred/hateful/mean/aggression/aggro" as anger.
Understand "fright/scare/scared/frighten/startle/frightened" as fear.
Understand "curious/curiousness/inquisitiveness/wonder/wonderment/awe/interest/interested" as curiosity.
Understand "concern/love/care/protection" or "brotherly/fraternal/familial" or "platonic" or "romantic/romance" as love.

[After reading a command when the player's command includes "muffle/dampen/decrease [calm]": say "Er, that could go in any number of directions. Try amplifying [list of every toolbox emotion except calm]."; reject the player's command.]

After reading a command when the player's command includes "muffle/dampen/decrease [toolbox emotion]", replace the matched text with "calm". [note: I implement Dampening any emotion as equivalent to Amplifying Calm ]

Amplifying it for is an action applying to one toolbox emotion and one visible thing.
Understand "[toolbox emotion]", "[toolbox emotion] [someone]", or "amplify [toolbox emotion]" or "amplify [toolbox emotion] for/to/with/by/into/in/from/on/within/onto [someone]" as amplifying it for. 
Understand "[someone] [toolbox emotion]", "amplify [someone] [toolbox emotion]" or "make [someone] [toolbox emotion]" as amplifying it for (with nouns reversed).  
Understand the commands "increase", "intensify", "grow", "magnify" as "amplify".    

Last report an actor amplifying: placeholder "Little effect." instead.


Part 3 - Folding (newspaper)

Folding is an action applying to one carried thing.

Understand "fold [something]" as folding.
Understand "fold up [something]" as folding.
Understand "fold [something] up/over" as folding.

Folding it into is an action applying to one thing and one topic.

Understand "fold [something] into [text]" as folding it into.
Understand "fold [something] up into [text]" as folding it into.
Understand "fold up [something] into [text]" as folding it into.

Understand the command "roll" as something new. 
Understand the commands "furl", "curl", "roll" as "fold".
Understand "roll [something] over" as folding.

Check folding it into: try folding the noun instead.
Carry out folding: if the noun is not fixed in place, try silently taking the noun. [we must fold the big flag before taking it] 
Last report folding: say "You ponder making an origami [noun]." instead.

Understand the command "unfold", "unfurl" as "open".

Last instead of opening something unopenable when we have folded the noun: say "You unfold [the noun]."; rule succeeds.



Part 4 - Playing (the piano)

Playing is an action applying to one thing.

Understand the command "play" as something new.
Understand "play [something]" as playing. 

Report playing the piano: say "You amuse yourself with 'Chopsticks'." instead.

Last report playing: say "You fool around with it until your ears bleed.  Which wasn't long." instead.

Part 5 - Knocking

Knocking on is an action applying to one thing.

Understand "knock" as knocking on.
Understand "knock [door]" as knocking on.
Understand "knock on/at [door]" as knocking on.

Rule for supplying a missing noun when knocking on[ and the number of doors in the location is 1]: 
	now the noun is a random door in the location.
[Rule for supplying a missing noun while knocking on: now the noun is the holder of the player.]

Check attacking a door: try knocking on the noun instead.

Last report knocking on: say "You get no reply." instead.

Part 6 - Hiding it under

Hiding it under is an action applying to two things.

Understand "hide under [something]" as hiding it under. 
Understand "hide [something] under [something]" as hiding it under (with nouns reversed). 

Rule for supplying a missing noun while hiding something under: now the noun is the player.

Check hiding yourself under: say "Why?  You don't have to hide from anyone." instead.

Check hiding something under: say "Oh, very funny." instead.

Check hiding yourself under when in chapter 8: say "Aidan may be pumped full of sedatives, but they're not going to make him stupid enough to miss you crawling under there!" instead.

Understand "put [something preferably held] under [something]" as hiding it under.


Part 7 - Shouting at

Shouting at is an action applying to one visible thing.

Understand the command "shout" as something new.
Understand "shout" as shouting at.
Understand "shout at/to/down [something]" as shouting at.
Understand "call to/at/over [something]" as shouting at.
Understand "shout [text]" as a mistake ("[run paragraph on][if an air vent is in the location][try shouting at a random air vent][otherwise][try shouting at nothing][end if][run paragraph on]").

Understand "call [text] to [someone]" as asking it about (with nouns reversed).

Understand the commands "yell", "scream", "cry", "bellow", "wail", or "yelp" as "shout".

Rule for supplying a missing noun when shouting at: change the noun to the location.

Report shouting at yourself: say "Must you berate yourself?" instead.
Report shouting at someone: say "[The noun] frowns at you." instead.
Report shouting at something: say "There's no use shouting at [the noun]." instead.
Report shouting at: say "Must you draw attention to yourself?" instead.


Part 8 - Singing whatever

Singing a little is an action applying to one topic. 

Understand "sing [text]" or "hum [text]" or "belt out [text]" as singing a little. 

Last report singing a little: say "You [one of]hum[or]sing[or]belt out[cycling] a few bars, but it seems this [one of][or][or]really [cycling]isn't your strong suit." instead. 

Last report someone singing a little: say "[The actor] sings [the topic understood] a bit, to little effect." instead.  


Part 9 - Empty out 

Understand "empty [something]" or "empty out/from [something]" as emptying. 
Understand the commands "unpack", "void", "unload", or "vacate" as "empty".

Emptying is an action applying to one thing. 

Carry out emptying a supporter: 
	if the holder of the noun is a container, now everything on the noun is in the holder of the noun;
	otherwise now everything on the noun is on the holder of the noun.

Carry out emptying a container: 
	if the holder of the noun is a container, now everything in the noun is in the holder of the noun;
	otherwise now everything in the noun is on the holder of the noun.

Last report emptying a container: say "You dump everything out of [the noun]." instead.
Last report emptying a supporter: say "You sweep everything off of [the noun]." instead.
Last report emptying: say "It doesn't have anything." instead.

[The unlikely to mean removing unworn things rule is not listed in the does the player mean rulebook. ]  [throws error]


Part 10 - Inquiring someone About an object

To say (p - a person) quips (q - a quip): start conversation with p on q. [ Connects Inquiring It About to the Quip system.   The former system of using ASK Person ABOUT "Topic" was broken because, in the "conversation table of the Person", the topic column has to have the topics for all the objects in the game re-listed within it. This is error-prone, laborious, and destroys any parsing intelligence such as disambiguation, scope, does-the-player-mean fine tuning, etc.  So I've created an ASK Person ABOUT Object (Inquiring It About) which consults the "object-based conversation table of the Person" for objects, once Inform has run its full parsing AI on what the heck the player meant by "TAKE RED". The above Say phrase allows me to marry the ASK ABOUT Object system's parsing to the pre-existing Quip system's dialogue-threading. Win-win. ]

[For each character, use like the following.  Note that the default reply is the first row of the table. This allows it to be character-specific without writing additional rules or proxy objects. 
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

Understand "ask [someone] about [any thing]" or "ask about/-- [any thing]" or "a about/-- [any thing]" as inquiring it about. Inquiring it about is an action applying to one thing and one visible thing. Does the player mean inquiring someone about something (called the subject) (this is the assume conversation about present things rule): if the subject is in the location, it is very likely[; otherwise say "Not applicable."].  Does the player mean inquiring someone about something (called the subject) (this is the assume non-conversation about off-stage things rule): if the subject is off-stage, it is unlikely[; otherwise say "Not applicable."].  Rule for supplying a missing noun when inquiring something about something (this is the assume conversation with the only person here rule): if the number of people in the location who are not the player is 1, change the noun to a random person in the location who is not the player.

Report inquiring something about a conversation listed in (the object-based conversation table of the noun) (this is the chooses response per object rule): say "[the reply entry][line break]" instead.

Carry out inquiring something about an achieved goal (this is the blank-out goals from conv tables rule):
	if the second noun is a conversation listed in (the object-based conversation table of the noun):
		choose row with a conversation of the second noun in (the object-based conversation table of the noun);
		blank out the whole row.

Last report inquiring it about when (the object-based conversation table of the noun) is not the default value of table name (this is the chooses default response per unknown object rule): 
	choose row 1 in the object-based conversation table of the noun;
	say "[the reply entry][line break]" instead.

Last report inquiring it about when (the object-based conversation table of the noun) is the default value of table name (this is the inquire action has no idea rule): 
	try talking to the noun instead.

Check asking someone about "themself/theirself/himself/herself": try inquiring the noun about the noun instead.

[TODO:   when i DOES THE PLAYER MEAN, if there is more than one final option with equal rank, *everything* is written. ]


Part 12 - going and EXITS

[The action is in the Textfyre Standard Rules, but as a novice player myself, EXITS is much more useful as a response to Going Nowhere than the standard response... or even as an explicit EXITS command itself.  --Ron]

Check going nowhere: try listing exits instead. 

After printing the name of a direction (called the way) while listing exits:
	if the room way from the location is visited, say " (to [the room way from the location])".

Understand "go","walk","run" or "go [text]","walk [text]","run [text]" as a mistake ("[run paragraph on][try going nothing][run paragraph on]  "). The block vaguely going rule is not listed in any rulebook. 

Understand "back","go back", "return" as a mistake ("[try going the opposite of the previously-gone direction]"). [BUG: the whole going action is performed as out of world. ]

First carry out going when the room gone to is exterior and the room gone from is interior and in chapter 1: say "You step out into the bright sunshine."

First carry out going when the room gone to is interior and the room gone from is exterior and in chapter 1: say "You leave behind the bright sunshine."

Carry out going: now the previously-gone direction is the noun.

The previously-gone direction is a direction that varies. The previously-gone direction is usually north. [from Your Room to info desk]


Part 13 - kinds of talking

Asking someone about [topic/text] is conversing.
Asking someone for [an object] is conversing.
Inquiring someone about [an object] is conversing.
Talking to someone is conversing.
[Telling someone about is conversing.] [ telling it about & answering it that have been folded into asking it about ]
Selecting menu option is conversing. [almost always, anyway]


Part 14 - examining rooms

Understand "x [any room]" or "examine [any room]"  as room-examining.  Room-examining is an action [out of world] applying to one visible object.  Does the player mean room-examining the location: it is very likely.   Rule for clarifying the parser's choice of the location: do nothing.  Check room-examining when the noun is not visited: ifndef debug; say "You've never been to [the noun] so you can't recall." instead; enddef debug. Check room-examining when the noun is not the location: say "You can't see [the noun] because you're not there.  You think you can get there by going [directions from the location to the noun]." instead.  Carry out room-examining: try looking.

[deal with name-masking]
Does the player mean room-examining pits lobby east: it is unlikely.
Does the player mean room-examining pits lobby west: it is unlikely.

your room is visited.

[I am so proud of myself for being able to write this without using global variables, and only one local variable. :)  -RN]
To say directions from (source - a room) to (destination - a room):
	if source is not a room or destination is not a room:
		say "... well actually you have no idea";
		stop; 
	let forward be the best route from the source to the destination, using even locked doors; [during play, this function is only called for visited places]
	if forward is not a direction:
		say "... well actually you're not quite sure";
		stop; 
	now source is the room forward from the source;
	if source is not a room:
		say "... well actually you're not quite sure";
		stop;
	if the source is the destination, say "[unless the destination is the room forward from the location]and [end unless][forward]";
	otherwise say "[forward], [directions from source to destination]".  [recurse!]
	[otherwise say "[forward] to [the source], [directions from source to destination]".]

part 15 - enter room

[Understand "enter [any room]" or "go to/into [any room]" or "go [any room]" or "run to/into [any room]" or "run [any room]" or "walk [any room]" or "walk to/into [any room]" as nominal-going. Nominal-going is an action applying to one visible thing. Check nominal-going to a room which is not adjacent: try room-examining the noun instead.  Check nominal-going to an adjacent room: 
	let aim be the best route from the location to the noun, using doors; 
	if aim is not a direction, say "You can't think how to get there from here." instead; 
	say "(heading [aim])[command clarification break]"; 
	try going aim instead.
]

Part 16 - examining & taking unimplemented things

Understand "x [text]" or "examine [text]" as unknown-examining. unknown-examining is an action [out of world] applying to one topic. Check unknown-examining: [out-of-world actions don't set THE TOPIC UNDERSTOOD. reported to graham ]
	let possible term be indexed text;
	let possible term be the topic understood;
	replace the text "^\s*(the|a|an|my|his|her|your|their|our|another)\s" in the possible term with "";
	if the description of the location matches the regular expression "\b[possible term]\b", case insensitively:
		replace the text "\B(es|s)\b" in the possible term with "";
		say "[one of]The [possible term] doesn't look very interesting.[or]The [possible term] looks like every other [possible term] you've ever seen.[or]You don't find the [possible term] all that interesting, really.[or]It's very [possible term]-like.[at random]";
	otherwise:
		say "You can't see such a thing." instead;

Understand "take [text]" or "get [text]" as unknown-taking. Unknown-taking is an action applying to one topic. Check unknown-taking:
	let possible term be indexed text;
	let possible term be the topic understood;
	replace the text "^\s*(the|a|an|my|his|her|your|their|our|another)\s" in the possible term with "";
	if the description of the location matches the regular expression "\b[possible term]\b", case insensitively:
		replace the text "\B(es|s)\b" in the possible term with "";
		say "[one of]The [possible term] doesn't look very interesting.[or]The [possible term] looks like every other [possible term] you've ever seen.[or]You don't find the [possible term] all that interesting, really.[or]It's very [possible term]-like.[at random]";
	otherwise:
		say "You can't see such a thing." instead;
	


Part 17 - score

Understand the command "score" or "full score" as something new.
Understand "score" or "full score" as a mistake ("[just list the player's goals]"). 
To say just list the player's goals: list the player's goals.

Part 18 - Waiting Until - not for release

Understand "wait until [time]" as waiting until. Waiting until is an action applying to one time. Carry out waiting until: now the time of day is the time understood; say "Time flies.  It is now [the time of day]." 

Part 19 - story command

Understand "story" as a mistake ("[placeholder]the story thus far[end placeholder]").


Part 20 - Swapping 

Swapping it with is an action applying to two things. Understand "swap [something] with [something]" or "replace [something] with [something]" or "exchange [something] with [something]" as swapping it with when robot fun is happening. 
First check swapping an unplugged slot with an unplugged slot: 
	say "Neither slot has anything in it." instead.
Check swapping a plugged slot with (this is the typecast first slot rule):
	change the noun to a random logic block in the noun.
Check swapping something with a plugged slot (this is the typecast second slot rule): 
	change the second noun to a random logic block in the second noun.
Check swapping (this is the convert swap to insert rule):
	if the noun is an unplugged slot, try inserting the second noun into the noun instead;
	if the second noun is an unplugged slot, try inserting the noun into the second noun instead.
Carry out swapping it with: 
	let the first place be the holder of the noun; 
	let the second place be the holder of the second noun; 
	unless the noun is nothing, silently try taking the noun; 
	unless the second noun is nothing, silently try taking the second noun; 
	unless the noun is nothing or the second place is nothing, silently try inserting the noun into the second place; 
	unless the second noun is nothing or the first place is nothing, silently try inserting the second noun into the first place.
Report swapping it with: say "You place the [the noun] into [the holder of the noun] and [the second noun] into [the holder of the second noun]."

Part 21 - Persuasion

A persuasion rule for asking someone to try examining: say "[The person asked] glances at [the noun].  'What about it?'" instead.

A persuasion rule for asking someone to try looking: say "[The person asked] looks around.  'What?'" instead.


Book 3 - Definitions

Part 1 - Dictionary

Chapter 1 - kinds for code

A hat is a kind of thing. A hat is always wearable. A hat can be girly. A hat can be Stacy-esque.

A ring is a kind of thing.  A ring is always wearable. There are 2 rings. The printed name of a ring is usually "gold ring". The printed plural name of a ring is usually "gold rings". Understand "ring" or "gold" as a ring.

Chapter 2 - topics just for ASK ABOUT

Understand "lean on me" or "Bill Withers song/--" as "[lean on me]".   
Understand "jeremy/dolan" or "jeremy dolan" as "[jeremy]".
Understand "damon/rose" or "damon/professor rose/damon" as "[damon]".
Understand "antonia/long" or "antonia/professor long/antonia" or "robotics" as "[antonia]".
Understand "Nana Mouskouri" or "nana" or "mouskouri" as "[mouskouri]".
Understand "Voice lessons", "singing", "lessons" as "[singing]".
Understand "power/powers/superpower/superpowers/empath/empathy/empathic" as "[powers]".
Understand "food" or "camp/cafeteria food" as "[food]".
Understand "cooking" or "cooking class" or "class" as "[cooking]".
Understand "SARG" or "robot" as "[robot]".
Understand "Dr", "Hu", or "Dr Hu" as "[hu]". [IMPORTANT:  Hu's on first. ]
Understand "help", "bullies/bully/bullying", "crystal", "earth crystal", "hank and/& joe", or "joe and/& hank" as "[bullying]".
Understand "himself" or "his family/father/mother" or "family/father/mother" as "[family]".
Understand "grandmother" or "gran" or "granny" or "grannie" or "grandma" or "granma" or "gramps" or "grandparent" or "grandparents" or "old lady" as "[grandmother]".
Understand "peter" or "school" or "teacher" or "class" or "class photo" as "[peter]".
Understand "crashing" or "crash" or "smash" or "noise" or "sound" as "[noise]".



Chapter 3 - other synonyms, abbreviations, and adverbs

[These dictionary words are useable in so many different contexts it would be a chore to attach an Understand to each object/room/value/whatever for each of them. ]

To decide which snippet is the first word: (- 101 -).
To update the player's command: (- players_command = 100 + WordCount(); -).

[Understand "[something related by reversed possession] s" as a thing.]
Understand "my/your/his/our/their/thier" as a thing.

After reading a command (this is the common synonyms and abbreviations rule):
	resolve punctuated titles;
	remove stray punctuation;
	update the player's command;  [fixes a bug in Punctuation Removal extension:  YES ?  rather than   YES?   ]
	if the player's command includes "ave", replace the matched text with "avenue";
	if the player's command includes "any", replace the matched text with "a";
	if the player's command includes "#/number", cut the matched text;
	if the player's command includes "1st", replace the matched text with "first";
	if the player's command includes "2nd", replace the matched text with "second";
	if the player's command includes "3rd", replace the matched text with "third";
	if the player's command includes "basement", replace the matched text with "pits";
	if the player's command includes "ground floor", replace the matched text with "first floor";
	if the player's command includes "anyway/whole/entire/just", cut the matched text;
	if the player's command includes "again" and the first word does not match "again", cut the matched text;
	if the player's command includes "remove all/everything from", replace the matched text with "empty";


Part 2 - implicit action reporting

First for implicitly opening something (called what's closed) : try silently opening what's closed.

Part 3 - Scavenger Hunt

A scavenger hunt goal is a kind of goal. Some scavenger hunt goals are defined by the table of scavenger-hunt-goals.

Table of scavenger-hunt-goals
scavenger hunt goal	printed name
the newspaper-goal	"find[if achieved]ing[end if] a newspaper"
the feather-goal		"find[if achieved]ing[end if] a feather"
the flag-goal		"find[if achieved]ing[end if] a flag"
the star-goal		"find[if achieved]ing[end if] a star"
the dinosaur-goal	"find[if achieved]ing[end if] a dinosaur"
the hat-goal		"find[if achieved]ing[end if] a hat"
the life-goal		"find[if achieved]ing[end if] something that was once alive"

A goal-scoring rule for a scavenger hunt goal (called G) (this is the scavenger goal eval rule): if the player has something that fulfills G, goal achieved.


Part 4 - fulfilling Goals

A goal has some [say-phrase-enabled] text called the win condition. 
The win condition outcome is a number that varies. 
To say goal achieved: now the win condition outcome is 1.
To say goal thwarted: now the win condition outcome is 2.

Last goal-scoring rule for a goal (called G) (this is the O-n running time goal eval rule):
	now the win condition outcome is 0;
	say "[run paragraph on][win condition of G][run paragraph on]";
	if the win condition outcome is:
		-- 1: goal achieved;
		-- 2: goal thwarted.

Fulfillment relates various things to various scavenger hunt goals.

The verb to be fulfilled by implies the reversed fulfillment relation.
The verb to fulfill (he fulfills, they fulfill) implies the fulfillment relation.


Part 5 - Class Options (ping pong, eggdrop, rap and rock music, etc)

An option is a kind of thing. An option is usually scenery.

Check taking an option: say "Maybe tomorrow." instead.

Check listening when the school of rock option is in the location and in chapter 1: say "Hey, they're not bad.  A bit too loud, but not bad at all.  At least, the loudness covers up any mistakes they may be making." instead.

Check jumping when the school of rock option is in the location: say "You execute a few freestyle steps, much to the amusement of the musicians." instead.  Understand "dance" as jumping when the school of rock option is in the location.

Understand "enrol in/for [option]" as taking.
Understand "enroll in/for [option]" as taking.
Understand "participate in [option]" as taking.
Understand "join [option]" as taking.
Understand "join in/with [option]" as taking.
Understand "join in with [option]" as taking.

Understand "campers", "students", "people" as an option.

An option has a room called the venue.

When play begins:
	repeat with o running through options:
		change the venue of o to the location of o;

Part 6 - Quip, Trigger, & miscellaneous extension additions

A quip can be available or unavailable. A quip is usually available.

Does the player mean doing something with a quip: it is very unlikely.

Rule for printing the description of something scenery (called item) when the description of the item is "" and the initial appearance of the item is not "" (this is the substitute initial appearance for missing scenery description rule): say "[the initial appearance of the item][line break]" instead.  [todo check this]


Part 7 - Dispensers and Representation

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

First check taking a dispenser: [formerly a procedural rule]
	ignore the can't take scenery rule;
	ignore the can't take what's fixed in place rule;
	ignore the can't take component parts rule.

Check taking a dispenser when nothing is vended by the noun:
	say "No need." instead.

Check taking a dispenser when the prize of the noun is enclosed by the location:
	say "You already have one [prize of the noun][if the player does not have the prize of the noun] right in front of you[otherwise], and don't need another one[end if]." instead.

Last check taking a dispenser:
	if the prize of the noun is off-stage, move the prize of the noun to the location; 
	try taking the prize of the noun; 
	if the rule failed, remove the prize of the noun from play instead;
	otherwise the rule succeeds.

Report taking something vended by something: say "You take [a noun]." instead.

Does the player mean taking or dropping a dispenser (called the vendor): if the prize of the vendor is in the location, it is unlikely. 
Rule for clarifying the parser's choice of something vended by something (called the vendor): if the vendor is in the location, do nothing instead. [skips the "(the red flag)" disambiguation message when dealing with The Red Flag in the presence of The Pile Of Red Flags.]

[Does the player mean taking or dropping the pile of red flags when the red flag is in the location: it is unlikely. 
Rule for clarifying the parser's choice of the red flag when the pile of red flags is in the location: say nothing.]

Part 8 - Cutouts of various types

A thing can be cardboard. 
A thing is usually not cardboard.

Understand "cardboard", "card board", "card", "picture/pictures of", "image/images of" as cardboard.
Understand "cutout", "cut out", "cut-out" as cardboard when the item described is a wall cutout.

Section 1 - Cutout Pouches

A cutout pouch is a kind of dispenser, privately-named. The printed name of a cutout pouch is usually "pouch". Understand "pouch" as a cutout pouch.  Understand "pouch of", "[something related by reversed representation]", "pouch" as a cutout pouch when the player's command matches the text "pouch", case insensitively.

Check searching a cutout pouch: try examining the noun instead.

Section 2 - Life-sized cutouts

A life-sized cutout is a kind of thing, scenery. Some life-sized cutouts are defined by the table of cardboard people.

Table of cardboard people
life-sized cutout
Stephan Eberharter
Frankenstein's Monster
Audrey Hepburn in her role as Holly Golightly
An astronaut

A life-sized cutout can be lifesized. A life-sized cutout is usually lifesized.
Understand the lifesized property as referring to a life-sized cutout. Understand "life-sized", "life sized" as lifesized.

A life-sized cutout is usually cardboard. Understand the cardboard property as referring to a life-sized cutout.

A cutout pouch is part of every life-sized cutout.

Stephan Eberharter is in the first floor midpoint.
Frankenstein's Monster is in the pits stairwell.
Audrey Hepburn in her role as Holly Golightly is in the second floor lobby.
An astronaut is in the third floor lobby.

Before printing the name of a life-sized cutout (called item):
	say "life-sized cardboard cutout of ";
	if the item is Stephan Eberharter, say "Olympic ski champion ".

Stephan Eberharter is improper-named.
Frankenstein's Monster is improper-named.
Audrey Hepburn in her role as Holly Golightly is improper-named.

Check taking a life-sized cutout when a cutout pouch is apparent:
	try taking a random apparent cutout pouch instead.

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

The images of classic horror are in pits west, pits stairwell, pits east.
The images of winter sports are in the first floor rooms west, the first floor midpoint, the first floor rooms east.
The images of Hollywood stars are in the second floor rooms west, the second floor lobby, the second floor rooms east. Understand "actor/actors" as the images of Hollywood stars.
The images of stellar bodies are in the third floor rooms west, the third floor lobby, the third floor rooms east.

Check taking a wall cutout when a cutout pouch is apparent:
	try taking a random apparent cutout pouch instead.

Part 9 - Dorm Rooms as a kind of room

A Dorm Room is a kind of room.  A dorm door is a kind of door. 

[Inhabitation relates various people to one Dorm Room (called home). The verb to inhabit (he inhabits, they inhabit, he inhabited, it is inhabited, he is inhabiting) implies the inhabitation relation.

The verb to be occupied by implies the reversed inhabitation relation.

The player inhabits your room.] [i can see where this bit of code is going, but it doesn't seem necessary.  ]

Rule for printing the name of the HVAC room when in the HVAC room: say "HVAC Room". 

Rule for printing the name of a room (called the spot) while looking (this is the room heading in title caps rule): 
	let N be indexed text;
	let N be the printed name of the spot;
	replace the regular expression "\s(north|west|south|east)$" in N with ", \1", case insensitively;
	replace the regular expression "\s\d+$" in N with ""; [twisty passages #1, 2, 3, etc]
	say N in title case.

Rule for printing the name of a room (called the spot) while listing exits (this is the remove trailing directional from room name rule): 
	let N be indexed text;
	let N be the printed name of the spot;
	replace the regular expression "\s(north|west|south|east)$" in N with "", case insensitively;
	replace the regular expression "\s\d+$" in N with "";[twisty passages #1, 2, 3, etc]
	say N.

To say the location in title case:
	let N be indexed text;
	let N be the printed name of the location;
	replace the regular expression "\s\d+$" in N with ""; [twisty passages #1, 2, 3, etc]
	say the N in title case.
	

Part 10 - classrooms as a kind of room

An unimportant classroom is a kind of room. 

Part 11 - Buildings & University Buildings as backdrops

A building is a kind of backdrop. A university building is a kind of building.

The windows of Jacobs Hall are a kind of backdrop.  The windows of Jacobs Hall are usually privately-named. Understand "locked", "sealed", "window" as windows of Jacobs Hall.  The printed name of windows of Jacobs Hall is usually "window".

Check searching the windows of Jacobs Hall: try examining the noun instead.

The campus grounds region is a region.   

Part 12 - Emotional residues

An emotional residue is a kind of thing.

Tainting relates various emotional residues to various rooms. The verb to taint (he taints, they taint, he tainted, it is tainted, it is tainting) implies the tainting relation.

Emotional-Awareness relates one person to various emotional residues.
The verb to be aware of implies the emotional-awareness relation.
The verb to be able to sense (it is sensed) implies the emotional-awareness relation.

Definition: an emotional residue is salient if the player can sense it and it taints the location.

After printing the description of a room (called R) when an emotional residue is salient:
	if R is the location:
		repeat with E running through salient emotional residues:
			carry out the printing the description activity with E;

Part 13 - Identified / Unidentified Things (and people)

[This is to do with "real names".]

A thing can be identified or unidentified. A thing is usually identified.

An unidentified thing is usually improper-named.

To identify (x - a thing):
	now x is identified;
	now x is proper-named;

Part 14 - Major and minor Goals

A goal can be major or minor. A goal is usually minor.

The goal-tidying rules are a rulebook.

A goal-tidying rule (this is the tidy recently achieved goals rule):
	remove the list of minor goals from the recently achieved goals;

A goal-tidying rule (this is the tidy current goals rule):
	remove the list of minor goals from the current goals;

Part 14 - Major and minor Scenes

A scene can be chapter-length.  A scene is usually not chapter-length.

When a chapter-length scene ends (this is the clear player pronouns rule):
	change the personal pronouns to nothing;
	change the pronoun it to nothing;
	change the pronoun they to nothing.

Last when a chapter-length scene begins (this is the set player pronouns to something meaningful rule):
	if a man which is not the player is in the location, change the pronoun him to a random man in the location;
	if a woman is in the location, change the pronoun her to a random woman in the location;
	if Stacy is in the location and Ava is in the location, change the pronoun them to Stacy;
	if Ava is in the location and Stacy is not in the location, change the pronoun them to Ava.

To show scene status: (- ShowSceneStatus(); -).

[When a scene begins, show scene status. ]

Part 15 - Group friends together

Friendship relates various people to each other.
The verb to be friends with implies the friendship relation.

Yourself is friends with Stacy Alexander.
Yourself is friends with Ava Winters.
Ava Winters is friends with Stacy Alexander.

Definition: a person is friends if the player is friends with them.

Before listing contents of a room: group friends together.

Before grouping together friends: say "your friends ".


Book 4 - Jacobs Hall Map

Part 1 - lobby west

Chapter 1 - Description

The first floor lobby west is a room. "This used to be the living room, back when [one of]Alexander Quaverley Jacobs, the eccentric old coot who donated this place to the university[or]old AQJ[stopping] was still alive and the university was just starting up.  It's got a huge fireplace, and a big bay window looking out onto the front lawn.  It's also been painted completely white from floor to ceiling, so thickly that you're not sure if some of the molding is not actually just bubbles under the paint.  The info desk is back through the arch to the north, and the lobby continues, through another arch, to the west.[paragraph break]A large brass plaque has been fixed into the space over the fireplace."


Chapter 2 - Scenery

Check room-examining the info desk when in the first floor lobby west: placeholder "This should describe the graffiti option. I really like windows as a technique for tightening the interconnections in the game world. -POB" instead.

A painted fireplace is scenery, in the first floor lobby west. "No-one uses it any more, of course, but it still looks nice.  Even with all that white paint slathered all over it."

The white paint is a backdrop, in the first floor lobby west. "It was the fashion, back in the 1950s, to try to make a place look more modern by painting it white.  It's not the 1950s anymore, but apparently nobody ever told the custodians that." Understand "50s", "fifties", "1950s", "nineteen-fifties", "nineteen fifties" as the white paint.

A bay window is scenery, in the first floor lobby west. "[if in chapter 1]Normally you can see all of the front lawn spread out from here, but right now there's been temporary walls set up all over the lawn[otherwise]It's dark outside.  You can see some of the temporary walls set up on the front lawn, but that's about it[end if]."

The elaborate wood molding is scenery, in the first floor lobby west. "It's pretty elaborate, and almost makes you dizzy as you follow the pattern across the -- oh wait, those are just air bubbles under the paint."

Some air bubbles are scenery, in the first floor lobby west. "They're annoyingly random.  You don't know why the original painters couldn't have taken the trouble to -- oh wait, that's actually an elaborate wood molding."

A plaque shaped like a shield is scenery, in the first floor lobby west. "It's shaped like a shield, and commemorates the memory of Damon Rose, one of the founders of LEAP.  You remember him quite well from last year.  It was quite a shock to hear about the accident, and there was some question as to whether LEAP could go on without him.  His sister, Claudia Rose, is in charge of LEAP now, and making sure that the good work goes on.  She seems like a nice lady, but she's just not quite as present as old Damon Rose used to be."

Chapter 3 - Michelle

Section 1 - description of Michelle

Counselor Michelle Close is a woman, in the info desk. "Michelle Close leans against the side of the desk, chewing on a pencil."  The description of Michelle Close is "Michelle Close is one of the counselors.  She's slightly untidy-looking, with a big explosion of curly black hair and a pencil tucked behind one ear."  Understand "Counsellor" as Michelle Close. The printed name of Michelle Close is "Michelle".  

Michelle Close wears Michelle's whistle. Michelle's whistle is improper-named. The printed name of Michelle's whistle is "whistle".

Michelle's pencil is carried by Michelle.  "It's a yellow stub of an HB pencil.  The eraser is gone from one end, and it looks like someone's been sharpening it with their teeth." Michelle's pencil is improper-named scenery. The printed name of Michelle's pencil is "pencil".  

Michelle's hair is scenery part of Michelle. "It makes her head look three times its size."

Section 2 - actions on Michelle and her stuff

Instead of taking, pushing, [Moving,] or pulling Michelle's pencil, say "After Michelle's been chewing on it?  Eww."
Check eating Michelle's pencil: say "Sure, it's probably tastier than the dining hall chow, but Michelle isn't going to give it up so easily." instead.
Check attacking Michelle's pencil: say "While Michelle's still chewing on it? That's just rude." instead.
Check focusing on Michelle's pencil: say "You stare intently at the pencil.  It does not tie itself into a knot." instead.

Instead of taking, [moving,] pushing, or pulling Michelle's hair, say "Surprisingly, it is not a wig."
Check Eating Michelle's hair: say "Eww!!" instead.
Check focusing on Michelle's hair: say "You stare intently at Michelle's head.  Question now is, do you really want to creep out the counselors that badly?" instead.

Instead of taking, pushing, [[moving,]] or pulling Michelle, say "Don't be rude."
Instead of eating or attacking Michelle, say "That's a sure way to get yourself kicked out of LEAP, and you don't want that."
Check focusing on Michelle: say "You stare intently at Michelle.  She feels a little creeped out by this." instead.

Section 3 - conversation with Michelle

[The conversation table of Michelle is the table of Michelle's conversation.]
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
LEAP flyers		"'You already know all about that, don't you?  I mean, it's your second year, after all.'"


Report asking MIchelle about "[jeremy]": say "[about anyone else][line break]" instead.
Report asking Michelle about "[damon]": say "'It was terrible about what happened, wasn't it?'  Michelle is silent for a moment, then says, 'no use thinking about that now!  Don't you have a treasure hunt to do?'" instead.
Report asking Michelle about "[antonia]": say "'Antonia's a good friend, and a very intelligent person.  You're registered for her robotics class, right?  I thought I saw your name on the registration form.'" instead.


To say about newspaper: say "[run paragraph on][if player has a newspaper]'Be careful you don't get ink all over your fingers!'[otherwise if the player has been able to see the vending machine]'Why Daniel, I am so very pleased that you're taking an interest in current events!'  She drops just enough change for the newspaper machine into your hand, and winks.  'At least, I'm sure that's why you want a newspaper, and it's not because of anything so silly as a scavenger hunt.'[otherwise]'You'll have to think outside the box for that one.'"

To say about either flag: say "[run paragraph on][if player does not have the green flag and the player does not have the red flag]'I really wouldn't know, Daniel, but perhaps you're just trying too hard.  Why don't you go take a look at how some of the other options are going?'[otherwise if player has the red flag and the player does not have the green flag]'Not bad!  That's another item off your list, isn't it?'[otherwise if player has the green flag and the player does not have the red flag]'Oh, very nice!  That's one solution we never thought of!'[otherwise if player has the green flag and the player has the red flag]'You know you only need one flag, right?'"

To say about either star: say "[run paragraph on][if player does not have five-pointed star cutout and the player does not have cutout Charlie Chaplin]'You know, stars are actually giant balls of flaming gas, a million times bigger than the Earth.  How's that for an off-the-wall fact?'[otherwise if player has five-pointed star cutout and the player does not have cutout Charlie Chaplin]'You're a star, Daniel!  Anything else on the list?'[otherwise if player has cutout Charlie Chaplin and player does not have five-pointed star cutout]Michelle laughs.  'A movie star?  I guess that counts....'[otherwise if player has cutout Charlie Chaplin and the player has five-pointed star cutout]'That's two different ways of reading it.  Bit of an overkill, I'd say.'"

To say about either hat: say "[run paragraph on][if player does not have a hat]'There's bound to be someone who can help you out on this one.'  She looks down at her clipboard.  'Someone or something, somewhere.'[otherwise if player has a girly hat and the player does not have a paper hat]'Not quite your style, Daniel, but it's a nice one, all the same.'[otherwise if player does not have a girly hat and player has a paper hat]'Oh, now you're going to get ink all over your face, aren't you?  Better clean up properly tonight!'[otherwise if player has at least two hats]'You know you only need one hat, right?'[otherwise]'I'll count that as a hat.  What else is on your list?'"

To say about anyone else: say "'I don't really know who has signed up for what,' says Michelle, probably trying to cover up for not actually knowing who you're talking about.  "




Check asking michelle for loose change: start conversation with Michelle on MICHELLE-ON-CHANGE instead.  MICHELLE-ON-CHANGE is a quip. The display text is "'What do you want it for, Daniel?'"

MICHELLE-ON-SNACKS is a quip. The menu text is "'Snacks!'"  The display text is "Michelle frowns.  'That stuff will rot your teeth and spoil your appetite.'  Needless to say, you get no change out of her."
MICHELLE-ON-SODA is a quip. The menu text is "'Soda pop!'"  The display text is "Michelle frowns.  'That stuff will rot your teeth and spoil your appetite.'  Needless to say, you get no change out of her."
MICHELLE-ON-COFFEE is a quip. The menu text is "'Coffee!'"  The display text is "'Coffee?  Daniel, there aren't any coin-operated coffee machines here.  I know, I've checked.'  She glances back at the stairs and mutters, 'none that serve anything remotely drinkable, anyway.'"
MICHELLE-ON-NEWSPAPER is a quip. The menu text is "'Newspaper!'"  The display text is "[about newspaper]"

The response of MICHELLE-ON-CHANGE is { MICHELLE-ON-SNACKS, MICHELLE-ON-SODA, MICHELLE-ON-COFFEE, MICHELLE-ON-NEWSPAPER }.

After populating MICHELLE-ON-CHANGE when the player has not been able to see the vending machine, remove MICHELLE-ON-NEWSPAPER from the current conversation.

After firing MICHELLE-ON-NEWSPAPER: now the player carries the loose change. 


Part 2 - info desk

Chapter 1 - Description

The info desk is a room, north of the first floor lobby west. "The main foyer of Jacobs Hall still looks a bit like the inside of a hundred-year-old mansion, though it's been a little bit beat up by the passing generations of students.  The information desk, an anomaly in glass and polished steel, sits beneath a portrait of Alexander Quaverley Jacobs, facing the main entrance to the west.  To the east, wide double doors open onto Calvin Field, while arches go south and southeast to the rest of the lobby area.  Much of the north wall has been chewed through to make a connection to the newer part of Jacobs Hall."

Chapter 2 - Scenery

Some stairs to administrative offices are scenery, in the info desk. "Of course there are stairs here.  But since they lead up to administrative offices which are off-limits to you, there didn't seem to be any point in mentioning them."

A portrait of Alexander Quaverley Jacobs is scenery, in the info desk. "Old AQJ, who left his mansion to the university, stares down benevolently from his portrait.  You never cease to be amazed at his enormous sidewhiskers."  Understand "picture" as portrait of Alexander.

Some sidewhiskers are scenery, part of the portrait of Alexander Quaverley Jacobs. "They're called Dundrearies, though you can't see anything remotely dreary about them.  Maybe one day you'll grow something like that, if Mom doesn't attack you with sheep-shearing equipment first."

Some LEAP flyers are a scenery dispenser in the info desk. "[PLACEHOLDER]leap flyers[end placeholder]."  Understand "flyer" or "camp" as LEAP flyers.  A LEAP camp flyer is a thing. The description is "[PLACEHOLDER]One leap flyer[end placeholder]."  Some LEAP flyers vend a LEAP camp flyer.

An information desk is an enterable supporter, scenery, in the info desk. "It's very sleek and modern-looking, which means it's oddly shaped and doesn't fit anywhere.  A never-ending supply of LEAP flyers are stacked in a corner.  Tucked away into a corner is a small saucer for loose change.  (The receptionist usually keeps this in a corner of the desk where only she can see it, but apparently it's been moved.  She's only here during the school year, anyway.)"

A saucer is scenery on the information desk. "[if the loose change has not been handled]Sitting in the saucer are a few random coins.  Funny, wasn't this dish empty when you passed by the desk this morning?[otherwise if nothing is in the saucer]Someone appears to have swiped all the loose change![otherwise if the newspaper has been handled][one of]Someone appears to have swiped -- hang on, t[or]T[stopping]he saucer's got a bunch of coins in it again.[otherwise if the loose change has been handled]Sitting in the saucer are a few oddly familiar coins."  Understand "dish" as the saucer. [Rule for deciding whether all includes the saucer: it does not.]  The printed name of the saucer is "saucer[if the saucer contains loose change] full of loose change".

Some loose change is singular-named, in the saucer. "[if  the player has the loose change]You have a handful of coins, conveniently just enough.[otherwise]Pennies, nickels, dimes.  The usual."  Understand "few", "random", "small", "coins", "coin" as the loose change.  The indefinite article of the loose change is "some". [Rule for printing the name of the loose change when the player has the loose change: say "small change".]

Check taking the loose change when the loose is in the saucer and the newspaper has NOT been handled:
	say "Michelle clears her throat and gives you a stern look.  Looks like petty thievery is going to have to wait another day."  instead.

Check taking the loose change when the loose is in the saucer and the newspaper has been handled:	say "No way, those reappearing coins are spooky." instead.

Check taking the saucer when the loose change is in the saucer:
	redirect the action from the saucer to the loose change, and try that  instead.

Report taking the loose change when the loose change was in the saucer and the newspaper has not been handled:
	say "You quickly swipe the loose change and hope that nobody saw you." instead.

Report inserting the loose change into the saucer:
	say "Okay.  Your mother would be proud." instead.

Check putting something on the saucer:
	try inserting the noun into the second noun instead.



Part 3 - lobby east

Chapter 1 - Description

The first floor lobby east is a room, east of first floor lobby west, southeast of info desk. "This used to be a rather large dining room, once upon a time, and it still has a low-hanging chandelier right in the middle of the ceiling.  A piano's been pushed under the chandelier so that nobody accidentally gets a head full of crystal walking blindly around, and the place is generally used as a kind of music room now.  The info desk is back to the northwest, and to the west is the rest of the first floor lobby.  Wide picture windows look out on the front lawn and on the southern part of Calvin Field[if in Chapter 1]. The School of Rock option is in progress here, jamming away in the upper decibels[otherwise if in chapter 2]. A group of older kids seem to be discussing the psychology of cats in one corner[end if]."


Chapter 2 - Scenery

A low-hanging chandelier is scenery, in first floor lobby east. "Pretty, but mostly useless.  You suspect that it's more glass than crystal these days, too: you distinctly remember someone (who certainly wasn't you, no sir!) knocking out part of it with an enthusiastic trombone slide last year, but this year there appears to be no sign of the damage."

A baby grand piano is scenery, in the first floor lobby east. "Ava says it's a baby grand, and she knows more about this sort of thing.  All grand pianos seem more or less alike to you.  The pile of plastic dinosaurs under the piano probably makes it unique, however."

Check playing the baby grand piano when in chapter 1: say "The piano is currently occupied by a couple of older kids in the School of Rock option.  You'll have to wait until later." instead.

Carry out playing the baby grand piano when in chapter 2:
	if Ava is not in the location, say "You bang out a few bars of 'Lean On Me' before hitting a wrong note (it doesn't take long) and stopping.  The only reason you learned that tune was to annoy Ava, anyway: she hates that song.";
	otherwise say "You bang out a few bars of 'Lean On Me' before Ava stops you.  She really has no love for that particular song at all."[;
	rule succeeds.]

Check looking under the baby grand piano: say "Under the piano is a pile of plastic dinosaurs, left there for no other reason than that people are less likely to step on a plastic dinosaur when it's under a piano." instead.

Check hiding something under the baby grand piano: say "There's a large pile of plastic dinosaurs in the way." instead.

Some picture windows are scenery, in the first floor lobby east. "[if in chapter 1]The front lawn is littered with graffiti-covered temporary walls, but Calvin Field seems much as usual[otherwise]All you can see outside is darkness[end if]."  Check searching the picture windows: try examining the noun instead.

The School of Rock option is an option, scenery, in first floor lobby east. "It's a musical jam session.  The majority of the players are pretty good; thankfully, they drown out the ones who aren't."

Last report going when the school of rock option is in the location during Scavenger Hunting: fire TRIG_SCHOOLOFROCK.

TRIG_SCHOOLOFROCK is a trigger. TRIG_SCHOOLOFROCK can be primed or unprimed. TRIG_SCHOOLOFROCK is unprimed.

Last after firing unprimed TRIG_SCHOOLOFROCK:
	now TRIG_SCHOOLOFROCK is primed;
	now TRIG_SCHOOLOFROCK is unfired;

Rule for firing primed unfired TRIG_SCHOOLOFROCK:
	say "Someone takes a complicated trombone solo, and you are suddenly seized by a dizzy spell.  For a moment, everything seems to glow red and orange, and then, just as suddenly, everything snaps back to normal.";

Rule for firing primed fired TRIG_SCHOOLOFROCK:
	say "As you approach the musicians, you once again get that odd sense of vertigo.  The feeling passes within seconds.";


Cat psychologists are scenery in first floor lobby east. "They seem pretty absorbed in what they're doing."
Understand "kids/campers/students", "older kids" as the cat psychologists when in chapter 2.

Carry out listening to the cat psychologists: say "[one of]'...so when you see a cat twitching its tail, that means that it's kind of confused or frustrated...'[or]'...those laser pointers are fun, but too much of it just isn't good for the cat's brains, you know?'[or]'...I'm telling you, they're going to take over the world one day....'[or]'...stupid thing just stands at the open door and meows....'[or]'...there's this webcomic about this pair of cats, and....'[or]'...she was creeping across the linoleum floor, pretending to be an invisible ninja or something....'[or]'...so I looked in the litterbox --' and you stop listening right there.[at random]"


Chapter 3 - Purple Plastic Diplodocus

Section 1 - Dinosaur Pile

Some plastic dinosaurs are a dispenser, scenery, in the first floor lobby east. "Rarrr.  They're all very lifelike, despite being small, plastic, and a variety of colors unlikely to be found in nature."  The indefinite article of the plastic dinosaurs is "a pile of".  Understand "pile", "pile of" as the plastic dinosaurs.

Report taking the plastic dinosaurs: say "You pick out a purple diplodocus from the pile of plastic dinosaurs." instead.

Check taking the plastic dinosaurs when the prize of the plastic dinosaurs is handled: say "[if in chapter 1]You've already taken one dinosaur from the pile.  You don't need another one.[otherwise]You're a little too old to be playing with plastic dinosaurs, really."  instead.

The plastic dinosaurs are represented by the purple diplodocus.
The plastic dinosaurs vend the purple diplodocus.
The purple diplodocus fulfills the dinosaur-goal.

Section 2 - Dinosaur

A purple diplodocus is a thing. The description is "You can't really get more generic, as far as dinosaurs go, as a diplodocus.  Never mind that there were thousands of other species of giant lizards roaming the earth once upon a time.  The purple color of this little plastic diplodocus is probably an example of artistic license, however."  Understand "generic", "little", "plastic", "dinosaur" as the purple diplodocus. The printed name of the purple diplodocus is "plastic dinosaur".

Check attacking the purple diplodocus: say "Are you sure you want to be the cause of the extinction of the plastic diplodocus?" instead.


Part 4 - Second Avenue

Chapter 1 - Description

Second Avenue is an exterior room, west of the info desk. "Second Avenue runs north and south along the edge of a cliff: to the west is a sharp drop down (don't even try) onto the rooftops of the buildings along First Avenue, and beyond those are the jagged ridges of the Rockies.  Jacobs Hall -- the old part, anyway -- is open to the east, and its front lawn spreads out to the southeast.  You can also go northeast, squeezing around the newer part of Jacobs Hall to the courtyard beyond.[paragraph break]Conveniently, a bus shelter with a newspaper vending machine is almost directly outside the Hall."  Second Avenue is in the campus grounds. 

Check going down when in Second Avenue: say "I told you, don't even try it!" instead.
Check jumping when in Second Avenue: say "I told you, don't even try it!" instead.

Chapter 2 - Scenery

First Avenue is scenery, in Second Avenue. "It's a good deal more interesting than Second Avenue, that's for sure.  Unless academia is your thing."



Jacobs Hall is a privately-named university building. "[if in the courtyard]The north face of Jacobs Hall is a flat expanse of brick, interspersed with dorm room windows.  At the rooftop parapet, you can also make out a bunch of happy campers dropping things off the edge.  That must be the Egg Drop option, if you remember rightly.[otherwise]The old part of Jacobs Hall used to be a millionaire's mansion, way back in ancient history.  It's all red sandstone and gargoyles and fancy stonework.  Then it got donated to the university and the first thing they did was to slap a huge, square-ish brick nonentity onto the north side; of course, the new part is where all the real business of Jacobs Hall gets done: the fancy, red sandstone mansion part is just where parents and newbies and visitors meet with the staff."  Jacobs Hall is in second avenue, calvin field north, calvin field south, the courtyard, and the front lawn.

[[The Jacobs Hall backdrop is a privately-named backdrop. The The Jacobs Hall backdrop is everywhere.] The printed name of the The Jacobs Hall is "Jacobs Hall".]
Understand "Jacobs/Hall" or "Jacobs Hall" as Jacobs Hall when the location is exterior.


The Rocky Mountains are scenery, in Second Avenue. "You get some spectacular sunsets from here.  When you left the camp last year, you and just about everyone else stopped for the longest time, just watching the sun go down.  It was the best traffic jam ever."

A cliff is scenery, in Second Avenue. "It's more of an escarpment, really, or so Aidan told you once.  You not quite sure about the difference.  Anyway, Valmont is built on a mountainside, so you see this sort of thing all the time."

An escarpment is scenery, in Second Avenue. "It's more of a cliff, actually, or so you prefer to call it.  You're not quite sure about the difference.  Anyway, Valmont is built on a mountainside, so you see this sort of thing all the time."

A bus shelter is scenery, in Second Avenue. "You figure that the next bus should be showing up about one minute after you leave."

Last carry out going from Second Avenue: if we have examined the bus shelter, say "[one of]You faintly hear the sound of a bus driving by.[or][run paragraph on][stopping]"


Chapter 3 - Vending Machine & Paper

A vending machine is scenery, closed, transparent, not openable, in Second Avenue. "Insert the appropriate change, get your daily dose of gloom and doom." Understand "newspaper/paper machine/vendor" as the vending machine.

Check opening the vending machine: say "Not without paying first!" instead.

Check inserting the loose change into the vending machine:
	move the loose change to the saucer;
	now the player carries the newspaper;
	say "You insert the appropriate change, and the glass front of the vending machine clicks open just wide enough for you to extract the day's newspaper.  Then it snaps shut again." instead.

Check inserting something into the vending machine: say "It appears that the vending machine was not designed to accept [that or those for the noun]." instead.

Check attacking the vending machine: say "Hooliganism is not the answer to this one." instead.


A newspaper is in the vending machine. The description of the newspaper is "[if the newspaper is in the vending machine][description of the vending machine][otherwise]You quickly scan the headlines.  War, pollution, corruption, crime, gas shortages... why anyone would want to start their day with such a sour note, you do not know." Understand "paper" as the newspaper. Understand "from [something related by reversed containment]" as the newspaper when the newspaper is in the vending machine.

The newspaper fulfills the newspaper-goal.

Check buying the newspaper when the newspaper is in the vending machine and the player has loose change: try inserting the loose change into the vending machine instead.

Check buying the newspaper when the newspaper is in the vending machine and the player has the dollars:
	say "(with a dollar)[command clarification break]";
	try inserting the dollars into the vending machine instead.
	
The block buying rule is listed last in the check buying rules.

Check folding the newspaper:
	now the player carries the paper hat;
	say "You pull out a section of the newspaper and quickly fold it into a sailboat.  Or a hat, one of the two: you never did figure out how to make those two things any different from each other.";
	rule succeeds.

Check folding the newspaper when the paper hat is in the location: say "You already have a paper hat (sailboat!) and you don't want to reduce the newspaper to a single page.  Not before you're supreme ruler of the world, anyway." instead.

The paper hat is a hat. The description is "A hat, or possibly a boat, folded from newspaper.  Not bad, if you do say so yourself.  At least until the newsprint ink comes off on someone's forehead."

The paper hat fulfills the hat-goal.

Part 5 - Calvin Field South

Chapter 1 - Description

Calvin Field South is an exterior room. "During the school year, this part of Calvin Field gets pretty scuffed up by students playing football or whatever inter-department sports tickle their fancy at the time.  Right now, it's getting scuffed up by people playing flag football.  The university caretakers must be wondering why they even bother to replant the grass every Spring.  The less scuffed-up part of Calvin Field is to the north, and the front lawn of Jacobs Hall is to the west."

Calvin Field Region is a region. Calvin Field North and Calvin Field South are in Calvin Field Region.

Chapter 2 - Scenery

Some backdrop-grass is a backdrop, privately-named, in Calvin Field South, Calvin Field North, the Front Lawn.  "[if in the front lawn]It's green, which probably means someone with a can of green spraypaint has been coloring outside the lines[otherwise]It's green, which means it's not quite dead yet, despite the best efforts of the [end if][if in Calvin Field South]football players[otherwise if in Calvin Field North]Myth Tag players[end if]."  The printed name of the backdrop-grass is "grass".  Understand "grass" as the backdrop-grass.

Report taking the backdrop-grass: say "You pluck a few [if the blades of grass was not carried]more [end if]blades of grass from the ground." instead.

Some blades of grass are a thing. The description is "They're green, at least for now." The indefinite article of the blades of grass is "a few".

The blades of grass fulfill the life-goal.

The Flag Football option is an option, privately-named, scenery, in Calvin Field South. "Football, in whatever form, is really more Aidan's thing than yours.  He's not taking the option today, though." Understand "flag football", "football", "option", "player", "players", "camper", "campers", "student", "students", "people" as the flag football option.

Chapter 3 - Red Flag

A red flag is a thing. "It's a small red flag from the flag football option."

A pile of red flags is a scenery dispenser in Calvin field south. "A pile of red flags for the flag football game.  Maybe not as exciting as tackling, but definitely less likely to cause grievous bodily damage." The pile of red flags vends the red flag.  Understand "flag" as the pile of red flags when the red flag is not enclosed by the location. 

Check waving the red flag: say "Only if you want to be dog-piled by a rabid gang of flag football players." instead.

Check burning the red flag: say "Even if you had a source of fire, you're not exactly the flag-burning sort." instead.

Report dropping the red flag: say "It flutters to the ground.  No flag football players notice.  Thank goodness." instead.

The red flag fulfills the flag-goal.



Chapter 4 - Brad

Section 1 - description of Brad

Counselor Brad Kramer is a man, in the Calvin Field South. "[unless in chapter 8]Your counselor, Brad Kramer, stands beside a large pile of red flags, watching the flag football game with a whistle tucked between his lips.[otherwise][placeholder]Brad's beat up[end placeholder]."  The description of Brad Kramer is "[unless in chapter 8]Brad Kramer, your counselor for this year, looks like a typical jock, though he's been pretty awesome so far.  Normally, he's never seen without a baseball cap and that ever-present wad of chewing gum lodged in one cheek.  The gum's still there, and somehow he still manages to chew it while still holding his referee's whistle between his lips, but at the moment the cap is gone.[otherwise]Brad Kramer, your counselor for this year, normally looks like a typical jock, though at the moment he's lying unconscious by the wall.  He's wearing a set of pajamas with teddy bears printed on them, but you really don't have time right now to wonder how a cool dude like Brad could wear pajamas with teddy bears printed on them.  Oh, and in case you missed it the first time, he's also out cold, as you will be too if you keep hanging around."  Understand "Counsellor" as Brad Kramer.  The printed name of Brad Kramer is "Brad".

Brad's whistle is worn by Brad. "It's a standard-issue referee's whistle, the sort that high school coaches the world over have been blowing since time immemorial." Brad's whistle is improper-named. The printed name of Brad's whistle is "whistle".

Brad's gum is carried by Brad. "Brad must go through a few hundred dollars['] worth of gum every year.  That, or he's been chewing on the same wad of gum since the beginning of time." Brad's gum is improper-named scenery. The printed name of Brad's gum is "gum".

Brad's baseball cap is a hat.

Brad's pajamas are a wearable thing. "Teddy bears!" Understand "pyjamas/PJs" as the pajamas. When Night Terrors begins: now Brad wears Brad's pajamas.


Section 2 - actions on Brad  and his stuff

Check eating Brad's gum: say "You're not in the mood for sharing anyone's gum, least of all Brad's." instead.
Instead of taking, pushing, pulling, [moving,] or touching Brad's gum, say "After Brad's been chewing on it?  Eww."
Check attacking Brad's gum: say "That would require you to actually touch it...." instead.
Check focusing on Brad's gum: say "You'd really much rather not." instead.

[Whistle (chapter 1)]
Instead of taking, pushing, pulling, [moving,] touching, or attacking Brad's whistle, say "That would earn you a penalty for sure."
Check eating Brad's whistle: say "No.  It would only get stuck in your throat and whistle every time you tried to talk, and that would be annoying." instead.
Check listening to Brad's whistle: say "It's loud enough to be heard all across the field!" instead.
Check focusing on Brad's whistle: say "You stare intently at the whistle.  Suddenly, Brad blows it and starts yelling at one of the players, breaking your concentration." instead.

[Check taking the pile of red flags when the player has a red flag, say "You don't need another one!"
Last check taking the pile of red flags,] 
Report taking a red flag: say "Being careful to not be mistaken for another football player, you pick up one of the flags." instead.
Instead of eating or attacking the pile of red flags, say "The football players, and your counselor, wouldn't take very kindly to that."
Check pushing the pile of red flags: say "'Don't push it, Danny,' says Brad without even looking around." instead.
Instead of pulling or searching the pile of red flags, say "You find nothing under the flags but a few more flags, and some grass."
Check touching the pile of red flags: say "Cloth." instead.
Check focusing on the pile of red flags: say "You feel a little angry, for some reason." instead.

Check focusing on Brad's Pajamas: try examining the noun instead.
Check taking [or wearing] Brad's Pajamas: say "That's going to take more time and effort than it's worth, and anyway Aidan's not going to fall for such a flimsy disguise." instead.

Instead of doing something with the baseball cap, say "There is no cap!"

[The Brad!]
Instead of taking, [moving,] pushing, or pulling Brad, say "[unless in chapter 8]Don't be rude.[otherwise]He's too heavy!  Maybe you'd better lure Aidan out of the way and hope someone else will deal with Brad."
Check attacking Brad: say "[unless in chapter 8]That's a sure way to get yourself kicked out of LEAP, and you don't want that.[otherwise]He looks beat up enough as it is!" instead.
Check kissing Brad: say "Somehow you don't think Brad would appreciate that at the moment." instead.
Check focusing on Brad: say "[unless in chapter 8]You stare intently at Brad.  He doesn't seem to notice.[otherwise]He's unconscious!  All you can sense is that he's certainly feeling no pain." instead.


Section 3 - conversation with Brad

[The conversation table of Brad is the table of Brad's conversation.]
The object-based conversation table of Brad is the table of Brad's replies.

Instead of conversing when Brad is the noun and in Chapter 8, say "Brad doesn't seem to hear you.  He's unconscious, remember?  And likely to be killed as well once Aidan's done with you!"

Check asking Brad for a red flag: try inquiring Brad about the noun instead.
Check asking Brad for the pile of red flags: try inquiring Brad about the noun instead.

[Does the player mean inquiring Brad about Brad's baseball cap: it is likely. [as opposed to the deerstalker cap]
Does the player mean asking Brad for Brad's baseball cap: it is likely. [as opposed to the deerstalker cap]]

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

Calvin Field north is an exterior room, north of Calvin Field South, east of info desk. "Claremont Hall, to the north, looms over the entire length of Calvin Field, which continues to the south.  Jacobs Hall is back to the west, and the dining hall is to the east.  A fountain takes up space right where all the paths meet, so there usually aren't that many people running around and tearing up the grass.  Right now, though, there are several people running around, playing Myth Tag, and there's nothing the fountain can do about it."

Chapter 2 - Scenery

The Myth Tag option is an option, scenery, in Calvin Field North. "It's sort of like normal tag, except you can declare yourself 'safe' by crouching down and naming a mythological creature.  No repeats, though: one of the counselors is keeping track of what's been named so far."

The view of Claremont Hall is a university building, in Calvin Field North. "Claremont Hall looks very grand, standing on a rise at the north end of Calvin Field.  It's a red sandstone building with rounded arches and red shingles, and a huge clock tower right over the door."  The view of Claremont Hall is in Calvin Field south, the rooftop, the courtyard. 

A huge clock tower is scenery, part of the view of Claremont Hall. "The Claremont Hall clock tower has never told the right time, not since it was built.  Someone told you last year that it's haunted, but that's the sort of thing people always tell kids on their first summer at camp."

A fountain is scenery, in Calvin Field North. "The fountain consists of a wide, shallow basin and a modern sculpture that, to you, looks a lot like Big Foot taking a shower.  It's not running right now."

Carry out searching the fountain when the player does not have a feather: say "You spot a lone feather just lying there, presumably lost from some passing pigeon.  You grab it before the wind blows it away."; now the player carries the feather. 


Part 7 - Front Lawn

Chapter 1 - Description

The Front Lawn is an exterior room, west of Calvin Field South, southeast of Second Avenue. "A whole bunch of walls have been temporarily erected all over the front lawn for the Graffiti Art option.  The smell of paint is everywhere, not to mention the hiss of spray cans.  Passersby on Second Avenue -- to the northwest -- will no doubt find this all very interesting.  A flagpole rises up from the maze of makeshift walls here, while Calvin Field and the more athletic options are off to the east." The front lawn is in the campus grounds. 

Chapter 2 - Scenery

The graffiti option is an option, scenery, in Front Lawn. "Some of it is actually pretty good.  But is it Art?"

Some cans of spray paint are scenery, in Front Lawn. "A multitude of different colors, all of it in the hands of kids with instructions to just 'go wild'.  The bathrooms are going to be pretty jammed up this evening."

A flagpole is scenery in the front lawn. "[if the star-spangled banner is scenery]It's keeping the good ol['] Star-spangled Banner well out of the reach of the spraypaint-happy campers all around you.[otherwise if the star-spangled banner is fixed in place]The flag is at the bottom of the flagpole.[otherwise]The flagpole seems to be missing a flag.  Huh."

The Star-Spangled Banner is [initially] fixed in place scenery in the front lawn. "[if the star-spangled banner is scenery]It's not exactly the dawn's early light, but you can see it quite clearly, drifting in the wind high overhead.[otherwise if the star-spangled banner is fixed in place]Up close, you realize it's bigger than you are!  How will you carry it?[otherwise]The camp's flag has seen some years of use.  It looks older than the camp itself." Understand "flag", "american", "american flag", "great/big/huge/ginormous", or "old glory" as the Star-Spangled Banner. The printed name of the banner is "[if taking inventory]enormous American flag (folded into a triangle)[otherwise]Star-Spangled Banner".

[the banner:  
"scenery" means it is up high
"fixed in place" means it is unfolded ]

Check climbing the flagpole: say "You're not that good an athlete." instead.
First check folding the flagpole: change the noun to the star-spangled banner. [no instead -- typecast]

[turning off the "scenery" bit]
Instead of doing something except examining or turning with the Star-Spangled Banner when the star-spangled banner is scenery, say "It's way too high to reach."

Understand "lower [Star-Spangled Banner]" or "raise [Star-Spangled Banner]" or "lower [flagpole]" or "raise [flagpole]" as turning.  Check turning the Banner: try turning the flagpole instead. [saves me creating a one-off Lower action]  

Check turning the flagpole when the Star-Spangled Banner is not enclosed by the location: say "There's little point without the Stars and Stripes to put up there." instead.

Check turning the flagpole when the Star-Spangled Banner is scenery: say "You unwind the pulley rope, and lower the flag.  The great flag now within reach."; now the Star-Spangled Banner is not scenery; rule succeeds.  

Check turning the flagpole when the Star-Spangled Banner is not scenery and the star-spangled banner is enclosed by the location: say "Perhaps some things are more important than a scavenger hunt.  You raise the Star-spangled Banner to its rightful place."; now the Star-Spangled Banner is fixed in place scenery in the front Lawn; rule succeeds.

[the fixed in place bit]
Instead of doing something except examining, touching, folding, or turning with the Star-Spangled Banner when the star-spangled banner is fixed in place not scenery, say "It's way too big to carry when unfurled."

Carry out folding the Star-Spangled Banner: now the player carries the banner; now the banner is not fixed in place.

Report folding the Star-Spangled Banner: now the time of day is the time of day plus 3 minutes; say "It takes some time, but you get the whole flag into its traditional triangular shape." instead.

Check dropping the Star-Spangled Banner: say "The flag must never touch the ground." instead.

The Star-Spangled Banner fulfills the flag-goal.

Part 8 - Courtyard

Chapter 1 - Description

The courtyard is an exterior room, northeast of Second Avenue, northwest of Calvin Field north. "The courtyard is a hard, concrete square ringed by bushes and trees.  It's not terribly interesting, but Aidan sometimes comes here to play basketball with his friends, as if the camp counselors didn't make you all run around enough already.  The other university buildings are visIble beyond the treetops, and the blank north face of Jacobs Hall rises up to the south; paths southeast and southwest lead around Jacobs Hall, though there is no entrance to the building from here.".  The courtyard is in the campus grounds. 


Chapter 2 - Scenery

Some prickly plantlife is scenery, in the courtyard. "The plantlife around here seems quite peaceful and idyllic.  Also, prickly."  Understand "plant", "plants", "leaf", "leaves", "thorns", "stems", "bushes", "trees", "leaves", "plant", "life", "peaceful", "idyllic", "grass" as the prickly plantlife.

Check taking the prickly plantlife:
	say "You briefly consider the trees, but they're rather on the tall side.  Then you reach into the bushes and immediately back off thanks to the thorns[if the player does not have the blades of grass].  Finally, you settle on just grabbing a few blades of grass[end if].";
	now the player carries the blades of grass instead.

Some distant university buildings are scenery, in the Courtyard. "Jacobs Hall is to the south, and Claremont Hall is to the east.  Neither of them can be entered directly from here.  Over the treetops to the north, you can also make out the Ridgeway Museum and the university library."

The view of Claremont Hall is in the Courtyard.
Ridgeway Museum is a university building. "The university buildings aren't of much interest, at least not from here."
The University Library is a university building. "The university buildings aren't of much interest, at least not from here."
Ridgeway Museum is in the Courtyard. The University Library is in the Courtyard.

Some scattered eggboxes are scenery, in the Courtyard. "Those belong to the Egg Drop option, going on up on the roof of Jacobs Hall.  Some appear more effective than others." Understand "boxes/containers/box/container/objects/object/debris" as the scattered eggboxes.

Check searching the eggboxes:
	if the player does not have a feather:
		say "Poking about the debris, you come across one that is stuffed full of blue feathers.  Guessing that the actual number of feathers is probably not part of the scientific data under examination, you help yourself to one.";
		now the player carries the feather;
	otherwise:
		say "Poking about the debris, you find nothing on your list that you did not already have.";
	rule succeeds.

Instead of doing something except searching when the scattered eggboxes are physically involved, say "Don't interfere with someone else's scientific data."

Chapter 3 - Ambient Messages for scavenger hunt

Has yet to encounter a single weird emotional thing is a truth state that varies. Has yet to encounter a single weird emotional thing is usually true.

Every turn when in chapter 1:
	if conversing for four turns and the noun is Michelle, say "She glances at her watch and adds, 'Time's a-wasting, Daniel!  Have you found everything on your list yet?'";
	if in the courtyard and a random chance of 1 in 3 succeeds, say "[one of]A box-like object crashes into the concrete close to the wall of Jacobs Hall.  Raw egg comes splattering out of its side, accompanied by loud groans from above.[or]A box-like object crashes into the Concrete close to the wall of Jacobs Hall, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.  Egg yolk drips from a seam.[or]Someone runs into the courtyard from around the corner, gathers up the various boxes and containers, and runs off again.[or][one of]A box-like object crashes into the concrete close to the wall of Jacobs Hall.  Raw egg comes splattering out of its side, accompanied by loud groans from above.[or]A box-like object crashes into the concrete close to the wall of Jacobs Hall, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.[or]Something falls onto the concrete, bounces twice, and lies still.  Egg yolk drips from a seam.[or]Someone runs into the courtyard from around the corner, gathers up the various boxes and containers, and runs off again.[at random][stopping]";
	if the time since Scavenger Hunting began is 15 minutes and true is has yet to encounter a single weird emotional thing,  say "A pair of first-year campers come tearing past you, yelling at the top of their lungs.  Looks like they've decided to take the unoffered 'Hide and Seek' option.  You're about to yell at them to settle down when the world suddenly turns mauve.  It only lasts a split-second, but leaves you feeling a little dizzy and disoriented.";
	if the time since Scavenger Hunting began is 15 minutes and true is has yet to encounter a single weird emotional thing, say "You feel an odd, ticklish sensation on the tip of your nose as two of the older campers walk past, and then your head begins to hurt.  The two campers laugh nastily when they see you stumble, but keep moving.  Fortunately for you, the headache disappears as quickly as it appeared."



Part 9 - first floor midpoint

The west end of Jacobs Hall is a region. The first floor rooms west, the second floor rooms west, the third floor rooms west, and pits west are in the west end of Jacobs Hall.  

The east end of Jacobs Hall is a region. The the first floor rooms east, the second floor rooms east, the third floor rooms east, and pits east are in the east end of Jacobs Hall.  

The central portion of Jacobs Hall is a region.  The info desk, the first floor midpoint, pits stairwell, the second floor lobby, the third floor lobby, the first floor lobby west, the first floor lobby east, pits lobby central, the pits lobby west, the pits lobby east, and the rooftop are in the central portion of Jacobs Hall.

The Jacobs Hall region is a region. The west end of Jacobs Hall, the east end of Jacobs Hall, and the central portion of Jacobs Hall are in the Jacobs Hall region.  Every dorm room is in the Jacobs Hall region.

Chapter 1 - Description

The first floor midpoint is a room, north of the info desk. "The first floor is where the older boys, including your brother Aidan, are housed.  The walls are plastered with images of winter sports, which makes perfect sense given that it's the middle of summer.  Between the skiers and the snowboarders, the hallway continues east and west, while the main stairs go up to the girls['] dorms and down to the younger boys['] dorms; and of course there's the info desk back to the south.  A friendly-looking cardboard cutout of Olympic ski champion Stephan Eberharter holds a pouch full of cutouts of all things winter-sporty, practically begging you to stick more of them up on the walls."


Chapter 2 - Scenery

Section 1 - Cut out Stephan Eberharter

The description of Stephan Eberharter is "He's been glued to the wall, no doubt because this particular junction sees a lot more traffic than most."

Understand "olympic", "ski champ", "skiing", "champ", "champion" as Stephan Eberharter.

Check taking Stephan Eberharter: try examining Stephan Eberharter instead.

Section 2 - Cutout Pouch

The description of Stephan Eberharter's cutout pouch is "It's full of cutouts of snowboards, skis, hockey sticks, skates, sleds and other things that make you want to put on your scarf and your warm, woolly mittens."

Stephan Eberharter's cutout pouch is represented by the images of winter sports.

Section 3 - Wall cutouts

The description of the images of winter sports is "You see far too many of those here."

Understand "ski/skis", "snowboard/snowboards", "snow board/boards", "skate/skates", "sled/sleds", "sledge/sledges", "sleigh/sleighs", "cutouts" as the images of winter sports.

Understand "hockey stick/sticks" as the images of winter sports when the player can not see the matching pair of hockey sticks.

Part 10 - first floor rooms, west

Chapter 1 - Description

The first floor rooms west is a room, west of the first floor midpoint. "You're at the west end of the first floor dorm area.  The winter sports theme continues on in spite of the summer sunshine streaming in through the window.  Aidan's room is to the north, flanked by a pair of matching hockey sticks, and you could take the fire stairs up or down."

Chapter 2 - Scenery

Section 1 - views of, views through

The western windows of Jacobs Hall are windows of Jacobs Hall[, privately-named,] in the west End of Jacobs Hall. "[if in the first floor rooms west]It's locked, and sealed with a cutouts of cross-country skiers.  Through it, you can see Second Avenue.[otherwise if in pits west]It's rather high up in the wall, but you can see right under the bushes to Second Avenue.  If zombies attack, you could take out their kneecaps easy as anything, from here.[otherwise if in the second floor rooms west]The view is clearly for someone else's eyes only.[otherwise if in the third floor rooms west]It overlooks Second Avenue, and it's locked.  The ground may be a lot closer than the general decor here would have you believe, but it's still not close enough to jump."

The eastern windows of Jacobs Hall are windows of Jacobs Hall, in the east end of Jacobs Hall. "[if in the first floor rooms east]It's locked, and sealed with a large cutout of a dogsled pulled by more huskies than you thought was legal.  Through it, you can see Calvin Field North.[otherwise if in pits east]The window is locked and sealed with a cutout you found of a werewolf gnawing on the leg of a skeleton.  From this angle, what you see through the window are mostly the legs of people running back and forth across Calvin Field North.[otherwise if in the second floor rooms east]From here, you can see people running around on Calvin Field below.  The window itself is locked, of course.[otherwise if in the third floor rooms east]Through the constellation of Orion, you can see Calvin Field below and the people running around on it."

A view of Second Avenue is a backdrop, in the west End of Jacobs Hall. "[if in the first floor rooms west]There's not much traffic, this time of the day, and you find yourself wondering what it would be like to snowshoe from one end to the other.  In winter, of course.  Not now.[otherwise if in pits west]From here, it looks like a thin ribbon of asphalt.[otherwise if in the second floor rooms west]The view is clearly for someone else's eyes only.[otherwise]There's not much traffic, this time of the day."

A view of Calvin Field is a backdrop, in the east End of Jacobs Hall. "There seems to be an awful lot of running around over Calvin Field today."  Understand "running", "around", "runners", "students", "campers", "myth tag", "tag", "game", "calvin field", "calvin field north", "field north" as the view of Calvin Field.


To decide if (c - person) is in dead end mentions:
	if C is in first floor rooms west, yes;
	if C is in first floor rooms east, yes;
	if C is in pits west, yes;
	if C is in pits east, yes;
	no.

Check going north when the player is in dead end mentions and in chapter 8: unless the player is in first floor rooms west, mention dead end instead.
Check going south when the player is in dead end mentions and in chapter 8: mention dead end instead.

To mention dead end: say "[if in Chapter 8]That would put you in a dead end!  And by dead end, I mean DEAD end!  Also, all the doors there are locked[otherwise]Most of the rooms are locked.  And the ones that aren't, are occupied by people you do not know[end if]."

Check examining a door when the player is in dead end mentions: say "No name tags, but each door has been decorated with cutouts of various sorts." instead.


Section 2 - Hockey Sticks

The matching pair of matching hockey sticks is scenery, in the first floor rooms west.

Part 11 - Aidan's Room

Aidan's room is a dorm room. "Aidan shares this room with some guy whose name you never caught and whom you almost never see.  Aidan keeps his half of the room neat and spartan, almost as if he were expecting a military inspection at any moment.  The bedclothes look to be pulled tight enough to bounce a penny to the ceiling, and the desk is practically bare but for a few neatly regulationed necessities.  The door to the dorm corridor is back to the south."

Aidan's door is a dorm door, scenery, closed, locked, north of first floor rooms west, south of Aidan's room.

Aidan's key is a thing.  The printed name of Aidan's key is "Aidan's room key".

First check opening Aidan's door when the player does not have Aidan's key:
	say "[if Night Terrors is happening]You jiggle the handle, but Aidan's door is locked![otherwise]Aidan isn't in right now, and you shouldn't be poking around in his room while he's gone.  Even if he is your brother.  Especially if he's your brother.  And anyway, the door is locked." instead.

First check opening Aidan's door when the player has Aidan's key: now Aidan's door is unlocked. [no instead]

Aidan's bed is a supporter, enterable, scenery, in Aidan's room. "Your father is a naval officer, and Aidan seems to take this fact rather more seriously than you do.  His bed is perfectly ship-shape, with shoes and boots lined up for inspection beside it.  You happen to know that Aidan also keeps a guitar stashed away under his bed, behind those perfect shoes and boots."

Aidan's boots are scenery, in Aidan's room. "If you kept your shoes and boots in such perfect order, you wouldn't have to hunt about for them every morning.  You'd also freak out your roommate... which Aidan no doubt has already done, seeing as how whats-his-name never seems to be around."

CHeck wearing Aidan's boots: say "They're a little too big for you.  Also, they smell." instead.
Check smelling Aidan's boots: say "[bold type]*** You have died ***[roman type]

Okay, not really, but you get the picture." instead.


Aidan's guitar is scenery, in Aidan's room. "It's in its case, for now.  Aidan's quite good, though he doesn't practice as much as he really should.  You sometimes wonder where he finds the time to practice at all."

Check playing Aidan's guitar: say "[if in chapter 8]Music may soothe the savage beast, but nothing you could pluck from this instrument could count as 'music', so you're out of luck here.[otherwise]You don't know how to play the guitar." instead.

Some neatly regulated necessities are scenery, plural-named, in Aidan's room. "Aidan's toiletries are so neatly laid out that you wonder if he ever actually uses them."  Understand "toiletries" as the neatly regulated necessities.

Instead of doing something to the neatly regulated necessities when the necessities are physically involved, say "It would be a sin to meddle with such perfect order."

Aidan's desk is scenery, a supporter, in Aidan's room. "[placeholder]Aidan's desk[end placeholder]"

Aidan's laptop is scenery, on Aidan's desk. "[placeholder]Aidan's laptop[end placeholder]"

Aidan's photograph is scenery on Aidan's desk. "[PLACEHOLDER]A photograph of Aidan and yourself (during a warm, fuzzy moment)[end placeholder]."  Understand "framed"  or "photo/photos", "picture/portrait", or "photographs" as Aidan's photograph.


Part 12 - first floor rooms, east

Chapter 1 - Description

The first floor rooms east is a room, east of the first floor midpoint. "This is the east end of the first floor dorm area.  Through the window at the end of the hall, you can see Calvin Field North and a bunch of campers running about in the summer sunshine.  In here, you are surrounded by images of people having snowball fights.  The fire stairs at this end of the hall go up and down."

Chapter 2 - Scenery



Part 13 - Hank & Joe's Room

Hank's room is a dorm room. "The less said about the mess in this room, the better.  The exit is back to the north."

Hank's door is a dorm door, scenery, improper-named, locked, south of first floor rooms east, north of Hank's room. The printed name of Hank's room is "[if Joe is identified and Hank is identified]Joe and Hank's[otherwise if Joe is identified]Joe's[otherwise if Hank is identified]Hank's[otherwise]dorm[end if] room".

The printed name of Hank's door is "[if Joe is identified and Hank is identified]Joe and Hank's[otherwise if Joe is identified]Joe's[otherwise if Hank is identified]Hank's[otherwise]south[end if] door";


Hank is a man, unidentified, improper-named, in Hank's room. "[placeholder]Room description text about [Hank][end placeholder]." The printed name of Hank is "[if Hank is unidentified]boy[otherwise]Hank".

Joe is a man, unidentified, improper-named, in Hank's room. "[placeholder]Room description text about [Joe][end placeholder]." The printed name of Joe is "[if Joe is unidentified]boy[otherwise]Joe".

Before listing contents of Hank's room: group unidentified men together.

Rule for grouping together unidentified men when in Hank's Room: say "[listing group size in words] older boys".


Part 14 - pits stairwell

Chapter 1 - Description

The pits stairwell is a room, down from the first floor midpoint. "This is the Pits, and evidently someone thought it would be a good idea to decorate the area dedicated to housing newbies with images taken from classic horror movies.  Frankenstein's monster looms over the doorway to the south, as if standing guard outside the Pits lobby, while werewolves and vampires romp away to the east and west.  The stairs themselves lead back upstairs to the wintery delights of the first floor."

Chapter 2 - Scenery

Section 1 - Cutout Frankenstein's Monster

The description of the cutout picture of Frankenstein's Monster is "He's holding a pouch full of scary monster cutouts.  'Go on, be an evil scientist,' he seems to be saying, 'go make more monsters.  Mwahahaha.'"

Baron Frankenstein is scenery in the pits stairwell. Understand "frankenstein" as Baron Frankenstein.

Before doing something when Baron Frankenstein is involved:
	[a few sanity checks because of the 9-character parsing limit!]
	unless the player's command matches the text "Frankenstein's", case insensitively:
		if the player's command matches the text "Frankenstein", case insensitively:
			say "[one of]Frankenstein was the creator, not the monster... but never mind.  [or][stopping][run paragraph on]";
	redirect the action from Baron Frankenstein to the cutout of Frankenstein's Monster, and try that instead.

Section 2 - Cutout Pouch

Frankenstein's Monster's cutout pouch is a cutout pouch. "It's full of pictures calculated to keep you awake all night."

Frankenstein's Monster's cutout pouch is represented by the images of classic horror. Frankenstein's Monster's cutout pouch vends the cutout picture of Frankenstein's Monster.

Section 3 - Wall cutouts

The description of the images of classic horror is "Booga booga booga!"

Understand "vampire/vampires", "ghoul/ghouls", "ghost/ghosts", "monstrous", "scary" as the images of classic horror.

Understand "werewolf/werewolves", "were wolf/wolves" as the images of classic horror when the player can not see the cutout werewolf.

Part 15 - pits west

Chapter 1 - Description

The pits west is a room, west of the pits stairwell, down from first floor rooms west. "This end of the Pits hallway is somewhat less spooky than the rest: the paper skeletons dancing across the walls all seem quite cheerful and not at all threatening.  Dim light filters in through a high window, through which you can see the bushes and assorted shrubbery growing up against the building.  From here, you could also go back east to the main stairwell, or take the fire stairs upstairs."

Chapter 2 - Scenery

Understand "dim light", "light", "high" as the western windows of Jacobs Hall when in pits west.


Understand "thin", "asphalt", "ribbon", "ribbon of", "asphalt", "road" as the view of Second Avenue when in pits west.

Some cheery skeletons are scenery, in pits west. "They do look like a cheery bunch, don't they?"

The printed name of the cheery skeletons is "skeletons".

Understand "bunch", "bunch of", "happy", "friendly", "paper", "dancing", "skeleton" as the cheery skeletons.

The roots of some bushes are scenery, plural-named, in pits west. "It feels almost indecent, looking at everything from between their roots like this."

The printed name of some bushes is "bushes".

Understand "bush", "shrubs", "shrubbery" as the roots of some bushes.



Part 16 - Lucian's Room

Lucian's room is a dorm room. "It's another dorm room, not much different from your own.  Lucian's desk and bed are on one side; a CD player, playing Bill Withers['] 'Lean On Me' over and over, sits on his desk beside a couple of framed photographs."

Chapter 1 - Scenery

Section 1 - Door

Lucian's door is a dorm door, scenery, closed, locked, north of Lucian's room, south of pits west.  The printed name of Lucian's door is "[if the player has not been able to see Lucian]south door[otherwise]Lucian's door".

Check listening to Lucian's door: say "[if in chapter 2]Someone's got their CD player going on repeat.  Sounds like the same song, over and over....[otherwise]You hear music within." instead.

Section 2 - Beds

Lucian's bed is scenery, enterable, a supporter, in Lucian's room. "Standard, regulation LEAP beds."

Lucian's desk is scenery, a supporter, in Lucian's room. "Standard, regulation LEAP desks, littered with the odd personal items that save them from complete anonymity."

Lucian's photographs are scenery, on Lucian's desk. "There are two of them.  One appears to be a class photograph taken a year or two ago: there's an older man, maybe in his fifties, surrounded by a bunch of kids, in front of a blackboard.  The other is much older, judging by the clothes and hair, and shows a cheerful little old lady sitting on a bench in a colorful flower garden." Understand "framed" or "photos" or "photographs" as Lucian's photographs when in Lucian's room.

Report examining Lucian's photographs during Chatting to Lucian: try asking Lucian about "photographs" instead.

Lucian's CD player is scenery, on Lucian's desk. "How many times can one person listen to 'Lean On Me' at one go?" Understand "CD" or "song" or "music" or "record" or "compact" or "disc" as Lucian's CD player when in Lucian's room.

Chapter 2 - Lucian

Lucian is a man, in Lucian's Room. "[placeholder]Room description text about [Lucian][end placeholder]."  The description is "Lucian's a little shrimp of a newbie.  He looks rather pale and colorless, with thin white-blonde hair plastered close to his scalp.  In short, he's rather typical bully-bait."

Check attacking Lucian: say "You've never been a bully, and you're not about to start now." instead.

Check kissing Lucian: say "Not on your life." instead.

Part 17 - pits east

Chapter 1 - Description

The pits east is a room, east of the pits stairwell, down from the first floor rooms east. "Your room is at this end of the Pits hallway, just to the south of here.  You've elected to cover your door with the biggest cutout of a werewolf that you can find, because werewolves are cool.  The hallway continues west, and a high window on the east wall looks out across Calvin Field North.  Right beside your room door is the fire stair leading back upstairs."

Chapter 2 - Scenery



A cutout werewolf is a wall cutout, in pits east and your room. "Rowrr.  Sure, werewolves are supposed to be scary, but you can't help but think they're too cool to be lumped together with all the zombies and vampires and assorted creeps that make up the standard classic horror fare[if we have examined the portrait of Alexander Quaverley Jacobs].  This particular one has huge whiskers that somehow make you think of the portrait of AQJ up by the info desk[end if]."

Understand "whiskers" as the cutout werewolf when the location is pits east.
Understand "wolfie", "werewolf", "were-wolf", "were wolf", "wolf" as the cutout werewolf.



Part 18 - pits lobby central

Chapter 1 - Description

The pits lobby central is a room, south of pits stairwell. "This section of the Pits is part of the older part of Jacobs Hall, and therefore cut up into more interesting shapes.  There are a bunch of storerooms, all of them locked, and then two very large halls to the east and west.  A passage to the north leads back to the main stairwell.  Apparently there used to be another staircase here going up, but it was ripped out to give this place a little more elbow room."

Chapter 2 - Scenery

The storeroom doors are scenery in pits lobby central. "Aidan told you once that the storerooms are full of vampires in their coffins, and that campers who tried to sneak around after lights out had a habit of disappearing, never to be seen again.  Haha, he's such a joker ... you weren't fooled for a minute.  Not for a minute, no sir....  [line break]".  Understand "storerooms" as the storeroom doors.

Check going up when in pits lobby central: say "There USED TO BE a staircase here.  Unless you have a time machine, going up from here is not going to get you anywhere." instead.

Instead of opening or entering the storeroom doors, say "The storerooms are reassuringly locked tight."


Part 19 - pits lobby west

Chapter 1 - Description

The pits lobby west is a room, west of pits lobby central. "[if in chapter 1]This windowless area used to be a wine cellar, but today it's like something out of science-fiction.  It's being used for the Virtuality option, and there are cables and computers and virtual reality equipment all over the place.  It's a little alarming, in fact, knowing that many of these campers -- the ones wearing the goggles, anyway -- can't actually see you.  The central lobby is back to the east.[otherwise]This windowless area used to be a wine cellar full of dusty old wine bottles, but these days it's full of shiny new virtual reality equipment.  All of it is kept locked up after hours, though; only the computers themselves are available, though all are currently in use.  The central lobby is back to the east."

Chapter 2 - Scenery

The Virtual Reality option is an option, scenery, in pits lobby west. "It's really quite amazing.  You'll have to sign up for the Virtuality option the next time it becomes available."

Understand "VR" as the virtual reality option.

Some powerful computers are scenery, in pits lobby west. "Clearly money was not an issue when supplying the program with computers.  These are all powerful, top-of-the-line models, as they have to be to run the virtual reality software.  They're also new this year: last year's computers, though pretty good, weren't exactly NASA quality[if in chapter 2].  All the computers are currently in use by other campers[end if]." The printed name of the powerful computers is "computers". Understand "amazing", "cables", "equipment", "goggles", "top-of-the-line", "top of the line", "models" as the powerful computers.

Check reading powerful computers: say "'You are standing west of a white house....'" instead.

Check attacking powerful computers: say "Your parents would have to sell you to gypsies if they had to pay to replace one of these computers." instead.


Some campers are a backdrop. Some campers are in pits lobby west, pits lobby east. The description is "[about campers]". 	Understand "fanatics" as the campers.

To say about campers:
	if in pits lobby west, say "You can barely see them under all the goggles and gloves and whatever.[otherwise if in chapters 2 through 7]Some are checking their e-mail or surfing the web.  A few others seem to be playing some sort of all-text game.";
	if in pits lobby east, say "They seem to be enjoying themselves.";
	

Check attacking the campers: say "[if in pits lobby west]That's one way of making sure you're never allowed to try out the VR equipment, ever.[otherwise if in pits lobby east]They're armed with vicious-looking Ping Pong paddles.  You're not." instead.

Check listening to campers when in pits lobby west: say "[if in chapter 1]They seem to be quite quietly engrossed with their virtual environments.[otherwise]Tap.  Tap tap tap tap tap.  Tap.  Tap tap.  Tap tap tap tappity tap tap tap.  Tap tap tap tap.  Tappity tappity tap tap tap." instead.

Check listening to campers when in pits lobby east: say "[if in chapter 1]Laughter accompanied by the pinging and ponging of Ping Pong balls bouncing over the tables and onto the floor.  Yes, they're definitely having fun.[otherwise]They're deathly silent.  The concentration on their faces is really something frightening.  The only sound you hear is the rapid spitfire ping-ping-ping of the ball bouncing back and forth between them." instead.

Check focusing on campers: say "[if in chapter 1]You sense nothing but an impending headache.[otherwise if in pits lobby west]You become aware of a wide variety of different sensations, ebbing and flowing and changing as you move around between the campers.  The most prominent seems to be some sort of drilling sensation in your ears.[otherwise]You can feel the intensity of their concentration.  It's like a brick wall surrounding them.  Your skin prickles." instead.


Part 20 - pits lobby east

Chapter 1 - Description

The pits lobby east is a room, east of pits lobby central. "This part of the Pits used to be the kitchen, once upon a time.  Imagine, having the kitchen in the basement, downstairs from the dining room!  All the kitchen equipment's been removed now, though, and the place is used as a sort of recreation room.  There are several ping pong tables here, and a tournament going in full swing.  The central lobby is back to the west.[if in chapters 1 through 2][paragraph break][Ava mentioned][Stacy mentioned]Ava and Stacy have both taken this option and are waiting for their turn at the ping pong tables.[otherwise if in chapter 10][paragraph break][Ava mentioned][Stacy mentioned]Ava and Stacy have both taken this option and are waiting for their turn at the ping pong tables."


Chapter 2 - Scenery

To decide whether TTT: decide on whether or not the player's command includes "table tennis tables".

Some regulation ping pong tables are scenery, in pits lobby east. "Regulation ping pong tables.[unless TTT]  You could call them table tennis tables, but that sounds a little redundant." Understand "table", "tennis", "game" as the ping pong tables.

Before doing something when in pits lobby east and TTT: say "[one of](It does sound redundant, doesn't it?)[command clarification break][or][run paragraph on][stopping]".

The table tennis option is an option, scenery, privately-named, in the pits lobby east. "It's still too early to say who's winning, but it looks like everybody's having fun.  So maybe everybody wins."  Understand "option", "tournament", "match" as the table tennis option. Understand "ping pong", "table tennis" as the table tennis option when the player's command includes "option".

Check playing ping pong when the player can see the table tennis option: say "The tournament is using all of the tables right now." instead.

Check playing ping pong: placeholder "A quick pick-up game, boys versus girls?" instead.

A ping-pong ball is scenery in pits lobby east. The description is "Small, white, plastic and very light."  Understand "balls" as a ping-pong ball.

First check taking a ping-pong ball: say "[if in Chapter 1]You pick up one of the balls from the floor.  It's immediately claimed by one of the players, who thanks you and goes straight back to playing.[otherwise]You've got to have a death wish to want to interfere with this particular game." instead.


Chapter 3 - Ava

Section 1 - Description

Ava Winters is a woman, in the pits lobby east. "[if Ava follows the player and Stacy follows the player][Stacy mentioned]Ava and Stacy trail along behind you. [run paragraph on][otherwise if Ava follows the player]Ava trails along behind you. [run paragraph on][otherwise if in chapter 7]Ava is following you, her eyes wide with fright.[otherwise if Stacy is in the location][Stacy mentioned]Ava and Stacy are here.[otherwise]Ava is here." 
The description of Ava is "You met Ava last year, here at LEAP.  She's a rosy-cheeked girl with long, brown pigtails; since last year, she's also acquired a pair of glasses that, she claims, make her look like a young Nana Mouskouri."  The printed name of Ava Winters is "Ava[if the constructing the status line activity is going on and Hospital Chat is happening] and Stacy".

Ava's pigtails are scenery part of Ava. "Ava has her hair done in two fat pigtails hanging down her back.  You've never seen her with her hair loose." Understand "hair" as Ava's pigtails.

Ava's glasses are scenery part of Ava. "They're very rectangular, with black plastic rims.  Not the sort of glasses you'd pick out if you had to wear them, which you don't.  But Ava seems to like the effect." Understand "spectacles" as Ava's glasses. 

Section 2 - actions on Ava

Instead of pulling or taking Ava's pigtails, say "Sure, but there aren't any convenient inkwells to dip them in.  Besides, if Aidan found out he'd find some way of interpreting this to mean you must have a crush on Ava."

Instead of taking, pulling, or attacking Ava's glasses, say "No, Ava still needs them."

Check focusing on Ava's glasses: say "That would be like staring deeply into Ava's eyes, which is just the sort of thing Aidan would call 'evidence of a crush'.  Bleagh." instead.

Instead of attacking, pushing, or pulling Ava, say "No, how heartless could you possibly be?"

Check kissing Ava: say "Do that, and Aidan will never give up about Ava being your girrrrrlfriend." instead.

Check focusing on Ava: say "[if in Chapter 1]'Is something wrong, Daniel?  You're looking at me all funny.'[otherwise if in Chapter 2]You can almost swear that the air feels sort of fuzzy all around you when you do that.[otherwise if in chapter 4]There's a muted version of Aidan's oboe; it's similar, but somehow different, not as loud.  The air feels thick and velvety around her.  She's ... worried? Concerned?  Confused?  Something like that.[otherwise if in Chapter 7]Ava is frightened and almost panicking.  You don't need any sort of superpower to figure that out.[otherwise if in Chapter 10] You sense nothing.  And thank goodness for that." instead.

Section 3 - conversation with Ava

[The conversation table of Ava is the table of Ava's conversation.]
The object-based conversation table of Ava is the table of Ava's replies.

Table of Ava's replies
conversation 	reply	
an object [default]	"She does not reply.[placeholder]That seems kind of rude and unfriendly. She should have a handful of default responses for topics she doesn't know.[end placeholder]"	
Aidan 	"[if in chapters 1 through 2]'I think your brother is kind of cute.'  Ava giggles a little, then turns bright red. 'You won't tell him I said that, will you?  I'd die!'[otherwise if in Chapter 4]'He looked pretty bad,' Ava says, worriedly.  'I hope he'll be okay!'[otherwise if in Chapter 7]'He's gone crazy!  We've got to do something!'[otherwise if in Chapter 10]'I feel kind of sorry for him.  I mean, it wasn't exactly his fault that he went crazy, was it?  And now of course everyone's afraid he'll go crazy again.'"
Stacy 			"[if in Chapter 7]Ava wrings her hands.  'I wish Stacy were here!  She always has some bright idea to fix things!'[Otherwise]'She's so thin, I worry about her.  I mean, I know she eats okay, but ...' Ava sighs.  'If she weren't my best friend, I'd totally hate her.'"
Lucian			"[if the player has not been able to see Lucian and in Chapters 1 through 2]'Who?'[otherwise if in Chapters 2 through 4 and the player has been able to see Lucian]'He's not bad, really.  He's just kind of shy and homesick.'[otherwise if in Chapter 7]'We've got to help him, Daniel!  Aidan's really going to kill him!'[otherwise if in Chapter 10]'I think it was awfully brave of him to go looking for help that night, wasn't it?  Most people would have locked themselves in their rooms.'[paragraph break]Across the table, Lucian blushes and pretends to be completely absorbed in his breakfast."
Brad		"'He's your counselor this year, right?  That's really all I know about him, sorry.'"
Michelle		"'I just know that she's one of the counselors, and that she likes music.'"
Claudia		"[if in Chapter 1]'I wonder what she's like.  I hear she's only temporary, though, until they get someone who actually knows about camps and teaching and that sort of thing to take over.'[otherwise if in Chapter 2]'If things get too bad, Daniel, at least we've got a doctor in charge of the camp.'[otherwise if in Chapter 4]'Well, she seems like a nice lady.  You really should do as she says and try to get some rest.'[otherwise if in Chapter 7]'I don't think she can help us here, Daniel!'[otherwise if in chapter 10 and C10.1 is unfired][Ava quips C10.1][otherwise]Ava shrugs.  'She's been really nice, I suppose.  I mean, if she hadn't been there, you and Aidan would both be dead, or worse.  That's more than just being nice, but you know what I mean.'"
yourself		"[if in Chapter 1]'What an odd question!'  Ava sticks her tongue out at you.  'I think you're just being silly.'[otherwise if in Chapter 2]'I don't really know what's happening or why.  I hope it isn't anything serious.'[otherwise if in Chapter 4]'You should be resting, Daniel.  That's what Dr Rose said.'[otherwise if in Chapter 7]'You've got to do something, Daniel!  I don't know, can't you make Aidan feel less angry or something?'[otherwise if in Chapter 10]Ava smiles, but doesn't say anything."
LEAP	"[if in Chapter 1]'Stacy and I are having a great time already!  I just wish the food were better, but I suppose you can't have everything.'[otherwise if in Chapter 2 and Hank is unidentified]'There's a lot of things this year that are different from last year.  Maybe one of them is what's causing your headaches.'[otherwise if in Chapter 2]'LEAP's supposed to be for smart kids, right?  So what are those bullies doing here?'[otherwise if in Chapter 4]'A lot of people back at camp are talking about how Aidan picked you up like you were nothing and zoomed off to the hospital.  They're really impressed.'[otherwise if in Chapter 7]'We can't go back to camp without stopping Aidan and rescuing Lucian!'[otherwise if in Chapter 10]'You know, all things considered, I think I still had a good time.  I hope next year will be less scary, though.'"
Hank		"[run paragraph on][Ava on bullying][run paragraph on] "
Joe			"[run paragraph on][Ava on bullying][run paragraph on] "
Bogart		"'Those old black-and-white movies are quite nice, I'll agree, but I think Stacy's just a little obsessed with Humphrey Bogart's stuff.'"
Ava's books	"[placeholder]Ava's books as dialogue[end placeholder][try examining Ava's books]"
Ava's CDs		"[placeholder]Ava's CDs as dialogue[end placeholder][try examining Ava's CDs]"
Ava's CD player	"[placeholder]Ava's CD player as dialogue[end placeholder][try examining Ava's CD player]"
odd sensations investigate	"[placeholder]asking about the goal '[odd sensations]'[end placeholder]"

Report asking Ava about "thief/thieves": say "[if in chapter 2 and Hank is identified]'I really don't understand why anyone would want to be so mean!'[otherwise if in chapter 10 and C10.1 is unfired][Ava quips C10.1][otherwise if in chapter 10]'I don't know, Daniel.  It all seems very mysterious to me.'[otherwise]Ava doesn't have much of interest to say about that." instead.

Report asking Ava about "mindscape" when in chapter 10: say "Ava can't seem to hear enough about your adventures in Aidan's mindscape.  'I wonder what it all means.  I mean, it's supposed to be all very symbolic, right?'" instead.


Report asking Ava about "star": say "'Does Humphrey Bogart count?  We've got a Hollywood theme going on our floor.'" instead.

Report asking Ava about "[damon]": say "[if in Chapter 7]'I don't think that's going to help, Daniel!'[otherwise if in Chapter 10]'It was really tragic, him dying so suddenly.  He was better at spending time with us campers, you know, but then I guess Dr Rose also has her hospital work, and he didn't.'[otherwise]'Oh, that was really tragic!  He seemed so full of life, you know?  And so nice.  I mean, I never got to talk to him personally or anything, but you remember the welcome speech on the first day last year, and the farewell speech.... Of course, his sister's in charge now, and she also seems quite nice, even if she didn't make any welcome speeches.  Maybe she's shy.'" instead.

Report asking Ava about "[antonia]": say "'I just know what Stacy tells me.  I wasn't in any of her classes last year, and I'm not registered for any of them this year either.'" instead.

Report asking Ava about "[mouskouri]": say "[if in Chapter 7]'Really, Daniel, this is not the time!'[Otherwise]'She's my favorite singer!  She's got a fantastic voice!'  Ava begins to sing something about how only love can make a memory, before you stop her." instead.

Report asking Ava about "music": say "[if in Chapter 7]'Really, Daniel, I don't think that's going to help!'[Otherwise]'I'm listening to a lot of folk music these days.'  She names a few groups that you've never heard of, most of them from the Canadian maritime provinces.  'My parents got me a voice teacher last September, and she's from Halifax, Nova Scotia.'" instead.

Report asking Ava about "[bullying]": say Ava on bullying instead.  To say Ava on bullying: say "[if Hank is unidentified]'I've heard people talk about being bullied, but no-one's tried to push me around so far.'[otherwise if in Chapter 2 and Hank is identified]'I really don't understand why anyone would want to be so mean!'[otherwise if in Chapter 4]'I wouldn't know, Daniel.  I've been avoiding them ever since that night when we got Lucian's crystal back from them.'[otherwise if in Chapter 7]'Daniel, right now Aidan's a thousand times worse than both Hank Thomson and Joe Gaffikin put together.  We've got to do something!'[otherwise if in Chapter 10] 'I haven't seen them today.  I hear they came down with food poisoning last night and had to be taken to the hospital.'[paragraph break]'No surprise,' mutters Stacy, pushing a slab of scrambled egg around her plate."

Report asking Ava about "[singing]": say "[if in Chapter 7 and Lucian is not in the location]'I don't see how that can help right now, Daniel!'[otherwise if in Chapter 7 and the location is the library and Lucian is in the library vent]'Well ... there's that song ... oh no.'  Ava glances at the vent and looks at you, hesitating.[otherwise]'My parents got me a voice teacher last September, and I'm registered for singing lessons here as well.  My folks think I'm going to be a great opera singer, but actually I'd rather sing folk music.'" instead.

Report asking Ava about "[lean on me]": say "'Oh no,' Ava winces, 'I spent way too much time practicing with that song after I started with the voice lessons.  It's kind of a silly song, anyway.'" instead.

Report asking Ava about "[powers]": say "[if in Chapter 1]'What powers?'[otherwise if in Chapter 2] 'Well, if that's what you want to call it.  I think it's probably more like an allergy.'[otherwise if in Chapter 4]'I don't know what to say, Daniel.'  Ava shifts uncomfortably.  'It's like something out of a comic book.'[otherwise if in Chapter 7]'Why do you think I came looking for you?  You've got to use those powers of yours to help.  This is more important than any silly earth crystal!'[otherwise if in Chapter 10]'I just hope your powers didn't have any side effects, like Aidan's had.' Ava shakes her head worriedly." instead.

Report asking Ava about "[food]": say "[if in Chapter 7]'How can you think about food at a time like this?'[otherwise]Ava makes a face.  'The accidents we come up with in the cooking classes are better than what they dish out in the dining hall.'" instead.

Report asking Ava about "[class]": say "[if in Chapter 7]'How can you think about class at a time like this?'[otherwise if in Chapter 10]'The cooking classes were great.  Maybe next year they'll let us cook for the dining hall.  Though maybe it won't make a difference.  After all those classes, I'd say that the cooking is actually okay, but it's the ingredients that are a bit off.  Well, maybe they could go easy on the fake sugar, too.'[otherwise]'I'm registered for a series of cooking classes this year,' Ava says.  'Maybe they'll tell me why the LEAP dining hall food tastes so awful.'" instead.



Chapter 4 - Stacy

Section 1 - Description

Stacy Alexander is a woman in the pits lobby east. "[if Stacy follows the player and Ava follows the player]Ava and Stacy trail along behind you. [Ava mentioned] [run paragraph on][otherwise if Stacy follows the player]Stacy trails along behind you. [run paragraph on][otherwise if in chapter 5]Stacy is sitting beside you, completely absorbed in her project.[otherwise if in chapter 6]Much, the Miller's Son, as played by thy friend Stacy, loiters.[otherwise if Ava is in the location][Ava mentioned]Ava and Stacy are here.[otherwise]Stacy is here."  
The description of Stacy is "You met Stacy last year, here at LEAP.  She's a skinny blonde girl with freckles and rather prominent front teeth.  She likes playing with gadgets, and is so full of nervous energy she could probably swallow an elephant and not gain an ounce of weight.  [if Stacy wears the straw hat]She's also wearing a neat little straw hat with a pink ribbon trailing behind.  [otherwise if Stacy wears the deerstalker cap]She's also wearing a deerstalker cap with a completely inappropriate daisy stuck into one flap.  [otherwise if Stacy wears the purple hat]She's also wearing a rather dashing purple hat with a wide, floppy brim. [end if]  [line break]".  The printed name of Stacy Alexander is "[if the constructing the status line activity is going on and Hospital Chat is happening]Ava and [end if]Stacy".

The little straw hat is a girly Stacy-esque hat. "This little straw hat belongs to Stacy, and is decorated with a few paper flowers and a wide pink ribbon.  It's rather more feminine than you would expect from someone who spends half her time playing with screwdrivers." Stacy wears the little straw hat. A pink ribbon is part of the little straw hat. The description of the pink ribbon is "[PLACEHOLDER]ribbon[end placeholder]." The little straw hat fulfills the hat-goal.  The printed name of the little straw hat is "Stacy's little straw hat[if taking inventory and we have worn the little straw hat] ([italic type]not[roman type] worn!)"

The purple hat is a girly Stacy-esque hat. "It's one of those flashy, wide-brimmed hats designed to sit at an angle on one's head."  Understand "dashing/flashy" as the purple hat.

[Instead of attacking,  eating, pulling, or pushing a hat worn by Stacy, say "Stacy would kill you if you killed her hat."]

Instead of attacking, eating, pulling, or pushing a Stacy-esque hat, say "Stacy would kill you if you killed her hat."

Check taking a hat worn by Stacy: say "It seems to be firmly attached to Stacy's head.  Also, she'd make you eat a screwdriver sideways if you tried anything." instead.

Check wearing a girly hat: say "But it's a girl's hat!"; rule succeeds.  

Check examining Stacy when in chapter 6: say  "Much, a fine fellow, is played this day by thy friend Stacy.  She -- or he -- has been pleased to take but a small speaking role, that she might explore the simulation at her leisure when thou and thy brother art gone to the next scene."  instead.


Section 2 - actions on Stacy

Instead of pushing, pulling, or attacking Stacy, say "Only if you want a screwdriver in your ribs."

Check kissing Stacy: say "Aidan makes enough fun of you and your 'girlfriends' as it is.  Do you really want to give him any more ammo than he already thinks he has?" instead.

Check focusing on Stacy: say "[if in chapter 1]'What?  Is there something on my nose?'[otherwise if in Chapter 2]You seem to hear crickets chirping.[otherwise if in Chapter 4]There's definitely some sort of chirping, ringing sound surrounding Stacy, along with a vaguely smoky smell.  She's ... curious?  Suspicious?  Anxious?  Something like that.[otherwise if in Chapter 5]Stacy is focussed on SARG with the sort of concentration most people reserve for defusing bomb threats.  There's a sort of interest and excitement about her that tells you that everything must be going according to plan.[otherwise if in Chapter 6]Stacy seems hurt and confused, especially with regard to Aidan.  She must still be thinking about what happened at the robotics class.[otherwise if in Chapter 10]You sense nothing.  And thank goodness for that." instead.


Section 3 - conversation with Stacy

[The conversation table of Stacy is the table of Stacy's conversation.]
The object-based conversation table of Stacy is the table of Stacy's replies.

Table of Stacy's replies
conversation 	reply	
an object [default]	"She does not reply.[placeholder]That seems kind of rude and unfriendly. She should have a handful of default responses for topics she doesn't know.[end placeholder]"	
Aidan			"[if in Chapters 1 through 2]'He's pretty good with electrical gadgets and that sort of thing.  We've got that robotics class coming up on Friday, and I'd really like to see what he comes up with.'[otherwise if in Chapter 4 and Stacy is not in the location]'Ava knows more,' Stacy mutters. 'I'm just as curious as you.'[otherwise if in chapter 5]'I'd like to see what he's building, but I guess I can wait until the end of class.  Bet it won't come close to beating the Stacy Alexander Robot Guy, though!'[otherwise if in chapter 6]'He's your brother.  I have nothing to say.'[otherwise if in chapter 10 and C10.2 is unfired][Stacy quips C10.2][otherwise if in chapter 10]'He's told me he's sorry about everything, so I guess I should stop being mad at him.  But I'm still kind of worried that he's going to go crazy again one day.'"
Ava		"[if in chapter 5]'She should be in the middle of her cooking class right now.  If we're lucky, she'll have something left over that we can eat instead of the dining hall food.'[otherwise if in chapter 6]'She's in the town; you know that.  I think she's playing a nun or something.'[otherwise]'Ava worries too much about everything,' Stacy says.  'I tell her to stop, but she just won't listen.'"
Brad	"'I'm actually kind of jealous that he's your counselor.  None of the other counselors are quite as sensible.'[if Ava is in the location][paragraph break]'You just think that because he's the only one who doesn't think your hats are silly,' says Ava."
Michelle		"[if in chapter 1]'She's really absent-minded.  I'm surprised she didn't lose her head for you to find in the scavenger hunt.'[otherwise if in chapter 2]'If you're not talking to your counselor about what's going on, I don't see why we should drag some other counselor into this.'[otherwise if in chapter 4]'I don't know.  I guess she's back at the camp, doing camp counselor-type stuff.'[otherwise if in chapter 10]Stacy shrugs.  'She's an okay counselor, I guess.  I don't really have anything to say about her one way or another.'"
Hank		"[Stacy on bullying]"
Joe			"[Stacy on bullying]"
Claudia Rose		"[if in chapter 10]'After everything that happened, I guess it was a good thing that we had a medical professional in charge this year.  I don't know if Damon Rose could have handled it as well.  Maybe he'd have called the doctor in to help, I don't know.'[otherwise if in chapter 6] The good doctor doth not enter into the simulation.[otherwise]'Well, I'm glad she stepped in to keep the camp running, after Mr Rose went and died.  She's supposed to be very busy with the hospital, though, and anyway camps like this aren't really her thing.  They'll probably find someone else to take over next year.'"
Lucian		"[if the player has not been able to see Lucian]Stacy doesn't know anyone by that name.[otherwise if in chapters 1 through 2]'He seems like a bit of a whiner, if you ask me.  But if he needs help, I guess we'd better do something.'[otherwise if in chapter 4]'He seemed kind of scared and upset, last time I saw him.'[otherwise if in chapters 5 through 6]'What?  Has something gone wrong with him again?'[otherwise if in chapter 10]'Lucian's okay, I guess.  He hates the dining hall food just as much as I do.'"
yourself		"[if in chapters 1 through 5]'You're you.  Why?'[otherwise if in chapter 2]'If there's something wrong with you, I'd like to know what it is.  I mean, that's what friends are for, right?'[otherwise if in chapter 4]'I heard about what happened in the dining hall.  Are you sure it wasn't the food?  It's pretty icky, after all.  You look okay now, anyway.'[otherwise if in chapter 6] 'You're Little John, or have you forgotten already?'[otherwise if in chapter 10]'You're you, of course.  After everything that's happened, that's about the best sort of thing for you to be, I think.  I just hope nothing else happens because of all this.'"
ping pong		"[if in chapter 1]'I like Ping Pong.  It's a sport like tennis, but you don't have to run around.  Not very much, anyway.  Can you believe Ava's never played before?'[otherwise if in chapters 2 through 5]'I highly recommend it.'[otherwise if in chapter 10]'It's a little late to be thinking of signing up for any options, don't you think?'"
scavenger hunt		"[if in chapter 1]'Sorry, Daniel, if I'd known you were doing the Scavenger Hunt, I'd have signed up for it too.'[otherwise if in chapters 2 through 5]'I don't think I'm going to get around to doing that option this year.  I've already booked spots in a whole bunch of other things.  And anyway it's not like you're going to be taking it again, right?'[otherwise if in chapter 6]'Yeah, I've got a list of a bunch of stuff in the simulation that I want to look at before our time is up.'[otherwise if in chapter 10]'It's a little late to be thinking of signing up for any options, don't you think?'"
five-pointed star		"[if in chapters 1 through 2]'Have you checked the fourth floor?  They've got some kind of astronomy theme going on up there.'"
Humphrey Bogart	"[if in chapter 6]'Bogart never made any Robin Hood movies.  Not really his type of character, I'd say.'[otherwise]'Humphrey Bogart's okay, I guess.  But Ava's, like, in love with him or something.'"
paper hat			"[if in chapter 1][Stacy on hats][otherwise]'Everything's better with hats!'"
deerstalker cap		"[if in chapter 1][Stacy on hats][otherwise]'Everything's better with hats!'"
little straw hat		"[if in chapter 1][Stacy on hats][otherwise]'Everything's better with hats!'"
few broken gadgets	"[if in chapter 1]'I promised I wouldn't break anything this year, just to see how it works.'  Stacy looks a little shifty.  'Of course, some things were already broken when I found them, so that's really not my fault.'[otherwise if in chapter 2]'Oh, I'm in the middle of a bunch of stuff.  Some of these ex-gadgets look like they could be great add-ons for SARG.'[otherwise if in chapter 4]'It's nothing compared to....' Stacy looks suddenly guilty.  'I wasn't thinking of taking apart any of the hospital equipment!  Honest!'[otherwise if in chapter 5]'Yeah, I've had lots of practice.'[otherwise if in chapter 6]'Yeah, I'm sure Much's dad's mill is just full of interesting Olde Englishe gadgetry.'[otherwise if in chapter 10]'I did finish fixing a lot of the stuff on my desk, in the end.  Some of the others, well....'  Stacy shrugs, then grins.  'Let's just say SARG has improved a lot in the past two weeks.'"
LEAP		"[if in chapters 1 through 2]'I'm having a great time already.  I was kind of worried that they'd cancel the camp this year.  You know, after Mr Rose's death and everything, but I'm glad his sister's taking charge.'[otherwise if in chapter 4]'Ava and I skipped class this morning to visit you.  I hope you're grateful.'[otherwise if in chapters 5 through 6]'They don't have things like this back home, do they?'[otherwise if in chapter 10]'Another year gone.  In spite of everything, I'm sorry to see the end of this.  There's still next year, though.'"
Stacy's tools		"'My dad's co-worker, Dr Hu, gave me this nifty new screwdriver for Christmas.  It's made out of a special space-age metal alloy, and the handle is specially molded to fit in my hand.  And it lights up if it touches something with an electrical current in it.  It's totally the awesomest screwdriver ever.'"
Stacy's screwdriver		"'My dad's co-worker, Dr Hu, gave me this nifty new screwdriver for Christmas.  It's made out of a special space-age metal alloy, and the handle is specially molded to fit in my hand.  And it lights up if it touches something with an electrical current in it.  It's totally the awesomest screwdriver ever.'"
odd sensations investigate	"[placeholder]asking about the goal '[odd sensations]'[end placeholder]"


Report asking Stacy about "[damon]": say "'I read all about Mr Rose's death in the newspaper.  I thought LEAP would shut down this year because of it, but I'm glad his sister decided to step in and keep the camp running.  I mean, it's awful that he's dead and all, and I'm sorry that he's gone, but really I didn't know him all that well.'" instead.

Report asking Stacy about "[antonia]": say "[if in chapter 5]'I wouldn't try asking her about anything, if I were you.  At least, not now, while she's being mobbed by idiots who shouldn't be taking this class in the first place.  Wait until after class if you really need her help.'[otherwise if in chapter 6]'I know she programmed most of Sherwood Forest.  I can't wait to go take a closer look at everything.'[otherwise if in chapters 1 through 4]'She's really smart.  I wouldn't be taking her robotics class again this year if she weren't.  But she's always getting bogged down by stupid people who need things explain seven or eight times.'[otherwise if in chapter 10]'I really liked her class.  Well, except for the part where Aidan broke SARG, but that wasn't her fault.  I hope she'll be back again next year.'" instead.

Report asking Stacy about "[hu]": say "Yeah, he's one of my dad's co-workers.  He's pretty brilliant, and has all the neatest gadgets." instead.

Report asking Stacy about "[robot]": say "[if in chapters 1 through 4]'The Stacy Alexander Robot Guy!  Remember, he was my project from last year, for robotics class?  This year, I'm going to work on making him even better than before.'[otherwise if in chapter 5]'SARG?  He is going to be so awesome once I'm done with him!'[otherwise if in chapter 6]'Don't remind me,' quoth Much with a growl.[otherwise if in chapter 10]'He was pretty awesome, wasn't he?  And if you think he was awesome this year, just you wait until next year!'" instead.

Report asking Stacy about "[powers]": say "[if in chapter 1]What powers?[otherwise if in chapter 2]'It would be really awesome if you were developing super powers, Daniel, but that sort of thing doesn't happen in real life.'[otherwise if in chapter 4]'So you've got these super emo-powers now?  I think I'm jealous.'  She isn't really, you know, but you somehow know that she finds the idea absolutely fascinating.[otherwise if in chapter 5]'I don't think those emo-powers work on robots, Daniel.  Robots don't have emotions.'[otherwise if in chapter 6]Stacy rolls her eyes.  'If Little John had those powers, the Robin Hood stories would be very very different.'[otherwise if in chapter 10 and C10.4 is unfired][Stacy quips C10.4][otherwise]'I'm still wondering where those powers come from.'[paragraph break]'You're not thinking of trying to get any sort of superpowers, are you?' asks Ava, a little worriedly.  'I mean, look what happened to Aidan.'[paragraph break]'Oh, I'm sure I could handle myself better.'" instead.

Report asking Stacy about "[food]": say "[if in chapters 1 through 2]'Oh yuck.  It's even worse this year than last year.'[otherwise if in chapter 4]'I bet the hospital food is better than what they serve us in the dining hall.  Maybe I'll go break a leg or something, see if they let me in here.'[otherwise if in chapter 5]'Are you trying to spoil my concentration, Daniel?'[otherwise if in chapter 6]Much hath much to speak of the food of the camp, which doth tempt him with savory scents of roast venison; but, as 'tis but a simulation, he knoweth that there shalt be but the poor fare of the LEAP dining hall to follow.[otherwise if in chapter 10]'It's our last day, and I'm not touching more of this than I absolutely have to.'" instead.

Report asking Stacy about "mindscape" when in chapter 10: say "I'm officially jealous.  That totally beats the Simulation Sunday VR." instead.

Report asking Stacy about "[bullying]": say Stacy on bullying instead.  To say Stacy on bullying: say "[if the player has not been able to see Lucian]'Yeah, I heard about them.  They don't mess with the girls much, luckily.'[otherwise if in chapter 2 and the player has been able to see Lucian]'Those boys need to be taught a lesson,' Stacy mutters darkly.[otherwise if in chapter 6]Such craven villains existeth not in the time of Robin Hood; or if they did, thou shalt surely vanquish them ere the tale is told.[otherwise if in chapters 5 through 10]Stacy shrugs.  'I can't say I've noticed them at all since that other night.'"


To say Stacy on hats: say "[if Stacy has a hat and the player has the paper hat]'I like my hat, thanks.  That newspaper hat of yours, well, I stopped wearing those when my folks started letting me get real ones.'[otherwise if in chapter 1 and the player has a hat and Stacy does not have a hat]'If you destroy that hat, I'm going to destroy you, so watch it.'[otherwise if in chapter 1 and Stacy has a hat and the player does not have a hat][Stacy quips Q_STACY_0][otherwise]'Everything's better with hats!'"


Q_STACY_0 is a quip. The display text is "'Hey, Stacy,' you say, 'I don't suppose I could borrow your hat for a bit, could I?'[paragraph break]'What?  What am I supposed to wear, then?'"

Q_STACY_1 is a quip. The display text is "'No.'"

Q_STACY_2 is a quip. The display text is "'No way, Ava and I will lose our place in the line if I run up to our dorm to get another hat.'"

Q_STACY_3 is a quip. The display text is "'No.'"

Q_STACY_4 is a quip. The display text is "Stacy hesitates a little, then sweeps the hat off her head.  'Okay, fine.  But if you ruin it, I'll kill you with a screwdriver.'"

Q_STACY_0a is a transitional quip. The following quip is Q_STACY_1. The menu text is "'Please?'".
Q_STACY_0b is a transitional quip. The following quip is Q_STACY_2. The menu text is "'I know you've got a bunch of other hats you could wear.'".
Q_STACY_0c is a transitional quip. The following quip is Q_STACY_4. The menu text is "'Come on, it's for the scavenger hunt.  Please?'"

Q_STACY_1a is a transitional quip. The following quip is Q_STACY_3. The menu text is "'Pretty please?'".

Q_STACY_3a is a transitional quip. The following quip is Q_STACY_1. The menu text is "'P-p-p-please?'".

The response of Q_STACY_0 is {Q_STACY_0a, Q_STACY_0b, Q_STACY_0c}.
The response of Q_STACY_1 is {Q_STACY_1a, Q_STACY_0b, Q_STACY_0c}.
The response of Q_STACY_2 is {Q_STACY_0a, Q_STACY_0c}.
The response of Q_STACY_3 is {Q_STACY_3a, Q_STACY_0b, Q_STACY_0c}.

After firing Q_STACY_4: now the player carries the little straw hat.

Part 21 - your room

Chapter 1 - Description

your room is a dorm room. "You share this room with first-year camper Jeremy Dolan, who hates werewolves for some inexplicable reason.  He let you put the werewolf cutout on the outside of the door only because you let him put up a vampire cutout on the inside.  Jeremy's not around right now, though, so you'll have to wait before continuing your ongoing discussion as to whether vampires or werewolves are cooler.  In the meantime, there's your bed and your desk, and the door back to the north."  Understand "my" or "your" or "dorm" as your room.

your door is a closed [not dorm door, for ease of coding ] door, scenery, south of pits east, north of your room. Understand "my" or "your" as your door.

First check going when in chapter 1:
	if the room gone to is a dorm room, say "Michelle had said the dorm rooms were off-limits for the hunt." instead;
	if the room gone to is in the Claremont Hall region, say "Claremont Hall is off-limits.  It's only full of empty lecture halls, anyway." instead;
	if the room gone to is the dining hall, say "The Dining Hall is off-limits for the moment.  And anyway, you don't really want to go in there: you might actually see what they do to the food to make it taste so awful, and then you'll have nightmares for weeks." instead.

First check going to an exterior room when in chapter 2: say "It's against the rules to leave the building during dorm time." instead.

First carry out going north when in your room and in chapters 1 through 7: say "You step out of the room, locking it behind you." [no instead here -- just narrate ]

Chapter 2 - Scenery

Instead of doing something when in your room and the cutout werewolf is involved:
	say "[if the second noun is nothing]He[otherwise]Wolfie[end if]'s on the other side of the door.  Thinking about it now, maybe you should have let Jeremy put his vampire cutout on that side instead, and wolfie on this side.";

A cutout vampire is scenery, in your room. "It is a mystery to you why anyone would think these snotty, bloodless monsters are cool, except in the sense of being cold, dead bodies.  Also, this particular vampire cutout seems to have a disconcerting way of following you with his eyes, which is really creepy."

Your bed is scenery, a supporter, in your room. "A standard, regulation LEAP bed, with nothing under it but dust.  You've looked several times, especially in the mornings when you can't find your [one of]slippers[or]socks[or]shoes[or]keys[at random]."

Check looking under your bed: 
	say "Oh hey, someone's gone and swept under the bed[if a LEAP camp flyer is off-stage].  And it seems Jeremy left a camp flyer under here[end if].";
	if a LEAP camp flyer is off-stage, move the LEAP camp flyer to the location;
	rule succeeds.

Check hiding yourself under your bed when in chapter 8: say "Aidan may be pumped full of sedatives, but they're not going to make him stupid enough to miss you crawling under your bed!" instead.


Instead of entering or lying on your bed, say "Now doesn't really seem to be the time for sleep."
Check sleeping: say "Now doesn't really seem to be the time for sleep." instead.

Jeremy is scenery in your room. The description is "[placeholder]describe Jeremy Dolan[end placeholder]".

Some dust is scenery, in your room. 

Your desk is scenery, a supporter, in your room. "A standard, regulation LEAP desk, with a built-in electrical outlet for your laptop if you have one.  The actual outlet is probably in some inconvenient place behind the desk, but why they couldn't just supply you with a power bar, you don't know.  Well, you suppose desks with built-in outlets are pretty cool.  Just... not as cool as werewolves."

Understand "standard", "regulation", "LEAP", "laptop" as your desk when your desk is in the location.

The built-in electrical outlet is part of your desk. Understand "electric", "power", "socket" as the built-in electrical outlet.

Part 22 - second floor lobby

Chapter 1 - Description

The second floor lobby is a room, up from the first floor midpoint. "Hooray for Hollywood!  The words are emblazoned right across the wall, over a cutout of Audrey Hepburn holding a pouch full of smaller cutouts of other Hollywood stars.  The glamour continues east and west, to where the younger girl campers are roomed, while the stairs go up and down.[if in chapter 1][paragraph break]A few tables have been set up here for the RPG option, and the campers involved seem thoroughly absorbed in the unfolding story.[otherwise if in chapter 2][paragraph break]It looks like the folks who took yesterday's RPG option have decided to reconvene and keep playing."

Chapter 2 - Scenery

Understand "big-name", "A-list", "actors", "actresses", "past and present", "hollywood", "stars" as the images of Hollywood stars.

The description of Audrey Hepburn as Holly Golightly is "It's Audrey Hepburn in her role as Holly Golightly in 'Breakfast at Tiffany's.'  You haven't seen that movie, but somehow you suspect that Holly Golightly never, at any point in the story, dangled a pouch of any sort from the end of her cigarette holder."

Understand "cigarette", "holder", "breakfast", "at", "tiffany's" as Audrey Hepburn as Holly Golightly.

The description of Audrey Hepburn as Holly Golightly's cutout pouch is "It's full of big-name, A-list actors and actresses, past and present."  Understand "actor/actors" or "actress/actresses" as Audrey Hepburn. 

Audrey Hepburn as Holly Golightly's cutout pouch is represented by the images of Hollywood stars.

Audrey Hepburn as Holly Golightly's cutout pouch vends the cutout picture of Charlie Chaplin.

Report taking Audrey Hepburn as Holly Golightly's cutout pouch: say "You rummage around among the celebrities like a tabloid journalist questing for a scandal, and finally emerge with with a small cutout of Charlie Chaplin." instead.

Check taking Audrey Hepburn as Holly Golightly's cutout pouch when the prize of the noun is handled: say "A fellow can only take so much glamour in one go, don't you think?" instead.

A cutout picture of Charlie Chaplin is a thing. The description is "It's a small cutout of Charlie Chaplin.  He looks alarmingly like Adolf Hitler, only with curly hair."

Check attacking the cutout Charlie Chaplin:
	say "Much as he looks like Hitler, you can't bring yourself to do anything so nasty to that lovable old tramp Charlie Chaplin." instead.

The cutout Charlie Chaplin fulfills the star-goal.

Chapter 3 - RPG Option

The RPG option is an option, scenery, in the second floor lobby. "[if in chapter 1]You've not had much exposure to roleplaying games in the past, but this looks quite interesting.  You'd have signed up for this option this evening if it hadn't filled up within seconds of being offered.  You'll get another chance some time later, though, never fear.  At any rate, this time round they're playing something called Seventh Sea, which seems to be all about swashbuckly goodness, arrr[otherwise]They must have really enjoyed themselves yesterday[end if]." 

Understand "role", "playing", "roleplaying", "role-playing", "game", "games", "gamer", "gamers", "seventh", "sea", "tables", "campers" as the RPG option.

Check focusing on the RPG option: say "[if in Chapter 1]You are distracted by a mild itch in one ear.[otherwise]You stare at the gamers.  You could almost swear there's a dark, bluish-green aura about them, and their speech seems to buzz like a swarm of bees." instead.

Check listening to the second floor lobby when in chapter 1: try listening to the RPG option instead.

Check listening to the RPG option: say "[one of]'No way!  I should totally have made that roll!'[or]'Where's my drama die, then?'[or]'...one and one and two and two and one....'[or]'Excuse me, milady, but I must punch you in the face now.'[or]'It could be worse.  Okay, maybe that IS worse.'[or]'But I am not left-handed either!'[or]'What?  A gazebo?  How ... how big is it?'[or]'We confront the villainous villainess with the evidence!'[or]'He what?  That no-good scoundrel!'[or]'I hit it with my sword.'[at random] [line break]" instead.


Part 23 - second floor rooms west

Chapter 1 - Description

The second floor rooms west is a room, west from the second floor lobby, up from first floor rooms west. "The large window at this end of the corridor would normally look out over Second Avenue, but someone's gone and plastered it over with cutouts of every actor who's ever played James Bond.  There's definitely a spy thriller motif going on here: the only surfaces not covered with more of the same are the doors to the rooms and the door to the fire stairs, which continue up and down from here.  The way back to the east looks significantly less cloak-and-dagger."

Chapter 2 - Scenery

Bond is a kind of thing, scenery. The description of a Bond is usually "Someone clearly thinks this is the spy who loved her."  The Bonds are defined by the table of actors who played Bond. Understand "007", "spy", "spies", "bonds", "actors/actor" as [not just any Bond, but...] James Bond [avoiding disambiguation requests].

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


The description of David Niven is "Oh hey, someone's even counted the 1967 not-entirely-serious version of 'Casino Royale'!"

When play begins, now every Bond is in the second floor rooms west.

Check taking Bond when in the second floor rooms west: say "You don't have a death trap to put him in." instead.
Check attacking Bond when in the second floor rooms west: say "You don't have a death trap to put him in." instead.


Part 24 - second floor rooms, east

Chapter 1 - Description

The second floor rooms east is a room, east from the second floor lobby, up from the first floor rooms east. "The girls at this end of the corridor seem to prefer movie posters to cutouts of actors.  The only cutout here is a life-size Humphrey Bogart, on the door to the fire stairs.  Opposite Bogey, to the north, is Ava and Stacy's room, while behind Bogey are stairs going up and down.  And at the end of the corridor is, of course, the window overlooking Calvin Field, and stardom continues back to the west."

Chapter 2 - Scenery


A life-size cutout of Humphrey Bogart as Sam Spade is scenery, in the second floor rooms east. "Humphrey Bogart as Sam Spade in 'The Maltese Falcon': trenchcoat, fedora, world-weary expression, and a general air of noir-ness.  Apparently he's guarding the stairs."

Understand "detective", "trenchcoat", "fedora", "world-weary", "world weary", "weary", "expression", "Bogey", "Bogie", "The Maltese Falcon", "in The Maltese Falcon" as the life-size cutout of Humphrey Bogart.

Some movie posters are scenery, in the second floor rooms east. "You haven't heard of half of these films.  You wouldn't watch most of the others.  The remaining few are pretty good, though: you know that those were put up by your friends Ava and Stacy, who at least have some sense in them."

Understand "films", "film", "movies" as the movie posters.

Part 25 - Stacy & Ava's Room

Stacy's room is a dorm room. "Ava and Stacy [if Visiting Stacy-and-Ava is happening][Stacy mentioned][Ava mentioned][end if]both keep their respective sides of the room perfectly tidy; it's rather intimidating, actually.  You can tell whose side is whose by the stuff they keep on their desks: Ava has a CD player, an assortment of CDs, and a few books; Stacy has a few broken gadgets that she's fixing, probably because she broke them to begin with.  One of them has taped a poster for 'Casablanca' on the door to the south."  The printed name of Stacy's room is "Ava and Stacy's room".

Stacy's door is a dorm door, scenery, closed, locked.  Stacy's door is north of the second floor rooms east and south of Stacy's room.  The printed name of Stacy's door is "Ava and Stacy's door". Understand "Ava and", "Stacy and", "Ava's", "Stacy's" as Stacy's door.

Check opening Stacy's door during Scavenger Hunting:
	say "Ava and Stacy aren't in right now, and it wouldn't be right to go poking around in other people's rooms while they're gone.  And anyway, the door is locked." instead.

The poster for Casablanca is scenery, in Stacy's room. "Here's lookin' at you, kid." 
The printed name of the poster for Casablanca is "poster for 'Casablanca'". 

Stacy's tools are scenery, plural-named, in Stacy's room. The description is "Rule one: never touch Stacy's tools.  Rule two: see rule one."  Understand "screwdriver" as Stacy's tools when in Stacy's room. Stacy's screwdriver is scenery in Stacy's room. 

Ava's desk is scenery, in Stacy's Room. Understand "desks" as Ava's desk. Understand "desks" as Stacy's desk.
Ava's CD player is scenery, on Ava's desk. "It also plays MP3s.  Ava loves her music."
Ava's CDs are scenery, plural-named, on Ava's desk. "Ava's on a folk song kick right now.  It's only a matter of time before she turns country-and-western, you think."
A few of Ava's books are scenery, plural-named, on Ava's desk. "A little light reading, mostly cosy little mysteries set in small New England towns."

Stacy's desk is scenery, in Stacy's Room.
A few broken gadgets are scenery, plural-named, on Stacy's desk. "Stacy's very fond of taking things apart and putting them back together again.  She's going to become a mad scientist and take over the world one day, if you and Ava don't watch her."

Check listening to Ava's CD player: say "You didn't come up here to listen to Ava's CDs.  Especially since she seems to be obsessing over a lot of bands that you've never even heard of." instead.

Check switching on Ava's CD player: say "You didn't come up here to listen to Ava's CDs.  Especially since she seems to be obsessing over a lot of bands that you've never even heard of." instead.

Check switching off Ava's CD player: say "You didn't come up here to listen to Ava's CDs.  Especially since she seems to be obsessing over a lot of bands that you've never even heard of." instead.

Check listening to Ava's CDs: say "You didn't come up here to listen to Ava's CDs.  Especially since she seems to be obsessing over a lot of bands that you've never even heard of." instead.

Check taking Ava's books: say "You don't really have the time right now." instead.
Check reading Ava's books: say "You don't really have the time right now." instead.


Check taking gadgets: say "You wouldn't know where to begin.  And Stacy's giving you a look that plainly says, 'try it and die.'" instead.

Check touching gadgets: say "You wouldn't know where to begin.  And Stacy's giving you a look that plainly says, 'try it and die.'" instead.

Check attacking gadgets: say "Too late, they're already broken beyond any hope of non-Stacy repair." instead.

Check taking Stacy's tools: say "Rule one: never touch Stacy's tools.  Rule two: see rule one." instead.
Check touching Stacy's tools: say "Rule one: never touch Stacy's tools.  Rule two: see rule one." instead.

Part 26 - third floor lobby

Chapter 1 - Description

The third floor lobby is a room, up from the second floor lobby. "This is where the older girls have their rooms.  The walls are painted a very dark blue, and there are planets, stars and all things space-age stuck all over the place.  A cutout of an astronaut holds out a pouch full of astronomical bits; the corridor itself extends east and west, and the stairs continue down to the rest of the dorms and up to the roof.[if in chapter 1][paragraph break]Under a particularly starry patch of ceiling, a group of campers, including your brother Aidan, are engaged in some freeform improvised poetry.  This is the Rap Session option, you think."

Chapter 2 - Scenery

The description of the astronaut is  "You can't tell who it is behind the visor, but it's almost certainly Neil Armstrong."

Understand "spaceman", "space man" as the astronaut.

Neil Armstrong is scenery, in the third floor lobby. "One small step for a man, one giant LEAP... well, clearly someone thought they were being awfully clever."

The description of the astronaut's cutout pouch is "A bag full of constellations." Understand "constellations/constellation" as the astronaut's cutout pouch. 

The astronaut's cutout pouch is represented by the images of stellar bodies.
The astronaut's cutout pouch vends the five-pointed star cutout.

Understand "stars", "constellations", "astronomical", "bits" as the images of stellar bodies.

Understand "star" as the images of stellar bodies when the player can not see the five-pointed star cutout.

Report taking the astronaut's cutout pouch:
	say "You rummage around in the pouch and eventually pull out a large, five-pointed star.";
	now the player carries the five-pointed star cutout instead.

Check taking the astronaut's cutout pouch when the five-pointed star cutout is handled:
	say "No, people will think you're planning on decorating the girls['] dorms, and that's just wrong on too many levels." instead.

A five-pointed star cutout is a thing. The description is "It's a five-pointed star from the third floor decorations pouch.  You wonder which star it's supposed to be.  Probably one of those dull ones with lots of greek letters and numbers in its name."

The five-pointed star cutout fulfills the star-goal.

Section 1 - Rap Option

The rap session option is an option, scenery, in the third floor lobby. "Rap or beat poetry, there's not that much difference that you can see here.  People are basically talking about their lives in an improvised rhythmic fashion."

Check taking the rap session option:
	say "Maybe after your improv theatre class." instead.

Check listening when the rap session option is in the location: say "The girl holding center stage right now is good.  Very good.  But the more you listen, the more your head hurts, and you're finally forced to take a few steps away from the group." instead.


Chapter 3 - Event on Entering

Last report going when the rap session option is in the location during Scavenger Hunting: fire TRIG_RAPSESSION.

TRIG_RAPSESSION is a trigger.

Rule for firing unfired TRIG_RAPSESSION:
	now has yet to encounter a single weird emotional thing is false;
	say "As you enter the area, you experience a momentary headache and the urge to sneeze.  The feeling disappears quickly, but evidently not quickly enough because Aidan clearly seems to have noticed something wrong.  He breaks away from the rest of his option and comes up to you. [paragraph break]";
	move Aidan to the Location;
	start conversation with Aidan on Q_AIDAN_0.

Rule for firing fired TRIG_RAPSESSION:
	say "There it is, that funny throbbing feeling in the back of your head.  And there, it's gone again.";

Chapter 4 - Aidan

Section 1 - description of Aidan

Aidan is a man.  "[if in chapter 1]Your brother Aidan is here, having signed up for the Rap Session option.[otherwise if in chapter 2 and the player is in Aidan's room]Aidan is sitting at his desk, clearly in the middle of a computer game of some sort.[otherwise if in chapter 2]Your brother Aidan is here.[otherwise if in chapter 6]Robin Hood, thy brother-in-arms, standeth before thee.[otherwise if in chapter 7]Aidan's here, and he looks seriously psychotic![otherwise if in chapter 8]Aidan is here, swaying a little and looking like an enraged bull with a killer headache.[otherwise if  in chapter 9 and the player is in the deepest place]Aidan's here, and he looks normal.  Except he knows kung fu, which isn't quite normal.[otherwise if in chapter 10]Aidan's sitting with a small handful of his closest friends, off at the other side of the hall.  They seem rather subdued; most of the other campers seem to be keeping their distance." [otherwise, do nothing -- is scenery ]  
The description of Aidan is "[if Here Comes The Flood is happening]He's sitting with a crowd of older campers, at the other side of the hall.  You're not so insecure that you absolutely have to sit beside him at every meal.  Not now that you're a mature second-year camper, anyway.[otherwise if in chapters 1 through 5]Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He's pretty cool; he just turned 15 a couple of months ago, but hasn't gotten too cool to be seen with you yet.  On the other hand, if your secret plot to grow up just like him works out, he'll never get too cool for you[otherwise if in chapter 6]Robin Hood is thy brother in arms -- and indeed, thy brother Aidan.  There is not a nobler fellow in all of merry old England.[otherwise if in chapter 7][PLACEHOLDER]TODO: examining is much like the Focusing action[end placeholder].[otherwise if in chapter 9 and battle with the thief is happening]Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He also seems to know kung fu, though that isn't really giving him much of an edge over the Thief.[otherwise if in chapter 10]Aidan is your big brother.  He looks quite a lot like you, only taller and broader.  He's pretty cool when he isn't a raving murderous monster, which Dr Rose says is never going to happen again.  For now, he just looks grateful that anyone at all is willing to still be friends with him after everything that's happened in the past week[end if]."  

Check examining Aidan when in chapter 8: say "Aidan looks a bit drugged out, but no less dangerous.  [if Aidan has been able to see Brad]His hands are clenched into fists, and he seems intent on pounding you into applesauce[otherwise]His right hand is clenched in a fist around his room keys, which he seems intent on sending to the back of your skull[end if]." instead.

Check examining Aidan when in chapter 9 and the player is in land of the dead: say "[if old-Aidan does not wear a ring] He looks grey and cold and lifeless.  His hands are crossed at the wrist, over his chest, fingers splayed.  For some reason, he's dressed up as Robin Hood[otherwise if old-Aidan wears two rings]He looks feverish, like he's in pain.  He's wearing a pair of matching rings[otherwise]He looks like he's asleep.  His hands are crossed at the wrist, over his chest, fingers splayed.  For some reason, he's dressed up as Robin Hood.  A single gold ring glints on one finger[end if]." instead.

Check examining Aidan when in chapter 9 and the player is not in the mindscape: say "He doesn't look very happy to be here.  Then again, who would?  Fortunately for everyone, he's also unconscious and drooling slightly.  He's being kept sedated, but goodness only knows how long that will last."[; try Focusing on Aidan ?] [todo?] instead.


Understand "big bro/brother", "bro/brother", "my bro/brother", "my big bro/brother", "taller", "broader", "aiden" as Aidan.


section 2 - conversation with Aidan

Instead of conversing when in chapters 7 through 8 and Aidan is the noun, say "Aidan does not appear to be in any mood to listen to you.  He probably can't even hear you over the pounding blood in his ears."

Instead of conversing when in chapter 3 and Aidan is the noun, say "Aidan's too far away to speak to, at the moment.  You'll have to wait until later this evening."  

Instead of conversing when in chapter 5 and Aidan is the noun, say "Aidan's too far away to speak to, at the moment.  You'll have to wait until later this evening."

[Instead of conversing when Aidan is the noun and in chapter 6, say "Forsooth, such existeth not within the bounds of this simulation."]

The object-based conversation table of Aidan is the table of Aidan's replies.

Table of Aidan's replies
conversation 	reply	
an object [default]	"He does not reply."	
Claudia Rose	"[if in Chapters 1 through 2]'She seems like a nice lady.  Kind of like everybody's favorite auntie, eh?'"
Brad Kramer	"[if in Chapters 1 through 2]'I never had him as a counselor, but he joins some of us for a game of basketball now and then.  He's pretty cool, actually.'"
Ava			"[Aidan on Ava & Stacy]"
Stacy			"[if in Chapter 6]Much may be made of muchness, but thy comrade appeareth not in the humor to humor thy question.[otherwise][Aidan on Ava & Stacy]"
Lucian		"[if in Chapter 1]'Who?'[otherwise if in Chapter 2 and Crystal Quest is not happening]'Sorry, Daniel, I don't see how I can help, there.'[otherwise if in chapter 2 and Crystal Quest is happening][about Joe and Hank and bullying][otherwise if in Chapters 2 through 5]'I hope getting back that crystal makes your friend feel better.'[otherwise if in Chapter 6]This Lucian of whom thou speaketh, existeth not in the time of Robin Hood."
Joe			"[about Joe and Hank and bullying]"
Hank			"[about Joe and Hank and bullying]"
Aidan's guitar	"[if in Chapter 1 through 2]'I should practice my guitar more, but there's just way too much other stuff to do here.'"
LEAP flyers  	"[if in chapters 1 through 2][Aidan quips Aidan-on-camp]"

A woman can be asked about.  A woman is usually not asked about.

To say Aidan on Ava & Stacy: 
	now the second noun is asked about;
	if in chapter 1, say "'Oh yeah, she's your girlfriend, isn't she?'[paragraph break]'She is not!'[paragraph break]'Sure she isn't.' Aidan grins in a way that makes you want to smack him. [if Ava is asked about and Stacy is asked about] 'You're going to have to choose between one of those two girls one of these days, you know.'[end if][paragraph break]'She is NOT my girlfriend!'";
	otherwise say "[if in chapter 2]It wouldn't be polite to talk about her while she's standing right there.  Anyway, Aidan's probably going to give you the ribbing of your life later about how all the girls just fawn over you, bleagh.[otherwise if in chapter 6]And who, pray tell, is this maiden of whom thou asketh?  She appeareth not in the script."


To say about Joe and Hank and bullying: say "[if in Chapter 1]'Look, if anyone starts picking on you, you be sure to tell me, okay?'[otherwise if in Chapter 2 and Crystal Quest has not happened]'Sorry, Daniel.  I mean, I could just tell them to stop picking on people, but that's never worked before.  Unless there's something else you need from them, we're out of luck.'[otherwise if in chapter 2 and Crystal Quest is happening][Aidan quips CT_AIDAN_HELP][otherwise if in Chapter 6]Such craven villains existeth not in the time of Robin Hood; or if they did, thou shalt surely vanquish them ere the tale is told."

Report asking Aidan about "[damon]" when in chapters 1 through 2: say "Yeah, he was a pretty cool dude.  You remember, you met him last year.  I was kind of worried about how things were going to be this year, now he's gone and his sister's in charge, but so far it's been okay, I think." instead.
Report asking Aidan about "[bullying]" when in chapters 1 through 2: say "[about Joe and Hank and bullying]" instead.
Report asking Aidan about "longbow/bow/archery" when in chapter 6: say "I'm Robin Hood.  That means I'm the best there is with a longbow." instead.
Report asking Aidan about "nottingham" when in Chapter 6: say "The town of Nottingham isn't too far off.  We can get there in plenty of time." instead.
Report asking Aidan about "mass/church" when in chapter 6: say "Only a real villain would dare to try and pick a fight in a church, so we'll be fine." instead.
Report asking Aidan about "oboe" when in chapters 1 through 2: say "'I don't play the oboe.  Why do you ask?'" instead.
Report asking Aidan about "music/oboe" when in Chapter 6: say "Such things are the province of Alan-a-Dale. The chosen instrument of thy brother-in-arms is the longbow." instead.
Report asking Aidan about "music" when in chapters 1 through 2: say "I should practice my guitar more, but there's just way too much other stuff to do here." instead.
Report asking Aidan about "mom/dad/parents/family/home": say "[if in Chapter 1 through 2]'I wonder how Mom is enjoying things in Djibouti.  I know Dad's going to be there for however long the Navy wants him there, but Mom should be back before camp's out.'[otherwise if in Chapter 6]The house of Locksley is both old and noble, and Robin of Locksley its noble scion." instead.
Report asking Aidan about "djibouti" when in chapters 1 through 2: say "'Your guess is as good as mine.  We'll have to wait to see Mom's pictures.'" instead.
Report asking Aidan about "navy" when in chapters 1 through 2: say "Aidan smiles.  You already know he wants to join up as soon as he can; he'd do it right out of high school if Mom and Dad didn't insist he spend some time in college first." instead.
Report asking Aidan about "zork/laptop/game": say "[if in chapter 1]'I've got to show you this Zork game that we're doing for the classic Interactive Fiction class some time.  I started it up on the laptop last night, and it's pretty cool.'[otherwise if in Chapter 2]'Check it out, this is what adventure games on the computer looked like way back before they figured out how to get pictures in.  This one here is Zork; you're this nameless adventurer dude on a treasure hunt in this great network of caves, and there's this thief who keeps popping up and stealing your stuff ... I bet you've got to defeat him somehow, but I haven't gotten that far yet.'[otherwise if in chapter 6] Such is of a different simulation from this." instead.


Aidan-on-camp is a quip. The display text is "Yeah, I always have a great time here.  How about you?" 

	Aidan-camp1 is a quip. The menu text is "Yeah, it's been awesome!"  The display text is "Hey, you don't have to tell me.  But if anything goes wrong, give me a shout, okay?". 

	Aidan-camp2 is a quip. The menu text is "Not so good...."  

	The response of Aidan-on-camp is { aidan-camp1 }. 
	
	When scavenger hunting ends, now the response of Aidan-on-camp is { aidan-camp2 }.

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

	Q_AIDAN_0a is a transitional quip. The following quip is Q_AIDAN_1. The menu text is "'Yeah, I'm fine.'".
	Q_AIDAN_0b is a transitional quip. The following quip is Q_AIDAN_2. The menu text is "'No, I'm getting these dizzy spells and headaches.'".

	The response of Q_AIDAN_0 is {Q_AIDAN_0a, Q_AIDAN_0b}.

Q_AIDAN_1 is a quip. The display text is "'You sure?  You looked a bit green for a moment there.'".

	Q_AIDAN_1a is a transitional quip. The following quip is Q_AIDAN_3. The menu text is "'Really, I'll be fine.'".
	Q_AIDAN_1b is a transitional quip. The following quip is Q_AIDAN_2. The menu text is "'Well, I felt a bit funny for a moment, but I'm better now.'".

	The response of Q_AIDAN_1 is {Q_AIDAN_1a, Q_AIDAN_1b}.

Q_AIDAN_2 is a quip. The display text is "Aidan frowns.  'Could be something you ate.  Brad Kramer's your counselor, isn't he?  Want me to go get him?'".

	Q_AIDAN_2a is a transitional quip. The following quip is Q_AIDAN_3. The menu text is "'Thanks, but I think I'll be able to find him myself.'". 
	Q_AIDAN_2b is a transitional quip. The following quip is Q_AIDAN_3. The menu text is "'No, I'll be fine.  It's nothing, really.'".
	Q_AIDAN_2c is a transitional quip. The following quip is Q_AIDAN_3. The menu text is "'Uh, no, thanks.  (Aidan, you're embarrassing me!)'".

	The response of Q_AIDAN_2 is {Q_AIDAN_2a, Q_AIDAN_2b, Q_AIDAN_2c}.

Q_AIDAN_3 is a quip. The display text is "'Whatever you say, tough guy.'  Aidan ruffles your hair, and for a moment, but only a moment, something buzzes in your ears.  Aidan resumes his seat with the other rappers.".


Last before firing a quip (called Q) (this is the print menu text as part of conversation rule):
	unless the menu text of Q is empty:
		say the menu text of Q, paragraph break;



Section 3 - actions on Aidan

Check attacking Aidan when in Chapter 9 and the player is not in the mindscape: say "No way.  Somewhere inside that monster is the brother who helped you with the bullies and who carried you all the way to the hospital himself when you collapsed.  Right now, he needs your help more than anything." instead.

Check attacking Aidan when in chapter 9 and the player is in mindscape: say "Aidan certainly isn't expecting that, but he's quick enough to dodge your attack.  You've distracted him just enough, however."; Go straight to section "You Fail To Give Aidan The Sword" in Chapter 09 text; rule fails.

Check attacking Aidan: say "[if in chapters 1 through 5]No way, Mom would kill you.  After she's done killing Aidan for killing you, because, let's face it, Aidan could probably break you in two with both hands tied behind his back.[otherwise if in chapter 6]Nay, [']twould get thee kicked from the simulation.[otherwise if in chapters 7 through 8]Are you out of your mind?" instead.

Check kissing Aidan: say "[if in chapters 1 through 5]You're a little too old for that sort of soppiness, don't you think?[otherwise if in chapter 6]Thou art past the age for such sop, dost thou not think?[otherwise if in chapters 7 through 8] That's not going to change his mind![otherwise if in chapter 9]Sadly, you lack the magical Mom power of kissing away owies." instead.

Check pushing Aidan: say "[if in chapters 1 through 2]You nudge Aidan with your elbow.  He nudges you back without thinking.[otherwise if in chapters 3 through 5]He's too far away, and probably wouldn't appreciate it anyway.[otherwise if in chapter 6]The script doth proceed apace without recourse to aught additional effort on thy part.[otherwise if in chapter 7 through 8]Are you out of your mind?[otherwise if in chapter 9]Aidan isn't going anywhere without your help, and this isn't helping." instead.
	
Check pulling [or moving] Aidan while in chapters 1 through 2: say "Aidan's quite capable of moving on his own, thank you very much." instead.

[todo: default message for Pulling Aidan otherwise!]

Check focusing on Aidan when in chapters 1 through 6: say "[if in chapter 1]You stare intently at your brother.  'Hey, didn't we stop playing those staring games years and years ago?'[otherwise if in chapter 2 through 3]You think you can hear someone playing an oboe.  Somewhere.[otherwise if in chapter 5]Aidan seems a little more irritable than usual.  You're not sure what it is, but there's something new and dangerous about him, lurking just under the surface.[otherwise if in chapter 6]Thy brother is in a temper, and thou shouldst tread carefully about him." instead.

Check focusing on Aidan when in chapter 7 for the first time: say "You sense rage and anger and frustration and hatred and more rage, so much so that you almost feel the same emotions yourself.  Just when you think you're going to fall into the same emotional whirlpool as Aidan has, you become aware that Aidan has paused in his assault on Lucian, and instead is swaying a little, a confused look on his face.  As you register this, Aidan shakes his head and returns his attention to Lucian.

Ava looks from you to Aidan and back.  'What did you just do?'"; rule succeeds.

Check focusing on Aidan when in chapter 7 [for the second time]: say "Rage and anger and hatred and rage and nothing else and suddenly you find yourself somewhere else entirely...."; now the weather is cloudy skies; now nobody follows the player; move the player to the battlefield; rule succeeds.

Check focusing on Aidan when in chapter 8: say "[if Aidan has not been able to see Aidan's photograph]So much anger!  He's like a walking explosion of anger and aggression and more anger and it's every bit as scary as the fact that he's trying to kill you![otherwise]So much anger!  But ... there, underneath it all, is that a hint of that brotherly love and concern that made him carry you all the way to the hospital last week?[end if]  [line break]" instead.

Check focusing on Aidan when in chapter 9 and the player is NOT in the mindscape and the player has been [expelled from]in the living room: say "You take a deep breath and focus again on your brother's emotions.  The sensations are beginning to seem all too familiar, and once again you find yourself in...."; say go to living room; rule succeeds.

Check focusing on Aidan when in chapter 9 and the player is NOT in the mindscape: say "[one of]You can sense raw, directionless rage and aggression, mixed with a large dose of confusion, all of it fortunately damped down by the sedatives.  Now that you're aware of it, it becomes rather hard to ignore.  Dr Rose, watching you intently, encourages you to go on.  'You can do it, Daniel.  I know you can.'[or]It's just like the last time, only the aggressive emotions seem much more muted.  There is confusion and fear as well.  As you focus, Aidan's emotions become the only ones you are aware of, and then you're somewhere else...[go to living room][stopping]"; rule succeeds. To say go to living room: ifndef debug; pause the game; enddef debug; move the player to the living room; add GOAL_REVIVE_AIDAN to the current goals, if absent; now the tea is off-stage.

Check focusing on Aidan when in chapter 9 and the player is in the mindscape: say "Given that you're currently inside his mind, that would probably not be a good idea." instead.

Check focusing on Aidan when in chapter 10: say "You sense nothing.  And thank goodness for that." instead.



Part 27 - third floor rooms west

Chapter 1 - Description

The third floor rooms west is a room, west of the third floor lobby, up from the second floor rooms west. "In defiance of the prescribed decoration scheme, someone has stuck a large poster of one of Van Gogh's 'Starry Night' paintings on the wall here.  The scattering of constellations around seem small and weak by comparison.  There is also the window overlooking Second Avenue, surrounded by a thicket of stars; meanwhile, the fire stairs only go down from here, and the corridor continues back to the east."

Chapter 2 - Scenery


The poster of Vincent Van Gogh's painting Starry Night is scenery, in the third floor rooms west. "It's very much an artistic interpretation of the subject; generally, the cutouts provided here tend to take more of a scientific, or at least science-fictional, approach."

The printed name of the poster of Van Gogh's Starry Night is "'Starry Night' poster".

Part 28 - third floor rooms east

Chapter 1 - Description

The third floor rooms east is a room, east of the third floor lobby, up from the second floor rooms east. "This end of the corridor looks like the inside of a space shuttle.  Someone's gone to great care to create window-like frames for the stars and planets and whatnot; even the window overlooking Calvin Field has been made to look like a space shuttle viewport.  Outer Space is back to the west; presumably the planet Earth is down the stairs."

Chapter 2 - Scenery

Some window-like frames are scenery, in the third floor rooms east. "You have to wonder what the Powers That Be think of people actually applying paint to the walls.  I mean, there's a reason they provided cutouts to paste onto the walls, and that you can take off again.  Then again, well, there's no way anyone could have done all this in the short time you've been here, so quite probably it was done by the college kids during the semester and the Powers That Be decided to just go with the theme rather than call in the graffiti removal squad."

Understand "space", "shuttle", "stars", "planets", "viewport", "paint", "painted", "graffiti" as the window-like frames.

The constellation of Orion is scenery, in the third floor rooms east. "The mighty hunter... he's the only constellation you can recognize in the night sky."

Understand "mighty", "hunter", "star", "Orion's belt", "belt", "Betelgeuse", "Rigel" as the constellation of Orion.

Check searching the constellation of Orion [> LOOK THROUGH ORION]:
	try searching the eastern windows of Jacobs Hall instead.

Part 29 - Rooftop

Chapter 1 - Description

The rooftop is an exterior room, up from the third floor lobby. "The rooftop is only accessible when there's an activity or option that uses it.  Otherwise, it's off-limits, not that you can really imagine why anyone would want to come up here.  It's all black gravel and tar.  The courtyard downstairs is way more pleasant.[if in chapter 1][paragraph break]The Eggdrop option is busy tossing boxes of eggs over the parapet: a table has been set up as well, and is covered with artsy-craftsy materials with which a number of campers are building egg-preservation containers.[end if]". Understand "roof" as the rooftop. 

[The printed name of rooftop is "rooftop".]

Check Jumping when in rooftop: say "Don't do it, Daniel!  You have so much to live for!" instead.

Check attacking yourself: say "Don't do it!  You have so much to live for!" instead.


Chapter 2 - Scenery

Section 1 - Courtyard

The distant courtyard is scenery, in the rooftop. "It's three stories down, and made of hard concrete.  Jumping is not advisable: take the stairs like a normal person."

Understand "hard", "concrete" as the distant courtyard.

The rooftop parapet is scenery, in the rooftop. "It's all that's keeping you from a three-story drop onto a very hard surface."

Section 2 - Table and supplies

The eggdrop option table is a privately-named supporter, scenery, in the rooftop. "The table is covered with artsy-craftsy materials: cardboard boxes, egg cartons, feathers, bits of cloth, sticks, rubber bands, glue, and so on.  There are also several cartons of eggs."  Understand "table/materials" as the eggdrop option table.

Some egg cartons are a privately-named container, open, openable, scenery, on the eggdrop option table. "Some are still full of eggs.  Others have been cut up to form other egg containment units."

Understand "box", "boxes", "cartons", "carton", "egg carton", "egg cartons", "of eggs" as the egg cartons. The indefinite article of the cartons of eggs is "several".

Some white eggs are scenery, in the cartons of eggs. "There's something vaguely wrong about how they're all the exact same shade of white."

A large bottle of white Elmer's glue is scenery, on the eggdrop option table. "There is a large bottle of white glue here, available for, and constantly in, use."  Check taking the glue: say "You can use some glue while you're here, but there's no need in taking a whole bottle." instead.

Check taking the eggdrop option table: say "You can't just take everything!  For one thing, the other campers would get upset.  And for another, your pockets aren't quite big enough." instead.


Section 3 - Green cloth

The lots of green cloth is scenery, a dispenser, on the eggdrop option table. "There must have been a sale on green cloth somewhere in town this last week.  There's enough cloth here to make a dozen wedding dresses.  Green wedding dresses, admittedly, but you get the picture."

The small square of green fabric is a thing. The description is "You have a small, square bit of green cloth.  It's barely big enough to serve as a handkerchief for a garden gnome."

Understand "cloth" as the small square of green fabric.

The lots of green cloth is represented by the small square of green fabric.
The lots of green cloth vends the small square of green fabric.

Report taking the lots of green cloth: say "You help yourself to a small square of the green fabric.  No-one notices or cares." instead.

Check taking the lots of green cloth when the small square of green fabric is handled:
	say "You've already helped yourself to some of that cloth.  No sense in taking any more." instead.

Understand "glue [something] to/on/onto [something]" as tying it to when the player can see the large bottle of white glue.
Understand "glue [something] on to [something]" as tying it to when the player can see the large bottle of white glue.
Understand "stick [something] to/on/onto [something]" as tying it to when the player can see the large bottle of white glue.
Understand "stick [something] on to [something]" as tying it to when the player can see the large bottle of white glue.

Check tying the small square of green fabric to the wooden stick when the player can see the large bottle of white glue:
	try tying the second noun to the noun instead.

Check tying the wooden stick to the small square of green fabric when the noun is part of the green flag or the second noun is part of the green flag:
	placeholder "They're already well glued together." instead.

Check tying the wooden stick to the small square of green fabric when the player can see the large bottle of white glue:
	placeholder "You stick the cloth to the short skewer with the glue. It makes a pretty nifty flag!";
	now the wooden stick is part of the green flag;
	now the small square of green fabric is part of the green flag;
	now the player carries the green flag;
	rule succeeds.

Check tying the wooden stick to the small square of green fabric:
	placeholder "You try wrapping the cloth around the stick a few times, but it doesn't stay put." instead.

The green flag is a thing. The description is "It's a stick with a bit of green fabric stuck on one end.  Not bad, if you do say so yourself; not bad at all.".

The green flag fulfills the flag-goal.

Section 4 - Kebab Skewers

Some shish-kebab skewers are a dispenser, on the eggdrop option table. "Shish-kebab skewers, only without the shish-kebab."

Understand "sticks" as the shish-kebab skewers.

The wooden stick is a thing. The description is "Wooden shish-kebab skewers, the sort you get at shish-kebab restaurants, only without the shish-kebab."

Understand "kebab", "skewer", "overgrown", "toothpick", "tooth pick", "shish-kebab", "skewers" as the wooden stick.

The shish-kebab skewers are represented by the wooden stick.
The shish-kebab skewers vend the wooden stick.

Report taking the shish-kebab skewers: say "You help yourself to one of the wooden skewers.  No-one notices or cares." instead.

Check taking the shish-kebab skewers when the wooden stick is handled:
	say "You've already helped yourself to a skewer.  You don't need another one." instead.

Section 5 - Feather Boa

A boa is a dispenser, scenery, on the eggdrop option table. "Someone's gone and raided the theatrical costumes and dragged up a few multi-colored feather boas for the option.  Every now and then, someone wrenches a bunch of feathers from a boa to stick into their egg boxes."

A feather is a thing. The description is "You have a feather.  It's a rather strange shade of blue that probably doesn't exist in nature."

The boa is represented by the feather. 
The boa vends the feather.
The feather fulfills the feather-goal.

Check taking the boa when the feather is handled:
	say "You only need one feather.  No sense in taking another one, unless you plan on taking the option." instead.

Report taking the boa: say "You pluck a feather from one of the boas.  No-one notices or cares." instead.

Section 6 - Eggdrop Option

The eggdrop-option is an option, scenery, privately-named, in rooftop. "The idea is to build a container that will enable an egg to survive a three-story drop onto the concrete below.  Everybody seems to be very deeply involved in the project."

Understand "class", "eggdrop", "egg drop", "egg-drop", "option", "options" as the eggdrop-option.
Understand  "people", "campers" as the eggdrop-option when the eggdrop-option is in the location.

Chapter 3 - Event on Entering

Last report going to rooftop during Scavenger Hunting: fire TRIG_EGGDROP.

TRIG_EGGDROP is a trigger.

Rule for firing unfired TRIG_EGGDROP:
	say "As you emerge into the sunlight, you feel a momentary dizziness that makes you almost want to hurl.  The feeling is gone very quickly, but your heart is left pumping as though you'd just run a couple of miles.";

Rule for firing fired TRIG_EGGDROP:
	say "There's that dizzy feeling again; this time you're ready for it.  As it fades away, you almost swear you taste something vaguely sour in the air.";


Book 5 - Claremont building

Part 1 - air vents

An air vent is a kind of container. An air vent is scenery, fixed in place, transparent.  The printed name of an air vent is usually "air vent". An air vent is usually closed, not openable[, locked, not lockable]. Rule for clarifying the parser's choice of an air vent: do nothing.

A vent grill is a kind of thing. "[if the grill is part of something closed]It covers the air vent and is securely screwed into the wall.[otherwise]The vent's grill is missing."  A vent grill is usually scenery. A vent grill is part of every air vent. 

Check entering an air vent (called the spot): say "[if the spot is closed]The vent is covered over with a metal grill, to prevent silly people like you from getting lost in an HVAC maze of twisty little ducts, all alike.  You couldn't turn around in there, anyway, and the idea of crawling backwards through such a tight squeeze, in darkness, makes you want to hurl.[otherwise]The duct beyond might be wide enough to crawl through, though not to turn around, but the vent itself is too small for you to fit through now.  Maybe you shouldn't have had that growth spurt after all." instead.

Understand "remove [something] with/using [something]" as unlocking it with.
Understand "unscrew [something] with/using [something]" as unlocking it with.

First check opening an air vent: if the player has the screwdriver, now the noun is openable.

Check taking a vent grill: try opening the holder of the noun instead.
Check opening a vent grill: try opening the holder of the noun instead. 
Check turning a vent grill: try opening the holder of the noun instead.
Check unlocking a vent grill with: try unlocking the holder of the noun with the second noun instead.

Check unlocking an air vent with something which is not the screwdriver: say "[The second noun] won't work the screws loose." instead.
Check unlocking an air vent with the screwdriver: try opening the noun instead.

Check turning an air vent: try opening the noun instead.
Check taking an air vent: try opening the noun instead.
Check opening an air vent when the player does not have the screwdriver: say "You're not strong enough to tear this thing from the wall with your bare hands." instead.

[Carry out opening an air vent: now the noun is open. [now the grill is not part of the air vent;][ remove the obstacle from play.]]
Report opening an air vent: say "You remove the screws as quickly as you can, the head of the screwdriver slipping from the screws rather more often than is usual.  Eventually, the grill falls off and is immediately lost among the boxes of costume accessories." instead.

First check examining an open air vent: ignore the examine containers rule. [prevents annoying "The air vent is empty" message]

Check shouting at an air vent: say "Your own hollow voice echoes back at you." instead.
Check shouting at an air vent for three turns: say "A hollow voice says, 'Fool!'" instead.


Part 2 - descriptions and scenery

The auditorium is a room. "The chairs of the auditorium have been folded up and moved aside, to give everyone plenty of room to spread out in the middle and even on the stage.  A rather harsh, bright light illuminates the central portion of the room and leaves the corners in shadows; the overall effect is to produce that still, dead, rather muffled feel that most theaters seem to have when they're not in use.  The backstage areas are to the north, and the main exit is to the west."  The auditorium is visited.

Some light is scenery in the auditorium. "You can see dust motes floating in the air."

The stage is scenery in the auditorium. "It is a low platform, without curtains, occupying the north side of the room.  The backstage areas are behind it."

The chairs are scenery in the auditorium. "They have been folded up and set aside, and are of no concern to you.  At least, not until you want to fill them with audience members."

Backstage is north of the auditorium. "Backstage is cramped, cluttered and chaotic, and it's not even in use yet.  It also smells of old costumes, which is hardly surprising, given the racks of costumes mouldering in one airless cubbyhole.  The stage and the auditorium are to the south, and a door out into the hallway is to the west." Backstage is visited. 

Some costumes are scenery in backstage. [The description is] "A brief rummage through the costumes reveals nothing but dust, more costumes, an air vent, and an overwhelming urge to sneeze."

The backstage air vent is an air vent in backstage. [The description is] "The air vent is almost hidden behind the racks of costumes[if the backstage air vent is open].  The protective grill has been removed and lost among the costumes[end if]." 

Understand "sneeze" as  a mistake ("[italic type]Achoo![roman type][if Ava is in the Backstage][paragraph break]'These things sure are dusty,' says Ava, rubbing her nose.  'And that air vent's no help.'"). 

The film studio north is a room. "The film studio has been deserted, and in a hurry, too.  Notebooks and papers and pens have been dropped or left behind, and chairs have been overturned.  It is quiet, the only sounds being the hum of warm air being pushed into the room through the vent high up in the wall.  [if in the film studio north]The studio continues off to the south, and the exit to the hallway is to the west.[otherwise]It seems safe to enter.[end if]"

Some debris is scenery in the film studio north.  "People have sure left in a hurry.  You can taste the shock and fear clinging to the debris they've left behind."  Understand "chairs", "notebooks", "papers", "pens" as some debris when in the film studio north. 


The film studio air vent is an open air vent in the film studio north. [The description is] "This particular vent doesn't have a grill, and the rows of shelving beneath it make it fairly accessible.  The wall around it looks as if it's been attacked with a sledgehammer.  Unfortunately for whoever attacked it, the dents in the metal duct have only served to make the opening more difficult to climb through."


The film studio south is south of film studio north. "This end of the film studio looks like the aftermath of a particularly exuberant action flick.  Tables, chairs and assorted props have been hurled about, some of it even broken in the process, and a fist-sized hole has been punched into one wall.  It's a little less untidy to the north, and the door to the hallway is to the west."

The hole is scenery in the film studio south. "[one of]'Aidan did that,' Ava says.  'Lucian made a run for it right then, while Aidan was trying to pull his fist out of the hole.  I don't know what would have happened if he hadn't missed.'[or]Through the hole in the wall, you can see the various layers of drywall and acoustic panelling that make up the studio walls.  It's quite impressive, not to mention frightening, how deep the hole is.[stopping]"


The southeast corner of Claremont is a room. "You're at a T-junction, of sorts.  Hallways stretch off to the north and west; another hallway stretches off to the south, ramping up slightly as it passes from this building to the next.  You catch sight of two of the counselors pacing about at the end of the southern hallway; fortunately, they haven't seen you ... yet.  The door to the auditorium where you were supposed to spend this morning working on your satirical drama class is to the east."

The eastern hallway is a room. "A utilitarian, academic hallway, stretching north and south.  Two empty classrooms are on the west side.  On the east side, the door to the backstage areas of the auditorium is to the southeast, while half of the film studio lies northeast."

The northeast corner of Claremont is a room. "The hallway makes an elbow here, heading off to the south and the west.  To the east is the film studio.  You can tell because the door has been torn off its hinges, giving you a perfectly unimpeded view of the studio within.  Another set of doors, to the north, leads out of the building, but those are intact."

The northern hallway is a room. "You are at a T-junction.  The hallway goes east and west, and another hallway joins it from the south.  To the north, wide double doors open into the library."

The northwest corner of Claremont is a room. "The hallway goes east and south from here.  To the north is an exit from the building.  You notice a door, previously locked, has been smashed open; beyond it, stairs lead down into the basement.  You can easily sense that Aidan has been here: you can trace two trails, one going down the stairs and another running off to the south."

The central hallway of Claremont is a room. "A utilitarian, academic hallway, stretching north and south.  Empty classrooms are in all other directions."

The southwest corner of Claremont is a room. "Not actually a corner, but enough of one for your purposes: the counselors standing guard to the south make you rather hesitant to wander off in that direction.  Fortunately, they're more concerned with keeping the other students from coming over onto this side, and aren't looking behind them for people who've already done so.  That leaves the north and the east open to travel."

The southern hallway is a room. "You are in a utilitarian east-west hallway.  Another hallway from the north connects here."

The western hallway is a room. "A utilitarian, academic hallway, stretching north and south.  Empty classrooms are in all other directions."

Chapter 1 - action and actions in Claremont

The two pacing counselors are a backdrop in the southeast corner of Claremont and in the southwest corner of Claremont. "They look nervous as they pace back and forth."

Check going to an exterior room when in chapter 7 and in the Claremont Hall region: say "As you put your hand on the exit door, Ava stops you, saying, 'We can't leave yet!  We've got to help Lucian!'" instead.

Report searching an unimportant classroom (called the spot): say "A quick search reveals nothing out of the ordinary.  [if something taints the spot]Aside from the ripped-out ventilation grill, anyway.  [end if]Lucian hasn't been by this way; or if he has, he's been remarkably calm for someone who's supposedly in a blind panic." instead.

Check facing east when in the northeast corner of Claremont: say "[the description of the film studio north][line break]" instead. 

First check going east from the eastern hallway: say "There's two doors in the east wall:  the film studio, northeast, and the auditorium, southeast." instead.

[Check going to the film studio south from the eastern hallway: say "The door won't budge.  [if Ava follows the player][one of]Ava shakes her head.  'We have to go in through the north entrance.'[or][stopping][end if] [line break]" instead.  Check facing northeast when in the eastern hallway: say "The viewing window is cracked, and it is dark within." instead.]

Chapter 2 - more maps 

The Claremont library is a room. "The Education And Fine Arts Library, as befits the University of Colorado at Valmont, is a labyrinth stacked high with books and simply lousy with hidden corners and dead ends.  Thankfully, most of it is also sealed away beyond a security barrier, and as far as you can tell, no-one is likely to have slipped through to the stacks beyond.  The only part of the library you can really access from here is the circulation desk, which has been positioned directly under an air vent to allow the librarians the full benefit of the heating system during the cold winter semester.  And also to blow papers off the desk, but none of the librarians have complained about that one little detail, oddly enough."

The circulation desk is an enterable supporter, scenery, in the Claremont library. "This is actually only half the circulation desk, the other half being on the other side of the security barrier.  Plaques indicate that one may drop off one's returns here, or pick up whatever books one has placed on reserve.  It is covered with stacks of papers and forms, each stack weighted down by a paperweight[if Ava is on the circulation desk and the player is on the circulation desk] or yourselves[otherwise if Ava is on the circulation desk], or Ava herself[otherwise if the player is on the circulation desk] or yourself[end if]."

Some paperweights are scenery on the circulation desk. "They're a variety of shapes and sizes and materials, and range from a simple cobblestone to an elaborately etched hunk of glass." Understand "paperweight" or "paper weight/weights" as the paperweights.

Check taking the paperweights: say "There's enough chaos going on without taking a paperweight and letting all those papers blow about the place." instead.

Some papers are scenery on the circulation desk. "Who knew that the business of managing a library entailed so much bureaucracy?  The papers rustle under the breeze from the vent above.  [if we have entered the circulation desk]A few stacks of papers have been shifted aside to make way for dirty footprints to be imprinted on the nice, clean desk top."

Some footprints are scenery. "Strangely, they look to be about your size."

Carry out entering the circulation desk: move the footprints to the circulation desk.
The block climbing rule is not listed in the check climbing rulebook.
The block climbing rule is listed in the report climbing rulebook.

The library air vent is an air vent in the Claremont library. "It is positioned directly over the circulation desk.  You can feel hot air blowing from it, and something else, too: fear.  It seems stronger here than elsewhere[if the library air vent is open].  The grill that used to cover it has been removed and tossed aside[end if]."


Report unlocking the library air vent with the screwdriver: say "As you begin to turn the screws, you feel something warm against your back: it feels almost like approval.  You turn around, and find Aidan standing at the entrance to the library, grinning malevolently.  You freeze, and you hear Ava gasp, and before you can do anything further, Aidan has leapt up on the desk (knocking you off in the process) and ripped the grill from the vent opening.  He flings the grill away -- it skims over the security barrier -- and begins feeling around inside the vent.  For a moment, you think it's all over for Lucian, but despite his panic Lucian has enough sense to keep out of reach and remain silent.  Aidan snarls in frustration, and is gone in a blur of speed." instead.


The HVAC room is down from the northwest corner of Claremont. "This is essentially a concrete basement full of pipes and maintenance equipment.  The master HVAC unit takes up half the space, and all the vents and chutes and pipes coming into or out of it takes up almost all the rest."

The pipes are scenery in the HVAC room. "The number of these things twisting around is quite bewildering." Understand "chutes/chute" as the pipes. Understand "vents/vent" as the pipes when in the HVAC room.

The HVAC unit is scenery in the HVAC room. "Essentially a furnace, generating hot air which is then pumped up to all the rooms of the building above.  The central thermostat, here, regulates the general temperature.  [if the thermostat is switched on]Judging by the roaring sound, it's working overtime to generate as much heat as it possibly can.[otherwise]The unit is completely silent." Understand "furnace" as the HVAC unit.

The thermostat is a scenery device, part of the HVAC unit. "The central thermostat consists of a simple dial which can be turned, and a meter above showing the temperature of the building.  [if the thermostat is switched on]Someone has set the the thermostat to the maximum!  The meter is slowly but surely climbing towards the danger zone.[otherwise]Everything seems normal, though the meter shows that the temperature is a little on the warm side.  It'll be a while before it returns to normal." The thermostat is switched on. Understand "dial/dials" as the thermostat when in the HVAC room. 

Instead of setting or turning the thermostat: if the thermostat is switched on, try switching off the thermostat; otherwise try switching on the thermostat.

Check switching off the HVAC unit: say "'If Stacy were here, she would have found the controls for this thing already,' says Ava, staring at the monstrous machine.  'Of course, Stacy isn't very patient when the CD player needs changing, either.'" instead.
Check switching on the HVAC unit: say "'I think we're doing OK,' says Ava." instead.

Report switching off the thermostat: say "You quickly turn the thermostat down to a more normal setting.  Immediately, the HVAC unit falls silent.  It'll be a while before the temperature drops back to normal, but at least it's not rising." instead.
Check switching on the thermostat: say "You fiddle with the thermostat dial, looking for a more optimum setting." instead.

[First carry out going from the HVAC room when the HVAC unit is switched off for the first time: say "'That's a relief.'".]


Part 3 - map connections 

The Claremont Hall region is a region. Every unimportant classroom is part of the Claremont Hall region. The claremont library, the HVAC room, the central hallway of Claremont are in the Claremont Hall region.

HVAC room is down from the northwest corner of Claremont. The northwest corner of Claremont is west of northern hallway. The northern hallway is west of northeast corner of Claremont. The northeast corner of Claremont is north of the eastern hallway.  The eastern hallway is north of the southeast corner of Claremont. The southeast corner Claremont is east of the southern hallway. The southern hallway is east of the southwest corner of Claremont. The southwest corner of Claremont is south of the western hallway. The western hallway is south of the northwest corner of Claremont. 

The central hallway of Claremont is north of the southern hallway and south of the northern hallway. 

The southwest corner of Claremont is north of Calvin Field north. 

The Claremont library is north of the northern hallway.  The film studio north is east of the northeast corner of Claremont. The film studio south is northeast of the eastern hallway.  backstage is southeast of the eastern hallway. The auditorium is east of the southeast corner of Claremont. 

Robotics class is southwest of central hallway. 

HVAC room, northwest corner of Claremont, northern hallway, northeast corner of Claremont, eastern hallway, southeast corner of Claremont, southern hallway, southwest corner, western hallway, Robotics class, the library, the film studio north, the film studio south, the auditorium, and backstage are in the Claremont Hall region.

Book 6 - Aidan's Mindscape

Part 1 - Battlefield for chapter 7 only

The battlefield is a room. "Everything is black and white, and grainy as an old photograph.  The ground is barren and scored with trenches; the sky is filled with stormclouds.  A fierce wind threatens to knock you off your feet, as bombshells rain about you."

The trenches are scenery in the battlefield. "Trenches crisscross the ground; where they aren't filled with mud, they're filled with sharp rocks and nasty bits of twisted shrapnel."  Before doing something to the backdrop-floor when in the battlefield, change the noun to the trenches.

The bombshells are scenery in the battlefield. "You're not quite crazy enough to get close enough to one of the shells to examine it.  They fall, they explode, they send bits and pieces of themselves flying through the air, and it's a miracle you haven't been sliced to ribbons by the flying shrapnel already." Understand "shrapnel/shells" as the bombshells.

The stormclouds are scenery in the battlefield. "The stormclouds race across the sky, driven by the mad winds."  Before doing something to the backdrop-sky when in the battlefield, change the noun to the stormclouds.

The wind is scenery in the battlefield. "It's insane.  But listening very carefully, you think you hear ... a voice?  No, you've lost it again...."

Check going when in the battlefield: say "The wind drives you back." instead.

Check focusing on when in the battlefield: say "An insane, murderous rage threatens to overwhelm you." instead.

Part 2 - mind map for chapter 9

The mindscape is a region. 

Chapter 1 - house & mountain

The living room is a room. "You are standing in your living room.  At least, it looks just like your living room back home, except for the [if we have not folded the rug]large oriental rug sitting right where the stairs used to be.[otherwise]trap door in the floor where the stairs used to be.[end if]  The kitchen is off to the east, just as you remember it.  And Dad's trophy case, there in the corner, seems a little larger and more imposing than you remember, come to think of it."

The trophy case is scenery in the living room. "It's stuffed full of old report cards and the like; Dad's souvenirs and memorabilia are barely visible."

The memorabilia is scenery in the living room. "You don't remember half of this stuff.  No wait, you do: you just never bother to think about it much." Understand "cards/souvenirs/card/souvenir" as the memorabilia. 

The oriental rug is scenery in the living room. "It's slightly dusty, but clearly a high-quality Persian, worth at least 20% of what the carpet seller was originally asking.[if we have not folded the rug]  It lies flat on the floor, its geometric pattern somehow creating an illusion of depth.[otherwise]  It's been rolled up and pushed to one side, revealing a trap door in the floor." The printed name of the oriental rug is "[if we have folded the oriental rug]rolled-up [end if]oriental rug".

The trap door is a scenery door. The trap door is down from the living room and up from the crossroads. The description is "The trap door is an over-engineered affair of heavy oak and ironwork, not the sort of thing one expects to find in a modern suburban house."  Before doing something with the trap door when we have not folded the oriental rug, say "You can't see any such thing." instead. First check going down from the living room when we have not folded the oriental rug: try listing exits instead.

Rule for implicitly taking the oriental rug: now the player carries the oriental rug. 
Check pulling the oriental rug: try folding the oriental rug instead.
Check pushing the oriental rug: try folding the oriental rug instead.
Check folding the oriental rug: say "Rolling up the large rug, you reveal a trap door underneath."; [now the trap door is down from the living room;] ; now the oriental rug is in the location; rule succeeds.

First report opening the trap door: say "The trap door pulls open with surprising ease, almost as if it were weightless." instead.

First report closing the trap door: say "The trap door falls shut again with a loud bang, sending billows of dust into the air." instead.

The kitchen is east of the living room. "This looks almost exactly like your kitchen back home, except that the door to the basement is missing.  Also, there's a blank wall where the entrance to the dining room used to be.  The kitchen table is pushed up under a window, just as it has always been, but the chairs are missing."

The blank wall is scenery in the kitchen. "Why would anyone leave this wall intentionally blank?"

The kitchen window is a scenery closed [transparent] door. The description is "It looks out onto the back yard.  Normally you'd be able to see the neighboring houses, but nothing seems to exist beyond the back yard fence." The kitchen window is east of the kitchen and west of the mountain view.

The kitchen table is scenery in the kitchen. "It's just a cheap work table that Mom has had since college.  It's very battered, but also very sturdy."  Some binoculars are on the kitchen table. "[placeholder]Binoculars[end placeholder]."

The mountain view is an exterior room. "The ground just drops away a short distance away from the house, descending straight down into the clouds miles below.  The only solid object you can see beyond the clouds is a mountain far off into the distance.  The only way back into the house is through the kitchen window." 

Check jumping when in the mountain view: placeholder "Leaping off into the void, the clouds you fall through obscure your vision, instilling unreasoning terror as you can not see your doom approach."; false death instead.


GOAL_LIGHT-BRINGER is a goal. The printed name is "Bring Light to the Darkness".  The win condition is "[if a dark room lit up is true][goal achieved]For a brief moment, you thought you heard the distant cawing of birds.[paragraph break]".  A dark room lit up is a truth state that varies.  Before printing the announcement of light when in chapter 9 (this is the light-bringer brought rule): now a dark room lit up is true. First carry out going when the room gone to is a dark room and in chapter 9: if GOAL_LIGHT-BRINGER is unachieved begin; add GOAL_LIGHT-BRINGER to the current goals, if absent; if the player has something lit, now a dark room lit up is true; end if. Carry out taking the brass lantern: if GOAL_LIGHT-BRINGER is unachieved, add GOAL_LIGHT-BRINGER to the current goals, if absent.

GOAL_REVIVE_AIDAN is a goal. The printed name is "Revive Aidan". The win condition is "[if old-Aidan wears one ring][goal achieved]Again, off in the distance.  The cawing of birds.[paragraph break]". 

GOAL_DEFEAT_THIEF is a goal. The printed name is "Defeat the Thief". The win condition is "[if the turns until the thief appears > 100][goal achieved]".

[after sword, so, after lake bottom]
GOAL_PIERCE_THE_VEIL is a goal. The printed name is "Pierce the Veil". The win condition is "[if we have attacked the red curtain][goal achieved]". First carry out going from the curtain room for the first time: add GOAL_PIERCE_THE_VEIL to the current goals, if absent.

The chapter 9 task list is a list of goals that varies. The chapter 9 task list is { GOAL_LIGHT-BRINGER, GOAL_REVIVE_AIDAN, GOAL_DEFEAT_THIEF, GOAL_PIERCE_THE_VEIL }.


To decide if (X - an object) fits a/the/-- description of (D - a description of objects): (- ({D}({X})) -).

To decide what number is the number of (D - description of objects) listed in (lst - list of objects):
	let total be 0;
	repeat with X running through lst:
		if X fits the description of D, increase total by 1;
	decide on total.

[todo!]
To decide if no puzzles solved: if the number of achieved goals listed in the chapter 9 task list is zero, yes; no.
To decide if a few puzzles solved: if the number of achieved goals listed in the chapter 9 task list is two, yes; no.
To decide if most puzzles solved: if the number of achieved goals listed in the chapter 9 task list is three, yes; no.
To decide if all puzzles solved: if the number of achieved goals listed in the chapter 9 task list is at least four, yes; no.

To decide if all birds are there: decide on whether or not no puzzles solved.
To decide if half the birds are gone: decide on whether or not a few puzzles solved.
To decide if all birds are gone: decide on whether or not most puzzles solved.


The mountain symbol is scenery in the mountain view. "[if all birds are there]The mountain rises straight up from the clouds.  An amorphous black mass, a blot on the otherwise serene landscape, covers its peak.[otherwise if half the birds are gone]The mountain rises straight up from the clouds, its ice-covered peak glinting in the sunlight.  You think you can see a face in the ice, but it is obscured by a shifting black mass that, interestingly enough, seems to have taken the shape of a domino mask.[otherwise if we have attacked the mountain symbol]The mountain rises straight up from the clouds.  Surprisingly, given the altitude, its peak is covered with green grass.  You think you can see goats frolicking about.[otherwise]The mountain rises straight up from the clouds, its ice-covered peak glinting in the sunlight.  In the ice, you can see Aidan's face, scowling murderously back at you."  The printed name of the mountain-symbol is "mountain". Understand "ice/icy" as the mountain symbol when we have not attacked the mountain symbol. 

The amorphous black mass is scenery in the mountain view. "[if searching the binoculars]Birds!  Through the binoculars, you can see that the shifting cloud of blackness is made up of thousands of inky-black birds![otherwise]It shifts slightly, enough so you can tell that it's not a single, solid entity."  Understand "shape" as the amorphous black mass.  Check searching ["looking through"] the binoculars when in the mountain view: say the description of the amorphous black mass instead. [Understand "look through/thru [something] [text]" as searching. Understand "look [text] with/through/using [something]" as searching.]  Check searching the binoculars when the player is in an interior room: say "The binoculars don't seem to be very useful indoors." instead.

The clouds are scenery in the mountain view. "You're higher up above the clouds than you have ever been, even in a plane, and if there's anything below those clouds, well, now is not the time to find out."

The house is scenery in the mountain view. "Well, it looks like your house.  Even though it contains only the living room and kitchen.  Most of the windows seem obscured, somehow, except for the kitchen window through which you got here in the first place."

Rule for writing a paragraph about the backdrop-sky when in the mountain view: say "The world may be filled with sunlight, but you can't see any other sign of the sun anywhere." Understand "sun/sky/sunlight" as the backdrop-sky when in the mountain view.

The living room, the kitchen, and the mountain view are in the mindscape. 

Check attacking the mountain symbol when all birds are gone: placeholder "The ice shatters."; rule succeeds.

Check throwing a smooth rock at when in the mountain view:
	now the smooth rock is off-stage;
	unless all birds are gone:
		if we have not searched the binoculars, say "Your throw, while unnaturally strong and accurate, is swallowed up by the dark mass." instead;
		if the amorphous black mass is in the location, say "You kill one bird, among thousands." instead;
	try attacking the mountain symbol instead.


Chapter 2 - Crossroads

The crossroads are a room. "You are standing at a crossroads.  A signpost indicates exits to the north, [if the red button is switched off]south, [end if]east, and west; the lamp perched on the top of the signpost does not illuminate enough of the area that you can actually see these exits, so having these indicators is a great help.  A spiral staircase leads back upwards.  You can faintly hear someone playing the blues on an alto sax." The crossroads are exterior.

Definition: a direction (called forward) is valid rather than invalid if the room forward from the location is a room.

[TODO northeast, northwest, southeast, or southwest.  Or south, when the red button has been switched on: ]

Check going an invalid direction when in the crossroads: say "[if player has something lit]You bravely march off into the shadows in that direction.  For a while, you can see nothing around you except for the ground at your feet and the shadows beyond the light ... and then you finally arrive at...[paragraph break][try looking][otherwise]You hesitantly walk off into the shadows, but turn back when it becomes clear that the lamplight from the signpost isn't going to penetrate far enough into the darkness to allow you to find anything." instead.

Check searching the binoculars:
	if in the crossroads, say "It's dark as far as the eye can see, in every direction." instead;
	if in the Xroads, say "It's dark in every direction, as far as the eye can see." instead;
	if in the lake bottom or in beneath the surface or in the lake shore or in the maintenance room, say "It's water as far as the eye can see." instead;
	if in the land of the dead or in the fork, say "It's dead air in every direction." instead;
	if in twisty passages 1 or in twisty passages 2 or in twisty passages 3 or in twisty passages 4 or in twisty passages 5 or in the thief's den, say "Binoculars aren't terribly useful underground." instead;
	if in deepest place, say "You see doom approaching if you don't do something!" instead.

The alto sax is scenery in the crossroads. "It's very very film-noir.  Also, pervasive." Understand "blues" as the alto sax. 

The signpost is scenery in the crossroads. "
West: Death and Maintenance[line break]
East: Art, Enlightenment and Soul[line break]
North: Knowledge[line break]
[if the red button is switched off]South: Alph[line break][end if]"

The twisty passages 1 are a room. "You are in a completely unsurprising maze of twisty passages, all alike."

The twisty passages 2 are west of twisty passages 1. "You are in a completely unsurprising maze of twisty passages, all alike.  Well, not all of them completely alike: the passage sloping upwards from here runs right beside a large rockfall."

The rockfall is a scenery dispenser in the twisty passages 2. The description is "The rocks are round, flat, very smooth, and very regular.  They look as if each would fit quite comfortably in your palm.  Half-buried beneath the pile of rocks is a sign which says 'Lair Sweet Lair'."  The rockfall vends a smooth rock. A smooth rock is a thing. Understand "rock", "stone", "smooth" as the rockfall when the rockfall is in the location and a smooth rock is not in the location. Understand "stone" as the smooth rock.

The sign is scenery in the twisty passages 2. "'Lair Sweet Lair'.  It looks rather homey and comforting, all things considered."

The twisty passages 3 are up from the twisty passages 2. "[placeholder][item described][end placeholder]."

The twisty passages 4 are up from the twisty passages 3. "[placeholder][item described][end placeholder]."

The twisty passages 5 are south of the twisty passages 4. "[placeholder][item described][end placeholder]."

The twisty passages 1, the twisty passages 2, the twisty passages 3, the twisty passages 4, the twisty passages 5 are in the mindscape.

The fork is west of the crossroads. "The shadowy passage from the east forks here, to the northwest and southwest.  A dim glow can be discerned at the end of the northwest fork; to the southwest, you can see only darkness."

The land of the dead is northwest of the fork. "You are on a vast, perfectly flat plain of ice.  A platform of some sort has been built out of dry twigs in the middle of the plain; Aidan is lying on it, his arms crossed sedately over his chest.  [if the spirits are in the location]The spirits of the dead crowd all around, chanting and wailing and gibbering, and preventing you from approaching the platform.[otherwise]It is completely and utterly silent." Check listening when in the land of the dead: try looking instead.

The spirits are scenery in the land of the dead. "There are shades of every sort of person from every sort of culture and time period, from Viking berserkers to Mandarin courtiers to Victorian fops.  None of them look particularly pleasant, presumably because any remotely nice members of the dearly departed have gone to heaven; which rather implies that this is The Other Place."

Check examining Exorcism when the spirits are in the location: placeholder "Begone!"; remove the spirits from play; now all rings are in the location; placeholder "The spirits dissipate.  Two gold rings drop from thin air."  instead.

The maintenance room is southwest of the fork. "This looks suspiciously like the bridge of your Dad's ship, at least what you remember of it from your visit to the naval base a couple of years ago.  Banks of controls line the walls, most of them blinking and beyond complicated.  One solitary terminal, separate from the others, seems simple enough, however.  Through a door to the northeast, which you do not remember opening to get in here, is the passage back to the fork." The maintenance room is dark interior.

The terminal is scenery in the maintenance room. "This terminal consists of a monitor screen, a red button, and a blue button.  The screen shows six boxes, labeled A to F: A and B in the top row, and the remaining four in the bottom row.  Horizontal lines connect boxes A to B, [if the red button is switched on]C to D, [end if][if the blue button is switched on] E to F,[end if] and D to E.[if the red button is switched off]  A vertical line joins boxes A and D.[end if][if the blue button is switched off]  Finally, a diagonal line joins boxes B and E.[end if]"

The banks of controls is scenery in the maintenance room. "With all these blinking lights, it's surprising that you needed to bring a light source into this room to dispel the darkness."

Instead of doing something when the banks of controls are physically involved, say "Probably not a good idea.  These controls are ridiculously complicated, and who knows what damage you might cause just by sneezing at them."

The fork, the crossroads, the land of the dead, the maintenance room are in the mindscape.

Section 1 - push my buttons, move my world

First check pushing a device (this is the allow pushing device buttons rule): [formerly a procedural rule]
	ignore the can't push what's fixed in place rule; 
	ignore the can't push scenery rule. 

Carry out pushing a device (this is the pushbutton device rule): if the noun is switched off, try silently switching on the noun; otherwise try silently switching off the noun. Report pushing a device: rule succeeds.

The blue button is a device, part of the terminal [in the maintenance room]. The description is "The blue button is labeled with the greek letter alpha.  It is currently [if the blue button is switched off]not [end if]pressed." Understand "alpha" as the blue button. 

Report pushing the blue button: 
	say "[if the red button is switched on]The red button pops up as you push on the blue button, which sinks into the panel and locks into place with a soft click[otherwise if blue button is switched on]The blue button sinks into the panel and locks into place with a soft click[otherwise if blue button is switched off]The blue button unlocks and pops out again[end if].  Off in the distance, you hear the grinding of heavy machinery."; 
	if the red button is switched on, now the red button is switched off;
	rearrange the map;
	rule succeeds.

The red button is a device, part of the terminal [in the maintenance room]. The description is "The red button is labeled with the greek letter omega.  It is currently [if the red button is switched off]not [end if]pressed." Understand "omega" as the red button.

Report pushing the red button:
	say "[if the blue button is switched on]The blue button pops up as you push on the red button, which sinks into the panel and locks into place with a soft click[otherwise if the red button is switched on]The red button sinks into the panel and locks into place with a soft click[otherwise if the red button is switched off]The red button unlocks and pops out again[end if].  Off in the distance, you hear the grinding of heavy machinery.";
	if the blue button is switched on, now the blue button is switched off;
	rearrange the map;
	rule succeeds.

To rearrange the map:
	if the blue button is switched on:
		now the printed name of the obtuse corner is "obtuse passageway";
		now nowhere is mapped southwest of the Xroads;
		now nowhere is mapped northeast of the obtuse corner;
		now the lake shore is mapped east of the obtuse corner;
		now obtuse corner is mapped west of the lake shore;
	otherwise:
		now the printed name of the obtuse corner is "obtuse corner";
		now nowhere is mapped west of the lake shore;
		now nowhere is mapped east of the obtuse corner;
		now the Xroads is mapped northeast of the obtuse corner;
		now obtuse corner is mapped southwest of the Xroads;
	if the red button is switched on:
		now nowhere is mapped south of the crossroads;
		now nowhere is mapped north of the right corner;
		now twisty passages 1 is mapped west of the right corner;
		now right corner is mapped east of twisty passages 1;
		now the printed name of the right corner is "right passageway";
	otherwise:
		now nowhere is mapped east of the twisty passages 1;
		now nowhere is mapped west of the right corner;
		now the crossroads are mapped north of the right corner; 
		now the right corner is mapped south of the crossroads;
		now the printed name of the right corner is "right corner";
	


Section 2 - old Aidan's bier

The platform is enterable scenery supporter in the land of the dead. "It looks rather uncomfortably like a funeral pyre.  It probably IS a funeral pyre.  So the last thing you want to do is to bring an open flame too close to it."  Check entering the platform: say "No thank you." instead. Understand "funeral" or "pyre" as the platform.

The old-Aidan is scenery, person, proper-named on the platform. "[if old-Aidan wears zero rings]He looks grey and cold and lifeless.  His hands are crossed at the wrist, over his chest, fingers splayed.  For some reason, he's dressed up as Robin Hood.[otherwise if old-Aidan wears one ring]He looks like he's asleep.  His hands are crossed at the wrist, over his chest, fingers splayed.  For some reason, he's dressed up as Robin Hood.  A single gold ring glints on one finger.[otherwise if old-Aidan wears two rings]He looks feverish, like he's in pain.  He's wearing a pair of matching rings." The printed name of the old-Aidan is "Aidan". [hyphenated to prevent parser disambiguation messages.] Understand "Aidan", "brother/bro" as old-Aidan.  After deciding the scope of the player when old-Aidan is enclosed by the location: if old-Aidan wears a ring (called R), place R in scope.

First check putting a ring on old-Aidan: now old-Aidan wears the noun; say "[if old-Aidan wears two rings]As you slip the second ring onto Aidan's finger, the heat around him increases and you begin to see steam rising from his body.  His face flushes with fever.  Meanwhile, there's a dry, crackling sound coming from the platform now, and the smell of scorching.[otherwise]As you slip the ring onto Aidan's finger, a warm glow seems to spread from his hands and up to his face.  He looks somehow peaceful, as if he were just taking a nap."; rule succeeds. [ WEAR is an action that you can't do to another; furthermore, Aidan can't WEAR what you are holding; hence this first check rule that does everything ]

Check removing a ring from old-Aidan: now the player carries the noun; say "[if old-Aidan wears exactly one ring]The temperature drops back down to something more comfortable, and Aidan himself loses the feverish look and returns to a more comfortable-looking state of unconsciousness.[otherwise]Aidan's face turns grey and ashen as the temperature drops." instead. Rule for implicitly taking a ring (called R) when old-Aidan wears R: try removing R from old-Aidan; now the player wears R.First check taking off a ring: if old-Aidan wears the noun, try removing the noun from old-Aidan instead.

Check attacking old-Aidan: say "You can't bring yourself to attack your brother while he's down.  Also, given that you're currently walking around inside his head, killing him would probably be a very bad idea." instead.

Check waking old-Aidan: say "He sleeps the sleep of the dead.  You only hope he's not actually dead." instead.


Chapter 3 - the Xroads

The Xroads are east of the crossroads. "You are standing at an Xroads, which differ from a mere crossroads in that the roads go off diagonally, that is, to the northeast, southeast, [if the blue button is switched off]southwest, [end if]and northwest.  Another narrow path goes back west to the crossroads." The Xroads are exterior.

The right corner is south of the crossroads. "You are in a passageway that goes east and [if the red button is switched on]west[otherwise]north[end if].  It seems absolutely ordinary in every way." Understand "passageway" as the right corner. 

The obtuse corner is east of the right corner. "You are in a passageway that goes west and [if the blue button is switched on]east[otherwise]northeast[end if].  It seems absolutely ordinary in every way." Understand "passageway" as the obtuse corner.  The obtuse corner is southwest of the Xroads.

The by-the-tree is northwest of the Xroads. "You are standing in the middle of a forest, which is interesting because you cannot for the life of you remember the point at which the underground passageway, which you recall as being to the southeast, suddenly turned into a forest path.  Just as interesting is the gigantic tree here, towering high above all the other trees and penetrating the cloud cover far above.  [if no puzzles solved]Lifeless and hollow, it's only a matter of time before it collapses and buries half the forest beneath it.[otherwise if a few puzzles solved]Withered and dry, it's only barely alive.  There's a hollow space inside that's almost large enough to live in.[otherwise if most puzzles solved]It looks distinctly unhealthy, with a hollow knot big enough to stand in.[otherwise if all puzzles solved]Other than a few signs of blight about its trunk, it's remarkably healthy.[end if]".  The printed name of the by-the-tree is "tree". Understand "tree" as the by-the-tree.

A scenery thing called the tree of life is in the by-the-tree.  "[if no puzzles solved]It's amazing that it's still standing at all.  It's so hollow that you could almost swear that it's all bark and nothing else.  Actually, looking into the hollow, you can see a ladder descending down into the tree's roots.[otherwise if a few puzzles solved]It's still alive, but only barely.  Through a hole in its side, you can see a hollow space as large as your living room back home, with a stair cut into the living wood leading down.
[otherwise if most puzzles solved]It doesn't look healthy, but it's mostly alive.  There's a hollow bit in its side that's just big enough for you to stand in.[otherwise if all puzzles solved]Except for its size, it looks like any other tree you've seen.  Solid and healthy, it could probably reign over the forest for a thousand years or so."  Rule for clarifying the parser's choice of the tree of life: do nothing.

The hollow of the tree is scenery, part of the tree of life. "[if no puzzles solved]It takes up the entire inside of the tree.  A ladder leads down into the tree's roots.[otherwise if a few puzzles solved]It takes up a good portion of the tree trunk.  A stair, cut into the wood, spirals down into the tree's roots.[otherwise if most puzzles solved]It's just a hollow space in the side of the tree.  It's big enough to stand in, but that's all there is to it.[otherwise if all puzzles solved]It's gone!"

The ladder is scenery, part of the tree of life. "It looks quite rickety, and descends deep beneath the tree."

The life-tree stairs is scenery in by-the-tree.  "They're carved out from the living wood inside the tree, and descend deep beneath the tree." The printed name of the life-tree stairs is "stairs".

The life-tree clouds are scenery in by-the-tree. "They're fluffy and white and clearly indicate that you are outside rather than underground.[If the Mountain View has been visited]  Funny, you don't remember having descended quite so far as to have gotten beneath the clouds.". The printed name of the life-tree clouds is "clouds". 

The trees-scenery are scenery in by-the-tree. "They obscure your view of the forest." The printed name of the trees-scenery is "trees".

The dark spot is down from by-the-tree. "[placeholder]dark spot[end placeholder]." [The dark spot is dark.]

A brass lantern is a device in the dark spot. "[placeholder][item described][end placeholder]."  Carry out switching on the brass lantern: now the brass lantern is lit.  Carry out switching off the brass lantern: now the brass lantern is unlit. Check burning the lantern: try switching on the lantern instead. Understand "snuff [device]" or "douse [device]" or "blow [device] out/on" or "blow out/on [device]" or "kill [device]" as switching off.

The curtain room is northeast of the Xroads. "You are in a perfectly cubical room, with wall-to-wall carpeting and wood-paneled walls.  An archway at the southwest corner leads back towards the Xroads.[if we have not attacked the red curtain]  The entire east wall is taken up by a red curtain that wafts and rustles in the nonexistent breeze.[otherwise]  To the east, a narrow flight of stairs descends down into darkness."

The red curtain is scenery in the curtain room. "It stretches from ceiling to floor, and from wall to wall.  You can't see anything through it, but there is no way any curtain could move like that unless there were a window or something on the other side, with a wind blowing against it."

Check attacking the red curtain when the player has the sword: say "The sword sings as it slices through the air and the curtain, cutting through it as if it were nothing but light and shadows.  The fabric seems to dissolve into tendrils of mist as it falls apart, finally leaving the way east open."; now the deepest place is mapped down of the curtain room; now the deepest place is mapped east of the curtain room; rule succeeds. [east? down?]

The wood panels are scenery in the curtain room. "It all looks like something out of the 1960s." Understand "carpet/walls" as the wood panels.

The deepest place is a room. "[present the thief][placeholder]deepest place[end placeholder]  ".

The art gallery is southeast of the Xroads. "This was clearly an art gallery once, but the walls are bare: you can see squares and rectangles of unfaded wallpaper where paintings used to hang.  An archway in the northwest corner would take you back to the Xroads." The art gallery is dark.

Exorcism is in the art gallery. "Only one painting still remains on the wall, and it's not a painting at all: it's a calligraphy scroll of some kind." The description is "[placeholder]A canvas whose only decorations are words. It is labeled 'Exorcism'[end placeholder]." Understand "scroll" or "calligraphy" or "painting" as Exorcism.

The classroom-shadow is north of the crossroads. "Looks like you're back in school again.  There's the old chalkboard, and all the familiar desks and chairs, all looking a little smaller than you remember.  By contrast, the teacher's desk looms menacingly at one shadowy end of the room.  There is an exit to the south." The printed name of the classroom-shadow is "classroom". The classroom-shadow is dark.

Check examining the player when in the classroom-shadow: say "You appear to not be naked this time round, which is something of a relief." instead.

The desks-shadow are scenery in the classroom-shadow. "They look rather small for you.  Could this have been first grade?" Understand "chairs" as the desks-shadow. The printed name of the desks-shadow is "desks".

The teacher's desk is scenery in the classroom-shadow. "It's rather large and ominous."

The chalkboard is scenery in the classroom-shadow. "Someone has written 'I will not leave the lights on when I leave the room' 57 times on the board." Understand "blackboard" as the chalkboard. 

Aidan's essay is a thing in the classroom-shadow. "[if Aidan's essay is unlit]A folded-up piece of paper[otherwise][placeholder]The paper has a long comment in bright red ink asserting that this level of writing couldn’t possibly be his own work and demanding that Aidan reveal where he copied from. The ink still looks wet, and glows as bright as the lantern.[end placeholder]".  Understand "classroom", "paper" as Aidan's essay when in chapter 9.

Check folding Aidan's essay: say "You fold back up [the noun]."; now Aidan's essay is unlit; rule succeeds. 
Check opening Aidan's essay: say "You unfold [the noun]."; now Aidan's essay is lit; rule succeeds. [ Obviously, this light shouldn’t be available until Daniel has already brought the lantern into the room. ]

The Xroads, the classroom-shadow, the by-the-tree, the right corner, the obtuse corner, the dark spot, the curtain room, the art gallery are in the mindscape.

Understand the command "smear" as "rub". Check rubbing Aidan's essay: placeholder "It immediately re-forms its letters."  instead.


Chapter 4 - the Lake

There is a room called the lake shore.  "You stand on the shores of what should more properly be called a sea: it is enormous, its far shores lost beyond the reach of any light.  The ceiling of the cavern is lost in the darkness as well; it is so high up that it is entirely possible that there is in fact no ceiling, and that the darkness above is a starless, moonless sky.  Faint music wafts down from above, and the only visible exit is to the west.". [The printed name of the lake shore is "by the lake". ]Understand "lake" as the lake shore.

The music is scenery in the lake shore. "Somehow, you know that it's a dulcimer, though you've never actually heard one before.  It sounds quite exotic."

The ice is scenery in the lake shore.  "It seems solid enough."  

A scenery thing called the lake is in the lake shore. "[if after clarification]The lake is dark and very deep: you can't see the bottom, though the water seems marvelously clear.[otherwise if the ice is in the lake shore and we have attacked the ice]The icy face seems to be sneering at you.[otherwise if the ice is in the lake shore]The lake is dark and inky, and covered over with a thick layer of ice.  Curiously, the marbled patterns of bubbles in the ice seem to form the vague appearance of a face.  A face wearing a domino mask.[otherwise if before clarification]The lake is dark and inky.  A closer examination reveals that the 'water' is in fact opaque, and might more properly be called 'ink'.  Fortunately, it doesn't seem to leave any lingering stains." Understand "inky/ink/inkyness" as the lake when before clarification. 

Check entering the lake when the ice is in the lake shore: say "You walk out across the ice, and despite your best efforts to keep in a straight line, find yourself emerging right where you started." instead.

Check entering the lake when the ice is NOT in the lake shore: try going down instead.

Check attacking the ice: say "Violence might be the answer to this one, but you can't seem to summon up quite enough violence to do anything more than hurt yourself."; rule succeeds.

Check throwing a smooth rock at when in the lake shore: 
	if the ice is in the location:
		placeholder "The lake ice shatters. See Rock in file Objects01";   [TODO]
		remove the ice from play; 
		rule succeeds;
	otherwise:
		try putting the smooth rock on the lake instead.
	

Check putting a smooth rock on the lake: say "[if after clarification]You watch as the rock sinks down towards the lake bottom; eventually, however, it sinks beyond the reach of the light, and is swallowed up by the distant darkness.[otherwise if the ice is in the location]You drop the rock on the ice.  It bounces harmlessly off the cold, hard surface.[otherwise]The rock is swallowed up immediately by the inky blackness."; if the ice is in the location, now the smooth rock is in the location; rule fails.


beneath the surface is down from the lake shore. "[if before clarification]All you can see is ink.  The fact that it's opaque makes the possession of a light source, or lack thereof, rather immaterial.[otherwise if after clarification and the player does not wear the night vision goggles]You hover just a foot below the surface.  It's too dark to go much deeper.[otherwise]All you have to go on is an innate sense of up and down:  all around you, for as far as you can see, is cold, clear water."

Check going down from beneath the surface when after clarification and the player does not wear the night vision goggles: say "It's too dark to go deeper." instead.

The inky water is scenery in beneath the surface. "It's all around you, freezing cold and dark and clammy.  [if player is wearing a ring]Luckily, the warmth from the ring on your finger is sufficient to keep you from turning into an iceberg." Understand "ink/inky/inkyness" as the inky water when before clarification.


The lake bottom is down from beneath the surface. "You are finally at the bottom of the lake, a vast desert of silt softly shifting with the currents.  Amid the billowing silt is a monolithic, hexagonal block of black basalt[If the player does not have the sword].  A sword, glowing a dim blue, has been plunged halfway into the basalt[end if]."

Some silt is scenery in the lake bottom. "Very fine sand, almost cloud-like as it shifts beneath you."

The hexagonal block of basalt is scenery container in the lake bottom. The description is "Something has been crudely etched into its side: squinting at it out of the corner of your eye, you can just barely make out the words, 'Cthulhu heart Shub-Niggurath.'"

The elvish sword is in the hexagonal block. The description is "[placeholder]An elvish sword of great antiquity.[end placeholder]"

The inkyness is a backdrop.  The inkyness is in the lake bottom, beneath the surface, and the lake shore.

To decide whether before clarification: 
	if after clarification, no; otherwise yes.
To decide whether after clarification: 
	if Aidan's essay is enclosed by the lake bottom, yes;
	if Aidan's essay is enclosed by beneath the surface, yes;
	if the inkyness is off-stage, yes;
	no.

Check throwing Aidan's essay at the lake: clarify the lake instead.
Check inserting Aidan's essay into the lake: clarify the lake instead.
Check putting Aidan's essay on the lake: clarify the lake instead.

To clarify the lake: placeholder "Lake clears when touched by Aidan's essay."; remove the inkyness from play.

The lake shore, beneath the lake, the lake bottom, the thief's den are in the mindscape.

Chapter 8 - the Den of the Thief

The thief's den is up from the twisty passages 4. "You have managed to find your way into the thief's den, a seedy little place higher than it is wide and lined with shelves displaying the thief's ill-gotten gains.  The only piece of furniture appears to be a dirty mattress on the floor.  A spiral stair winds back up to the twisty passages of the maze."

The mattress is scenery in the thief's den. "It's filthy and probably infested with bedbugs."

The shelves are scenery in the thief's den. "The shelves are crowded with all sorts of things, ranging from priceless works of art to odds-and-ends picked out of other people's pockets.  None of it seems very useful to you."

The spiral stair is scenery in the thief's den. "It's a little off-kilter and rickety, but it does its job."

The night vision goggles are a plural-named wearable thing in the thief's den. The description is "[placeholder][item described][end placeholder]."


Book 7 - Walkthrough

[Test me with "chapter 9 / z/ test 9"]

Test walkthrough with "test 1 / test 2 / test 3 / test 4 / test 5 / test 6 / test 7 / test 8 / test 9 / test 10".

Test 1 with "teleport to the info desk/read list/s/e/get dinosaur/nw/w/e/ask michelle for change/4/n/u/u/u/get feather/get cloth/get stick/glue cloth to stick/d/get cutout/d/d/s/w/put change in machine/get paper/ne/get grass/se/w/fold paper".

Test 2 with "teleport to your room/n/u/u/knock/1/2/1/1/s/d/d/w/w/focus/ask lucian about leap/ask lucian about bullies/ask lucian about crystal/2/ask lucian about family/z/n/e/u/s/focus/n/e/s/3/w/w/knock/aidan, help/s/e/e/w/w/d/s".

Test 3 with "random/eat dinner/g/1/3/2/w/l/l/w/l/l/l/w/l/w/w/l/s/l/w/w".

Test 4 with "yell / 2/2/1/1/1/tell stacy about contraption/ask stacy about aidan/1   /ask stacy about R15/2/w/n/n/look through R15 window /e/s/s/s".

Test 5 with "place mint in 1 / place saffron in 2 / place forest in 3 / place purple in 4 / place copper in 5 / place baby in 6 / place scarlet in 7 / place magenta in 8 / place golden in 9 / run program / place hot pink in 10 / run program "

Test 6 with "talk to stacy / talk to robin / x robin / x much / go / listen / talk to robin / e / x target / touch target / shoot target / x much / aim / shoot target / shoot target / e / ask robin about my money /1/1/1/1/2"

Test 7 with "i / read readings/ x people / x class / z / 1 / focus / n / x costumes / sneeze / x air vent / open it / nw / e/n/x e/e/x air vent / enter vent/ s / x hole / enter hole/n /w/w/n/take paperweight/get on desk/x vent/open vent/shout/shout at vent/shout ollie ollie oxen-free / d/s/w/w/d/ turn it off / turn off HVAC unit / x HVAC / x thermostat / turn off thermostat /turn on thermostat/ u/ e/e/e/e/e/focus/s/focus/n/focus/w/focus/w/focus/n/focus/lucian, exit/lucian, calm down/ava, calm lucian/ ava, sing/calm lucian/ava, sing/tell ava about lean on me/ava, sing lean on me/ s/s/d/sw/x screwdriver/take it/ne/n/n/unscrew vent/ava, sing lean on me/amplify calm/focus/focus/n/x bombshells/l/z/".

Test 8 with "x aidan / x jeremy / n/z/w/w/u/n/e/e/d/w/u/e/d/take key/w/u/w/n / x photograph / l/show photo / x him/ focus on him / calm aidan / magnify love in aidan ".

Test 9 with "x dr / x aidan / talk / 1/1/2/ n/l/calm aidan/ calm rose/focus on rose/ focus/focus/ /x rug/e/take binoculars/look through them/  x window/e/x mountain/x mass/look through binoculars at the mass/w/w/d/roll up rug/open door/d/x signpost/e/nw/x tree/d/take lantern/light lantern/u/se/ne/x curtain/back/se/x scroll/ take it/back/sw/w/n/n/x paper/take paper/read it/unfold it/read it/x it/i/fold paper/i/unfold paper/i/back/drop paper/w/nw/x spirits/x aidan/read exorcism/take rings/showme mountain symbol/i/wear ring/i/put ring on aidan/back/sw/x terminal/x red button/x blue/push blue/back/e/s/e/e/x lake/enter lake/x ice/break ice/x lake/w/w/n/w/sw/push red button/ne/e/take paper/x signpost/e/sw/w/w  /w/x rockfall/x sign/take stone/u/u/u/ x thief/attack thief/kick thief/punch thief/x thief/l/X goggles/take them/goals/d/d/d/e/e/e/ne/w/u/e/e/x mountain/throw rock at mountain/x mountain/w/w/d/e/sw/w/w/w/take rock/e/e/e/ne/w/w/sw/x terminal/x red button/push blue button/back/e/s/e/e/x lake/throw stone at lake/enter lake/wear goggles/d/x sword/take sword/u/u/doff goggles/w/w/n/e/ne/cut curtain/l/e/x thief/x aidan/ attack thief/cut thief/ attack thief with sword/x thief/ give sword to aidan".

Test 10 with "talk to ava/3/talk to stacy/2/talk to lucian/1/talk to stacy/3/talk to lucian/2".


Volume 2 - Story & Outline



Book 1 - Scavenger Hunt scene

Scavenger Hunting is a chapter-length scene. Scavenger Hunting begins when the entire game begins.

Scavenger Hunting ends naturally when the time of day is after 8:24 PM and the chapter number is 1.
Scavenger Hunting ends victoriously when every scavenger hunt goal is achieved and the player can see Michelle.

When Scavenger Hunting ends naturally:
	say "8:25!  Time's up!  You hurry back to the starting point with your list[if the player has something that fulfills a goal] and everything you've found so far[end if]....";
	move the player to first floor lobby west;
	if every scavenger hunt goal is achieved:
		say "Michelle takes your list, then searches about herself for a pencil (completely missing the one behind her ear and the two pens in her pocket) before finally pulling out a magic marker.  She nods as she ticks off the items from the list.  'Nice going, Daniel,' she says, smiling, 'that's everything on the list.  You win!'  She slaps a blue ribbon on your chest and turns to address the next camper.[paragraph break]The numb sensation in the side of your head takes a few moments to clear completely.";
	otherwise if at least one scavenger hunt goal is achieved:
		say "Michelle scans your list, looks over your findings, and shakes her head.  'Well, it was a[if most of the scavenger hunt goals are achieved]n excellent effort[else] good try[end if], Daniel, but I'm afraid you haven't [if almost all of the scavenger hunt goals are achieved]quite [end if]found everything.  Better luck next time!'[paragraph break]It takes you a few moments to realize that 'the bitter taste of defeat' is, in this case, not a figure of speech: the air literally does taste bitter.";
	otherwise:
		say "Michelle shakes her head.  'None of the items on the list? Better luck next time!'[paragraph break]It takes you a few moments to realize that 'the bitter taste of defeat' is, in this case, not a figure of speech: the air literally does taste bitter.";
	ifndef debug;
	pause the game;
	enddef debug.

When Scavenger Hunting ends victoriously:
	say "Michelle takes your list, then searches about herself for a pencil (completely missing the one behind her ear and the two pens in her pocket) before finally pulling out a magic marker.  She nods as she ticks off the items from the list.  'Nice going, Daniel,' she says, smiling, 'that's everything on the list.  You win!'  She slaps a blue ribbon on your chest and turns to address the next camper.[paragraph break]The numb sensation in the side of your head takes a few moments to clear completely.";
	ifndef debug;
	pause the game;
	enddef debug.

When Scavenger Hunting ends (this is the clear the player's inventory of scavenger hunt items rule):
	remove the items list for the Scavenger Hunt from play;
	repeat with treasure running through things which fulfill a scavenger hunt goal:
		if the player has the treasure, remove the treasure from play;

GOAL_SCAVENGER_HUNT is a goal, major, achieved. The printed name of GOAL_SCAVENGER_HUNT is "[if every scavenger hunt goal is achieved]winning the scavenger hunt[otherwise if almost all scavenger hunt goals are achieved]runner up in the scavenger hunt[otherwise if most scavenger hunt goals are achieved]doing well in the scavenger hunt[otherwise]participating in the scavenger hunt".

When Scavenger Hunting ends:
	add GOAL_SCAVENGER_HUNT to the recently achieved goals, if absent;
	consider the goal-tidying rules;

Book 2 - Lucian's Secret


Part 1 - Introduction

Lucian's Secret is a chapter-length scene. Lucian's Secret begins when Scavenger Hunting ends. Lucian's Secret ends when Crystal Quest ends.

Visiting Stacy-and-Ava is a scene. Visiting Stacy-and-Ava begins when Lucian's Secret begins. Visiting Stacy-and-Ava ends when the location is Stacy's room.

GOAL_AVA_STACY is a goal.  The printed name is "visit Ava & Stacy". The win condition is "[if the location is Stacy's room][goal achieved]".

When Lucian's Secret begins:
	say "Well, that was odd.[paragraph break]Those sudden flashes of sensory hallucination (what else would you call them?) seem to die down over the course of the next day.  The headaches and dizzy spells are so mild now as to be practically gone, but on the other hand, the frequency seems to be increasing.  It's all somewhere in the back of your head: if you focus, you can almost always find... something.  A smell, or a sound that isn't there.  A peculiar flavor hanging in the air.[paragraph break]Even so, you're not entirely sure you want to speak to a doctor.  I mean, it's not as if it's laying you flat on your back on anything like that.  You could talk to Aidan, but he'd probably just march you straight up to the hospital.  He'd even carry you there if he had to.  So where does that leave you?[paragraph break]";
	ifndef debug; 
	pause the game; 
	enddef debug;
	change the right hand status line to "Dorm time";
	change the current term day to day 3;
	change the time of day to 8:32 PM;
	change the current goals to { GOAL_AVA_STACY };
	now the chapter number is 2;
	say "[paragraph break]LEAP, Day 3 (Tuesday) - Dorm Time[paragraph break]Your roommate, Jeremy, went off with some friends after dinner, which leaves you alone for now.  It's dorm time, which means you have maybe a couple of hours or so before lights-out, all to yourself.  Some people spend the time reading, or listening to music, or visiting friends.  Which reminds you, maybe talking to Stacy and Ava about this would be the best thing to do.  Maybe they'll tell you it's all part of being eleven years old, or something.[paragraph break]Yeah.  You can hope.";
	consider the new goal notification rule;
	now the player is in your room;
	now all options are off-stage;
	[repeat with opt running through options:
		remove opt from play;]
	now Michelle Close is off-stage;
	move Ava to Stacy's Room;
	move Stacy to Stacy's Room;
[	now Ava is not scenery;  [todo: check]
	now Stacy is not scenery;]
	now the little straw hat is off-stage;
	now Stacy's door is unlocked;
	now Aidan is in Aidan's room.

Part 2 - Stacy & Ava's Room

Check opening Stacy's door when in the second floor rooms east during Visiting Stacy-and-Ava: say "You don't think either of the girls would appreciate you just barging in on them like that." instead.

Check knocking on Stacy's door when in the second floor rooms east during Visiting Stacy-and-Ava:
	now Stacy's door is open;
	say "Ava peeks out and breaks into a smile when she sees you.  'Hey, Daniel!'  She pulls you inside.  'What's up?'";
	move the player to Stacy's Room;
	start conversation with Ava on Q_STACY_AVA_0 instead.


Chapter 1 - Conversation

Stacy-and-Ava Dorm Chat is a scene. Stacy-and-Ava Dorm Chat begins when Visiting Stacy-and-Ava ends. Stacy-and-Ava Dorm Chat ends when Q_STACY_AVA_10 is fired.

Q_STACY_AVA_0 is a quip. The display text is "Stacy looks up from her desk, where a few hundred tiny electronic parts are scattered.  'We were just talking about how lately you seem distracted all the time.  Is something wrong?'[paragraph break]Ava looks a little embarrassed.  'We're just concerned.  You know.'"

	Q_STACY_AVA_0A is a transitional quip. The following quip is Q_STACY_AVA_1. The menu text is "'I don't know what's happening....'".
	Q_STACY_AVA_0B is a transitional quip. The following quip is Q_STACY_AVA_1. The menu text is "'Well, I'm getting these headaches....'".
	Q_STACY_AVA_0C is a transitional quip. The following quip is Q_STACY_AVA_9. The menu text is "'There's nothing wrong.  Can't a guy visit his friends every now and then?'".

	The response of Q_STACY_AVA_0 is { Q_STACY_AVA_0A, Q_STACY_AVA_0B, Q_STACY_AVA_0C}.

Q_STACY_AVA_1 is a quip. The display text is "You tell Ava and Stacy about the headaches, the dizzy spells, and the hallucinations.  Only of course you don't call them hallucinations, because they'd think you're going nuts for sure.  Ava says, 'that sounds serious.  Maybe you should see a doctor.'"

	Q_STACY_AVA_1A is a transitional quip. The following quip is Q_STACY_AVA_2. The menu text is "'Over my dead body.'".
	Q_STACY_AVA_1B is a transitional quip. The following quip is Q_STACY_AVA_3. The menu text is "'I'm not that sick.'".

	The response of Q_STACY_AVA_1 is { Q_STACY_AVA_1A, Q_STACY_AVA_1B }.

Q_STACY_AVA_2 is a transitional quip. The following quip is Q_STACY_AVA_4. The display text is "'Then you'd be seeing a coroner,' says Stacy, 'and it would be an autopsy.'".

Q_STACY_AVA_3 is a transitional quip. The following quip is Q_STACY_AVA_4. The display text is "'That's what they all say,' says Stacy, 'right before they keel over dead.'".

Q_STACY_AVA_4 is a quip. The display text is "'I don't know,' says Ava, 'it sounds pretty serious to me.  And we've noticed you sometimes stopping in the hallway with your eyes sort of glazed over.'"

	Q_STACY_AVA_4A is a transitional quip. The following quip is Q_STACY_AVA_5. The menu text is "'Is it that obvious?'".
	Q_STACY_AVA_4B is a transitional quip. The following quip is Q_STACY_AVA_8. The menu text is "'Have you two been spying on me?'".

	The response of Q_STACY_AVA_4 is { Q_STACY_AVA_4A, Q_STACY_AVA_4B }.

Q_STACY_AVA_5 is a quip. The display text is "'Mostly to Ava, says Stacy, 'because Ava notices these things.  I would have totally missed it if she hadn't pointed it out as we were coming back from dinner earlier.'  You remember feeling a little nauseous as you walked by the info desk.  You thought it might have been something you ate.  'Personally,' Stacy continues, 'I'm kind of wondering if maybe it could be real.  The sounds and stuff you told us about, I mean.'[paragraph break]Ava frowns.  'Stacy, how can it possibly be real?  Nobody else noticed anything.'[paragraph break]'Nobody else noticed Daniel getting all glassy-eyed and green either.  Look, Daniel, there's a very easy way to find out.  If there's something at the info desk that's making you sick, then going there again will bring back the same feeling, right?  So we could just go there and see how consistent these feelings are.'"

	Q_STACY_AVA_5A is a transitional quip. The following quip is Q_STACY_AVA_6. The menu text is "'They're pretty consistent, now I think about it.  Always at the same place... sort of.  I mean, unless something's changed about the place since.'".
	Q_STACY_AVA_5B is a transitional quip. The following quip is Q_STACY_AVA_7. The menu text is "'Consistent? They're just random.  I never know when I'm going to suddenly get this feeling, whatever it is.'". 

	The response of Q_STACY_AVA_5 is { Q_STACY_AVA_5A, Q_STACY_AVA_5B }.

Q_STACY_AVA_6 is a transitional quip. The following quip is Q_STACY_AVA_10. The display text is "Ava looks thoughtful.  'It could be some sort of allergy, I suppose.  Maybe we could find out exactly what's causing this, and fix it.'".

Q_STACY_AVA_7 is a transitional quip. The following quip is Q_STACY_AVA_10. The display text is "Ava looks doubtful.  'Are you sure?  I mean, it's not like you're taking notes, is it?  I think Stacy has a point.  If we can find out what's causing this, we can fix it.'"

Q_STACY_AVA_8 is a quip. The display text is "'Oh, don't get all paranoid,' says Ava, 'you're our friend!  Of course we look out for you!'[paragraph break]'The question is,' Stacy says, 'what are we going to do about it?'  You recognize the look on her face: it's the one she gets when she's decided that something needs fixing.  'I think we should see if this is being triggered by anything.  Ava noticed you going all green and glassy-eyed by the info desk after dinner earlier, so maybe we should go back there and see if there's any sort of pattern going on.'"

	Q_STACY_AVA_8A is a transitional quip. The following quip is Q_STACY_AVA_6. The menu text is "'They're pretty consistent, now I think about it.  Always at the same place... sort of.  I mean, unless something's changed about the place since.'". 
	Q_STACY_AVA_8B is a transitional quip. The following quip is Q_STACY_AVA_7. The menu text is "'Consistent? They're just random.  I never know when I'm going to suddenly get this feeling, whatever it is.'".

	The response of Q_STACY_AVA_8 is { Q_STACY_AVA_8A, Q_STACY_AVA_8B }.

Q_STACY_AVA_9 is a transitional quip. The following quip is Q_STACY_AVA_4. The display text is "Both girls look rather doubtful at this, and you finally sigh and describe all the strange sensations that have been assailing you since yesterday.  'But really, it's nothing serious.  The feelings are almost gone now.'"

Q_STACY_AVA_10 is a quip. The display text is "'Okay, then!'  Stacy grins cheerfully as she pulls a deerstalker cap out of her dresser.  'I'd say we have a mystery to solve.'[paragraph break]Ava gets out a notebook and pen.  'Just try to focus, Daniel.  We'll get to the bottom of this.'"

After firing Q_STACY_AVA_10:
	now Stacy Alexander wears a deerstalker cap;

Check going from Stacy's Room when the current conversationalist is Ava: placeholder "The player shouldn't be able to leave until this conversation is over." instead.

The deerstalker cap is a Stacy-esque hat. "Just like the one Sherlock Holmes wears in all those pictures of him!  Of course, he'd only have worn it if he were out in the country, but nothing says 'detective' quite like a deerstalker."  Understand "hat" as a hat.


Part 3 - Trailing Lucian

Trailing Lucian is a scene. Trailing Lucian begins when Stacy-and-Ava Dorm Chat ends. Trailing Lucian ends when the location is Lucian's room.

The emotion trail is a backdrop. "[placeholder]It's here, but you'll really need to focus on it.[end placeholder]".  When play begins, move the emotion trail backdrop to all rooms tainted by something. Understand "taste" or "smell" or "feeling" or "sense" as the emotion trail.

Understand "taste" or "smell" as focusing on when the emotion trail is in the location.

The lachrymose trail is an emotional residue. The lachrymose trail taints Lucian's room, pits west, pits stairwell, the first floor midpoint, and the info desk. The description of the lachrymose trail is "[if trailing lucian has ended]Lucian's[otherwise]There is a[end if] sour, vaguely nauseating [if trailing Lucian has ended]trail is[otherwise]taste[end if] in the air.  [if Trailing Lucian is happening][fire TRIG_FOCUS_HINT]"

When Trailing Lucian begins:
	now the player can sense the lachrymose trail;
	now Stacy follows the player;
	now Ava follows the player;
	add odd sensations investigate to the current goals, if absent;
	move the emotion trail backdrop to all rooms tainted by something.

Odd sensations investigate is a goal. The printed name is "investigate odd sensations". The win condition is "[if we have focused on the lachrymose trail][goal achieved]".

TRIG_FOCUS_HINT is a trigger. TRIG_FOCUS_HINT can be relevant. TRIG_FOCUS_HINT is relevant.

Rule for firing relevant unfired TRIG_FOCUS_HINT:
	say paragraph break;
	say "'Daniel,' says Ava, 'Daniel, you're getting that funny look again.  Is whatever-it-is somewhere around here?'[paragraph break]'Try to focus,' says Stacy. "; now Ava is mentioned; now Stacy is mentioned.

A focusing rule for the lachrymose trail when in info desk:
	say "Concentrating on the flavor, you sense an undercurrent of something salty as well, like tears.  You can also tell that this is all definitely part of a trail of some sort, going off to the east and the north. [paragraph break]";

A focusing rule for the lachrymose trail when in the first floor midpoint:
	say "Concentrating on the flavor, you sense an undercurrent of salt tears.  Both sour and salt seem to form a line between the info desk and the stairs going down. [paragraph break]"

A focusing rule for the lachrymose trail when in pits stairwell:
	say "Concentrating on the flavor, you sense an undercurrent of salt tears.  Both sour and salt seem to trail off to the west and to the stairs going up. [paragraph break]"

A focusing rule for the lachrymose trail when in pits west:
	say "Concentrating on the flavor, you sense an undercurrent of salt tears.  They trail off to the east, but seem strongest around one of the doors to the south. [paragraph break]";

Last focusing rule for the lachrymose trail:
	fire TRIG_TRAIL;

TRIG_TRAIL is a trigger.

Rule for firing unfired TRIG_TRAIL when in info desk:
	say "'It's a trail,' you say.  'It runs off that way, outside, and that way, back to the dorms.'[paragraph break]'Well,' says Stacy, 'we can't very well leave the building at this time of the night.  We'd best investigate the other direction.'";

Rule for firing unfired TRIG_TRAIL when in the first floor midpoint:
	say "'It's a trail,' you say.  'It goes down the stairs and back to the info desk.'[paragraph break]'I know we said we'd go look around the info desk,' says Stacy, 'but if this is a trail of some sort, I wonder where it leads.'[paragraph break]Ava shrugs.  'Up to you, Daniel.  Off to the info desk, or down the stairs?'";

Rule for firing unfired TRIG_TRAIL when in pits stairwell:
	say "'It's a trail,' you say.  'It goes up the stairs and that way down the hall.'[paragraph break]'I know we said we'd go look around the info desk,' says Stacy, 'but if this is a trail of some sort, I wonder where it leads.'[paragraph break]'I'm guessing the trail up the stairs goes back to the info desk.'  Ava shrugs.  'Up to you, Daniel.  Off to the info desk, or do we see what's at the end of the hall?'";

Rule for firing TRIG_TRAIL when in pits west:
	say "'Whatever it is, it's strongest around that door.'[paragraph break]Ava and Stacy exchange glances, and before you can stop her, Stacy is knocking on the door.  'We've come this far.  I want to know what's at the end of --'[paragraph break]Stacy quickly shuts up when the door opens a crack, and a rather timid little guy peeks out at you.  He fairly reeks of that mysterious sour-salty air.  And now you think you can hear some sort of twittering in the background, too[if the eggdrop-option has been apparent].  It occurs to you that you remember seeing him up at the egg-drop option yesterday, though he certainly wasn't giving off this... whatever it is... back then[end if].[paragraph break]'Hi,' says Ava, who seems to recognize the guy.  'Lucian, isn't it?  We met yesterday at the sign-ups.  Anyway, these are my friends Daniel and Stacy.  May we come in for a moment?'[paragraph break]Lucian lets the door swing half-open and sighs resignedly.  'Sure, if you want,' he says, retreating back into the room.  The three of you follow him inside.";
	now Lucian's Door is open;
	move the player to Lucian's room;
	now Stacy is in Lucian's room;
	now Ava is in Lucian's room.

When Trailing Lucian ends:
	now Stacy  follows no-one;
	now Ava  follows no-one;

Part 4 - Conversation with Lucian

Chatting to Lucian is a scene. Chatting to Lucian begins when Trailing Lucian ends. Chatting to Lucian ends when Q_LUCIAN_EARTH_CRYSTAL is fired.

When Chatting to Lucian begins: add GOAL_LUCIAN to the current goals, if absent.

GOAL_LUCIAN is a goal. The printed name is "find out what happened to Lucian". The win condition is "[if Chatting to Lucian has ended][goal achieved]".

When Chatting to Lucian ends:
	now the lachrymose trail taints nothing;
	now the player can sense nothing.


Chapter 1 - Conversation Table

[The conversation table of Lucian is the table of Lucian's conversation.]
The object-based conversation table of Lucian is the table of Lucian's replies.

Does the player mean inquiring someone (called P) about something (called Q): if Q is a conversation listed in the object-based conversation table of P, it is very likely.

Table of Lucian's replies
conversation 			reply	
an object [default]			"He doesn't say anything."	
LEAP flyers				"[Lucian quips Q_LUCIAN_LEAP]"
Lucian's CD player		"[Lucian quips Q_LUCIAN_SONG]"
Lucian's photographs		"[Lucian quips Q_LUCIAN_PHOTOS]"
Joe					"[Lucian quips Q_LUCIAN_BULLIES]"
Hank					"[Lucian quips Q_LUCIAN_BULLIES]"
Earth crystal 			"[Lucian quips Q_LUCIAN_EARTH_CRYSTAL]"
eggdrop-option			"[Lucian quips Q_LUCIAN_EGGDROP]"
Lucian				"[Lucian quips Q_LUCIAN_FAMILY]"

Report asking Lucian about "[powers]" when in chapter 10: say Lucian quips C10.3 instead.
Report asking Lucian about "[family]": say Lucian quips Q_LUCIAN_FAMILY instead.
Report asking Lucian about "[bullying]": say Lucian quips Q_LUCIAN_BULLIES instead.
Report asking Lucian about "[grandmother]": say Lucian quips Q_LUCIAN_GRANDMOTHER instead.
Report asking Lucian about "[peter]": say Lucian quips Q_LUCIAN_PETER instead.

Understand "LEAP" or "camp" or "school" or "here" or "dorm" or "room" or "his dorm/room" as LEAP flyers when in Lucian's room.

[Rule for choosing the conversation topic for Lucian:
	repeat through the chosen conversation table:
		if the topic understood includes topic entry:
			if there is a conversation entry:
				if the conversation entry is available:
					change the chosen conversation topic to the conversation entry;
					rule succeeds;
	carry out the choosing the default conversation topic activity with Lucian;]

Chapter 2 - Conversation Quips

[Rule for speaking with Lucian: start conversation with Lucian on the chosen conversation topic.]

Section 0 - Song

Q_LUCIAN_FAMILY is a quip. The display text is "Lucian rolls his eyes.  'What's to know?  My dad is an airline steward and my mom works in a hardware store.  We're just ordinary people.'".

Section 1 - Song

Q_LUCIAN_SONG is a quip. The display text is "Lucian shrugs.  'I just like the song.  It makes me feel better when I'm feeling unhappy.'"

	Q_LUCIAN_1A is a transitional quip. The following quip is Q_LUCIAN_2. The menu text is "'Are you feeling very unhappy?'"
	Q_LUCIAN_1B is a transitional quip. The following quip is Q_LUCIAN_3. The menu text is "'It's a nice song....'" 

	The response of Q_LUCIAN_SONG is { Q_LUCIAN_1A, Q_LUCIAN_1B }.

Q_LUCIAN_2 is a quip. The display text is "'I don't know anybody here and I'm all alone.  Why shouldn't I be unhappy?  Let's talk about something else.'"

Q_LUCIAN_3 is a quip. The display text is "'It was my grandmother's favorite song.  She used to sing it to me when I was little.'  Lucian's glance strays to one of the photographs on his desk, of an old lady in her garden."

After firing Q_LUCIAN_3:
	now Q_LUCIAN_GRANDMOTHER is available;

Section 2 - Photos

Q_LUCIAN_PHOTOS is a quip. The display text is "You look at the two photographs.  There's one of a little old lady in a garden.  The other is a class photograph.";

After firing Q_LUCIAN_PHOTOS:
	now Q_LUCIAN_GRANDMOTHER is available;
	now Q_LUCIAN_PETER is available;

Q_LUCIAN_PHOTOS_A is a transitional quip. The following quip is Q_LUCIAN_PETER. The menu text is "'Is that your class picture?  What was your teacher like?'"
Q_LUCIAN_PHOTOS_B is a transitional quip. The following quip is Q_LUCIAN_GRANDMOTHER. The menu text is "'Who's the lady in that picture?  Is she your grandmother?'"

The response of Q_LUCIAN_PHOTOS is { Q_LUCIAN_PHOTOS_A, Q_LUCIAN_PHOTOS_B }.

Section 3 - Egg-drop Option

[Rule for firing Q_LUCIAN_EGGDROP:
	start conversation with Lucian on Q_LUCIAN_EGGDROP;]

Q_LUCIAN_EGGDROP is a quip. The display text is "'The egg-drop thing wasn't so bad,' Lucian says, grudgingly.  'I even managed to make a box that saved all the eggs inside, so that was nice.  I really thought I was going to have fun here after all.'".

	Q_LUCIAN_EGGDROP_A is a transitional quip. The following quip is Q_LUCIAN_6. The menu text is "'Aren't you having fun, then?'".
	Q_LUCIAN_EGGDROP_B is a transitional quip. The following quip is Q_LUCIAN_7. The menu text is "'Hey, congratulations!  I never managed to do it when I tried that option, last year.'".
	
	The response of Q_LUCIAN_EGGDROP is { Q_LUCIAN_EGGDROP_A, Q_LUCIAN_EGGDROP_B }.

Q_LUCIAN_6 is a quip. The display text is "'No.'  It looks like Lucian's not going to say anything more, but just when you're about to move on, he says, 'people are so mean.  Peter said that there wouldn't be any bullies here, but I should have known better.'"

After firing Q_LUCIAN_6:
	now Q_LUCIAN_BULLIES is available;
	now Q_LUCIAN_PETER is available.

	Q_LUCIAN_6A is a transitional quip. The following quip is Q_LUCIAN_8. The menu text is "'Who's Peter?'". 
	Q_LUCIAN_6B is a transitional quip. The following quip is Q_LUCIAN_9. The menu text is "'Bullies?  Has someone here been giving you a hard time?'".

	The response of Q_LUCIAN_6 is { Q_LUCIAN_6A, Q_LUCIAN_6B };

Q_LUCIAN_7 is a quip. The display text is "Lucian shrugs.  'Yeah, whatever.'"

Q_LUCIAN_8 is a transitional quip. The following quip is Q_LUCIAN_PETER.

Q_LUCIAN_9 is a quip. The display text is "Lucian looks annoyed.  'Yeah.  You.  Why don't you leave me alone?'[paragraph break]'We're just trying to help, Lucian,' says Ava gently.[paragraph break]Stacy, meanwhile, looks like she's losing patience.  'You know, if you don't you tell us what's upsetting you, we can't help you.  So why don't you just spit it out and get it over with?'"

Section 4 - LEAP

Q_LUCIAN_LEAP is a quip. The display text is "'It's just school pretending to be camp, isn't it?  I suppose it's more interesting than normal school, but I think I'd rather be home for the summer.  I don't have to worry about bullies when I'm at home.'".

	Q_LUCIAN_LEAP_A is a transitional quip. The following quip is Q_LUCIAN_9. The menu text is "'Bullies?  Has someone here been giving you a hard time?'"
	Q_LUCIAN_LEAP_B is a transitional quip. The following quip is Q_LUCIAN_6.  The menu text is "'Aren't you having fun, then?'"

	The response of Q_LUCIAN_LEAP is { Q_LUCIAN_LEAP_A, Q_LUCIAN_LEAP_B }.

	After firing Q_LUCIAN_LEAP: now Q_LUCIAN_BULLIES is available.

Section 5 - Bullies

Q_LUCIAN_BULLIES is an unavailable transitional quip.  The following quip of Q_LUCIAN_BULLIES is Q_LUCIAN_10.

Rule for firing fired Q_LUCIAN_BULLIES:
	change the following quip of Q_LUCIAN_BULLIES to nothing;
	say "'I don't want to talk about that any more.'"

Section 6 - Grandmother

Q_LUCIAN_GRANDMOTHER is an unavailable quip. The display text is "'Yeah.  She died.'  The sour taste in the air is almost overwhelmed by a different, marshy sort of smell, yet you somehow know that the two sensations are somehow related.  Ava is instantly consoling Lucian, and finding all the right words that you can't think of.[paragraph break]'Was she a gardener?' asks Ava.  'That's a beautiful garden she's in.'[paragraph break]'Yeah, yeah she was.  She was an environmentalist.  That's why she....'  Lucian stops.  'Never mind.'".

	Q_LUCIAN_GRANDMOTHER_A is a transitional quip. The following quip is Q_LUCIAN_10. The menu text is "'Why what?'".

	The response of Q_LUCIAN_GRANDMOTHER is { Q_LUCIAN_GRANDMOTHER_A }.

Section 7 - Goal

Q_LUCIAN_10 is a transitional quip. The following quip is Q_LUCIAN_11. The display text is "Lucian shakes his head.  Stacy looks a little annoyed and says, 'you know, if you don't tell us what's upsetting you, we can't help you.  So why don't you just spit it out and get it over with?'"

Q_LUCIAN_11 is a quip. The display text is "Lucian looks a little angry and says, 'Stop picking on me!  You're just like those bullies at dinner!  They made me give them my grandmother's earth crystal and I bet you want me to pay some sort of fine for being a loser.  Well I've had it.  Just go away and leave me alone!'"

After firing Q_LUCIAN_11:
	now Q_LUCIAN_BULLIES is available;
	now Q_LUCIAN_EARTH_CRYSTAL is available;

Section 8 - Peter

Q_LUCIAN_PETER is an unavailable quip. The display text is "Lucian picks up the class photo.  'That's Peter,' he says, pointing to the teacher smiling up from one side of the group.  For a moment, the sour taste in the air disappears.  'He lets us call him by his first name, and he's the most awesome teacher ever.'  Then Lucian looks sad again.  'He's the one who said I was smart enough to come here, and he went and pulled all sorts of strings.  I should be grateful, I suppose.'".

	Q_LUCIAN_PETER_A is a transitional quip. The following quip is Q_LUCIAN_2. The menu text is "'But you're not?  Why?'".

	The response of Q_LUCIAN_PETER is { Q_LUCIAN_PETER_A }.


Section 9 - Earth Crystal

Q_LUCIAN_EARTH_CRYSTAL is an unavailable quip.  The display text is "'It's a crystal cube with a 3-D image of the earth etched inside it.  My grandmother gave it to me just before she died, so it means a lot to me.  Those bullies didn't care, though, they just took it.  I don't know how to get it back, I mean, I don't want to go crying to the camp counselors like a little crybaby.'  Lucian sniffles and wipes his sleeve across his nose, then reaches over to the CD player to turn the volume up."

After firing Q_LUCIAN_EARTH_CRYSTAL when Q_LUCIAN_EARTH_CRYSTAL was unfired:
	Stacy plans to fix Lucian in two turns from now;
	if Q_LUCIAN_SONG is unfired, say "'Isn't it loud enough for you already?' asks Stacy pointedly.  'It's not even a very good song!  Ava says it makes her sick.'[paragraph break]Ava turns bright red.  'Only because I had to sing it in my voice lessons over and over again,' she says quickly.[paragraph break][Lucian quips Q_LUCIAN_SONG]".

At the time when Stacy plans to fix Lucian: if Stacy is in the location, say "Stacy pulls you and Ava aside.  'Okay,' she says, 'I think I know how to fix this.  We've got to get that earth crystal away from the bullies and give it back to Lucian here.  Daniel, I think we should let you handle this part.  You can track them from the info desk the same way you tracked Lucian.'"

Part 5 - Reclaiming the Crystal

Crystal quest is a scene. Crystal quest begins when Chatting to Lucian ends. [Crystal Quest ends when the player has the Earth Crystal.]

When Crystal Quest begins: 
	now Hank's door is open unlocked;
	add GOAL_CRYSTAL to the current goals, if absent;
	consider the new goal notification rule.
	
First carry out going from Lucian's room during crystal quest:
	say "[one of]'You guys go ahead,' says Ava as you make for the door, 'I'd better stay here with Lucian.  He looks like he needs someone to talk to.'

'Fine, whatever,' says Stacy, rolling her eyes.[or]Ava stays behind with Lucian as usual.[stopping]";
	now Ava does not follow the player;
	now Lucian does not follow the player;
	now Stacy follows the player.


GOAL_CRYSTAL is a goal. The printed name is "[if the Earth Crystal is not handled]retrieve Lucian's crystal[otherwise]give Lucian back his crystal[end if]".  The win condition is "[if the player can see Lucian and the player has the Earth Crystal][goal achieved]".

Chapter 1 - New trail

Check focusing on a room during Crystal Quest: say "Now that you think about it, there are so many alien sensations swirling around, most of them so faint you're not sure if you're just imagining them.  You really don't know which sensation you really want." instead.

First check focusing on the info desk during Crystal Quest:
	now the player can sense the oily trail;
	change the noun to the oily trail.

The oily trail is an emotional residue. The oily trail taints info desk, the first floor midpoint, first floor rooms east. The description of the oily trail is "Some sort of oily, burnt stench seems to coil about your legs here, and you think you can hear some sort of low-pitched chatter."

Understand "burnt", "stench", "engine oil", "oil", "monkey's chatter", "chatter", "path" as the oily trail.

A focusing rule for the oily trail when in info desk:
	say "[one of]You close your eyes and stand near the door to Calvin Field.  You know Lucian's trail begins just outside this door.  Concentrating on the area in question, you[or]You[stopping] sense the beginning of another trail, one that smells of burnt engine oil and sounds like a monkey's chatter dropped several octaves and sped up.  It traces the same path back towards the dorms to the north. [paragraph break]";

A focusing rule for the oily trail when in first floor midpoint:
	say "That unpleasant smell, and its accompanying sound, seems to trace a path from the info desk to the eastern end of the hallway. [paragraph break]";

A focusing rule for the oily trail when in the first floor rooms east:
	say "You can trace that unpleasant smell, and its accompanying sound, to one of the rooms to the south.  The door is open on an already messy room, and with a shock you realize that you are not sensing that burnt-oil smell with your nose at all: it's just registering in your mind as a smell.  Same goes for the sound of low-pitched chattering. [paragraph break]";

Chapter 2 - Bullies

Section 1 - Initial encounter

Last focusing rule for the oily trail when in the first floor rooms east and TRIG_BULLIES is unfired during Crystal Quest:
	fire TRIG_BULLIES;

TRIG_BULLIES is a trigger.

Rule for firing unfired TRIG_BULLIES:
	move Joe to the location;
	start conversation with Joe on Q_JOE_0;

Q_JOE_0 is a quip. The display text is "One of the boys inside the room notices you gawking outside the door, and comes out.  'Yeah, what do you want?'"

	Q_JOE_0A is a transitional quip. The following quip is Q_JOE_1. The menu text is "'Uh.  Nothing in particular....'". 
	Q_JOE_0B is a transitional quip. The following quip is Q_JOE_1. The menu text is "'I was following this, uh, smell, and I was wondering....'". 
	Q_JOE_0C is a transitional quip. The following quip is Q_JOE_2. The menu text is "'Um, Have you seen an earth crystal -- sort of like a glass cube, about so big, with the earth etched inside...?'". 

	The response of Q_JOE_0 is { Q_JOE_0A, Q_JOE_0B, Q_JOE_0C }.

Q_JOE_1 is a quip. The display text is "'Shove off before I dunk you in the toilet, loser-boy.'  The boy retreats into the room to resume his conversation with his roommate."

Q_JOE_2 is a quip. The display text is "'Oh, that?  Hey, Hank, loser-boy here wants to know about the world cube.'[paragraph break]The other boy, Hank, comes to the door and sneers at you.  'Yeah? Too bad, it's ours now.  Ain't it, Joe?  So you can just go home and ask your mommy to kiss you and make it all better.  Now shove off.'  Hank and Joe retreat back into the room to resume their conversation."

After firing Q_JOE_1:
	move Joe to Hank's Room;

After firing Q_JOE_2:
	identify Hank; identify Joe;
	identify Hank's Door;
	move Joe to Hank's Room;

Check going from the first floor rooms east to Hank's Room when Joe is the current conversationalist: placeholder "The boy is blocking the door." instead.

First report going from the first floor rooms east when Joe is the current conversationalist: say Joe quips Q_JOE_1.


Section 2 - In Joe & Hank's Room

Report going to Hank's Room during Crystal Quest: 
	if Q_HANK_0 is fired:
		say Stacy quips TRIG_NEED_HELP;
	otherwise:
		Hank ushers you out in 3 turns from now;
		start conversation with Hank on Q_HANK_0.

Q_HANK_0 is a quip. The display text is "'Hey, Joe, did we give loser-boy permission to enter our room?'[paragraph break]'Why no, Hank, I don't believe we did.  Maybe we'll have to make him pay a fine.'[paragraph break]'Aw, but that would be mean!  We shouldn't make little loser-boys give us stuff for trespassing.  I think we should punish them instead.'"

After firing Q_HANK_0:
	identify Hank; identify Joe;
	identify Hank's door;
	move Joe to Hank's Room;

	Q_HANK_0A is a transitional quip. The following quip is Q_HANK_1. The menu text is "'Um, about that earth crystal....'".
	Q_HANK_0B is a transitional quip. The following quip is Q_HANK_3. The menu text is "'What, a fine?'". 
	Q_HANK_0C is a transitional quip. The following quip is Q_HANK_4. The menu text is "'What do you mean, [']punish them[']?'".

	The response of Q_HANK_0 is { Q_HANK_0A, Q_HANK_0B, Q_HANK_0C }

Q_HANK_1 is a quip. The display text is "Joe smirks.  'It's yours if you can take us both in a fair fight with both hands tied behind you and a blindfold on.'"

	Q_HANK_1A is a transitional quip. The following quip is Q_HANK_2. The menu text is "'That's not a fair fight!'".
	Q_HANK_1B is a transitional quip. The following quip is Q_HANK_5. The menu text is "'Sounds fair enough.'". 
	Q_HANK_1C is a transitional quip. The following quip is Q_HANK_6. The menu text is "'It's not yours to begin with!'".

	The response of Q_HANK_1 is { Q_HANK_1A, Q_HANK_1B, Q_HANK_1C }

First before firing Q_HANK_1B:
	change the menu text of Q_HANK_1B to ""; [We don't really say that.]

Q_HANK_2 is a quip. The display text is "'Too bad, so sad.  Now get lost.'"

Q_HANK_3 is a quip. The display text is "'Yeah.  You came here uninvited, so now you got to give us something.  To compensate us for the distress of having to breathe the same air as you.'  Joe looks at Hank.  'What d'you think?'[paragraph break]'I think I could use a nice laptop computer.'[paragraph break]'Sounds about right.  So what're you waiting for, loser-boy?  Scram!'"

Q_HANK_4 is a quip. The display text is "'I signed up for boxing classes and I need to practice.'  Hank flexes his fists.  'So why don't you make yourself useful and stand where I can reach you for, oh, half an hour or so?'  You backpedal out of the room before either of them decides they're being serious.'"

Q_HANK_5 is a quip. The display text is "You open your mouth to say something phenomenally stupid, but visions of yourself missing out on the rest of the LEAP camp, due to being in traction, stop you.  Hank and Joe snicker, but say nothing further."

Q_HANK_6 is a quip. The display text is "'Yeah?  Possession is nine-tenths of the law, loser-boy.  That means that if we possess it, as we do, then it's 90% ours.  You think your 10% stake is gonna do anything?  Shove off.'"

Section 3 - Timeouts and triggers

[this is an Activity, not an Action]
After terminating conversation with Hank when the location is Hank's Room during Crystal Quest:
	now Hank's door is open;
	try going north;

TRIG_NEED_HELP is a quip.  The display text is "[one of]Stacy frowns and shakes her head.  'I think we need help, Daniel.  Should we call a counselor?'[paragraph break]You shake your head.  'No way.  We'll be called snitches and rats until the day we die.'[or][stopping]"

At the time when Hank ushers you out:
	if the player is in Hank's room:
		say "'Are you still here?' Joe says.  'Get out and go bother somebody else!'  The two bullies hustle you to the door and send you sprawling in the hallway outside.";
		now Hank's door is open;
		try going north;
		say Ava quips TRIG_NEED_HELP.


Section 4 - The Earth Crystal

The Earth Crystal is scenery, in Hank's room. "This is a rather heavy cube of pure crystal, with an image of the earth etched into its interior.  Though it appears clear when you look down at it, it seems to glow slightly violet when you hold it up to the light."  The indefinite article of the Earth Crystal is "Lucian's".

Check examining the earth crystal when the Earth Crystal is in Hank's Room: try taking the Earth Crystal instead.

Instead of doing something when in Hank's room and the Earth Crystal is involved and the Earth Crystal is in Hank's Room:
	say "The bullies snatch the crystal out of your reach, laugh in your face, and hustle you out of the room.";
	now Hank's door is open;
	try going north;

Section 5 - Help from Aidan

Check knocking on Aidan's door when Hank's room is visited during Crystal Quest:
	say "Aidan opens the door.  'Hey, Daniel!  What's up?'  He ushers you into the room and sits down at his desk.  'Sorry if I'm a little distracted.  We just had our first class on old-school text adventures today, and I'm kind of caught up in the homework.  Seriously, this is kind of cool.'  Turning back to his laptop, he begins typing away.";
	now Aidan's door is open;
	move the player to Aidan's room instead.

Aidan's warpath is a scene. Aidan's warpath begins when CT_AIDAN_HELP is fired. Aidan's warpath ends when the number of entries in the warpath of Aidan is 0.

First carry out looking during Aidan's warpath: now Aidan is mentioned. [so I don't get "Aidan is here" right before "Aidan goes east"]

Every turn during Aidan's warpath (this is the Aidan vs The Bullies rule):
	let X be entry 1 of the warpath of Aidan;
	if the location of Aidan is Aidan's room:
		move Aidan to X;
	otherwise:
		let d be the quick best route from the location of Aidan to X;
		try Aidan going d;
	remove entry 1 from the warpath of Aidan;

Aidan has a list of objects called the warpath.

The warpath of Aidan is {first floor rooms west, first floor midpoint, first floor rooms east, Hank's room}.

When Aidan's warpath ends:
	if the location is first floor rooms east or the location is the first floor midpoint:
		say "'Yo, Hank!  Joe!'  Aidan strides into the bullies['] room as if he owned the place[if the location is First Floor Rooms east] and perches on the edge of a desk[end if].  'I hear you've been bothering the younger campers again.'[paragraph break]Hank looks out the door, sees you, and gives you the evil eye.  'So?'[paragraph break]'So I figure you gotta either pay a fine or get yourselves ratted out to the counselors.  Me, I don't like ratting on people, so I figure it's gonna be the fine for you guys[if the location is First Floor Rooms east].'  He picks up the earth crystal.  '[otherwise].  [end if]This will do nicely, especially since I gather you took it from one of the younger campers to begin with.'[paragraph break]'Shove off, Aidan.  Unless you want a mouthful of knuckles.'[paragraph break]Aidan gives a short bark of laughter.  'Dude.  My dad chews out Navy SEALs for a living, remember?  They taught me how to kill jerks like you with a pencil when I was five.'  Catching Hank glaring out the door at you, he adds, 'That's my little brother, in case you're wondering.  Only reason he hasn't whooped your sorry asses to hell and back is because he takes the whole [']only pick on people who can fight back['] thing a lot more seriously than I do.'[paragraph break][if the location is First Floor Rooms east]Joe looks like he's about to call Aidan's bluff, but Aidan stares him down.  The two bullies finally look away, muttering something rude.  [end if]Aidan swaggers out of the room and pulls the door shut behind him.  He grins and passes the earth crystal to you.  'There you go.  Problem solved.  Now, I better get back to Zork.'  He musses up your hair and strolls back to his room.";
	otherwise:
		say "'Hey, Daniel!'  Aidan jogs up to you and holds up the earth crystal, grinning.  'This the crystal thingy you told me about?  Here, problem solved.  Hank and Joe are a couple of pushovers, once you convince them you're tougher than both of them put together.  After camp, I'm asking Dad to enroll you in some martial arts classes or something.  I've already told Hank and Joe you're a black belt.'[paragraph break]'Er, thanks.'[paragraph break]'Anytime, bro.'  Aidan musses up your hair and [if the location is not Aidan's room]strolls back to his room[otherwise]settles back in front of his computer[end if].";
	now the player carries the Earth Crystal;
	move Aidan to Aidan's room;
	now Hank's door is closed locked.

Part 6 - Returning the Crystal

Crystal Quest ends when the player can see Lucian and the player has the Earth Crystal.

When Crystal Quest ends:
	say "Lucian looks up from his desk as you enter the room, and his mouth drops open when he sees the earth crystal in your hands.  'You did it!  You got it back!'  He leaps from his chair and throws his arms around you -- the room glows mauve for an instant, and something stabs in the back of your eye.  You vaguely hear Stacy telling Lucian to take it easy, and you feel Ava's arms catching you as you stumble back, off-balance, from Lucian.[paragraph break]'I don't know if we're any closer to figuring out what's going on,' you say to the girls as you leave Lucian's room.  'I mean, so now I'm some sort of psychic bloodhound?  Why me?'[paragraph break]'It could turn out useful,' says Stacy.  'Just think of the things you could do now!'[paragraph break]Ava doesn't say anything.  She just looks worried.";
	consider the goal assessment rule;
	add GOAL_HELP_LUCIAN to the recently achieved goals, if absent;
	consider the goal-tidying rules;
	remove the Earth Crystal from play;
	now the oily trail taints nothing;
	now the player can sense nothing;
	now Stacy does not follow the player;
	ifndef debug;
	pause the game;
	enddef debug.

GOAL_HELP_LUCIAN is a major goal, achieved. The printed name of GOAL_HELP_LUCIAN is "helping Lucian retrieve his crystal".


Book 3 - Here Comes The Flood

Part 1 - Scene set-up

Here Comes The Flood is a chapter-length scene.
Here Comes The Flood begins when Lucian's Secret ends.
Here Comes The Flood ends when Lost In The Maelstrom ends.

When Here Comes The Flood begins:
	say "The headaches are now nothing more than a faint but constant pressure in the back of your skull.  The dizzy spells are gone, and in their place is a vague sense of unease.  The last time you felt perfectly normal would have to be shortly before falling asleep last night.[paragraph break]If you concentrate even a little bit, you can conjure up those unreal sensations around everybody you meet.  And you're beginning to notice a definite relationship between what you sense and how everybody feels.  This is definitely some sort of empathic thing that's waking up inside you.  You'll have to discuss this with Ava and Stacy and Aidan later tonight.";
	ifndef debug;
	pause the game;
	enddef debug;
	change the current term day to Day 4;
	change the time of day to 5:08 PM;
	change the right hand status line to "[time of day]";	
	now the chapter number is 3;
	say "LEAP, Day 4 (Wednesday) - Dinner[paragraph break]You usually have your meals with Ava and Stacy, but they're in a different time slot for dinner today.  Aidan's with his own friends at the other end of the dining hall, which leaves you alone with your readings for your class on satirical writing.  Hopefully Aristophanes and Moliere will be enough to distract you from the rather unpleasant substances on your plate pretending to be meat and potatoes.";
	now the player carries the readings for Satirical Writing;
	move the player to the Dining Hall;
	now Aidan is in the location;
	add GOAL_DINNER to the current goals;
	Lucian appears in two turns from now.

Some readings for Satirical Writing are a thing. The description is "Aristophanes, Rabelais, Moliere... if you didn't find this sort of thing as fascinating as you do, you'd be comatose after the first page." The printed name of some readings for Satirical Writing is "readings for your Satirical Writing class". 

Instead of doing something when Aidan is physically involved:
	if Here Comes The Flood is happening, placeholder "Aidan's away with his friends on the other side of the hall." instead;
	if Saving Lucian from Aidan is happening, say "Aidan barely notices your futile attempts to stop him." instead;
	make no decision.


GOAL_DINNER is a goal. The printed name is "eat dinner in peace". The win condition is "[if Lost In The Maelstrom is happening][goal thwarted]".

Part 2 - Dining Hall

The Dining Hall is east of Calvin Field north. "[if Here Comes The Flood is happening]You are alone at the southeast corner of the room, with a few readings for your satirical writing class.  You can see Aidan somewhere off to the west, eating with his friends.[otherwise if in chapter 10]You are sitting between Ava and Stacy.  Lucian is sitting across from you, half-hidden behind a stack of pancakes.  Aidan is with his friends somewhere off to the west.[otherwise]The dining hall is a large room lined with long tables and chairs.  It is crowded with campers discussing just about everything under the sun."

A plural-named thing called some dining tables and chairs are scenery, in the dining hall.

Your dining table is scenery, in the dining hall.
Your dinner is edible scenery [allegedly] carried by the player. [avoid problems with implicit take]

First carry out examining your dinner (this is the school dinners box quote rule):
	display the boxed quotation
		"Don't eat school dinners, just toss them aside!
		A lot of kids didn't, a lot of kids died!
		The meat is of metal, the spuds are of steel,
		And if they don't kill you, the pudding will!";

The description of your dinner is "Seriously, the food's about the only downside to the LEAP camp.  It looks okay, but there's this sickly sweet aftertaste, like they used fake sugar in everything."

Check eating your dinner: say "You shovel another forkful of your dinner into your mouth and swallow it as quickly as you can.  Unfortunately, you still don't quite manage to escape the aftertaste." instead.

Check smelling your dinner: say "It smells innocent enough, anyway.  But smells can be deceiving." instead.

Part 3 - Lucian Again

At the time when Lucian appears:
	now Lucian is in the dining hall;
	start conversation with Lucian on Q_LUCIAN2_0.

Chapter 1 - Conversation

Q_LUCIAN2_0 is a quip. The display text is "'Hi, Daniel!'  It's Lucian, looking a lot more chipper than he did yesterday.  'Hey, where are Ava and Stacy?  Are you sitting alone?  Can I sit with you?'".

	Q_LUCIAN2_0A is a transitional quip. The following quip is Q_LUCIAN2_1. The menu text is "'Sure....'".
	Q_LUCIAN2_0B is a transitional quip. The following quip is Q_LUCIAN2_7. The menu text is "'No.'".
	Q_LUCIAN2_0C is a transitional quip. The following quip is Q_LUCIAN2_1. The menu text is "'Uh....'".

	The response of Q_LUCIAN2_0 is { Q_LUCIAN2_0A, Q_LUCIAN2_0B, Q_LUCIAN2_0C }.

Q_LUCIAN2_1 is a quip. The display text is "'Really?  You're so cool!  Hey, I don't know what you said to those bullies yesterday, but you have to tell me how you did it!  Is there a special class for dealing with bullies?  They have all sorts of classes here... hey, maybe you could teach me!'".

	Q_LUCIAN2_1A is a transitional quip. The following quip is Q_LUCIAN2_5. The menu text is "'Uh....'".
	Q_LUCIAN2_1B is a transitional quip. The following quip is Q_LUCIAN2_6. The menu text is "'Actually, I asked my brother Aidan....'".
	Q_LUCIAN2_1C is a transitional quip. The following quip is Q_LUCIAN2_4. The menu text is "'You really need to settle down.'".
	Q_LUCIAN2_1D is a transitional quip. The following quip is Q_LUCIAN2_5. The menu text is "'There's nothing to teach.'".

	The response of Q_LUCIAN2_1 is { Q_LUCIAN2_1A, Q_LUCIAN2_1B, Q_LUCIAN2_1C , Q_LUCIAN2_1D }.

Q_LUCIAN2_2 is a quip. The display text is "Hey, we should hang out!  We can play checkers.  Do you play checkers?  I bet you're really good at it.  We can play tonight, during dorm time!  How about it, Daniel?  Will you come play checkers with me?'".

	Q_LUCIAN2_2A is a transitional quip. The following quip is Q_LUCIAN2_3. The menu text is "'I'm sorta busy tonight....'".
	Q_LUCIAN2_2B is a transitional quip. The following quip is Q_LUCIAN2_4. The menu text is "'For goodness['] sakes, settle down!'".
	Q_LUCIAN2_2C is a transitional quip. The following quip is Q_LUCIAN2_7. The menu text is "'No, you're really creeping me out here.'".
	Q_LUCIAN2_2D is a transitional quip. The following quip is Q_LUCIAN2_8. The menu text is "'Uh, sure, why not....'".
	Q_LUCIAN2_2E is a transitional quip. The following quip is Q_LUCIAN2_8. The menu text is "'I love checkers!'".

	The response of Q_LUCIAN2_2 is { Q_LUCIAN2_2A, Q_LUCIAN2_2B, Q_LUCIAN2_2C, Q_LUCIAN2_2D, Q_LUCIAN2_2E }.

Q_LUCIAN2_3 is a quip. The display text is "'Oh, well I guess that's true.  You've got all these things to read.  Gosh, you must be smart.  How about tomorrow, huh?  I've got nothing to do tomorrow, we can hang out then!  How's that sound?'".

	Q_LUCIAN2_3A is a transitional quip. The following quip is Q_LUCIAN2_8. The menu text is "'That sounds nice....'".
	Q_LUCIAN2_3B is a transitional quip. The following quip is Q_LUCIAN2_7. The menu text is "'That sounds slightly nicer than being dunked in battery acid.  Stop bothering me!'".

	The response of Q_LUCIAN2_3 is { Q_LUCIAN2_3A, Q_LUCIAN2_3B }.

Q_LUCIAN2_4 is a quip. The display text is "'Peter, my teacher back in school, used to say the same thing.  I'm just happy to have made friends!  You ARE going to be my friend, right?'".

	Q_LUCIAN2_4A is a transitional quip. The following quip is Q_LUCIAN2_7. The menu text is "'Are you out of your mind?'".
	Q_LUCIAN2_4B is a transitional quip. The following quip is Q_LUCIAN2_8. The menu text is "'Friends ... uh, sure....'".

	The response of Q_LUCIAN2_4 is { Q_LUCIAN2_4A, Q_LUCIAN2_4B }.

Q_LUCIAN2_5 is a transitional quip. The following quip is Q_LUCIAN2_2.

	Rule for firing Q_LUCIAN2_5: say "'See, you're just that awesome.  [run paragraph on]".

Q_LUCIAN2_6 is a transitional quip. The following quip is Q_LUCIAN2_2. Rule for firing Q_LUCIAN2_6: say "'Oh?  Who's he?  Nah, I still think you're the coolest.  [run paragraph on]".

Q_LUCIAN2_7 is a quip. The display text is "Lucian's eyes nearly fall out of their sockets.  'But... but... I thought we were going to be friends!'  You try to respond but at that moment you hear a little snicker from somewhere -- no doubt one of the other first-years of Lucian's acquaintance -- and Lucian, absolutely mortified, leaves his tray on the table and makes a break for the dining hall doors.  You try to stand but are knocked back into your seat by a wave of bitterness and a strange, slick feeling that makes your skin crawl.  The headache, which you thought was all but gone, throbs to life and the room seems to whirl into a maelstrom of sound and color and smell and flavor and touch.  You're vaguely aware of Aidan, somewhere off to the west, getting to his feet before he disappears into a complicated flurry of woodwinds."

Q_LUCIAN2_8 is a quip. The display text is "Lucian's eyes light up.  'I knew you were different from the others!'  He goes on about his delight at making a friend, but you can't hear him: you've been nearly bowled out of your seat by a wall of fluttering mauve butterfly wings exploding from Lucian.  You fight to regain your balance, but the explosion of color drives you reeling away from the table.  All around you, colors and sounds and smells and flavors and disconcerting sensations thrilling along your skin all erupt into being, leaving you unable to see what's actually there.  You are vaguely aware of Aidan, somewhere off to the west, getting to his feet before you lose him to a complicated flurry of woodwinds."

After firing Q_LUCIAN2_7: move the player to the Maelstrom.
After firing Q_LUCIAN2_8: move the player to the Maelstrom.


Part 4 - Emotional Maelstrom

Chapter 1 - Scene setting

Lost in the Maelstrom is a scene. Lost in the Maelstrom begins when the location is the Maelstrom. Lost in the Maelstrom ends when the x part of the coordinate of the Maelstrom is at least 4.

Chapter 2 - Goals

When Lost in the Maelstrom begins:
	now your dinner is off-stage;
	add GOAL_ESCAPE to the current goals, if absent.

GOAL_ESCAPE is a goal. The printed name is "escape from Lucian's emotions". The win condition is "[if the x part of the coordinate of the Maelstrom is not 1 or the y part of the coordinate of the Maelstrom is not 1][escape from Lucian's emotions]". To say escape from Lucian's emotions:
		add GOAL_ESCAPE_2 to the current goals;
		say goal achieved.

GOAL_ESCAPE_2 is a goal. The printed name is "find your way to Aidan". The win condition is "[if lost in the maelstrom is not happening][goal achieved]".

Chapter 3 - Definitions

Section 1 - Coordinate system

A coordinate is a kind of value. (100, 100) specifies a coordinate with parts x (without leading zeros) and y (without leading zeros).

The maelstrom is a room.
The maelstrom has a coordinate. The coordinate of the maelstrom is (1, 1). 
The maelstrom has a coordinate called the boundary. The boundary of the maelstrom is (4, 4).

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
spicy flavor		"seems to taste sour and bitter and spicy all at once"
sweet flavor		"has an uncomfortably too-sweet taste in the air"
prickly sensation		"feels inexplicably, well, prickly"
electrical buzz		"feels electrically charged, you can almost hear the buzz"

Understand "sound of", "wall of", "excited", "excitedly", "jangling", "jangle", "door", "bells", "bell", "doorbell", "noise", "sound", "noises", "sounds" as the doorbells when in the maelstrom.

Understand "crowd", "crowd of", "chatter", "chattering", "song", "birds", "bird", "songbird", "swooping", "shadow", "shadow", "noises", "sounds", "singing" as the songbirds when in the maelstrom.

Understand "smell", "aroma", "stench", "stink", "perfume", "smell of", "aroma of", "stench of", "stink of", "swamps", "mud", "sulphur", "sulfurous", "muddy", "wet", "smelly", "smells", "aromas" as the swamp when in the maelstrom.

Understand "strong", "smell", "smell of", "smells", "aromas" as the burnt engine oil when in the maelstrom.

Understand "gay", "festive", "gaily", "swirling", "orange", "oranges", "red", "reds", "color/colour", "colors", "colours" as the dazzling blaze when in the maelstrom.

Understand "whirl", "whirl of", "blue", "green", "blues", "greens", "mock-german", "german", "images", "images of", "people dancing", "dancing people", "dancing", "around", "song", "colors", "colours", "noises", "sounds" as the drunken singing when in the maelstrom.

Understand "sour", "bitter", "taste", "flavor", "tastes", "flavors", "flavors" as the spicy flavor when in the maelstrom.

Understand "sweet", "pink", "too-sweet", "too sweet", "taste", "flavor", "tastes", "flavors", "flavors" as the sweet flavor when in the maelstrom.

Understand "feeling", "sensation", "feelings", "sensations" as the prickly sensation when in the maelstrom.

Understand "electric", "electricity", "charge", "charged", "charged air", "feeling", "sensation", "buzzing", "sound", "noise", "tastes", "flavors", "flavors", "sounds", "noises" as the electrical buzz when in the maelstrom.

The description of doorbells is "You can't see them, but you can hear them jangling and buzzing in a cacophony of excitement and anticipation."
The description of songbirds is "They're accompanied by swooping shadows, and seem to be leaping from one curiosity to another.";
The description of swamp is "[placeholder]They're accompanied by swooping shadows, and seem to be leaping from one curiosity to another[end placeholder]."
The description of burnt engine oil is "The air there is black and menacing."
The description of dazzling blaze is "They're very gay and festive, but more than you can take right now."
The description of drunken singing is "It sounds vaguely mock-german, and conjures images of people dancing around in circles."
The description of spicy flavor is "You can taste it in the air, like storm warnings."
The description of sweet flavor is "It's even worse than the dining hall food.  Somehow you know it's pink and hiding something unpleasant underneath."
The description of prickly sensation is "You just know you'll get an awful case of pins and needles if you head off in that direction."
The description of electrical buzz is "It seems to keep bouncing between two sources, growing or changing with each bounce."

Chapter 4 - Maze Implementation

Section 1 - Available exits

The Maelstrom has a list of objects called the accessible directions.
The Maelstrom has a list of objects called the blocked directions.

The description of the Maelstrom is "[desc de maelstrom]".
To say desc de maelstrom:
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
	;
	if the x part of the coordinate of the Maelstrom is 4, stop;
	say "You are lost in a swirl of sensory stimuli. ";
	repeat with D running through the blocked directions of the Maelstrom:
		say "[The D] [short description of the feeling of D]. ";
	say paragraph break;
	say "Somewhere off to the west, above the noise and color and inexplicable smells, you think you hear something -- a low-pitched reed instrument of some kind, possibly an oboe -- calling out to you."

First check going an orthogonal direction in Maelstrom:
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

Check facing a planar direction (called d) when in the Maelstrom:
[	carry out the printing the description activity with the noun instead.

Rule for printing the description of a direction (called d) when in the maelstrom:]
	if d is a maelstrom-blocked direction, carry out the printing the description activity with the feeling of d instead;
	if d is a maelstrom-accessible direction, placeholder "You sense nothing significant in that direction." instead;
	if d is an orthogonal direction, placeholder "There's a wall in that direction, isn't there?" instead;
	if d is a planar direction, placeholder "You sense nothing significant in that direction." instead.


Section 3 - Movement

This is the coordinate-updating rule:
	let XX be the x part of the coordinate of the Maelstrom;
	let YY be the y part of the coordinate of the Maelstrom;
	if the noun is:
		-- north: increase YY by 1;
		-- south: decrease YY by 1;
		-- west: increase XX by 1;
		-- east: decrease XX by 1;
	change the coordinate of the Maelstrom to the coordinate with x part XX y part YY;

Chapter 5 - End

When Lost In The Maelstrom ends:
	say "You finally stumble into the edge of what looks like a long, sustained note played on an oboe and sounds like a cone of bright, white light.  It leaps about you, and you feel someone catch hold of you -- it takes you a moment to realize that this is real, and not a product of your out-of-control senses.  It's Aidan, you can hear his voice over the buzzing of all the other sounds that aren't really there.  The relief is overwhelming, and you finally allow yourself to collapse.";
	consider the goal assessment rule;
	say "Just as you lose consciousness, you are startled by the appearance of something ominously black and alien, spinning about in the centre of the whiteness surrounding you....";
	ifndef debug;
	pause the game;
	enddef debug.

Book 4 - Hospital

Hospital is a chapter-length scene. Hospital begins when Here Comes The Flood ends.

When Hospital begins:
	say "The first thing you try to do when you regain consciousness is open your eyes.  This fails because they're already open.  You're in absolute darkness, and there's this smell -- not that you can really trust your senses anymore -- like disinfectant.[paragraph break]Rather more alarmingly, for some odd reason, is the fact that you feel perfectly fine.  When was the last time you felt that way?";
	ifndef debug;
	pause the game;
	enddef debug;
	now the chapter number is 4;
	change the current term day to Day 5;
	change the left hand status line to "Day ??: ??";
	change the right hand status line to "??:??";
	say "[paragraph break]Location unknown, Day unknown - Time un-- you know it's entirely possible that you're dead, right?[paragraph break]You are in darkness.";
	move the player to the coffin case, without printing a room description;
	add GOAL_FIND_OUT_ABOUT_YOU to the current goals, if absent.

GOAL_FIND_OUT_ABOUT_YOU is a goal. The printed name is "find out what's happened to you".  The win condition is "[if Doc Rose Chat has ended][goal achieved]".

Rule for printing the announcement of darkness when in the coffin case: do nothing.

your hospital room is a room. "[if in chapter 9]The room is, if anything, even more full of medical equipment than the last time you were here.  Aidan has been strapped into that coffin-thing that you woke up in back then, and trussed up so securely that it's a wonder they found anywhere to stick the wires monitoring his condition.  The door is back to the north.

A pair of comfortable chairs have been wheeled in, along with a small table.  Dr Rose [Claudia Rose mentioned]sits in one chair, watching you with concern.[otherwise]You are in a hospital room, equipped with a single bizarre-looking coffin-case thing attached to a bewildering wall of medical equipment.  The walls are painted a sterile white.  Huge windows look out to the south, while a pale green door, equipped with a small viewing window, is to the north." 

The huge window is scenery in your hospital room. "You can see your dorm from here!"  Check facing south when in your hospital room: say the initial appearance of the huge window instead. Understand "windows" as the huge window when in your hospital room. Check searching the huge window: say the initial appearance of the huge window instead.  Jacobs Hall is in your hospital room.

The viewing window is scenery in your hospital room. "It's a square of reinforced glass set into the middle of the door.  Through it, you can see a featureless hospital corridor." Check facing north when in your hospital room: say the initial appearance of the viewing window instead. Check searching the viewing window: say the initial appearance of the viewing window instead. 

your hospital room door is a closed door, scenery. The description is "[if in your hospital room]It's metal and looks very heavy and solid.[otherwise]You can see your hospital room through the door's viewing window.".  your hospital room door is north of your hospital room and south of the south T-intersection. 

The medical equipment is scenery in your hospital room. "Monitors, wires, computers ... it's all quite dizzying and bewildering.  Is that a stereo amplifier?" First check switching on the medical equipment: say "You don't know what it does -- or does to you -- and since you had your head in it, you think it best not to fiddle with it." First check switching off the medical equipment: say "Saving energy is always a virtue, but perhaps medical stuff could be allowed an exception."

Check listening to the medical equipment: say "They hum and beep just like the medical equipment you've seen on TV, though these things here look nothing like the medical equipment you've seen on TV." instead.
Check listening to when in the coffin case and the coffin case is closed: say "You think you can hear some sort of electronic hum, but otherwise it's pretty quiet." instead.
Check listening to when in your hospital room: say "You hear the steady hum of medical equipment." instead.

Part 1 - Inside the Coffin

The coffin case is scenery, an enterable, openable, closed, container in your hospital room. The description is "It's shiny and silver and futuristic-looking, but still looks like a coffin.  Or an Egyptian sarcophagus.  Or an iron maiden.  You'd have to be out cold before you'd let anyone put you into that thing."  Understand "coffin-case", "cranial" or "crown" or "helmet" or "contraption" as the coffin case. Understand "machine" or "device" as the coffin case when the coffin case is in the location.

Cased In is a scene.
Cased In begins when Hospital begins. [the player is in the coffin case.]
Cased In ends eventually when the time since Cased In began is 10 minutes.
Cased In ends prematurely when the coffin case is open.

Check shouting at the location during Cased In: now the coffin case is open instead.
Check knocking on during Cased In: now the coffin case is open instead.

When Cased In ends:
	change left hand status line to "Day ??: [the location in title case]";
	now the coffin case is open;
	say "The darkness above you flies open, and you're momentarily blinded by a flood of bright light.  As you try to blink away the spots, a face swims into view -- it takes you a few moments to register the curly white hair, the rosy cheeks and the clear blue eyes, and the fact that said face is talking to you.";
	move the player to your hospital room, without printing a room description;
	start conversation with Doctor Claudia Rose on Q_DOC_ROSE_0.

Check entering the coffin case when not in the coffin case: say "No." instead.

Check attacking the coffin case: say "However creepy that thing might be, trying to destroy it strikes you as being a very bad idea.  Dr Rose might think you need to start over in a new one." instead.

Check exiting from the coffin case when Doctor Rose is in the location: say "'Not just yet, Daniel,' Dr Rose says gently, 'you've just had a tremendous shock to your system, and you should rest a little longer.'" instead.
Report exiting from the coffin case when Doctor Rose is not in the location: say "'Daniel, you should be resting, like Dr Rose said!'

'I'll feel better once I'm out of this coffin,' you retort as you clamber out of it.  And not a moment too soon." instead.



Part 2 - Conversation with Doctor Claudia Rose

Chapter 1 - Doctor Rose

Doc Rose Chat is a scene. Doc Rose Chat begins when Cased In ends. Doc Rose chat ends when Q_DOC_ROSE_14 is fired.

Doctor Claudia Rose is an unidentified woman, improper-named, in your hospital room. "[placeholder]Room description text about [Doctor Rose][end placeholder]." The printed name of Doctor Rose is "[if Doctor Claudia Rose is identified]Dr Rose[otherwise]doctor". Understand "dr/doc" as Doctor Rose. 

Chapter 2 - Conversation

Q_DOC_ROSE_0 is a quip. The display text is "'Hullo, Daniel.  My goodness, you gave us a scare.  How are you feeling?'"

	Q_DOC_ROSE_0A is a transitional quip. The following quip is Q_DOC_ROSE_1. The menu text is "'I'm alive, I think.'".
	Q_DOC_ROSE_0B is a transitional quip. The following quip is Q_DOC_ROSE_2. The menu text is "'What just happened?'".
	Q_DOC_ROSE_0C is a transitional quip. The following quip is Q_DOC_ROSE_3. The menu text is "'What the hell just happened?'".
	Q_DOC_ROSE_0D is a transitional quip. The following quip is Q_DOC_ROSE_3. The menu text is "'I just woke up in a coffin!  I thought I was being buried alive!  How do you think I feel?'".

	The response of Q_DOC_ROSE_0 is { Q_DOC_ROSE_0A, Q_DOC_ROSE_0B, Q_DOC_ROSE_0C, Q_DOC_ROSE_0D }.

Q_DOC_ROSE_1 is a transitional quip. The following quip is Q_DOC_ROSE_5. The display text is "'That's the spirit!'  The face breaks into a smile, complete with dimples."

Q_DOC_ROSE_2 is a transitional quip. The following quip is Q_DOC_ROSE_5. The display text is "'Now, then, that's a rather complicated question.  Let's see if I can make the answer a little less complicated.'  The face pauses thoughtfully before continuing."

Q_DOC_ROSE_3 is a quip. The display text is "'Tsk tsk, I do know you're upset, but I do think it best if you try to calm down and consider that this sort of stress might be what put you here in the first place.'"

	Q_DOC_ROSE_3A is a transitional quip. The following quip is Q_DOC_ROSE_4. The menu text is "'Where am I?'".
	Q_DOC_ROSE_3B is a transitional quip. The following quip is Q_DOC_ROSE_5. The menu text is "'Okay, fine, I'll calm down.  See?  All calmed down.  Now this had better be good.'".

	The response of Q_DOC_ROSE_3 is { Q_DOC_ROSE_3A, Q_DOC_ROSE_3B }.

Q_DOC_ROSE_4 is a quip. The display text is "'You're in the university hospital, dear, and I'm Dr Claudia Rose.  We've had you and your brother under observation all night, and I really hope you'll both be well enough to return to the camp today.  You should be, if nothing goes wrong.'"

	Q_DOC_ROSE_4A is a transitional quip. The following quip is Q_DOC_ROSE_7. The menu text is "'Aidan's under observation?  Whatever for?'".
	Q_DOC_ROSE_4B is a transitional quip. The following quip is Q_DOC_ROSE_6. The menu text is "'What do you mean, [']if nothing goes wrong[']?  What's happening?'".

	After firing Q_DOC_ROSE_4: identify Doctor Claudia Rose.

	The response of Q_DOC_ROSE_4 is { Q_DOC_ROSE_4A, Q_DOC_ROSE_4B }.

Q_DOC_ROSE_5 is a quip. The display text is "'Here, sit up.  I'm Dr Claudia Rose, by the way, and you and your brother are very lucky that your particular condition happens to be a specialty of mine.'"

	Q_DOC_ROSE_5A is a transitional quip. The following quip is Q_DOC_ROSE_6. The menu text is "'Condition?  What condition?'".
	Q_DOC_ROSE_5B is a transitional quip. The following quip is Q_DOC_ROSE_7. The menu text is "'What... has something happened to Aidan?'".

	After firing Q_DOC_ROSE_5: identify Doctor Claudia Rose.

	The response of Q_DOC_ROSE_5 is { Q_DOC_ROSE_5A, Q_DOC_ROSE_5B }.

Q_DOC_ROSE_6 is a quip. The display text is "'You're developing some rather unique abilities, Daniel.  As far as I can tell, based on what your friends have told me, you are gaining the ability to sense the emotions of the people around you.  At the moment, your brain is trying to cope with the influx of these new senses and trying to interpret them using the template of the other five; before long, you should start recognizing emotions for what they are, rather than sensing them as flavors or colours or smells.'"

	Q_DOC_ROSE_6A is a transitional quip. The following quip is Q_DOC_ROSE_9. The menu text is "'So ... what, I'm going to be some sort of mind-reader?'"
	Q_DOC_ROSE_6B is a transitional quip. The following quip is Q_DOC_ROSE_10. The menu text is "'So what DID happen at dinner?'"
	Q_DOC_ROSE_6C is a transitional quip. The following quip is Q_DOC_ROSE_10. The menu text is "'So I've got to avoid people now or I'll wind up here again?'"
	Q_DOC_ROSE_6D is a transitional quip. The following quip is Q_DOC_ROSE_11. The menu text is "'That sounds kind of cool, actually....'"

	The response of Q_DOC_ROSE_6 is { Q_DOC_ROSE_6A, Q_DOC_ROSE_6B, Q_DOC_ROSE_6C, Q_DOC_ROSE_6D }.

	After populating Q_DOC_ROSE_6:
		if Q_DOC_ROSE_10 is fired begin;
			remove Q_DOC_ROSE_6B from the current conversation;
			remove Q_DOC_ROSE_6C from the current conversation;
		end if.

Q_DOC_ROSE_7 is a quip. The display text is "'Your brother Aidan carried you here after you collapsed at dinner last night.'  Dr Rose pauses.  'A distance of about a mile, running at thirty miles an hour, he was here before anyone at the camp could fully explain over the phone what had happened.'"

	Q_DOC_ROSE_7A is a transitional quip. The following quip is Q_DOC_ROSE_12. The menu text is "'Where is he?  I want to see him.'"
	Q_DOC_ROSE_7B is a transitional quip. The following quip is Q_DOC_ROSE_10. The menu text is "'So what DID happen?'"

	The response of Q_DOC_ROSE_7 is { Q_DOC_ROSE_7A, Q_DOC_ROSE_7B }.

Q_DOC_ROSE_8 is a transitional quip. The following quip is Q_DOC_ROSE_14. The display text is "Dr Rose nods.  'This sort of thing must be expected as you're first getting used to your new abilities, I suppose.  In the meantime, I've set up this device here to help you out.'  She indicates what appears to be a steampunk salon hair dryer.  'This is a cranial crown.  It will flood your brain with an electromagnetic frequency that should dampen the new sensory stimulus going to your brain, giving it a rest and allowing it to recuperate enough so it doesn't go out of control again.  You'll have to undergo this treatment at least once a week, I'd say.'"

Q_DOC_ROSE_9 is a transitional quip. The following quip is Q_DOC_ROSE_11. The display text is "Dr Rose chuckles.  'If you want to put it that way.  You won't be reading minds, exactly, but otherwise it's not such a bad analogy.'"

Q_DOC_ROSE_10 is a quip. The display text is "'What happened at dinner was a sensory overload.  Too many people, too many emotions, not enough experience.  You should develop the ability to handle this sort of thing, with time, but in the meantime it is absolutely vital that you come back here once a week for ... well, this device here.'  Dr Rose waves a hand at what appears to be a steampunk salon hair dryer.  'This is a cranial crown that will flood your brain with an electromagnetic frequency that should dampen the new sensory stimulus going to your brain -- giving it a rest, as it were -- and prevent it from going out of control again.'"

	Q_DOC_ROSE_10A is a transitional quip. The following quip is Q_DOC_ROSE_13. The menu text is "'It's not going to also give me a hair helmet, is it?'"
	Q_DOC_ROSE_10B is a transitional quip. The following quip is Q_DOC_ROSE_11. The menu text is "'Well, that's a drag.  I suppose there's nothing I can do about it, is there?'"
	Q_DOC_ROSE_10C is a transitional quip. The following quip is Q_DOC_ROSE_06. The menu text is "'But I don't understand.  What's happening to me?'"

	The response of Q_DOC_ROSE_10 is { Q_DOC_ROSE_10A, Q_DOC_ROSE_10B, Q_DOC_ROSE_10C }.
	
	After populating Q_DOC_ROSE_10 when Q_DOC_ROSE_06 is fired: remove Q_DOC_ROSE_10C from the current conversation.

Q_DOC_ROSE_11 is a quip. The display text is "'Your friends tell me you've been able to track people using the emotional debris they leave in their wake.  That's really quite impressive.  You should also be able to get an idea of how a person feels by examining them, and possibly more if you focus on those emotions.  Eventually, I think you might even be able to amplify or muffle whatever emotion you find, though right now that ability may only manifest in times of extreme stress, as it was with the manifestation of Aidan's abilities.'"

	Q_DOC_ROSE_11A is a transitional quip. The following quip is Q_DOC_ROSE_7. The menu text is "'Aidan's abilities?  What do you mean?'"
	Q_DOC_ROSE_11B is a transitional quip. The following quip is Q_DOC_ROSE_12. The menu text is "'Can I see Aidan?'"
	Q_DOC_ROSE_11C is a transitional quip. The following quip is Q_DOC_ROSE_8. The menu text is "'I guess that sort of went out of control at dinner....'"

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

	Q_DOC_ROSE_12A is a transitional quip. The following quip is Q_DOC_ROSE_11. The menu text is "'What exactly is my condition, anyway?'"

	The response of Q_DOC_ROSE_12 is { Q_DOC_ROSE_12A  }.

After populating Q_DOC_ROSE_12:
	if Q_DOC_ROSE_11 is fired:
		remove Q_DOC_ROSE_12A from the current conversation;
	if the current conversation is empty:
		carry out the firing activity with Q_DOC_ROSE_14;
		carry out the populating activity with Q_DOC_ROSE_14;

Q_DOC_ROSE_13 is a quip. The display text is "'A hair helmet?'  Dr Rose looks at the cranial crown again.  'Oh!  I suppose it does rather look like a salon hair dryer, doesn't it?  Well, function before form, I suppose.  The important thing is that it will allow your abilities to develop without overwhelming you in the process.'"

	Q_DOC_ROSE_13A is a transitional quip. The following quip is Q_DOC_ROSE_11. The menu text is "'My abilities?'"

	The response of Q_DOC_ROSE_13 is { Q_DOC_ROSE_13A  }.

Q_DOC_ROSE_14 is a quip. The display text is "'I have spoken to your parents, by the way, and explained everything to them.  As you know, they're overseas and cannot return at the moment, at least not on such short notice.  In the meantime, they've left me in charge of your health and welfare.  So, Daniel, if anything bothers you at all, I hope you will tell me about it.  I'll do anything I can to make sure you're safe.'[paragraph break]Dr Rose pats you on the shoulder and is about to say something more when there's a resounding crash from somewhere else in the hospital.  At the same time, the pager on Dr Rose's belt goes off.  You catch a glimpse of a number, R15, flashing on its face as Dr Rose looks down at it.  She frowns.  'I'm sorry to have to cut our little chat short, Daniel, but it seems I'm urgently needed elsewhere.  Remember, stay where you are, and don't exert yourself.'  With that, she hurries out of the room, leaving a cloud of apprehension (or is it anxiety?) in her wake.[paragraph break]As the door closes behind her, Ava and Stacy slip into the room.  'Daniel!' says Ava, 'what happened?  Are you going to be okay?'[paragraph break]'Ava, stop worrying and let him answer already.'  Stacy's eye wanders over to the cranial crown contraption.  You don't need super emo-detector powers to see that her curiosity is piqued.";

When Doc Rose Chat ends:
	now Doctor Claudia Rose is off-stage;
	now Ava is in your hospital room;
	now Stacy is in your hospital room.


Part 3 - Conversation with Ava and Stacy

Chapter 1 - Scene

Hospital chat is a scene. Hospital chat begins when Doc Rose chat ends. Hospital chat ends when Q_AVA_HO_2 is fired or Q_AVA_HO_3 is fired or Q_AVA_HO_4 is fired.
	
When hospital chat begins: 
	change the object-based conversation table of Ava to the table of Ava and Stacy's hospital object-conversation;
	change the object-based conversation table of Stacy to the table of Ava and Stacy's hospital object-conversation.

When hospital chat ends: 
	change the object-based conversation table of Ava to the table of Ava's replies;
	change the object-based conversation table of Stacy to the table of Stacy's replies.

Understand "ava and/& stacy" as ava when the player can see Ava and the player can see Stacy.
Understand "stacy and/& ava" as ava when the player can see Ava and the player can see Stacy.

Chapter 2 - Conversation

Table of Ava and Stacy's hospital object-conversation
conversation 	reply	
an object [default]	"She doesn't say anything."	
The room R15 door	"[Ava quips Q_AVA_HOSP_R15]"
coffin case		"[Ava quips CT_AVA_HOSP_CROWN]"
Aidan			"[Ava quips CT_AVA_HOSP_AIDAN]"

Report asking Ava about "[noise]" during hospital chat: placeholder "missing prose".
Report asking Stacy about "[noise]" during hospital chat: placeholder "missing prose".


CT_AVA_HOSP_CROWN is a quip[conversation topic]. The display[response] text is "You tell Stacy about the cranial crown and the need for regular treatments.  'Sorry to hear that,' Stacy says, still peering at the cranial crown and not sounding very convincing, 'that sort of thing always sucks.' "

CT_AVA_HOSP_AIDAN is a quip. The display text is "'Ava went to look in on him while we were waiting to see you,' says Stacy.  'He's somewhere on this floor too, isn't he?'[paragraph break]'They wouldn't let me in to see him, either,' Ava says, 'and it's not as if anything had happened to him or anything.  He's in room R15.'"

	Q_AVA_HO_0_A is a transitional quip. The following quip is Q_AVA_HO_1. The menu text is "'R15?  That's the number I saw flashing on Dr Rose's pager!'"

	The response of CT_AVA_HOSP_AIDAN is { Q_AVA_HO_0_A }.

Q_AVA_HO_1 is a quip. The display text is "'Something must have happened,' you say, 'I'll bet it has something to do with that crash I heard ... I've got to see what's going on!'[paragraph break]'No, wait,' Ava says, 'you're supposed to be resting!'"

	Q_AVA_HO_1_A is a transitional quip. The following quip is Q_AVA_HO_2. The menu text is "'I'll rest after I've checked in on Aidan!'"
	Q_AVA_HO_1_B is a transitional quip. The following quip is Q_AVA_HO_3. The menu text is "'I feel fine!'"
	Q_AVA_HO_1_C is a transitional quip. The following quip is Q_AVA_HO_4. The menu text is "'I suppose you're right.  Someone will tell me if it's something to do with Aidan.'"

	The response of Q_AVA_HO_1 is { Q_AVA_HO_1_A, Q_AVA_HO_1_B, Q_AVA_HO_1_C }.

Q_AVA_HO_2 is a quip. The display text is "Ava tries to stop you, but you push past her to the door.  You don't stop to look back as you slip out onto the corridor.[paragraph break]For a moment, you feel a bit lost as you realize that you have no idea where room R15 might be, but then you sense Stacy and Ava joining you.  'Aidan's room is that way,' Ava says quietly, pointing off to the northwest."

Q_AVA_HO_3 is a quip. The display text is "'Well you don't know that you actually are fine!'  Ava moves to block your way.[paragraph break]'I'd like to know what that noise was, too,' Stacy says, 'and, come on, aren't you the least bit concerned?  It might have something to do with Aidan!'[paragraph break]Ava looks anxious and uncertain, then finally backs down.  'Okay, fine, but we better not get caught.'[paragraph break]Stacy opens the door, and you all slip out into the corridor.  Ava points off to the northwest.  'Aidan's room is that way.'"

Q_AVA_HO_4 is a quip. The display text is "Stacy frowns.  'Maybe.  But I want to know what that crash was.  I mean, it's not the sort of thing you want to hear in a hospital.'  She goes to the door and prepares to step out.  'Ava, are you coming?  You're the one who knows where room R15 is.'[paragraph break]Ava glances at you, and hesitates.  Stacy rolls her eyes and says, 'come on, Daniel, don't you want to find out if your brother is all right?'[paragraph break]You don't need that much encouragement.  Half a second later, the three of you are in the corridor.  Ava points off to the northwest.  'Aidan's room is that way.'"

Q_AVA_HOSP_R15 is a quip. The display text is "'That's Aidan's room,' says Ava, 'I tried to drop in on him earlier.  You don't think...?'[paragraph break]'That something's happened to Aidan?'  It's an alarming thought.  'I'd better go find out.'[paragraph break]'But Daniel, you're supposed to be resting!'"

The response of Q_AVA_HOSP_R15 is [reusing the Quip 1 responses] { Q_AVA_HO_1_A, Q_AVA_HO_1_B, Q_AVA_HO_1_C }.


Part 4 - Hospital Map

The Valmont Hospital region is a region. 

A hospital corridor is a kind of room. Every hospital corridor is in the Valmont Hospital region.
A hospital ward is a kind of room. Every hospital ward is in the Valmont Hospital region.
Ward R15 is a hospital ward. 
Your hospital room is in the Valmont Hospital region.

[ A hospital door is a kind of door. A viewing window is a kind of thing.
A viewing window is part of every hospital door.

Check searching a hospital door (called the portal):
	redirect the action from the portal to a random viewing window which is part of the portal, and try that instead; ]

South T-intersection is a hospital corridor[, north of your hospital room]. "You are in a featureless hospital corridor stretching from east to west.  Another corridor goes off to the north.  The door to your hospital room is to the south."

Southwest Corner of hospital is a hospital corridor, west of South T-intersection.  "The corridor makes a bend here, going east and north.  There are hospital rooms, apparently empty, to the west and south."

Southeast Corner of hospital is a hospital corridor, east of South T-intersection. "The corridor makes a bend here, going west and north.  There are hospital rooms, apparently empty, to the east and south."

west T-intersection is a hospital corridor, north of Southwest Corner of hospital . "You are in a featureless hospital corridor stretching north and south.  Another corridor goes off to the east.  A door marked 'EXIT' is to the west."

The west T-intersection door is a locked door. "Through a narrow window in the door, you can catch a glimpse of the fire escape stairs."  It is west of the west T-intersection. Check opening the west T-intersection door: say "Probably not a good idea: it looks like there's some kind of alarm set to go off when you open it." instead.

The main intersection is a hospital corridor, east of west T-intersection, north of South T-intersection. "This is the heart of this particular wing of the hospital, with corridors running off in all four cardinal directions."

east T-intersection is a hospital corridor, east of the main intersection, north of Southeast corner of hospital . "You are in a featureless hospital corridor stretching north and south.  Another corridor goes off to the west.  A pair of elevator doors are set into the east wall."

The elevator doors are scenery in east T-intersection. "They look pretty imposing.  There's no reason to go through them, though, not at the moment."

Northwest Corner  of hospital  is a hospital corridor, north of west T-intersection.  "The corridor makes a bend here, going east and south.  There are hospital rooms to the west and north, although the sounds coming from the north suggest that that particular hospital room is not quite as empty as all the others have been."

North T-intersection is a hospital corridor, east of Northwest Corner of hospital , north of main intersection.  "You are in a featureless hospital corridor stretching north and south.  Another corridor goes off to the south."

Northeast Corner  of hospital is a hospital corridor, east of North T-intersection, north of east T-intersection.  "The corridor makes a bend here, going west and south.  There are hospital rooms, apparently empty, to the east and north."

Ward-A is a hospital ward, north of North T-intersection.
Ward-B is a hospital ward, north of Northeast Corner.
Ward-C is a hospital ward, west of Northwest Corner.
Ward-D is a hospital ward, east of Northeast Corner.
Ward-E is a hospital ward, east of east T-intersection.
Ward-F is a hospital ward, west of Southwest Corner.
Ward-G is a hospital ward, east of Southeast Corner.
Ward-H is a hospital ward, south of Southwest Corner.
Ward-I is a hospital ward, south of Southeast Corner.

Check facing towards a hospital ward:
	say "A glance through the viewing windows shows that the rooms beyond are quite unoccupied." instead.

Understand "door", "doors", "viewing window", "view", "window" as a direction when the item described is headed towards a hospital ward.

After printing the name of a direction that is headed towards a hospital ward:
	say " door".

Check searching a direction that is headed towards a hospital ward: try facing the noun instead.

Part 5 - Wandering (Dis)Orderly

Wandering Disorderly is a scene. Wandering Disorderly begins when Hospital Chat ends.

When wandering disorderly begins:
	now Ava follows the player;
	now Stacy follows the player.

The wandering orderly is a person. The wandering orderly is in North T-intersection.
The wandering orderly can be stopped. The wandering orderly is not stopped.
The wandering orderly can be wandering-freely or capturing. The wandering orderly is wandering-freely.
The wandering orderly has a room called the previous location. The previous location of the wandering orderly is North T-intersection.

Every turn during Wandering Disorderly:
	abide by the disorderly decision rules;
	consider the disorderly movement rules.

The disorderly decision rules are a rulebook.

A disorderly decision rule when the wandering orderly was stopped:
	now the wandering orderly is not stopped instead;

A disorderly decision rule when the wandering orderly is stopped: rule fails.

A disorderly decision rule when the wandering orderly is in a hospital ward:
	if a random chance of 3 in 8 succeeds:
		unless the location of the wandering orderly is adjacent:
			rule fails.

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
			let the new direction be the direction produced by the disorderly motion rules for x;
			if the new direction is a direction:
				change the previous location of the wandering orderly to the location of the wandering orderly;
				try the wandering orderly trying going the new direction;
				rule succeeds;

The disorderly motion rules are an object based rulebook producing a direction.
A disorderly motion rule for the Northwest Corner of hospital: rule fails.
A disorderly motion rule for your hospital room: rule fails.

A disorderly motion rule for a room (called r) when the wandering orderly is in a Hospital Ward and r is not the location:
	rule succeeds with result the quick best route from the location of the wandering orderly to r;

A disorderly motion rule for a room (called r) when r is not the location:
	if r is not the previous location of the wandering orderly:
		rule succeeds with result the quick best route from the location of the wandering orderly to r;


First report the wandering orderly trying going to an adjacent hospital corridor (called R) from a room that is not the location:
	now the wandering orderly is capturing;
	say "You notice an orderly pushing a gurney out into the corridor, off to the [quick best route from the location to R].  It looks like he's about to head this way!" instead.

First report the wandering orderly trying going:
	if the room gone to is the location:
		placeholder "A gurney is pushed right into you by an orderly who, though surprised, is not too surprised to immediately sound the alarm.  Within seconds, Ava and Stacy have been bundled out of the hospital and you're locked into your room.  It's a couple of hours before Dr Rose comes back, frowning in a very concerned manner.";
		fire TRIG_DR_ROSE_DEATH;

First report going to a hospital corridor:
	if the room gone to contains the capturing wandering orderly:
		placeholder "You run right into an orderly who, though surprised, is not too surprised to immediately sound the alarm.  Within seconds, Ava and Stacy have been bundled out of the hospital and you're locked into your room.  It's a couple of hours before Dr Rose comes back, frowning in a very concerned manner.";
		fire TRIG_DR_ROSE_DEATH;
	otherwise if the room gone to contains the wandering orderly:
		consider the disorderly wandering rule;
	continue the action.

Check going to a hospital ward:
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
	rule succeeds.

TRIG_DR_ROSE_DEATH is a quip. The display text is "'I do wish you wouldn't insist on running around unsupervised, Daniel.  You need your rest, we need to monitor your condition, and this last adventure of yours might very possibly have interfered terribly with ... well, with everything.  The data may have been compromised.  I'm afraid we'll have to keep you under observation a little longer.'  She shakes her head sadly. 'Believe me, Daniel, I'd have liked to let you go back to the camp every bit as much as you would, but under the circumstances, I'm afraid it just can't be done.'"

Rule for firing TRIG_DR_ROSE_DEATH: end the game saying "The story is over."


Part 6 - Finding Aidan

Outward Journey is a scene. Outward Journey begins when Hospital Chat ends. Outward Journey ends when TRIG_FOUND_AIDAN is fired.

Return Journey is a scene. Return Journey begins when Outward Journey ends. Return Journey ends when the location is your hospital room. Wandering Disorderly ends when Return Journey ends.

When Outward Journey begins:
	now Stacy follows the player;
	now Ava follows the player;
	move the player to South T-Intersection.

Last report going to the northwest corner of hospital when TRIG_FOUND_R15 is unfired during Outward Journey: say Ava quips TRIG_FOUND_R15.

TRIG_FOUND_R15 is a quip.  The display text is "'Here we are,' whispers Ava, pointing to a door to the north.  'That's room R15.  Aidan's in there.'"

The room R15 door is a door, north of Northwest Corner, south of ward R15.  The printed name of the room R15 door is "door to R15".  Understand "window", "viewing window", "view", "ward" as the room R15 door when the room R15 door is in the location. Understand "R15" or "room 15" or "room r15" as the room R15 door when hospital chat is happening [just as a conversation Object]. 

Check searching the room R15 door: try going the room R15 door instead.
Check opening the room R15 door: fire TRIG_FOUND_AIDAN instead.
Check facing north when in the northwest corner: fire TRIG_FOUND_AIDAN instead.

TRIG_FOUND_AIDAN is a trigger. 
	
Rule for firing TRIG_FOUND_AIDAN:
	if TRIG_FOUND_AIDAN is unfired:
		say "Looking through the window, you see a room equipped in much the same way your room was, complete with the silvery, high-tech coffin thing.  That's where the resemblance ends.  The lid of the coffin thing has been broken off and lies at the far end of the room, a huge crack down its middle, and smoke billows out from one broken monitor.  Aidan himself is lying near the coffin, unconscious, while a bunch of orderlies stand at a very safe distance away from him.[paragraph break]Fear, shock, whatever, it's thick in the air and feels like you just snorted hot salsa up your nose.[paragraph break]In the middle of all this is Dr Rose.  You can't hear what she's saying but ... oh, well, it looks like she's done lecturing the orderlies and now she's heading for the door.  You pull back before she sees you.  You've got to get back to your room before she notices you're gone, but you're in a corner and there's no way to know which way she'll turn when she comes out, and if you hide in the empty room to the west Dr Rose will almost certainly get to your room before you.[paragraph break]'Go that way,' Stacy whispers, shoving you eastwards.  'I'll distract them.'  Before you can say anything, Stacy has run off to the south.";
		now Stacy does not follow the player;
		try silently Stacy going south;
	otherwise:
		say "'Daniel Wayne!' Dr Rose catches you by the collar and frowns, clearly disappointed.  'What are you doing out of your room?  Come on, back you go.'  She marches you back to your room, where she proceeds to put you through a battery of seemingly unnecessary tests.  Pursing her lips as she reads the data scrolling by on the monitors, she says, [run paragraph on]";
		fire TRIG_DR_ROSE_DEATH.


When Return Journey ends: now Ava does not follow the player.

Hospital ends when Return Journey ends.

When Hospital ends:
	say "And not a moment too soon.  When Dr Rose comes bustling in, you are back in the coffin thing and Ava is sitting beside you, looking as if you'd just spent the past half hour talking about the weather.  Dr Rose frowns a bit when she checks the readouts on the various monitors, but no-one can look as innocent as Ava when she has to, and in the end Dr Rose decides that nothing suspicious has been going on after all.[paragraph break]Aidan, she says, is still undergoing observation of some kind, but you're free to go back to camp.  Brad picks you up after lunch (it turns out that the hospital food tastes just as nasty as the camp food) and you're back in time for your afternoon classes.  It's dinner time before Aidan is back at camp; and whatever it was that happened to him in the hospital, he either doesn't remember, or doesn't want to tell you.";
	ifndef debug;
	pause the game;
	enddef debug.



Book 5 - Robotics Class

Robot Fun is a chapter-length scene. 
Robot Fun begins when Hospital ends.
Robot Fun begins when chapter number is 5 [and the player is in the robotics class]. [isn't set to 5 until it's own Begin rule, but testers can force it.]

When Robot Fun begins:
	now every logic block is on your workbench;
	change the current term day to day 6;
	change the time of day to 10:25 AM;
	now the left hand status line is "[Current term day]: [the location in title case]";
	now the right hand status line is "[time of day]";
	now the chapter number is 5;
	say "Things settle down, more or less, over the next day or so.  People are trying very hard to not give you funny looks when they see you, which pretty much comes to the same thing, really.  Aidan's probably going through the same sort of thing too.  He's certainly rather a bit more moody than he used to be.[paragraph break]LEAP, Day 6 (Friday) - Class Period 2[paragraph break]Robotics class, the wave of the future, because everyone knows that some day we're going to have giant killer robots laying waste to downtown Tokyo or something like that, and it would be a good thing to know how to deal with them.  No-one's really capable of making a giant killer robot: right now, you're all just doing a basic project to program a robot to do a certain simple task.  Except Stacy, who seems to be dead set on making a midget killer robot she calls the 'Stacy Alexander Robot Guy', or SARG for short.";
	move Stacy Alexander to Robotics Class;
	move Aidan to Robotics Class;
	move the player to Robotics Class;
	remove Ava from play;
	now nobody follows the player.

Robotics Class is a privately-named unimportant classroom. "[if in chapter 5]You sit at a table in a perfectly ordinary classroom, surrounded by electronic parts.  Antonia Long, your Robotics instructor, has been cornered elsewhere by students with issues, leaving you to your own electronic, robotic devices.  Stacy sits beside you with her own robot project, SARG, while Aidan[Aidan mentioned] is at another table with the older students[otherwise]No windows here:  small electronic and mechanical parts fill every nook and cranny of the shelved walls of Robotics.  A half-dozen tables each large enough for four march down the center of the room toward Instructor Long's bench, opposite the door[end if]." Understand "robotics" as Robotics Class.

Some electronic parts are scenery in robotics class. "[if in chapter 5]You've already isolated the bits and pieces you need; the rest is[otherwise]They are[end if] just so much debris."

Check going somewhere when in chapter 5: placeholder "You can't leave class until you finish building your robot's brain." instead.

Understand "build" or "build [text]" or "make" or "make [text]" as a mistake ("To do that, you must insert all of the logic blocks into all of the robot's slots, into their right order, so the robot will be able to move the marbles from one basket to the other.") when in chapter 5.

Your workbench is a scenery supporter in robotics class. "Sturdy enough to hold a robot army.  Which is good, as Stacy looks like she's building one."




Part 1 - The Robot and its brain slots

Your robot is a fixed in place animal on your workbench. The description is "[program description]". Understand "slots" or "brain" or "your" as your robot.


Part 2 - Logic Blocks

A logic block is a kind of thing, improper-named. Some logic blocks[ in Robotics Class] are defined by the table of robot logic blocks.  Understand "programming", "logic block", "code", "block", "brain block", "blocks" as a logic block.  Definition: a logic block is placed rather than unplaced if it is in a slot.

The description of a logic block is usually "[The item described] is labeled with the program logic it contains, in pseudo-code form. This one reads:[paragraph break][fixed letter spacing][pseudocode of the item described][variable letter spacing]".

Before listing contents: group logic blocks together.
After printing the name of a logic block while not grouping together: say " logic block".
Before grouping together logic blocks: say "some programming logic blocks, all different colors: "

[Understand "blocks" as the block-collective. The block-collective is a privately-named undescribed scenery thing in robotics class. Instead of doing something other than examining the block-collective, say "You'll have to pick a specific block."] [Check examining [the block-collective]: say "The blocks on the table are:[line break]"; repeat with X running through the logic blocks on your  workbench begin; say "[The X]:[line break][fixed letter spacing][pseudocode of X][variable letter spacing][line break]"; end repeat. ]

Understand "examine [logic blocks]" or "x [logic blocks]" as examining.


Table of robot logic blocks
logic block		braces	pseudocode
copper-colored		-1	"[tab][tab][tab][tab]last_used = left;[line break][tab][tab][tab]}"
royal purple		0	"[tab][tab][tab][tab]pick_up_with_left;"
hot pink		-1	"[tab]}[line break]end loop"
scarlet			-1	"[tab][tab]}[line break][tab]} else {"
saffron			1	"[tab][tab][tab]turn_to_destination_basket;[line break][tab][tab]} else {[line break][tab][tab][tab]if (last_used == left) {[line break][tab][tab][tab][tab]pick_up_with_right;"
golden			-1	"[tab][tab]}[line break][tab][tab]turn_to_source_basket;"
mint green		2	"begin loop[line break][tab]if (facing_source_basket) {[line break][tab][tab]if (holding_marble) {"
magenta		1	"[tab][tab]if (holding_marble) {[line break][tab][tab][tab]drop_marble_in_basket;"
baby blue		0	"[tab][tab][tab]holding_marble = true;[line break][tab][tab][tab]turn_to_destination_basket;"
forest green		0	"[tab][tab][tab][tab]last_used = right;[line break][tab][tab][tab]} else {"

To say tab: say "    ".

Understand "copper", "copper-colored" as the copper-colored.
Understand "red" as the scarlet.
Understand "orange" as the saffron.
Understand "gold", "yellow" as the golden.


Part 3 - slots 

A slot is a kind of container. Some slots are defined by the table of programming slots. After printing the name of a plugged slot (called the spot) while asking which do you mean: say " (with [a random logic block in the spot])". Every slot is part of your robot.  Definition: a slot is plugged rather than unplugged if it contains a logic block. 

Does the player mean inserting a unplaced block into an unplugged slot: it is very likely. 
Does the player mean inserting a placed block into an unplugged slot: it is likely.  
Does the player mean removing a placed block from: it is likely.


Table of programming slots
slot	running order	solution block (an object)
slot 1		1	mint green
slot 2		2	saffron
slot 3		3	forest green
slot 4		4	royal purple
slot 5		5	copper-colored
slot 6		6	baby blue
slot 7		7	scarlet
slot 8		8	magenta
slot 9		9	golden
slot 10	10	hot pink


Part 4 - robot sim

Chapter 1 - helper 

The brace count and the loop count are numbers that vary. 
[To say braces (n - a number): now the brace count is the brace count plus n; if the brace count < 1, say "A yellow light blinks slowly on slot [The currently processing slot].  ".]

To say loop (n - a number): increase the loop count by n. 

The basket faced is a container that varies. The basket faced is usually the metal bowl.

Holding_marble, last_used are truth states that vary. 

A metal bowl and a wicker basket are containers on your workbench. A marble is a kind of thing. 7 marbles are in the wicker basket. 

The currently executing slot is a number that varies.

To check brace syntax:  if the brace count is less than zero, say "A yellow light beside slot [the currently executing slot] blinks."

To check loop syntax: if the loop count is less than zero, say "A yellow light beside slot [the currently executing slot] blinks slowly.  "

Chapter 2 - rulebook 

The robot action rules are an object-based rulebook.

First robot action of something (called X):
	now the currently executing slot is the position of X.

Robot action for copper-colored: 
	say "The robot nods to itself, as if it just told itself something it needs to remember.  "; 
	decrease brace count by 1;
	check brace syntax;
	
Robot action for royal purple:  
	say "The robot's left hand grabs ";
	if a marble is in the basket faced:
		let that marble be a random marble in the basket faced;
		now your robot carries that marble;
		say "a marble from [the basket faced].  ";
	otherwise:
		say "thin air, as there aren't any marbles in [the basket faced].  ".

Robot action for hot pink: 
	decrease brace count by 1;
	check brace syntax;
	say "The robot seems to sigh, as if its doing something its getting bored of.  ".

Robot action for scarlet:  
	decrease the brace count by 1;
	check brace syntax;
	say "The robot tilts its head to the left.  "

Robot action for saffron: 
	now the basket faced is the metal bowl;
	say "The robot turns to face the metal bowl.  It tilts its head to the left.  ";
	increase brace count by 1;
	check brace syntax;
	say "And to the right. It then grabs ";
	if a marble is in the basket faced:
		let that marble be a random marble in the basket faced;
		now your robot carries that marble;
		say "a marble";
	otherwise:
		say "thin air, as there aren't any marbles in [the basket faced].  "

Robot action for golden: 
	decrease brace count by 1;
	check brace syntax;
	now the basket faced is the wicker basket;
	say "The robot turns to face the wicker basket[if the wicker basket contains at least 10 marbles] full of marbles[end if].  "

Robot action for mint green:	
	say "The robot does an exaggerated sigh, and looks down at [the basket faced].  ";
	increase brace count by 2;
	check brace syntax;

Robot action for  magenta:
	say "The robot tilts its head back, as if trying to remember something.  ";
	increase the brace count by 1;
	check brace syntax;
	if your robot has a marble:
		now every marble carried by your robot is in the basket faced;
		say "Then it drops the marble into [the basket faced].  ";
	otherwise:
		say "It opens its hand, to no effect.  "

Robot action for  baby blue: 
	say "The robot deliberately nods, as if to reaffirm something in its mind.  It then turns toward the metal bowl.  ";
	now the basket faced is the metal bowl.

Robot action for  forest green:
	say "The robot deliberately nods to itself, as if to say, 'ok.'  It then tilts its head to the left.  "


Part 5 - Action on slots and logic blocks

First check inserting a logic block which is not held into (this is the implicit take to enslot rule): try silently taking the noun; unless the player carries the noun, say "Wait, where did [the noun] go?" instead.

Check inserting a logic block into your robot: 
	repeat with N running from 1 to 10:
		repeat with X running through the slots:
			if the running order of X is N:
				if X is unplugged, try inserting the noun into X instead;
				otherwise break; [out of the inner loop]
	say "There's no open slots." instead.

Check inserting something into a slot when the noun is not a logic block:
	say "The slots are designed to each hold one logic block[if the second noun is plugged]. Besides, that one already has [a random logic block in the second noun] in it[end if]." instead.

Check inserting something into a plugged slot (called the occupied slot): say "But that slot already has the [random something in the occupied slot] in it." instead.

Report inserting something into a slot: say "Ker-chunk[one of]! [The noun] fills the slot snugly.[or]. Another block fits neatly into place.[or]. You put [the noun] in the slot.[or].[or].[or] - isn't this fun?[or].[stopping]" instead.

Instead of doing something except inserting or swapping when an unplugged slot is physically involved, say "Nothing's in that slot."

[Before doing something except taking or removing when the noun is a plugged slot and a plugged slot is physically involved: let B be a random logic block in the noun; change the noun to B.]

Check taking a plugged slot: let B be a random logic block in the noun; try taking B instead.

First check removing a placed block from your robot: change the second noun to the holder of the noun.
First check removing a placed block from the program: change the second noun to the holder of the noun.

Check removing a plugged slot from: let X be a random logic block in the noun; try removing X from the second noun instead.

Rule for supplying a missing second noun while in chapter 5: change the noun to your robot.

Every turn when in chapter 5: now every logic block in [on the floor of] robotics class is on your workbench.

Part 6 - The program

The program is part of your robot. The description is "[program description]".  Understand "mind" as the program.

To say program description:
	if every slot is not plugged:
		say "All the program slots are empty.  Your robot has no brain. ";
		stop;
	say "Going down the list of slots, your program reads as follows:[line break][line break]";
	let B be an object;
	repeat with X running from 1 to 10:
		if a logic block (called Blk) is in position X, now B is Blk;
		otherwise now B is nothing;
		if we are examining your robot, say "[if B is nothing]Slot [X] is empty.[otherwise]In slot [X], [the B]:[line break]";
		unless B is nothing, say "[fixed letter spacing][pseudocode of B][variable letter spacing][line break]".

Understand "run [program]", "execute [program]", "run [your robot]", "execute [your robot]" as entering. Understand "run", "go", "execute" as entering when in chapter 5. Rule for supplying a missing noun when entering and in chapter 5: now the noun is the program.

First check entering your robot (this is the by robot i meant program rule): change the noun to the program. [no instead -- typecasting]

The number of correctly placed blocks is a number that varies. The number of correctly placed blocks is usually 0.

Check entering the program when in chapter 5 (this is the domo arigato mr roboto rule):
	now holding_marble is false;
	now last_used is false;
	now the number of correctly placed blocks is 0;
	repeat with X running from 1 to 10:
		unless a logic block (called B) is in position X, say "Finally, it stops moving, a red light blinking on slot [X]." instead;
		say "[bracket][printed name of B][close bracket] ";
		consider the robot action rules for B;
		if B is the solution block corresponding to a running order of X in the table of programming slots, increase the number of correctly placed blocks by one;
	say paragraph break;
	if the number of correctly placed blocks is ten, rule succeeds;
	rule fails.

[Instead of entering the program when in chapter 5:
	if a slot is not plugged, say "That can't be right. You need every single one of these blocks." instead;
	if the braces are not matched, say "Your robot buzzes and whirrs sadly[one of]. Stacy peers over. 'That's no good,' she says, and points at the { and } squiggly lines in your program. 'Your braces don't match. Every opening brace needs a closing one.'[or].[or][if a random chance of 1 in 4 succeeds]. 'Braces!' calls Stacy helpfully.[otherwise].[end if][stopping]" instead;
	if the loop is not matched, say "¿Bad loop?" instead;
	rule succeeds.]

Part 8 - helper routines

To decide which number is the position of (b - a logic block):
	if b is in a slot (called the holster), decide on the running order of the holster;
	otherwise decide on -1.

[To decide which list of objects is the current program:
	let zblocks be a list of objects;
	repeat with i running from 1 to 10:
		if a logic block (called B) is in position i:
			add B to zblocks;
	decide on zblocks.
]
Block-ordering relates a logic block (called X) to a number (called Y) when the position of X is Y. The verb to be in position implies the block-ordering relation.

[
To decide whether braces are not matched:
	now the brace count is 0;
	repeat with B running through the current program:
		let the temporary adjustment be 0;
		increment the brace count by the braces of B; 
		if B is:
			-- scarlet: change the temporary adjustment to -1;
			-- saffron: change the temporary adjustment to -1;
			-- forest green: change the temporary adjustment to -1;
		increment the brace count by the temporary adjustment;
		if the brace count is less than 0:
			decide yes;
		decrement the brace count by the temporary adjustment;
	decide on whether or not the brace count is not 0.

To decide whether loop is not matched:
	now the brace count is 0;
	repeat with B running through the current program:
		let the temporary adjustment be 0;
		increment the brace count by the braces of B; 
		if B is:
			-- scarlet: change the temporary adjustment to -1;
			-- saffron: change the temporary adjustment to -1;
			-- forest green: change the temporary adjustment to -1;
		increment the brace count by the temporary adjustment;
		if the brace count is less than 0:
			decide yes;
		decrement the brace count by the temporary adjustment;
	decide on whether or not the brace count is not 0.]

Part 9 - end scene

Robot Fun ends when we have entered the program.

When robot fun ends: 
	placeholder "Daniel's robot does all the marbles, then messes with SARG (Stacy's robot), whose 'jet boots' fly it around uncontrollably.  Aidan smashes it angrily.  Instructor Antonia tsks Aidan for method and Stacy for lacking 'safety features'. Aidan apologizes to Antonia, shoots a dark look at Stacy, and leaves.  Stacy is upset, and Daniel wonders what's wrong with his brother.";
	ifndef debug;
	pause the game;
	enddef debug.



Book 6 - The Protector

Part 1 - opens

The Protector is a chapter-length scene.  The protector begins when Robot Fun ends.

under the greenwood tree is an exterior room. "Thou art in the company of thy master's men, the merry men of Sherwood Forest.  'Tis a sunny morning in May, and the merry birds doth sing in the trees above."

Some birds are scenery in under the greenwood tree. "The birds doth twitter on unseen.  They are but of little import, and thus the simulation extendeth not to their very appearance."

Some merry green trees are scenery in under the greenwood tree. "No greener trees than these do grow, nay, not in all of merry England." The printed name of the merry green trees is "trees". 

When the Protector begins:
	say "Things are a little tense Friday evening, and through most of Saturday.  Stacy is angry with Aidan for what he did to SARG, Aidan is being all sulky and broody and unsociable, and Ava seems to have had an argument with Stacy over who was right or wrong in the Great Robotics Class Incident.  You, meanwhile, have simply been watching the ebb and flow of everybody's emotional states.

You're getting better at this.  Some things don't even register as smells or sounds or colours any more, but as recognizable emotions.  So of course, since you're the one who can see the best time to approach people, you're the one to go gather everyone together for Sunday's event.";
	ifndef debug;
	pause the game; 
	enddef debug;
	now the chapter number is 6;
	change the current term day to day 8;
	change the time of day to 1:30 PM;
	say "LEAP, Day 8 (Sunday) - Mid-afternoon

Everyone looks forward to Sim Sunday!  That's when people get to go into the Simulation Room and play through the scenario that some of the counselors have spent the whole year putting together.  It is quite literally THE great virtual reality event of the entire camp.

The Simulation Room functions as a sort of giant virtual reality suit, recreating a whole other world that you and a few other campers can enter and interact with.  There's always a scenario of some sort involved: a few campers are let in to run through it, some playing principal speaking parts while others play less important roles or even just stand around as non-speaking extras.  Everybody wants to get in on this, of course, so as soon as one group has played through the scenario, they're moved out while another group starts over again.

This year, they're doing Robin Hood And The Monk.  You went through this as a non-speaking extra (Random Church-Goer #5) this morning, but this time around you've snagged a major speaking role: you're Little John.  Or rather, thou art Little John.  [']Tis of great importance that thou immerseth thyself in thy part, is[']t not?";
	now Aidan is in under the greenwood tree;
	now Stacy is in under the greenwood tree;
	now Aidan follows the player;
	now the player is in under the greenwood tree.


Understand "Robin" as Aidan when in chapter 6. Rule for printing the name of Aidan when in chapter 6: say "Robin".
Understand "little/john" or "little john" as yourself when in chapter 6. Rule for printing the name of yourself when in chapter 6: say "Little John".
Understand "Much/son/miller's" or "miller's son" as Stacy when in chapter 6. Rule for printing the name of Stacy when in chapter 6: say "Much".

Part 2 - on the road

Understand "cheer [someone]" or "cheer [someone] up" as talking to. 

Instead of doing something other than looking, examining when in chapter 6 and SOMETHING_ROTTEN_IN_NOTTINGHAM is not fired:
	if SET_SCENE is not fired, say Aidan quips SET_SCENE instead;
	if MUCHS_ARG is not fired, say Aidan quips MUCHS_ARG instead;
	if SOMETHING_ROTTEN_IN_NOTTINGHAM is not fired, say Aidan quips SOMETHING_ROTTEN_IN_NOTTINGHAM instead;

[Instead of conversing when the noun is Aidan and in under the greenwood tree:
	if SET_SCENE is not fired, fire SET_SCENE instead;
	if MUCHS_ARG is not fired, fire MUCHS_ARG instead;
	if SOMETHING_ROTTEN_IN_NOTTINGHAM is not fired, fire SOMETHING_ROTTEN_IN_NOTTINGHAM instead;]

Check going nowhere when in chapter 6: say "Nottingham lies to the east." instead.
Check going when in chapter 6 and SET_SCENE is not fired: placeholder "unsportsmanlike to wander from the script! There's supposed to be dialogue betwixt Little Jon (that's you) and Robin Hood." instead.

Instead of conversing when the noun is Stacy and in chapter 6, say "Forsooth, such existeth not within the bounds of this simulation." 

SET_SCENE is a quip. The display text is "'I dunno, John, it's just that every Sunday we're here in the woods, it's like there's no difference from day to day, you know?  And today is White Sunday, too.  I really should be in church.  It's been two weeks since I've been to Mass.'

'Then let us go, for if that is what ailest thee, then we shouldst find both salve and salvation at Nottingham church.'

Robin fixeth upon thee a look of no small wonderment.  'You've been double-dipping into the Shakespeare, haven't you?  Well, I think it's a good idea, anyway.  To Nottingham!'"


MUCHS_ARG is a quip. The display text is "'Wait,' quoth Much, the miller's son, 'aren't you wanted in Nottingham for highway robbery?  You should take some men with you.  Twelve guys, maybe, to watch your back.'

'No way, I'm not taking anyone except Little John, to carry my bow.  Everything will be fine.'"

SOMETHING_ROTTEN_IN_NOTTINGHAM is a quip. The display text is "Er, according to the poem, this is the part where thou art supposed to tell Robin to carry his own bow, as thou shalt be carrying thine own, but Robin seemeth not to heed the script, and fixeth Much with a stern and a terrible eye.  'Are you trying to tell me I can't take care of myself?'

'Do whatever you want,' quoth Much, who sulketh and looketh away all too quickly.  Methinks the lad be not comfortable arguing with Robin.

'Fine.' Robin taketh up his bow, and bids thee take thine own.  'Let's get moving.'"


Part 3 - archery contest


The old archery range is an exterior room. "Though all of Sherwood be thy range, this sunny glen doth lend itself best to thy sport.  A stump by thy feet doth provide adequate place for thy wager, and targets lean upon the trees at the opposite side of the glen."

The stump is scenery supporter in the old archery range. "[']Tis as flat as a table, and hath oft served as a place upon which to place thy wagers when thou and thy friends take up thy bows against thy fearsome foes, the targets."

The target is scenery in the old archery range. "Many is the time that thou hast waged honorable war against them, yet there they stand, as whole as ever they were on the day upon which they had been carved."  Instead of doing something other than examining or attacking the target, say "But thy target is three hundred paces away." 

under the greenwood tree is west of the old archery range.  Nottingham is east of the old archery range. Nottingham is visited. [player never gets to Nottingham, but I want the GO NOWHERE message to imply its out there.]


The Archery Contest is a scene.  The archery contest begins when in the old archery range.

When the archery contest begins: say "'Ah, the old archery range.  Good times, eh?  I think we've got some time before Mass, so how about a bit of archery practice?  I'll give you 3 to 1 odds: three pennies to you for every target you hit, if you'll give me one for every target I hit.'

'Thou shalt be the poorer man for this, I'll wager!'

'Yeah, yeah, notch up and shoot the targets already.'"

Check going during the archery contest: placeholder "unsportsmanlike to leave during your contest" instead.

The-one-about-nothing-much is scenery in the archery range. Understand "much" as the-one-about-nothing-much. The printed name of the-one-about-nothing-much is "Much".
Check an actor examining the-one-about-nothing-much during the archery contest: say "'Wait, Sir Robin.  I cannot shoot with thee now, for I cannot see Much!'

Thou grineth, but verily, it seemeth thou hast annoyeth Sir Robin."; placeholder "Check my language, please. --RN" instead.

[Check singing when in chapter 6: say "'Cheerest up, Sir Robin.  Here, I shall sing to thee:

When evil rearth its ugly head
Brave Sir Robin turnth tail and fled
He's the brave, brave, br--

'That's enough, Daniel,' snaps Aidan." instead.]


John's score and Robin's score are numbers that vary.

Check attacking the target when in chapter 6 for the first time: say "Thy arrow is unfortunately wide of the target.  Robin doth smirk as he fitteth an arrow upon his own bowstring.

Robin doth raise up his bow and let fly his shot, straight and true, to the heart of the target.  Well shot, indeed." instead.

Check attacking the target when in chapter 6 for the second time: say "Well shot!  Thou art another three pennies ahead of thy companion!

Robin doth shoot his arrow, which misseth the target by a hair.  With a scowl, he bids thee take thy turn." instead.

Check attacking the target when in chapter 6 for the third time: say "Thy arrow seemeth to shimmer in its flight, and striketh the target but close to the edge.  A lucky shot indeed!

Robin shooteth, but scoreth not."; rule succeeds.

Check attacking the target when in chapter 6: say "Thy arrow leaps through the air into thy mark.  Well shot!" instead. 

The archery contest ends in Little John's favor when we have attacked the target.
The archery contest ends in Robin Hood's favor when Robin's score is two.

Part 4 - two cents worth

Section 1 - scene

Two cents worth is a scene. Two cents worth begins when the archery contest ends.

When the archery contest ends in Robin Hood's favor:  say Aidan quips 2CENTS-10.
When the archery contest ends in Little John's favor: say "Thou art a full two shillings, or four-and-twenty pennies, ahead of thy companion.  Verily, thou hast won the contest.  With ill humor, Robin doth gather up the arrows and prepareth to continue upon his way to Nottingham."

Instead during two cents worth (this is the bother Robin for pennies rule):
	if looking, make no decision;
	if examining, make no decision;
	if conversing, make no decision;
	say "Wait, did Robin not promise to pay thee three pennies for every target thou didst hit?  Thou must demand of him this payment, for it is in the script."

Understand "payment", "pennies", "shillings", "wager", "bet", "winnings" as the dollars when in chapter 6.

Report inquiring Aidan about dollars during two cents worth: say Aidan quips 2CENTS-01 instead.
[Report asking Aidan about when the player's command includes "payment/pennies/shillings/wager/bet/money/winnings" during two cents worth: fire 2CENTS-01 instead.]

Understand "asking [Aidan] for [text]" as asking it about when two cents worth is happening.

Check talking to Aidan during two cents worth: say Aidan quips 2CENTS-01 instead.

Two cents worth ends when 2CENTS-04 is fired or 2CENTS-10 is fired.


Section 2 - quips

2CENTS-01 is a quip. The display text is "'Robin, I have won of thee fairly two shillings, and would have thee pay me what thou owest.'

'Don[']t be stupid.  I don[']t owe you any such thing.  And for goodness['] sake, drop the fake Shakespeare already.  It[']s not even the right time period for Robin Hood.'"  

	2CENTS-M01 is a transitional quip. The menu text is "'Verily thou owest me that much, and I demand it of thee!'". The following quip is 2CENTS-02.
	2CENTS-M02 is a transitional quip. The menu text is "'You do so owe me two shillings!  Cough it up!'". The following quip is 2CENTS-05.
	2CENTS-M03 is a transitional quip. The menu text is "'C[']mon, it[']s in character, anyway.  Pay unto me the two shillings, as thou didst promise!'". The following quip is 2CENTS-02

	The response of 2CENTS-01 is { 2CENTS-M01, 2CENTS-M02, 2CENTS-M03 }. 

2CENTS-02 is a quip. The display text is "'And you are a miserable liar!  Shut up and get moving or we[']ll be late for church!'"  

	2CENTS-M04 is a transitional quip. The menu text is "'Nay, [']tis thou who art the liar!  Thou dost so owe me two shillings!'". The following quip is 2CENTS-06.
	2CENTS-M05 is a transitional quip. The menu text is "'Nay, I shall not, for thou art a faithless master and I shall have none of thee!  If thou goest, thou goest alone!'". The following quip is 2CENTS-03.
	2CENTS-M06 is a transitional quip. The menu text is "'Very well, if thou insists upon it.  Let us go on.'". The following quip is 2CENTS-09.

	The response of 2CENTS-02 is { 2CENTS-M04, 2CENTS-M05, 2CENTS-M06}.

2CENTS-03 is a transitional quip. "Thou canst practically hear the applause in the peanut gallery." The following quip is 2CENTS-04.

2CENTS-04 is a quip. The display text is "Thou turnst upon thy heel to stride off, but Aidan doth grab thee by the shoulder and spins thee around to face him.  'Don[']t you DARE turn your back on me!' he roars."  [Go to section: End of Chapter]

2CENTS-05 is a quip. The display text is "[']Tis prudent, perhaps, to affect normal speech for the nonce, lest thy brother explode.  Quoth he, 'well, it[']s about time.  I still say either you[']re a liar or you flunked basic math, and I don[']t owe you anything.  Now pack up and let[']s get moving.'" 

	2CENTS-M07 is a transitional quip. The menu text is "'First you pay me what you owe!'". The following quip is  2CENTS-07.
	2CENTS-M08 is a transitional quip. The menu text is "'Forget it.  If you[']re going to be this way, I[']m out of here and you can go to Nottingham church alone.'". The following quip is  2CENTS-04.
	2CENTS-M09 is a transitional quip. The menu text is "'Okay, okay, you win.  Let[']s just move on, shall we?'". The following quip is  2CENTS-09.

	The response of 2CENTS-05 is { 2CENTS-M07, 2CENTS-M08, 2CENTS-M09}.

2CENTS-06 is a quip. The display text is "'Do not!'" 

	2CENTS-M10 is a transitional quip. The menu text is "'Dost so!'". The following quip is  2CENTS-06.
	2CENTS-M11 is a transitional quip. The menu text is "'Thou art a faithless master and I shall have no more of thee!  If thou goest to Nottingham, thou goest alone!'". The following quip is  2CENTS-03.
	2CENTS-M12 is a transitional quip. The menu text is "'Very well, if thou insists upon it.  Let us go on.'". The following quip is  2CENTS-09.

	The response of 2CENTS-06 is { 2CENTS-M10, 2CENTS-M11, 2CENTS-M12}.

2CENTS-07 is a quip. The display text is "'Will you shut up about the two shillings already? I don[']t owe you anything!'" 

	2CENTS-M13 is a transitional quip. The menu text is "'Yeah, you do!'". The following quip is  2CENTS-08.
	2CENTS-M14 is a transitional quip. The menu text is "'Fine, be that way, but be that way alone.  I[']m out of here.'". The following quip is  2CENTS-04.
	2CENTS-M15 is a transitional quip. The menu text is "'Okay, okay, you win.  Let[']s just move on, shall we?'". The following quip is  2CENTS-09.

	The response of 2CENTS-07 is { 2CENTS-M13, 2CENTS-M14, 2CENTS-M15 }.

2CENTS-08 is a quip. The display text is "'Do not!'" 

	2CENTS-M16 is a transitional quip. The menu text is "'Do so!'". The following quip is  2CENTS-08.
	2CENTS-M17 is a transitional quip. The menu text is "'Fine, be that way, but be that way alone.  I[']m out of here.'". The following quip is  2CENTS-04.
	2CENTS-M18 is a transitional quip. The menu text is "'Okay, okay, you win.  Let[']s just move on, shall we?'". The following quip is  2CENTS-09.

	The response of 2CENTS-08 is { 2CENTS-M16, 2CENTS-M17, 2CENTS-M18 }.

2CENTS-09 is a quip. The display text is "Aidan is triumphant, but alas he doth realize too late how such victory wouldst change the script. 'Hold it right there, what[']s that supposed to mean?  We[']re supposed to part ways here.  Are you trying to ruin the story?'" 

	2CENTS-M19 is a transitional quip. The menu text is "'Then pay me my two shillings!'". The following quip is  2CENTS-10.
	2CENTS-M20 is a transitional quip. The menu text is "'Um.'". The following quip is 2CENTS-10.
	2CENTS-M21 is a transitional quip. The menu text is "'Uh.'". The following quip is 2CENTS-10.
	2CENTS-M22 is a transitional quip. The menu text is "'Oops?'". The following quip is 2CENTS-10.
	2CENTS-M23 is a transitional quip. The menu text is "Try to improvise something.". The following quip is 2CENTS-10.

	The response of 2CENTS-09 is { 2CENTS-M19, 2CENTS-M20, 2CENTS-M21, 2CENTS-M22, 2CENTS-M23 }.

2CENTS-10 is a quip. The display text is "Aidan[']s face doth turn scarlet with rage.  'Why, you little --'" [go to section: End of Chapter]

2CENTS-11 is a quip. The display text is "'All right, then,' quoth Robin, 'I think you owe me two shillings.'" 

	2CENTS-M24 is a transitional quip. The menu text is "'Verily I do not; methinks thou hast miscounted.'". The following quip is  2CENTS-12.
	2CENTS-M25 is a transitional quip. The menu text is "'Very well, here are thy two shillings.  [']Twas a good game, aye?". The following quip is  2CENTS-14.

	The response of 2CENTS-11 is { 2CENTS-M24, 2CENTS-M25}.

2CENTS-12 is a quip. The display text is "'Don[']t lie to me.  You know you owe me two shillings, so cough them up, now!'" 

	2CENTS-M26 is a transitional quip. The menu text is "'Thou art clearly mistaken!  Now let us not argue, but be upon our way.'". The following quip is  2CENTS-13.
	2CENTS-M27 is a transitional quip. The menu text is "'Very well, here are thy two shillings, and let us argue no further.'". The following quip is  2CENTS-14.

	The response of 2CENTS-12 is { 2CENTS-M26, 2CENTS-M27}.

2CENTS-13 is a quip. The display text is "'I am not mistaken!'  The rage is upon Robin as it hath never been before; verily, it frightens thee, and thou takest a step back in fear.  Robin advances upon thee, the light of menace in his eye.  'Are you going to pay me or not?'" 

	2CENTS-M28 is a transitional quip. The menu text is "'Nay!  And I shall have no more of thy money-grubbing!  If thou goest to Nottingham church, thou goest alone!'". The following quip is  2CENTS-03.
	2CENTS-M29 is a transitional quip. The menu text is "'Take then thy two filthy shillings, for thou shalt have none of me!  Fare thee well!'". The following quip is  2CENTS-03.
	2CENTS-M30 is a transitional quip. The menu text is "'Er, um, aye, if it pleaseth thee, here are thy two shillings.'". The following quip is  2CENTS-14.

	The response of 2CENTS-13 is { 2CENTS-M28, 2CENTS-M29, 2CENTS-M30 }.

2CENTS-14 is a quip. The display text is "Aidan is triumphant, but alas he doth realise too late how such victory wouldst change the script. 'Hold it right there, what[']s that supposed to mean?  We[']re supposed to part ways here.  Are you trying to ruin the story?'" 

	2CENTS-M31 is a transitional quip. The menu text is "'So, thou seest that I was in the right!'". The following quip is  2CENTS-10.
	2CENTS-M32 is a transitional quip. The menu text is "'Um.'". The following quip is 2CENTS-10.
	2CENTS-M33 is a transitional quip. The menu text is "'Uh.'". The following quip is 2CENTS-10.
	2CENTS-M34 is a transitional quip. The menu text is "'Oops?'". The following quip is 2CENTS-10.
	2CENTS-M35 is a transitional quip. The menu text is "Try to improvise something.". The following quip is 2CENTS-10.

	The response of 2CENTS-14 is { 2CENTS-M31, 2CENTS-M32, 2CENTS-M33, 2CENTS-M34, 2CENTS-M35 }.


Part 5 - closes

The Protector ends when two cents worth ends.

When the Protector ends:
	now Aidan does not follow the player;
	say "Aidan ([']tis useless now to call him 'Robin', for he hath dropped all pretense of playing the part) doth take a menacing step towards you, forcing you to backpedal in alarm.  You can sense the rush of emotion in and around him, like a hurricane, building in intensity.  He raises a fist to make a point, but you have no idea what he's saying because the force of his emotion has, at that point, suddenly exploded in your face, knocking you flat out on your back.

The next thing you know, you are sitting up outside the simulation room.  Brad, your counselor, is kneeling beside you with a concerned look on his face.  'Whew, almost thought we'd have to ship you over to the hospital again.  You okay?  I'm afraid we can't put you back into the sim as Little John.  We didn't know how long you'd be out, so we let someone else take your place.'

Behind him, you can see Aidan apologizing madly to the other counselors.  Clearly he's been pulled out of the sim too, and been replaced.  But there's something wrong with the picture ... it isn't until later that you realise that this time, unlike the incident with Stacy's robot, he really doesn't care whether or not he did anything wrong....";
	ifndef debug;
	pause the game;
	enddef debug.


Book 7 - Lucian's Bad Day

Part 1 - Drama class

Lucian's Bad Day is a chapter-length scene. Lucian's Bad Day begins when the Protector ends. 
Lucian's Bad Day begins when the chapter number is 7.

When Lucian's Bad Day begins:
	now the chapter number is 7;
	change the current term day to day 9;
	change the time of day to 8:00 AM;
	say "Everything is Absolutely Fine.

At least, that's what you keep telling everybody who asks, especially the ones who stink of Morbid Curiosity.  You're guessing that your little fainting spell, at the Sim Sunday event, was something similar to what happened at dinner with Lucian last week, but at least this time round you didn't wind up in the hospital.  It looks really bad for Aidan, though: some of the people who used to hang out with him are giving him the cold shoulder now, and Stacy is definitely actively avoiding him.

You have no idea what sort of emotion could have knocked you out like that.  And you're kind of leery of checking out Aidan's emotional status these days....";
	ifndef debug;
	pause the game;
	enddef debug;
	say "LEAP, Day 9 (Monday) - Class Period 1

Satirical drama.  The best way to take your mind off your troubles is to laugh at them, and some of the other people doing this class are pretty good.  You've spent half the class period listening to other people reading their stuff, but now it's time to work on your own stuff.  You're looking forward to putting this on stage this Friday, and that's enough to make you forget everything else.";
	now the player carries the readings for Satirical Writing;
	move the player to the auditorium;
	now Ava is in the auditorium;
	now Ava follows the player;
	now Stacy's screwdriver is in Robotics class;
	now Stacy's screwdriver is not scenery;
	now Stacy's screwdriver is not fixed in place.


Ava gets Daniel's help is a scene.  Ava gets Daniel's help begins when Lucian's Bad Day is happening and the time since Lucian's Bad Day began is 5 minutes.

When Ava gets Daniel's help begins: say "The alarm bells go off.  Judging by the reactions of the counselors and instructors, this is not a drill.  You are about to follow everyone out (in a not-so-orderly fashion) when you see Ava fighting her way past the surging crowd.  She sees you and immediately pulls you aside."; say Ava quips A_ALARM.

A_ALARM is quip. The display text is "[line break]'Daniel! Thank goodness I found you.  You know what the alarm is all about?  It's about Aidan!  He's gone crazy ... we were in the middle of our film class when Lucian -- you remember him -- accidentally jostled the camera and ruined Aidan's shot, and then Aidan went berserk!  I swear, he tried to kill Lucian!'".

	A-alarm-1 is a transitional quip. The following quip is A-alarm-1a. The menu text is  "'Don't tell me Lucian's dead?'"
	A-alarm-2 is a transitional quip. The following quip is A-alarm-2a. The menu text is  "'Why are you telling me this?'"
	A-alarm-3 is a transitional quip. The following quip is A-alarm-3a. The menu text is  "'What do you mean, Aidan went berserk?'"
	A-alarm-4 is a transitional quip. The following quip is A-alarm-4a. The menu text is  "'You're joking, right?'"

	The response of A_ALARM is { A-alarm-1, A-alarm-2, A-alarm-3, A-alarm-4 }.

A-alarm-1a is quip. The display text is "'No no, he got away.  Aidan tried to hit him and got his fist stuck in a wall, and Lucian ran off ... now Aidan's running around the school trying to find Lucian, and if we don't find him first Aidan is really going to kill him!  I mean it!'  You've never seen Ava look this distraught. [Ava quips A-alarm-5]"

A-alarm-2a is quip. The display text is "'Because we've got to find Lucian!  He escaped somewhere, but if Aidan finds him first....' She shudders. [Ava quips A-alarm-5]"

A-alarm-3a is quip. The display text is "'He went crazy!  He hit out at Lucian so hard his fist got stuck in a wall, and thank goodness it did, too, because that's all Lucian needed to escape.  But if we don't find Lucian first, Aidan will find him and kill him and I am not making this up!'  Ava looks distraught. [Ava quips A-alarm-5]"

A-alarm-4a is quip. The display text is "'Does that alarm bell sound like a joke?  I'm serious, Daniel, Aidan really does mean to murder that boy and we've got to stop him!'  Ava takes a deep breath before going on. [Ava quips A-alarm-5]"

A-alarm-5 is quip. The display text is "'Lucian's bound to be terrified.  Can't you find him the same way you found him the last time?'

You glance around.  Everyone's already left, and, standing as you were in the shadows of the auditorium, you and Ava were missed in the general exodus.  'All right,' you say, 'we[']d better find Lucian and get him out of here.'

'As long as Lucian doesn't make you go crazy like he did the last time.' [run paragraph on]"  [not sure why Inform's all line break-happy here ]

Check amplifying  for someone when in chapter 6 and the second noun is not enclosed by the location: say "While you do somehow feel that this is within your capabilities, [the second noun] doesn't seem to be close enough to try it." instead.

[Last report an actor singing a little ["to/for/near/by/-- [Lucian]"]: try the actor singing instead.]
Check Ava singing when not in Claremont Library during coaxing Lucian out of the vents: say "'Daniel, this really isn't the time.'" instead.


Part 2 - Tracking down Lucian

Tracking Lucian is a scene. Tracking Lucian begins when A-alarm-5 is fired.

Last check going from the auditorium when A-alarm-5 is unfired during tracking Lucian: say Ava quips A-alarm-5.

FEAR-TRAIL-DETECTED is a trigger.

Check focusing on a room which is not the film studio south when FEAR-TRAIL-DETECTED is unfired during tracking Lucian: say "You sense a confusion of trails, all of them scented with fear.  More than one of them seem strong enough to be Lucian's, assuming he's as terrified as you think he is, though none are precisely alike." instead.

Report focusing on a room during tracking Lucian: say "[if in the Film Studio South][fire FEAR-TRAIL-DETECTED]Here's where it all began.  You can sense the explosion of rage and the responding burst of fear, right in the middle of what seems to be an actual physical explosion.  Both rage and fear race off towards the north end of the room.[otherwise if in Film Studio North]You trace Lucian's terror to the bookshelves, and then into the depths of the open vent.  [one of]You point out the trail to Ava, who looks at the damaged wall around the vent and says, 'I suppose Aidan must have tried to force his own way into the vent after Lucian.  Is Lucian in there still?'  She tries shouting into the vent, but receives no response.  [or][stopping]It's clear that Lucian must have crawled some distance through the vents already.[otherwise if In Northeast Corner of Claremont] Standing on tiptoe and craning your neck towards the ceiling, you can sense Lucian's trail tracing a path through the HVAC system from east to west.[otherwise if In northern Hallway]Standing on tiptoe and craning your neck towards the ceiling, you can sense Lucian's trail tracing a path through the HVAC system from east to north.[otherwise if in Claremont Library]You can sense abject terror pooling about the air vent over the circulation desk, practically dripping onto the papers below.[paragraph break][Ava quips Lucian-found][otherwise]You seem to have lost the trail.  None of the emotions here seem to match Lucian's."; rule succeeds.

Tracking Lucian ends when Lucian-found is fired.

Lucian-found is a quip. The display text is "'There,' you say, pointing to the vent.  'He's in there.'  You sense the terror leaking out of the vent suddenly grow more pungent.

Ava gets up onto the desk and calls into the vent, 'Lucian!  Are you there?  You have to come out.  We'll get you somewhere safe.'

Lucian's response is barely audible.  'No.  Shan't.  Go away.'"


Every turn during tracking Lucian (this is the Aidan turns up the heat rule):
	if the HVAC unit is switched off, do nothing instead;
	if the time since tracking Lucian began is:
	-- 10 minutes: say "Hm, is it just you or is it getting a bit warmer than usual?  Could be the adrenaline talking.";
	-- 20 minutes: say "It's definitely getting a bit warm now.";
	-- 30 minutes: say "It's getting uncomfortably warm.  You can hear the hot air blowing through the various air vents all around.";
	-- 40 minutes: say "It's getting very hot in here, and the hot air coming through the vents now smells slightly burnt.";
	-- 50 minutes: say "Who knew the HVAC systems could get this hot?  You could probably roast something in one of the vents.";
	-- 60 minutes: 
		say "In fact, you can roast something in the vents, as the authorities discover shortly afterwards.  Poor Lucian, too afraid to come out of his hiding place in one of those vents, is cooked alive.  Ava goes into hysterics at the discovery; her emotional outburst sends you reeling and by the time you are steady on your feet again, Aidan has been taken away by armed guards and men with mirror shades and black suits.  You never see your brother again ... in fact, all evidence that he ever existed seems to vanish from the face of the earth."; 
		end the game saying "You lose your friend and your brother".


Part 3 - Coaxing Lucian out of Claremont Library's air vent

Chapter 1 - quick-begin - not for release

Coaxing Lucian out of the Vents begins when puzzle-touch is 7.

When Coaxing Lucian out of the Vents begins:
	now the player is in Claremont Library;
	now Ava is in Claremont Library;
	

Chapter 2 - begin scene

Coaxing Lucian out of the Vents is a scene. Coaxing Lucian out of the Vents begins when tracking lucian ends. 

When coaxing lucian out of the vents begins:
	now Lucian is in the library air vent.

Rule for supplying a missing second noun when amplifying during coaxing Lucian out of the vents: now the second noun is Lucian.

[After deciding the scope of the player during coaxing Lucian out of the vents: place Lucian in scope. [this just evades the parser's whiny "i don't know the word Lucian" error.  AFter this, then the physical sim whines, too, because it's too stupid to realize seeing != hearing.  ]]

Rule for reaching inside an air vent when conversing: allow access. [i.e., can hear]
Rule for reaching inside an air vent when amplifying: allow access. [i.e., can hear]


Chapter 3 - try talking or calming Lucian first

[Check amplifying calm for Lucian during coaxing Lucian out of the vents: say Ava quips CALMING-LUC instead.] CALMING-LUC is a trigger. [The display text is "Easy enough to say, but.... 'Hey Lucian,' you say, 'chill out, okay?'  Ava gives you an incredulous look.  She was always better at this sort of thing than you."]  [an empath wouldn't say that]

[try talking to Lucian]
Instead of conversing when the noun is Lucian during coaxing Lucian out of the vents: say "You get no response, though you can easily tell that he's there; and, by the fluctuating emotions around the vent, that he can hear you."

Persuasion for asking Lucian to try doing anything during coaxing Lucian out of the vents: say "He's really too frightened to do anything but hunker down inside the vent and wait for the world to end." instead.


Chapter 4 -  try asking Ava to talk to, calm, or sing to Lucian, though she won't sing LOM

Last report asking Ava about during coaxing Lucian out of the vents: 
	try inquiring Ava about Lucian instead.
Persuasion for asking Ava to try amplifying calm for Lucian during coaxing Lucian out of the vents: 
	try inquiring Ava about Lucian instead.
Persuasion for asking Ava to try conversing when the noun is Lucian during coaxing Lucian out of the vents: 
	try inquiring Ava about Lucian instead.

Check inquiring Ava about Lucian during coaxing Lucian out of the vents: say "Ava tries her best to talk to Lucian, once even managing to elicit a stifled sob, but to no avail.  She shrugs helplessly." instead.


Persuasion rule for asking Ava to try singing during coaxing Lucian out of the vents: persuasion succeeds.
Persuasion rule for asking Ava to try singing a little during coaxing Lucian out of the vents: persuasion succeeds.

Report Ava singing a little "[lean on me]" when CALMING-LUC is NOT fired during coaxing Lucian out of the vents: try asking Ava about the topic understood; say "'Anyway, aren't you his hero?  Try calming him down, or something.'" instead.

Report Ava singing [anything] when in Claremont Library and CALMING-LUC is fired during coaxing Lucian out of the vents: say "'Daniel, this isn't really the time.'

'Just try it, Ava.'

She sighs.  'Fine.'  Clearing her throat, she sings a random folk song from her collection.  This does not seem to have any effect on Lucian, unfortunately." instead.


Chapter 5 - try your new power out for the first time, discover the need for a "kernel"

Check amplifying curiosity for Lucian when in Claremont Library and LEAN-ON-AVA is not fired during coaxing Lucian out of the vents: say "What curiosity?  There is no curiosity here but my own." instead.

Check amplifying calm for Lucian when in Claremont Library and LEAN-ON-AVA is not fired during coaxing Lucian out of the vents: fire CALMING-LUC; say "[one of]Trying to muffle Lucian's fear is like trying to bail out a sinking ship with a teaspoon.  You can't do it, not without some sense of calm to take the place of the fear.[or]You sense no calm here to magnify.[cycling]" instead.


Chapter 6 - power fails, no kernel  now Ava is more malleable She will sing LOM

Report asking Ava about "[lean on me]" when CALMING-LUC is fired during coaxing Lucian out of the vents: say Ava quips NOT-THAT-SONG instead.  
Report Ava singing a little "[lean on me]" when CALMING-LUC is fired during coaxing Lucian out of the vents: say Ava quips NOT-THAT-SONG instead.  
Report Ava singing when NOT-THAT-SONG is fired during coaxing Lucian out of the vents: say Ava quips NOT-THAT-SONG instead.

NOT-THAT-SONG is a quip. The display text is "[one of]'But I hate that song!' Ava glances back at the vent.  'Okay, you're right, if that's the only way to get him calm enough to listen to reason, I'll do it.[or][stopping][if not in Claremont Library][otherwise if the library air vent is closed][Ava quips GRILL-IN-THE-WAY][otherwise][Ava quips LEAN-ON-AVA][end if]  ". 


Chapter 7 - oh, that vent is screwed shut 

GRILL-IN-THE-WAY is a quip. The display text is "[one of]  But we'd[or]'We'd[stopping] better get that grill out first.  If that song does calm Lucian down enough, we don't want to waste time trying to unscrew it.'"

Check inquiring Ava about the screwdriver when the screwdriver is not enclosed by the location during Lucian's Bad Day: say Ava quips SCREWDRIVER-LOVE instead.
Check inquiring Ava about the library air vent when the screwdriver is not enclosed by the location during Lucian's Bad Day: say Ava quips SCREWDRIVER-LOVE instead.

SCREWDRIVER-LOVE is a quip. The display text is "Ava shakes her head.  'If Stacy were here, she'd have a screwdriver, and--'[paragraph break]'I think she was in one of the classes here!  Maybe she left it there when the alarm went off?'" 


Chapter 8 - Ava and then Daniel does their things

LEAN-ON-AVA is a [beautiful] quip. The display text is "Ava takes her place on the circulation desk and begins singing softly into the vent.  You can sense curiosity blossoming in the middle of all the fear, and then ... there it is, a kernel of calm! [run paragraph on]"

Report amplifying curiosity for Lucian when in Claremont Library and LEAN-ON-AVA is fired during coaxing Lucian out of the vents: say "You grab hold of that sense of curiosity and, you're not sure how, pull it over the fear.  It somehow drags that kernel of calm along.  Curiosity and calm quickly amplify, while fear shrinks before them....  [paragraph break][Ava quips Extracting-Lucian]" instead.

Report amplifying calm for Lucian when in Claremont Library and LEAN-ON-AVA is fired during coaxing Lucian out of the vents: say "You're not sure how you're doing this, but the adrenaline pumping in your veins gives you enough of a boost to grab that tiny kernel of a sense of well-being and magnify it.  At the same time, the fear and the anxiety seems to damp down a bit: a person can only feel so much emotion at a time, after all.  [paragraph break][Ava quips Extracting-Lucian]" instead.


Chapter 9 - end puzzle

Coaxing Lucian out of the vents ends when Extracting-Lucian is fired. 

Extracting-Lucian is a quip. The display text is "Slowly, Lucian's head appears in the open mouth of the ventilation shaft.  The fear spikes for a moment as he looks around, but when he sees no-one but you and Ava, he calms down enough to emerge further.  Finally, he comes out enough for you to grab him and carefully help him down onto the desk and then down to the floor.

Ava stops singing.  'Good.  Now, we'd better get out of here before--'

You don't need to turn around.  The heat of the burning rage behind you is enough to tell you that Aidan has just chosen the worst possible moment to check in on the library.  Ava, turning white as a sheet, tries to shield Lucian, who meanwhile has made a mad scramble for the barrier to the main part of the library.

Aidan burns right past you to get at Lucian, pushing Ava aside as she tries to pull him back.  Lucian manages to duck just in time, and the barrier reverberates from the force of Aidan's fist hitting it."



Part 4 - Lucian attacks Aidan

Saving Lucian From Aidan is a scene. Saving Lucian From Aidan begins when coaxing Lucian out of the vents ends.

When Saving Lucian from Aidan begins: now Aidan is in the location.

Every turn during saving Lucian from Aidan (this is the Aidan attempts murder rule):
	if saving Lucian from Aidan is happening for the first turn, say "Aidan lunges for Lucian, who twists away just in time.  There is a sharp cracking sound from the barrier as Aidan slams into it." instead;
	if saving Lucian from Aidan is happening for the second turn, say "Lucian tries to make a break for the exit, but Aidan, moving faster than you though possible, vaults over the circulation desk and into Lucian's escape path.  Lucian squeaks in terror and scrambles back to the barrier." instead;
	if saving Lucian from Aidan is happening for the third turn, say "Aidan makes a grab for Lucian, and gets a fistful of his shirt.  The fabric rips, and Lucian goes sprawling across the floor." instead;
	if saving Lucian from Aidan is happening for the fourth turn, say "Aidan pounces on Lucian, this time getting his right hand on Lucian's throat.  He lifts Lucian, kicking and coughing into the air." instead;
	if saving Lucian from Aidan is happening for the fifth turn and the player is not in the battlefield: 
		say "There is a sickening crunch as Aidan's hand closes around Lucian's throat, and the smaller boy goes limp.  Behind you, Ava begins screaming.  As for yourself, you are nearly overwhelmed by a wave of black horror, much of it coming from yourself.  You black out....

You are told, when you regain consciousness, that Aidan was 'taken away'; accounts differ as to who exactly did the taking.  Some say it was the police, others say it was the army.  A few people whisper about conspiracies and men in black.  Regardless, you never see your brother again."; 
		end the game saying "You have lost your brother and your friend".


Instead of conversing when the noun is Ava during saving Lucian from Aidan, say "'I don't know, just do something!'  Ava is wide-eyed and almost panicking."

Instead of conversing during saving Lucian from Aidan, say "He seems a little busy right now."

Check focusing on Claremont Library during saving lucian from Aidan: 
	[unless the noun is Lucian or the noun is Ava,] try focusing on Aidan instead. [try so the "for the first time" stuff works]

Check focusing on Lucian during saving lucian from Aidan: say "The pure survival instinct of doomed prey." instead.

Rule for supplying a missing second noun while amplifying during saving Lucian from Aidan: change the second noun to Aidan.

Check amplifying anger for Aidan when in chapters 7 through 8: say "[italic type]Maybe it'll make him black out[roman type], you think desperately.  But as Aidan's rage threatens to bury you alive, it becomes clear that you'd be the one to black out first, and lose control of the situation." instead.

Check amplifying it for when Aidan is the second noun and in chapters 7 through 8: say "There's too much of it!  No matter how much you try, Aidan's rage just keeps pouring from him in never-ending supplies!" instead.


Saving Lucian From Aidan ends when the player is in the battlefield.


Part 5 - A Glimpse into the Mindscape

Every turn when the player is in the Battlefield for three turns: fire BOOM.  BOOM is a trigger. 

Lucian's bad day ends when BOOM is fired.


When Lucian's bad day ends: 
	say "A shadow falls upon you.  Looking up, you see a massive shell headed directly towards you!  You try to run, but, as if in a dream, you feel like you're running through molasses ... there's a sharp crack as something strikes you in the back of your head and you think for a moment that you're dead, but....";
	ifndef debug;
	pause the game;
	enddef debug;
	say "You blink.  You're lying on the floor, staring up at the ceiling of the Fine Arts Library, and it is singularly free of the panic and rage that saturated the air the last time you were here.  Instead, there's a sort of hysterical worrying that you quickly trace to Ava ... who is standing over the unconscious form of your brother Aidan, a large granite paperweight clutched in her hands.

'What happened?' she says, staring at you.  'What did you do?  One moment Aidan's trying to kill Lucian, next minute you're both as still as statues and I knew I had to grab the chance and oh I hit Aidan with a paperweight and you both fell over ... Daniel, what on earth just happened?'

You sit up and rub the back of your head where it still feels as though you'd been hit with a paperweight ... though there's certainly no evidence of anything ever having struck you there at all.  'I'm not sure.  I think ... I think I was actually inside Aidan's head there.  It's....'  You shake your head.  'We should get Aidan and Lucian back to the counselors.'

Something is terribly wrong with Aidan, and that has got to be the understatement of the year."


Book 8 - Night Terrors

Night Terrors is a chapter-length scene. Night Terrors begins when Lucian's Bad Day ends.

When Night Terrors begins:
	say "Aidan is sedated and taken to the hospital 'for further observation'.  It's all very dramatic, but not in a good way.  Dr Rose thanks you and Ava personally for your help, and then things go back to normal.  Sort of.

Aidan didn't come back that day, or the day after.  Nobody knows anything.  Ava tends to babble when you try to talk to her about it, and Stacy seems to prefer to not talk about it at all.  Heaven knows, you're probably in too much shock to make much sense, anyway.  So all you can do is try to force yourself back into the normal routine to take your mind off of things.  Thank goodness for the normal camp routine.  If you didn't have that, you'd need to be under 'further observation' too.";
	ifndef debug;
	pause the game;
	enddef debug;
	now Stacy's screwdriver is carried by Stacy;
	now the chapter number is 8;
	now every room in Jacobs Hall is visited;
	now Aidan's door is locked closed;
	change the current term day to day 10;
	change the time of day to 2:32 AM;
	change the right hand status line to "Late at night";
	say "LEAP, Day 10 (Tuesday) - Late at night

Thump.

Snore.

Thump!

You wake up suddenly to the sound of someone or something hitting your dorm room door.  Jeremy is already up, and has turned on the lights.  He's just about to say something to you when the door smashes open and Aidan, of all people, comes stumbling in.  He's clearly been pumped full of sedatives, but that's not stopping him from glaring around the room like some sort of mad, enraged bull.  Jeremy, terrified, cowers in his bed as Aidan advances on you.

'You ... die....'  His speech is slurred and he's been slowed down significantly by the sedatives.  That doesn't mean you can get away from him just like that, the room's too small for you to get out past him.

A high-pitched beep draws your attention to SARG, whom Stacy must have left hidden in here somewhere.  The little guy activates and flies straight at Aidan, who roars angrily and is momentarily distracted -- just long enough for you to slip out into the hallway!

You can feel Aidan's mad rage burning at your back as he lumbers out behind you.";
	now the player is in your room;
	now Aidan is in your room.



[FIRST TIME VISITING PITS ROOMS WEST]

First carry out going to pits west when in chapter 8 for the first time: say "As you run into this part of the hallway, one of the doors opens a crack.  Lucian pops his head out just long enough to see Aidan roaring up after you, and then he slams the door shut again." [no instead ]

First carry out going from pits west when in chapter 8 for the first time: say "You hear Lucian's door open again, and Lucian himself running off in another direction.  You hope he's gone to get help."; Brad's big moment in 4 turns from now. [no instead -- just narrate]

Check going to an exterior room when in chapter 8: say "A still-fresh image of Aidan shooting down the long, straight corridors of Claremont, still gaining speed as he came to a corner, flashes through your mind when you glimpse the wide open expanse of [if the noun is west]the front lawn[otherwise]Calvin Field[end if] ahead of you, and you instantly know that going outside would be suicide." instead.

Check going up from the first floor rooms east when in chapter 8: say "No, after lights out, the fire doors on the second and third floors are locked so that you can get onto the fire stairs from those floors but not onto those floors from the fire stairs.  You'd be trapping yourself at the top of the stairs if you went that way.  Better go down instead: the pits and the first floor are still accessible because there's supposed to be direct escape routes onto the grounds from those floors." instead.

Check going up from the first floor rooms west when in chapter 8: say "No, after lights out, the fire doors on the second and third floors are locked so that you can get onto the fire stairs from those floors but not onto those floors from the fire stairs.  You'd be trapping yourself at the top of the stairs if you went that way.  Better go down instead: the pits and the first floor are still accessible because there's supposed to be direct escape routes onto the grounds from those floors." instead.

Check going up from the first floor midpoint when in chapter 8: 
	move Aidan to the second floor lobby;
	say "With a running leap, Aidan crashes onto the stairs in front of you, narrowly missing your head en-route." instead.


At the time when Brad's big moment: 
	move Brad to the location;
	move Aidan's key to the location;
	the SWAT team shows up in 20 turns from now;
	say "'Hey!'  It's Brad, your counselor, minus the gum and the baseball cap.  He gets in between you and Aidan, shouting for Aidan to settle down.  Aidan has no intention of doing any such thing, and swings out at Brad instead.  He's slow, though, Brad ducks easily -- but then Aidan opens his hand and sweeps it back, catching Brad right in the chest.  WHAM!  Brad goes flying against the wall and slides unconscious to the floor.  You hear doors opening all up and down the hallway, and closing again, as Aidan turns his attention back to you...." 

Carry out going during Night Terrors: unless Aidan is in the room gone to, move Aidan to the room gone from.

Every turn during Night Terrors:
	if the time since Night Terrors began is less than 3 minutes and Aidan is in your room, make no decision;
	if DO-YOU-REMEMBER is fired, make no decision;
	if not going and Aidan is not in the location:
		say "[one of]Aidan stumbles into the room, and launches himself at you.[or]Still unsteady on his feet, Aidan prowls into the room after you.[purely at random]";
		now Aidan is in the location;
	otherwise if Aidan is in the location [already]:
		if the player is in Aidan's room for less than 3 turns:
			placeholder "Familiar surroundings momentarily confuse him.";
		otherwise:
			say "You hesitate a little too long.  Aidan pounces on you with a triumphant little snarl, and, well, that's pretty much the last thing you ever see.";
			end the game in death;
	otherwise:
		let backward be the best route from the location to the location of Aidan;
		if backward is not a direction:
			say "Aidan is just beyond the door.";
		otherwise if backward is up or backward is down:
			say "Aidan's heavy footsteps come from the stairs.";
		otherwise:
			say "Aidan's heavy footsteps come from the [backward]."


[THE CHASE

Aidan circles around onto you
"Unexpectedly, Aidan lurches into view in front of you.  He must have circled around via the fire stairs or something."

Aidan stops you from going somewhere
"Aidan stumbles into the room, and launches himself at you.  This unfortunately puts him in between you and that exit."
]

DO-YOU-REMEMBER is a quip. The display text is "[placeholder]DO YOU REMEMBER?[end placeholder]"

Instead of doing anything except examining or showing when Aidan's photograph is involved during Night Terrors:
	now the player carries Aidan's photograph;
	if DO-YOU-REMEMBER is unfired, try showing Aidan's photograph to Aidan.

First check showing Aidan's photograph to Aidan during Night Terrors: if DO-YOU-REMEMBER is unfired, say Aidan quips DO-YOU-REMEMBER instead; otherwise do nothing instead.  

Check examining Aidan when in chapter 8 and DO-YOU-REMEMBER is fired: say "Aidan stands here, swaying a little and looking like an enraged bull with a killer headache." instead.

Check focusing on [Aidan] when in chapter 8 and DO-YOU-REMEMBER is fired: say "Aidan's mind is blurred by many warring emotions, none strong enough to win on its own." instead.

Check amplifying calm for Aidan when in chapter 8 and DO-YOU-REMEMBER is fired: try amplifying love for Aidan instead.
Check amplifying love for Aidan when in chapter 8 and DO-YOU-REMEMBER is fired: say "You try your best, but those feelings of anger and aggression seem to be pouring out of Aidan's psyche in never-ending waves.  The best you can do is to keep them from overwhelming that one bright spark of brotherly feeling....";
	ifndef debug;
	pause the game;
	enddef debug;
	say Aidan quips BLOOD-IS-THICKER instead.

BLOOD-IS-THICKER is a quip.  The display text is "But maybe that's all you need.

You hear the sirens a minute later, and then there's a police SWAT team swarming about.  You learn later that if Aidan had so much as taken a step towards you, he'd have been plugged full of lead from three different directions.  As it is, Dr Rose and her crack team of hospital orderlies eventually manage to push their way through the police red tape while you've got Aidan under control; he is given enough sedative to knock out an elephant, and taken back to the hospital.

From what you overhear from the orderlies, it looks like Aidan is building up a tolerance to the drugs that they've been using to keep him under: that's why he managed to escape from the hospital tonight.  It's only a matter of time before those drugs either stop working at all, or kill him without knocking him out."


At the time when the SWAT team shows up: 
	if in chapter 8 and BLOOD-IS-THICKER is not fired:
		say "Sirens!

Someone's gone and called the police, and it sounds like they've sent in a SWAT team.  You are momentarily distracted by the commotion, and that moment's distraction is all Aidan needs to catch up with you.  For a moment, you are lifted off the ground, and then three sniper bullets cut into Aidan in important places.  He collapses right on top of you, and this time it's your own horrified reaction that knocks you out.

It's probably best to not think about what happens afterwards.";
		end the game saying "You lose your brother and your sanity".


Night Terrors ends when BLOOD-IS-THICKER is fired.



Book 9 - The Poisoned Mind

Part 1 - not for release

The Poisoned Mind begins when the chapter number is 9.

Part 2 - begin chapter, chat with doc

The Poisoned Mind is a chapter-length scene. The Poisoned Mind begins when Night Terrors ends. 

Some tea is an edible thing.  "Herbal.  For calming one's nerves." Check smelling tea: try examining the tea instead. Check tasting tea: try examining the tea instead.  Check eating tea: try examining the tea instead. Check drinking tea: say "You sip some tea[one of].  It's an herbal tea, for calming one's nerves[or][stopping]." instead.

When the Poisoned Mind begins:
	now the chapter number is 9;
	say "'Have a sandwich,' says Dr Rose.  'And some tea, perhaps?'

You help yourself to the first thing you've had in almost two weeks that doesn't taste of reverse-engineered sugar substitute.  As you nibble on the sandwich, Dr Rose pours out a cup of tea for herself and for you.  'I spoke with Ava,' she says, looking serious, 'and she tells me that you said something about having entered your brother's mind at one point.  Now, that is an aspect of your power that I had not anticipated, and I must say I find it quite fascinating.  It might, I suspect it might be of great use to Aidan right now.  Poor boy, I'm afraid there's no other way of dealing with the side effects of his emerging powers, as there was with you.  You're his last hope, Daniel.'";
	change the current term day to day 12;
	change the time of day to 4:39 PM;
	change the right hand status line to "[time of day]";
	say "University Hospital, Day 12 (Thursday) - Late afternoon

You're back in the same hospital room you woke up in last week, after you blacked out in the dining hall.  This time it's Aidan who's in the coffin-thing, pumped full of sedatives and tied down with so many heavy-duty cables that he looks like a mummy.  A small table and a couple of comfy chairs have been set up; Dr Rose is sitting in one chair, sipping at her tea.";
	move the player to your hospital room;
	[now everything carried by the player is off-stage;]
	repeat with X running through things carried by the player:
		remove X from play;
	now Aidan is in the coffin case;
	now the coffin case is transparent closed locked;
	now Doctor Rose is identified proper-named;
	now Doctor Rose is in your hospital room;
	now the player carries tea;
	[start conversation with Doctor Claudia Rose on C9.01;]

Rule for initiating conversation with Claudia Rose: change the chosen opening gambit to C9.01.

C9.01 is a quip. The display text is "'You will give it a try, won't you, Daniel?'"

	C9.01m1 is a transitional quip. The following quip is C9.01-1. The menu text is "'What?'"
	C9.01m2 is a transitional quip. The following quip is C9.01-7. The menu text is "'Of course I will.  Just tell me what to do.'"

	The response of C9.01 is { C9.01m1, C9.01m2 }.

C9.01-1 is a quip. The display text is "'Taking a little trip inside Aidan's mindscape, of course.  The only way to cure him is to find the thing in his subconscious that is generating his rage, and to remove it.  And since we can't exactly make him sit through several sessions of psycho-analysis, the only way to deal with the problem is for you to enter the mindscape created by his subconscious, find the problem, and physically remove it yourself.'"

	C9.01m3 is a transitional quip. The following quip is C9.01-2. The menu text is "'But the last time I went in there, there were bombs!  Everywhere!  I almost got hit by one!'"
	C9.01m4 is a transitional quip. The following quip is C9.01-8. The menu text is "'Okay, if that's what I have to do, that's what I'll do.'"
	C9.01m5 is a transitional quip. The following quip is C9.01-3. The menu text is "'You must be crazy.  I'm not doing this.'"

	The response of C9.01-1 is { C9.01m3, C9.01m4, C9.01m5 }.

C9.01-2 is a quip. The display text is "'I think the bomb did hit you, Daniel, but that's a good thing.  It means that if you should [']die['] in Aidan's mindscape, you will in fact simply be ejected back into the real world again.  So you see, it will be perfectly safe.  In any case, with the calming influence of all the sedatives we've given him, I think you'll find his mindscape quite a lot calmer than before.'"

	C9.01m6 is a transitional quip. The following quip is C9.01-3. The menu text is "'No way, it's still too dangerous.'"
	C9.01m7 is a transitional quip. The following quip is C9.01-8. The menu text is "'Well, I suppose it's the only way.  Sure, I'll do it.'"

	The response of C9.01-2 is { C9.01m6, C9.01m7 }.


C9.01-3 is a quip. The display text is "'But, Daniel, what about Aidan?  Surely you don't want to see him spend the rest of his life like this.  And who knows what will happen if he builds up enough tolerance to resist the sedatives again?'"

	C9.01m8 is a transitional quip. The following quip is C9.01-4. The menu text is "'No no, I'm still not doing this.  Find someone else.'"
	C9.01m9 is a transitional quip. The following quip is C9.01-8. The menu text is "'All right then.  I'll do it.'"
	C9.01m10 is a transitional quip. The following quip is C9.01-7. The menu text is "'All right then.  Tell me again what I'm supposed to do?'"

	The response of C9.01-3 is { C9.01m8, C9.01m9, C9.01m10 }.


C9.01-4 is a quip. The display text is "'There is no-one else.  You're our last hope.'"

	C9.01m11 is a transitional quip. The following quip is C9.01-5. The menu text is "'I'm not doing this and you can't make me.'"
	C9.01m12 is a transitional quip. The following quip is C9.01-8. The menu text is "'All right then.  I'll do it.'"
	C9.01m13 is a transitional quip. The following quip is C9.01-7. The menu text is "'All right then.  Tell me again what I'm supposed to do?'"

	The response of C9.01-4 is { C9.01m11, C9.01m12, C9.01m13 }.


C9.01-5 is a quip. The display text is "Dr Rose looks at you sadly.  'Really, Daniel, I'm quite disappointed in you.  Your own brother.  Still, if that is your choice, I suppose there is nothing I can do to change your mind.'"

	C9.01m14 is a transitional quip. The following quip is C9.01-6. The menu text is "'Right, I'm out of here.'"
	C9.01m15 is a transitional quip. The following quip is C9.01-8. The menu text is "'Um.  I suppose since you put it that way....'"

	The response of C9.01-5 is { C9.01m14, C9.01m15 }.


[YOU TURN YOUR BACK ON EVERYTHING, YOU UNFEELING MONSTER]
C9.01-6 is a quip. The display text is "Dr Rose doesn't try to stop you as you hurry out the door of the hospital room and down to the lobby.

You never see Aidan again.  Rumor has it that he was shipped off to some very hush-hush government department.  When your parents start asking questions, they disappear as well.  The next few years are a blur of foster homes.  Dr Rose tries to do what she can for you, but it isn't long before you disappear as well....".  After firing C9.01-6, end the game saying "You were never seen again".


C9.01-7 is a quip. The display text is "'You need to take a little  trip inside Aidan's mindscape, find the source of his rage, and remove it.  He's under a lot of heavy sedation, so you might find the experience a little surreal.  But at least it won't be as dangerous as it was the last time this happened, I think.'"

C9.01-8 is a quip. The display text is "Dr Rose smiles.  'I knew I could count on you, Daniel.  Now, good luck.  Whenever you're ready, just go ahead.'"

Check going from your hospital room when in chapter 9:
	if C9.01-7 is fired or C9.01-8 is fired, say "You can't leave now.  You've got to save Aidan from ... whatever it is he needs to be saved from!" instead;
	if C9.01-5 is fired, say Doctor Rose quips C9.01-6 instead;
	if C9.01-3 is fired or C9.01-4 is fired, say Doctor Rose quips C9.01-5 instead;
	say Doctor Rose quips C9.01-3 instead.


Check amplifying it for when Aidan is the second noun and in chapter 9: say "Though you feel your effort has some effect, it's akin to stirring a turbulent sea:  no trace of your effort remains once you've stopped." instead.

First check focusing on your hospital room when in chapter 9: change the noun to Aidan. 
[Rule for supplying a missing noun when focusing on and in chapter 9: change the noun to Aidan.]
Rule for supplying a missing second noun when amplifying and in chapter 9: change the second noun to Aidan.


Chapter 3 - when all else fails, die, die again

To say false death: false death.
To false death: 
	say "[paragraph break][line break][bold type]*** You have died ***[roman type]";
	if the player is enclosed by Beneath the surface or the player is enclosed by the lake bottom, now everything had by the player is in the lake shore;
	otherwise now everything had by the player is in the location;
	ifndef debug;
	pause the game;
	enddef debug;
	say "[paragraph break][line break]Or have you?  The light at the end of the tunnel soon revolves into the ceiling light of the hospital room, and you see Dr Rose looking down at you, her face full of concern.  'Oh dear,' she says, 'I suppose something went a little wrong in there?  Well, whenever you're ready, I hope you'll give it another try.'";
	now the player is in your hospital room.


Every turn when in chapter 9 and not in your hospital room:
	consider the random thief rule;
	if in the deepest place and [the real] Aidan is in the deepest place, say "[one of]The thief is too busy fighting Aidan to attempt to attack you.[or]The thief lashes out at Aidan with his knife and a bucket-load of inhuman speed.  Aidan somehow manages to deflect the attack, but only just.[or]The thief lunges at Aidan, who dives for the ground and kicks out at the thief.  The kick manages to catch the thief in the shoulder, sending him spinning off to one side.  Unfortunately, this does not seem to slow the thief down in the slightest.[or]Aidan engages the thief in a blur of flying fists and feet, and for a moment the two of them are moving so quickly you're not sure where one of them ends and the other begins.  And when they finally disengage, you can't tell if either of them has managed to land a blow on the other.[or][Aidan needs an edge][cycling]" instead;
	if the player wears all rings for 5 turns:
		say "The heat is unbearable now.  And it's getting worse!  You burst into flames, which is not very pleasant, to say the least."; 
		false death; 
	if in darkness for 3 turns:
		say "You are aware of heavy breathing behind you just as slavering fangs descend upon you, and you are eaten by a grue.";
		false death;
	if old-Aidan wears all rings for 2 turns:
		say "The heat around Aidan intensifies until it explodes with such force that you are violently thrown off your feet.  You slam painfully into a solid rock wall and lose consciousness...."; 
		now every ring is in the land of the dead; 
		false death;


[

Eaten by the shark (waited around too long)
"The shark swims straight for your sword-hand, mouth wide open.  Before you can think of doing anything, its teeth descend upon you, and you quickly become another Jaws casualty."

Eaten by the shark (tried to hit the shark with your fist)
"[see relevant action under The Shark in NPCs01]"
]


Chapter 4 - random encounters with the thief

The thief is a man in the thief's den. "[if in the thief's den]Surprised, the thief twists to his feet, pulling a knife.[otherwise][placeholder]the thief[end placeholder]." The description of the thief is "[placeholder]thief[end placeholder] ".  Understand "theif" as the thief.

Turns until the thief appears is a number that varies. Turns until the thief appears is 40.
The previous action is a stored action that varies. 

This is the random thief rule: [called from every turn, but not put directly in there for performance ]
	now the previous action is the current action;
	if GOAL_DEFEAT_THIEF is achieved, do nothing instead;
	if the thief is in the location, now the thief is in the thief's den; 
[	say "NOW IN THE DEN, FOR [turns until the thief appears] MORE TURNS.";]
	decrease the turns until the thief appears by 1;
	unless the turns until the thief appears is 0, do nothing instead;
	add GOAL_DEFEAT_THIEF to the current goals, if absent;
	let the item stolen be a random thing had by the player[ that is not the brass lantern];
	if the item stolen is the brass lantern, now the item stolen is nothing;
	if the item stolen is nothing, say "[one of]A lean and hungry-looking gentleman wearing a domino mask sidles up nearby.  He smirks a bit as he observes you from the shadows.[present the thief][or]Without warning, the thief darts forward and expertly rummages through all your pockets without you feeling a thing.  Disappointed at not finding anything worth taking, he kicks you in the shins and dashes away again.[or]A lean and hungry-looking gentleman wearing a domino mask darts out of the shadows, runs a circle around you, and disappears back into the shadows.  All your pockets have been turned inside-out: it looks like you've been the victim of a run-by pick-pocketing.  Fortunately, nothing has been taken.[purely at random]" instead;
	say "[one of]Without warning, the thief darts forward and expertly extracts [the item stolen] from your inventory!  If you hadn't seen him do it, you would never have noticed it happening![present the thief][or]A lean and hungry-looking gentleman wearing a domino mask darts out of the shadows, blows a raspberry at you, and disappears back into the shadows again.  It's a moment before you notice that your [item stolen] has also disappeared.[purely at random]";
	move the item stolen to the thief's den;
	now the turns until the thief appears is 40 plus a random number from 1 to 20.
	
To say present the thief: move the thief to the location.


Chapter 5 - the final battle

Check attacking the thief in the thief's den for the third turn: now the turns until the thief appears is 3000; say "[italic type]CRACK![roman type][paragraph break]The thief tries to get up, but this time your awesome in-this-world-only kung fu skills prove too much for him, and he collapses, unconscious." instead.

Check attacking the thief in the thief's den for the second turn: now prepare the final blow is true; say "[italic type]THUD.[roman type][paragraph break]The thief scrambles to his feet again, and adopts a defensive position." instead. Prepare the final blow is a truth state that varies. 
	
Check attacking the thief in the thief's den: say "[one of]Oh, hey, you know kung fu.  Since when did you know kung fu?  Clearly Aidan must think you ought to know kung fu, because here you do.  You show the thief.[paragraph break][italic type]WHAM![roman type][paragraph break][or][stopping]The thief rolls to one side as he lands, and is quickly on his feet again.  He shakes his head, as if to clear it, and aims a deadly jab at your throat.  You manage to dodge the worst of it, but it still clips you quite painfully on the shoulder." instead.


Instead of doing something other than attacking when in chapter 9 and in the thief's den and the thief is in the location:
	if the turns until the thief appears > 100: [and is still in the location]
		say "Black smoke begins to emit from the fallen thief, only slightly at first, then billowing out in greater and greater amounts.  Again you hear the distant sound of cawing birds, but this time, the sound draws closer, as if they come for you.  As the cold smoke fills the room, it begins to circle and swirl, until resolving itself into a mass of inky-black birds, cawing, echoing, shrieking within the small space.  You duck down, cover your head and your ears, await some sort of onslaught, but, it does not come.  The black flock thins on its own, not so much flying down the only exit, as disappearing through the rock itself.";
		remove the thief from play;
	otherwise if prepare the final blow is true:
		say "When you refrain from following up on your last attack, the thief takes the opportunity to aim a quick jab at your chest before darting away again." instead;
	otherwise:
		say "[one of]The thief bounds around to one side and lashes out at you.  You deflect his blow just in time.[or]The thief aims a spinning kick at your head.  His boot bounces off the side of your head and sends you spinning.[or]The thief punches you in the stomach and quickly leaps away.[or]The thief hangs back, watching you cautiously.[or][if in deepest place]Suddenly, the thief draws up close to you, smiling.  It takes you a moment to realise that the thief's knife is buried up to the hilt in your stomach, and then the world seems to turn blood-red as you slump to the floor....[false death][otherwise]The thief's final blow turns out to be too much for you.[false death][end if][cycling]" instead.

[Alternate with the random attack messages from before, until player either dies or hits the thief a third time.]

Instead of doing something other than attacking when in chapter 9 and in the deepest place and the thief is in the location and Aidan is not in the location: say "[one of]The thief tosses his knife from hand to hand, and just when you think he's about to attack you from the right, he slashes at you from the left and draws a long line of blood down your side.[or]The thief strikes out at you like a cobra, and bounces back away from you.  It takes you a moment to realize that he's managed to draw blood.[or]The thief lunges at you with his knife, and if it weren't for the fact that this is all happening inside Aidan's head, you'd be scarred for life.[or]The thief slashes at you with his knife.  You only just manage to dodge out of the way.[at random][paragraph break][Aidan shows up to fight the thief with you]".

Check attacking the thief when in the deepest place and Aidan is not in the location: say Aidan shows up to fight the thief with you instead.

To say Aidan needs an edge: say "[one of]Aidan catches your eye.  'We're too evenly matched,' he says, in between deflecting the thief's knife and trying to land a punch, 'I could really use an edge here....'[or]'Daniel!' Aidan shouts, holding out his hand.  The thief attacks him right then, interrupting him, and now he's too busy with the thief to finish whatever it was he was trying to tell you.[stopping]"

To say Aidan shows up to fight the thief with you: say "Out of nowhere, someone leaps in between you and the thief!  It's Aidan, and more to the point, it's the Aidan that you remember, the one who helps you handle bullies and carries you to the hospital when you freak out in the dining hall!  He barely has time to give you a 'hi Daniel' before he and the thief are locked in mortal combat with each other...."; move Aidan to the location.

Check attacking Aidan when the player has the sword: say "Aidan certainly isn't expecting that, but he's quick enough to dodge your attack.  You've distracted him just enough, however.[Go straight to section You Fail To Give Aidan The Sword]" instead.


To say go straight to section YOU FAIL TO GIVE AIDAN THE SWORD: 
	say "With a sudden lunge, the Thief slips through Aidan's defenses and buries his knife in Aidan's stomach.  Aidan has time to give you one horrified look before his eyes roll up and he collapses.  The mindscape wavers for a moment, then shatters, and that is the last thing you know.

No really, it's the last thing you know.  Both you and Aidan spend the next twenty-odd years in a coma, knowing nothing of what's going on around you.  It's a terrible fate, and if you were conscious enough to formulate a thought, you would probably wonder what you could have done differently in that last fight that would have averted this.";
	end the game saying "You lose your brother and your mind."


First check giving the sword to Aidan: now Aidan has the sword; say  "You put the sword on the ground and slide it over to Aidan, who kicks it up into his hands and swings it up to block the Thief's knife.  He's much faster than you are, given the super-speed and super-strength, and you can hear the sword whistling through the air as it whirls, a blue blur around the Thief.  In less than a minute, the Thief's knife goes flying off into the darkness, and the Thief himself is cut down.

There's no blood.

Aidan stands over the Thief, leaning on the sword and panting.  He flashes you a familiar smile.  'Thanks, Daniel.  He almost had me there.  If you hadn't passed me the sword....'  He shakes his head.  'Now, let's see who this fellow is behind his mask.'  Leaning down, he pulls off the Thief's mask, revealing the face of ... Dr Claudia Rose.

The scene wavers and dissolves all around you.  Aidan is saying something, but you can't hear him.  And in a moment, you are back in the hospital room, looking at the real Dr Rose, who is smiling quite happily.  'You did it, Daniel!  I knew you could do it!  Look, your brother's looking more peaceful already.'

It's true.  Aidan's still unconscious, but he looks a great deal more relaxed, with the same expression of peace that you saw when you put the ring on him back there in the Land of the Dead.  Whatever was going wrong in his head, it's over now."; now everything carried by the player is in the location; now everything worn by the player is in the location; rule succeeds.

The Poisoned Mind ends when Aidan has the sword.



Book 10 - Breakfast of Champions

Breakfast of Champions is a chapter-length scene. Breakfast of Champions begins when the Poisoned Mind ends. [The entire game ends when Breakfast of Champions ends.]

section 2 - scene begin

When Breakfast of Champions begins:
	now the chapter number is 10;
	say "'For he's a jolly good fellow, for he's a jolly good fellow, for he's....'

You wake up to face the last day of LEAP.  Oh, a big parade, like the one in your dream, would have been nice.  But it looks as if you've been totally out of it since saving Aidan from himself; in fact, Dr Rose's congratulations really were pretty much the last thing you remember before waking up just now, three hours before breakfast, with Dr Rose hovering nearby.  She doesn't appear to have slept all night.

After two hours of various tests and stuff, you and Aidan are both shipped back to camp, and then it's off to breakfast while ignoring all the whispers and the odd looks.  You find a seat in a far corner of the dining hall, while Aidan falls in with some friends who don't think he's going to rip their heads off if they look at him funny.  Almost immediately, Ava and Stacy sit down on either side of you, and Lucian sits himself across the table from you.  At least some people don't think you're an all-out freak....";
	ifndef debug;
	pause the game;
	enddef debug;
	change the current term day to day 13;
	change the time of day to 7:32 AM;
	change the right hand status line to "[time of day]";	
	say "LEAP, Day 13 (Friday) - Breakfast

You are sitting with Ava and Stacy and Lucian; otherwise, there's no-one else at the table.  Somewhere else in the dining hall, Aidan is sitting with a small handful of friends who still think he's okay, murderous psycho rages or not.  A lot of the people have finished breakfast and moved on, but you've been busy telling your friends about your adventures through Aidan's mindscape.";
	now Stacy is in the dining hall;
	now Ava is in the dining hall;
	now Aidan is in the dining hall;
	now Lucian is in the dining hall;
	now the player is in the dining hall;
	change the object-based conversation table of Stacy to the table of Stacy's final replies;
	change the object-based conversation table of Ava to the table of Ava's final replies;
	change the object-based conversation table of Lucian to the table of Lucian's final replies;


Instead of standing on, facing, entering, exiting, or going when in chapter 10, say "You'll lose your seat if you do."


section 1 - conversation tables and rules

Table of Stacy's final replies
conversation 	reply	
an object [default]	"She's eating so doesn't reply."	
Aidan			"[Stacy quips C10.2]"

Table of Ava's final replies
conversation 	reply	
an object [default]	"She's eating so doesn't reply."	
the thief		"[Ava quips C10.1]"

Table of Lucian's final replies
conversation 	reply	
an object [default]	"He's eating so doesn't reply."	

Report asking Stacy about "[powers]" when in chapter 10: say Stacy quips C10.4 instead.
Report asking Lucian about "[powers]" when in chapter 10: say Lucian quips C10.3 instead.
Report asking Lucian about "[food]" when in chapter 10: say Lucian quips C10.5 instead.

Check talking to Ava when in chapter 10 and C10.1 is not fired: say Ava quips C10.1 instead.
Check talking to Stacy when in chapter 10 and C10.2 is not fired: say Stacy quips C10.2 instead.
Check talking to Lucian when in chapter 10 and C10.3 is not fired: say Lucian quips C10.3 instead.
Check talking to Stacy when in chapter 10 and C10.4 is not fired: say Stacy quips C10.4 instead.
Check talking to Lucian when in chapter 10 and C10.5 is not fired: say Lucian quips C10.5 instead.


section 3 - CONVERSATION C10.1 (Dr Rose)

C10.1 is a quip. The display text is "'One thing I don't understand,' Ava muses, 'is why the last Thief turned out to be Dr Rose.  I mean, what's the connection?'"

	C10.1m01 is a transitional quip. The menu text is "'Um, she's the doctor who's been keeping him sedated all the time?'" The following quip is C10.1-01.
	C10.1m02 is a transitional quip. The menu text is "'Um, she's the big authority figure here now that Damon Rose is gone?'" The following quip is C10.1-02.
	C10.1m03 is a transitional quip. The menu text is "'Why does there have to be a connection?'" The following quip is C10.1-03.
	C10.1m04 is a transitional quip. The menu text is "'Maybe she's secretly an evil supervillain who's been behind everything this year.'" The following quip is C10.1-04.

	The response of C10.1 is { C10.1m01, C10.1m02, C10.1m03, C10.1m04 }.

C10.1-01 is a quip. The display text is "Ava looks doubtful.  'Maybe.  But, I don't know, that seems like a really recent thing, you know?  You've been his brother all your life, and of course he's known himself all his life too -- oh, you know what I mean! -- but this thing with Dr Rose is, like, just a couple of days ago.'

'You worry too much,' says Stacy."

C10.1-02 is a quip. The display text is "'That could be it, I suppose.  Maybe Aidan really misses Damon Rose and secretly resents Dr Rose for taking over.'

'That sounds pretty plausible.'

Ava nods slowly, but doesn't seem entirely convinced."

C10.1-03 is a quip. The display text is "'There's always a connection.  Our brains aren't quite that random.  Isn't that right, Stacy?'

'I think people are pretty random.  Maybe Aidan just fixed on the last person he saw before he went under sedation again.'

'That really doesn't sound right,' mutters Ava.  Stacy rolls her eyes."

C10.1-04 is a quip. The display text is "Lucian gives a loud bark of laughter.  'Yeah right.  I mean, look at her, she's like somebody's favorite aunt.'

Ava gives you a look of exasperation.  'Really, Daniel, if you can't take this seriously....'

'You're the only one who thinks it means anything, Ava,' says Stacy."


section 4 - CONVERSATION C10.2 (Aidan)

C10.2 is a quip. The display text is "'I'm surprised to see Aidan here,' says Stacy, glancing over to where your brother is sitting.  'I should have thought they'd have kept him in the hospital until your folks came to get you.  Or maybe even shipping him straight home right away.'"

	C10.2m01 is a transitional quip. The menu text is "'Mom and Dad have been kind of tied up overseas.  I don't know how much they've been told about what's up with Aidan, anyway.  I guess they'll find out when they get here tomorrow.'" The following quip is C10.2-01.
	C10.2m02 is a transitional quip. The menu text is "'You're not still mad at him about SARG, are you?'" The following quip is C10.2-02.
	C10.2m03 is a transitional quip. The menu text is "'I don't know.  I guess it's Dr Rose's decision, and she knows what she's doing.'" The following quip is C10.2-03.

	The response of C10.2 is { C10.2m01, C10.2m02, C10.2m03 }.

C10.2-01 is a quip. The display text is "'Oh, that's tough.'  Stacy chews slowly on some bacon, and resists the temptation to spit it out.  'I hadn't thought of that ... it's going to be weird living with Aidan now, isn't it?  After everything that's happened?'"

	C10.2m04 is a transitional quip. The menu text is "'Yeah, a little.  But, he's still my brother.'" The following quip is C10.2-04.
	C10.2m05 is a transitional quip. The menu text is "'Nah, he's my brother!  How can it be weird?'" The following quip is C10.2-05.

	The response of C10.2-01 is { C10.2m04, C10.2m05 }.

C10.2-02 is a quip. The display text is "Stacy relents a little.  'He did stop me just a few minutes ago to apologize,' she admits.  She shrugs.  'He says he doesn't feel angry all the time anymore.  Is this true?'

You nod.  'The super-strength seems to be gone, too, so he's exactly back to the same old Aidan.'

Stacy reaches around you to poke Ava, who squeaks and bats Stacy's hand away.[C10.2 ends tree]"

C10.2-03 is a quip. The display text is "You add that Aidan's back to normal now, anyway: no more mad rages, but then no more super-strength either.  So it must be all right.  Right?  Everyone nods sagely: Dr Rose is the expert, after all.  [C10.2 ends tree][if C10.1 is not fired][Stacy quips C10.1]"

C10.2-04 is a quip. The display text is "Ava looks pleased, but Stacy looks skeptical.  'Aren't you worried he might try to kill you again?'"

	C10.2m06 is a transitional quip. The menu text is "'No, he's back to normal.  No super-rage, no super-strength.  Nothing to worry about.'" The following quip is C10.2-06.
	C10.2m07 is a transitional quip. The menu text is "'Oh, I think I can handle him if he tries anything.'" The following quip is C10.2-07.

	The response of C10.2-04 is { C10.2m06, C10.2m07 }.

C10.2-05 is a quip. The display text is "Ava and Stacy exchange glances, then look back at you and say, 'yeah, it's going to be weird.'"

	C10.2m08 is a transitional quip. The menu text is "'No no, he's totally back to the way he was before.  The rage is gone: I guess I must have killed it.  And the super-strength is gone, too.'" The following quip is C10.2-06.

	The response of C10.2-05 is { C10.2m08 }.

C10.2-06 is a quip. The display text is "'Seriously?' says Lucian, 'that's ... kind of sad, really.  I mean, super-strength is one of the more awesome abilities out there, you know?'

'Lucian, he tried to kill you once.  Do you seriously want him to turn back into that monster?'

Lucian shrugs, and Ava whispers to you: 'Lucian seems to have gotten a lot braver ever since that night when Aidan tried to kill you and he had to go wake up the counselors.'  Huh, maybe the kid will be all right after all.[C10.2 ends tree]"

C10.2-07 is a quip. The display text is "'Ooh!'  Lucian is all starry-eyed admiration, but the girls know better.  'He's back to normal, isn't he?' asks Stacy.

'Yeah,' you admit, 'he's not mad all the time anymore, but then he's not super-strong anymore either.  So yeah, I can handle him the same way I used to handle him before this whole business started.'

Stacy nods.  Apparently Aidan mentioned something about this earlier, when he stopped her to apologize for what he did to SARG.[C10.2 ends tree]"


section 5 - CONVERSATION C10.3 (Powers 1)

C10.3 is a quip. The display text is "'So Daniel,' says Lucian, 'how awesome was it to go adventuring inside someone's brain?  Think you could do that in mine?'"

	C10.3m01 is a transitional quip. The menu text is "'I don't think so.  Dr Rose thinks those funny emo powers kind of got blown away the last time I got blown out of Aidan's head.'" The following quip is C10.3-01.
	C10.3m02 is a transitional quip. The menu text is "'Yeah, sure.  Maybe.'" The following quip is C10.3-02.

	The response of C10.3 is { C10.3m01, C10.3m02 }.

C10.3-01 is a quip. The display text is "'Aw man, you mean they're gone?  For good?  No way!'

You shrug.  'They were getting kind of annoying anyway,' you say, but Lucian still looks heartbroken at the news.[C10.3 ends tree]"

C10.3-02 is a quip. The display text is "'Awesome!'

But Ava suddenly says, 'Oh!  That's what's different about you today: you've lost that funny sort-of-glazed look you've had all week!  So ... you've gotten totally used to being able to sense everybody's emotions now?'"

	C10.3m03 is a transitional quip. The menu text is "'Um, well actually, no.  The powers are gone.'" The following quip is C10.3-03.
	C10.3m04 is a transitional quip. The menu text is "'Of course.  I had to get used to them sooner or later.'" The following quip is C10.3-04.

	The response of C10.3-02 is { C10.3m03, C10.3m04 }.

C10.3-03 is a quip. The display text is "You explain that it looks like you pretty much used up all of your powers during your adventures in Aidan's head.  Dr Rose seemed a little disappointed about it, but you're kind of glad, actually: that emo-sensory power wasn't exactly very comfortable to live with.

Lucian and Stacy both look a little disappointed as well, but Ava says, 'well, as long as you're happy about it.'  It's a bit of a relief not being able to tell if she's just pretending to be happy for you.[C10.3 ends tree]"

C10.3-04 is a quip. The display text is "Stacy looks at you closely.  'Really?  What am I feeling right now?'"

	C10.3m05 is a transitional quip. The menu text is "'Curious.'". The following quip is C10.3-05.
	C10.3m05b is a transitional quip. The menu text is "'Suspicious.'".  The following quip is C10.3-05.
	C10.3m06 is a transitional quip. The menu text is "'Happy.'". The following quip is C10.3-06.
	C10.3m06b is a transitional quip. The menu text is "'Sad.'". The following quip is C10.3-06.
	C10.3m06c is a transitional quip. The menu text is "'Angry.'". The following quip is C10.3-06.
	C10.3m06d is a transitional quip. The menu text is "'Worried.'". The following quip is C10.3-06.
	C10.3m07 is a transitional quip. The menu text is "'Totally in love with Hank Thomson.'". The following quip is C10.3-07.

	The response of C10.3-04 is { C10.3m05, C10.3m05b, C10.3m06, C10.3m06b, C10.3m06c, C10.3m06d, C10.3m07 }. 

C10.3-05 is a quip. The display text is "'Anybody could see that,' remarks Ava drily.  The girls don't seem much interested in pursuing the matter.  You catch Lucian's eye, but, rather surprisingly, he drops his gaze and turns his attention back to his food.  You have no idea what he thinks of all this, which is kind of a relief.[C10.3 ends tree]"

C10.3-06 is a quip. The display text is "'Pfft, I am not!' Stacy looks triumphant, then realizes what it means and frowns.  'So they're gone, then.'

Reluctantly, you nod.  'Dr Rose thinks they died in that last confrontation with the Thief in Aidan's head.  I guess it was too good to last, but at least things will go back to normal now.'

'Sorry to hear that.'[C10.3 ends tree]"

C10.3-07 is a quip. The display text is "Stacy gasps and flings a bit of hash brown at you.  You dodge just in time, and it hits Ava instead.  Before this can turn into an all-out food fight, Lucian says to you, 'so do you still have superpowers or not?'

Reluctantly, you admit that your powers are gone.  'Dr Rose thinks they died in that last confrontation with the Thief in Aidan's head.  I guess it was too good to last, but at least things will go back to normal now.'

'Gee, that's too bad.'[C10.3 ends tree]"


section 6 - CONVERSATION 10.4 (Powers 2)

C10.4 is a quip. The display text is "'Oh, here's a thought,' says Stacy suddenly, 'Daniel, could it be something at LEAP that set off your powers?'"

	C10.4m01 is a transitional quip. The menu text is "'Eh?  What do you mean?'" The following quip is C10.4-01.
	C10.4m02 is a transitional quip. The menu text is "'I'm pretty sure of it, actually.'" The following quip is C10.4-02.
	C10.4m03 is a transitional quip. The menu text is "'I don't think so.  Aidan's been coming here for years, and nothing's happened until now.'" The following quip is C10.4-03.

	The response of C10.4 is { C10.4m01, C10.4m02, C10.4m03 }.

C10.4-01 is a quip. The display text is "'I mean, it's kind of funny that both you and Aidan should suddenly develop these mutant powers at the same time.  I thought that maybe it's because you're brothers and there's some sort of genetic thing going on with you two, but then why right at the same time?  It doesn't really make sense.'

'Stacy, you think too much.'"

C10.4-02 is a quip. The display text is "'Well, both Aidan and I suddenly picked up these powers while we were here, so I figured it must be something around here that's doing it.  Maybe they're doing some sort of super-secret gamma-ray experiment in one of the nearby buildings.'

'And only you and Aidan were affected.  I suppose if only the two of you had some sort of genetic thing that made you especially likely to react....'  Stacy nods slowly, but still doesn't seem entirely satisfied."

C10.4-03 is a quip. The display text is "'Maybe he's just slower to react to it than you are.'  Stacy doesn't look satisfied.  'Or maybe there's something different about this year.'

'There are lots of things different about this year.  Do you think someone is causing this on purpose?'

'Maybe, but then, why pick on the two of you?  I mean, it would be less suspicious if it were two unrelated people, and if the two of you really were somehow genetically special, then it would be better to get you somewhere else.  Something here doesn't make sense.'

'Stacy, you think too much.'"


section 7 CONVERSATION C10.5 (Food)

C10.5 is a quip. The display text is "Lucian, who's been struggling with a few rashers of bacon, finally swallows the last of it and says, 'one thing I still don't like about this place is the food.  I mean, is it always so ... sweet?  And not even like they put sugar, more like they used some sort of fake sugar instead.'"

	C10.5m01 is a transitional quip. The menu text is "'It's always been pretty awful, I thought.'" The following quip is C10.5-01.
	C10.5m02 is a transitional quip. The menu text is "'Yeah, but it's not so bad, really.'" The following quip is C10.5-02.

	The response of C10.5 is { C10.5m01, C10.5m02 }. 

C10.5-01 is a quip. The display text is "'It's especially bad this year, though,' says Ava.  'Must be a new cook.  Or maybe someone decided that fake sugar would be better for our health than real sugar.'

'Yeah,' says Stacy, rolling her eyes, 'because we all need to go on diets.  They didn't have to put it in everything, though.'"

C10.5-02 is a quip. The display text is "'Daniel always finishes everything on his plate whether he likes it or not,' says Stacy.

'My folks hate to see food go to waste.  Mom always said to either finish everything, or take a little less.'

'If everything tasted like the food here, I wouldn't take any at all!'"


C10.2 done and C10.3 done are truth states that vary. 

To say C10.2 ends tree: now C10.2 done is true.
To say C10.3 ends tree: now C10.3 done is true.

To decide whether a fired quip is listed in (L - a list of objects):
	repeat with X running through L:  [loop on L, as it's almost certainly guaranteed to be smaller than D]
		if X is a fired quip, yes;
	no.

Last after firing a quip (called Q) when C10.2 done is true and Q is not a transitional quip (this is the should we fire C10.6 rule):  [10.2, a truth state, moved into rule header for performance]
	unless C10.3 done is true, make no decision;
	unless a fired quip is listed in the response of C10.1, make no decision; 
	unless a fired quip is listed in the response of C10.4, make no decision;  
	unless a fired quip is listed in the response of C10.5, make no decision;
	say Stacy quips C10.6.

[Understand "puzzle 10" as a mistake ("[conv stat]") when in chapter 10. To say conv stat: 
	unless a fired quip is listed in the response of C10.1, say "1."; 
	unless C10.2 done is true, say "2.";
	unless C10.3 done is true, say "3.";
	unless a fired quip is listed in the response of C10.4, say "4.";  
	unless a fired quip is listed in the response of C10.5, say "5.";]

C10.6 is a quip. The display text is "'Okay, campers!  Enough breakfast!'  It's one of the counselors, Michelle Close.  She bustles along, hurrying everyone on to prepare for the upcoming exhibition and the end-of-camp banquet afterwards.  'You don't have to finish everything on your plates if you don't want to,' she says generously, as Lucian attempts to gobble down the last of his breakfast.  'I know it's pretty awful.'

'Hopefully the banquet will be better,' mutters Stacy.

'It's catered by other people, in town.  After two weeks of this rubbish, I'm sure you won't want to miss the food at tonight's banquet!'

'Awesome!' says Lucian, pushing away his plate.

As everyone gets up from the table, you are suddenly hit with a strong sense of anticipation practically bouncing out of your friends and smashing heavily into your head.  Michelle notices your momentary unsteadiness.  'Hey ... Daniel, right?  You okay?'

'Yeah ... yeah.  Stood up to quickly, that's all.'  Dr Rose did say that you might get flashes like this in the future, and that she would help you out if they didn't go away again.  Better not tell Michelle this: you don't want to wind up being stared at any more than you already are, and then there's Aidan to worry about....

But, as the emotion fades away, you know that this isn't over yet.  Not by a long shot...."

After firing C10.6, end the game in victory.

