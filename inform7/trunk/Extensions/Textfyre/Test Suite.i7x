Test Suite by Textfyre begins here.

Running the test suite is an action applying to one topic.

Carry out running the test suite:
	say the topic understood, line break;
	if the topic understood matches the text "exits":
		run the testsuite exits test;
	otherwise if the topic understood matches the text "names":
		run the testsuite names test;
	otherwise:
		say "Test not known.";

To run the testsuite exits test:
	repeat with x running through rooms:
		say "[b][x][r][line break]";
		carry out the listing available exits activity with x;

Definition: a thing is gameplay-relevant:
	if it is a trigger, no;
	if it is a room, no;
	yes;

To run the testsuite names test:
	repeat with x running through gameplay-relevant things:
		say "[b][x][r] ([the x], [a x])[if x is on-stage or x is a backdrop]:[end if] [if x is a backdrop]backdrop [end if][if x is on-stage]in [the location of x][end if][line break]";
		carry out the printing the description activity with x;
		wait for the SPACE key;

Understand "tftest [text]" as running the test suite.

Test Suite ends here.
