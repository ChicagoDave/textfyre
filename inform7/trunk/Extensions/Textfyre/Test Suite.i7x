Test Suite by Textfyre begins here.

To assert that/-- (C - a condition) issuing (report - some text), critically:
	(- TF_Assertion ({C}, {report}, {critically}); -);	

To assert that/-- (T - a truth state) issuing (report - some text), critically:
	if T is false:
		say "[bracket][bold type][if critically]CRITICAL [end if]ASSERTION FAILED: [report][roman type][close bracket][paragraph break]";
		if critically:
			stop the game abruptly;
		rule fails;

Include (-
[ TF_Assertion T report c;
	if (~~(T)) {
		print "[";
		if (c) { print "CRITICAL "; }
		print "ASSERTION FAILED: ";
		if (metaclass(report) == String) {
			print (string) report;
		} else if (metaclass(report) == Routine) {
			report.call();
		} else {
			print "without a printable report.";
		}
		print "]^";
		if (c) quit;
		rtrue;
	}
];
-).

Unit testing is an action out of world applying to one visible thing.
Understand "unit test [any thing]" as unit testing.

Carry out unit testing:
	abide by the unit test rules for the noun;

The unit test rules are an object-based rulebook. The unit test rules have default success.

Chapter 2 - Stopping abruptly (For use without Basic Screen Effects by Emily Short)

To stop the/-- game abruptly:
	(- quit; -)
				
Test Suite ends here.
