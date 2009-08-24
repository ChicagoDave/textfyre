Test Suite by Textfyre begins here.

Part 1 - Assertions

To assert the/-- equality of (m - a thing) and (n - a thing), critically:
	let the failure be indexed text;
	let the failure be "[m] == [n].";
	if critically:
		assert that m is n issuing failure, critically;
	otherwise:
		assert that m is n issuing failure;

To assert the/-- equality of (m - a number) and (n - a number), critically:
	let the failure be indexed text;
	let the failure be "[m] == [n].";
	if critically:
		assert that m is n issuing failure, critically;
	otherwise:
		assert that m is n issuing failure;

To assert the/-- inequality of (m - a thing) and (n - a thing), critically:
	let the failure be indexed text;
	let the failure be "[m] =/= [n].";
	if critically:
		assert that m is not n issuing failure, critically;
	otherwise:
		assert that m is not n issuing failure;

To assert the/-- inequality of (m - a number) and (n - a number), critically:
	let the failure be indexed text;
	let the failure be "[m] =/= [n].";
	if critically:
		assert that m is not n issuing failure, critically;
	otherwise:
		assert that m is not n issuing failure;

To assert that/-- (C - a condition) issuing (report - indexed text), critically:
	(- TF_Assertion ({C}, {report}, {critically}); -);

To assert that/-- (T - a truth state) issuing (report - some text), critically:
	if T is false:
		say "[bracket][bold type][if critically]CRITICAL [end if]ASSERTION FAILED: [report][roman type][close bracket][paragraph break]";
		if critically:
			stop the game abruptly;
		rule fails;

Include (-
[ TF_Assertion T report;
	if (~~(T)) {
		print "[ASSERTION FAILED";
		if (metaclass(report) == String) {
			print ": ", (string) report;
		} else if (metaclass(report) == Routine) {
			print ": "; report.call();
		} else if (BlkType(report) == INDEXED_TEXT_TY) {
			print ": "; INDEXED_TEXT_TY_Say (report);
		} else {
			print " -- without a printable report.";
		}
		print "]^";
		rfalse;
	}
	rtrue;
];
-).

Part 2 - Unit tests

A unit test is a kind of thing.

The unit test rules are an object-based rulebook.
The unit test rules have default success.

Unit test executing is an action applying to one visible thing.
Understand "execute [any unit test]" as unit test executing.

Carry out unit test executing:
	abide by the unit test rules for the noun;

Part 3 - Bugs

To bug (X - some text):
	say "[b]****[bracket]BUG[close bracket]: [X]****[r][paragraph break]";
	say "[one of](Don't panic. See if you can continue to play.)[paragraph break][or][stopping]";

To placeholder (X - some text):
	say "[bracket]placeholder text: '[X]'[close bracket][paragraph break]";

Chapter 2 - Stopping abruptly (For use without Basic Screen Effects by Emily Short)

To stop the/-- game abruptly:
	(- quit; -)
				
Test Suite ends here.
