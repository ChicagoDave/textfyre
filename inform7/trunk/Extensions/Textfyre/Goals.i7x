Goals by Textfyre begins here.

A goal is a kind of thing.
A goal can be achieved or unachieved. A goal is unachieved.

The current goals is a list of objects that varies.

The recently achieved goals is a list of objects that varies.

The current goals is {}.

The goal-scoring rules are an object-based rulebook.

The goal-scoring rules have outcomes goal achieved (success), goal not yet achieved (failure - the default), and goal thwarted (failure).

Every turn:
	let the goals achieved this turn be a list of objects;
	let the goals thwarted this turn be a list of objects;
	repeat with G running through the current goals:
		consider the goal-scoring rules for G;
		if the outcome of the rulebook is the goal achieved outcome:
			now G is achieved;
			add G to the goals achieved this turn, if absent;
		otherwise if the outcome of the rulebook is the goal thwarted outcome:
			add G to the goals thwarted this turn, if absent;
	remove the goals achieved this turn from the current goals, if present;
	remove the goals thwarted this turn from the current goals, if present;
	add the goals achieved this turn to the recently achieved goals, if absent;
	let n be the number of entries in the goals achieved this turn;
	if n is at least 1:
		say "[bracket]You achieved [if n is 1]a[otherwise][n in words][end if] goal[if n is not 1]s[end if]! ([the goals achieved this turn])[close bracket][paragraph break]";

To list the player's goals:
	if the recently achieved goals is not empty:
		say "Goals Accomplished: ";
		repeat with G running through recently achieved goals:
			say "[line break]  [G]";
		if the current goals is not empty:
			say "[paragraph break]";
	if the current goals is not empty:
		say "Goals[if the recently achieved goals is not empty] Remaining[end if]: ";
		repeat with G running through current goals:
			say "[line break]  [G]";
	if the recently achieved goals is empty and the current goals is empty:
		say "Your present aims are unclear.";
	say paragraph break;

Listing goals is an action out of world applying to nothing.
Understand "goals" as listing goals.

Report listing goals:
	list the player's goals;

Goals ends here.
