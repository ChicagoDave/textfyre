Grid Layout by Textfyre begins here.

Table of grid layout options
table 		cell spacings	headings	row numbering
a table-name	a list of numbers	a truth state	a truth state
with 0 blank rows

[This function needn't be so evil and monolithic but sorting it out can wait, for now.]

To say (t - a table-name) laid out as a grid:
	let x be indexed text; [temporary text holding the text of individual grid rows as they are constructed]
	let the spacings be a list of numbers;
	let the headings option be true;
	let the row numbering option be true;
	let ws be 0; [initial required whitespace count]
	if there is a table of t in the table of grid layout options:
		choose row with a table of t in the table of grid layout options;
		if there is a cell spacings entry,
			change the spacings to the cell spacings entry;
		if there is a headings entry,
			change the headings option to the headings entry;
		if there is a row numbering entry,
			change the row numbering option to the row numbering entry;
	let the column count be the number of entries of the spacings;
	say fixed letter spacing;
	[1. Produce and display the table heading]
	if the headings option is true:
		let x be "";
		if the row numbering option is true:
			change x to ".   ";
		repeat with n running from 1 to the column count:
			change x to "[x][n]";
			if n is not the column count:
				change ws to entry n of the spacings - 1;
				while ws is greater than 0:
					change x to "[x] ";
					decrement ws by 1;
		say "[x]", line break, run paragraph on;
	change ws to 0;
	change x to "";
	[2. Produce and display each line of the grid]
	[some kind of bug regarding nested repeats requires us to be a little more circumspect in our wording here than I would like:]
	repeat with the row counter running from 1 to the number of rows in t:
		if the row numbering option is true:
			say "[row counter]:  ";
		repeat with n running from 1 to the column count:
			do nothing;
			if n is:
			-- 1: change x to "[p1 in row row counter of t]";
			-- 2: change x to "[p2 in row row counter of t]";
			-- 3: change x to "[p3 in row row counter of t]";
			-- 4: change x to "[p4 in row row counter of t]";
			-- 5: change x to "[p5 in row row counter of t]";
			if n is not the column count:
				[add padding - but not needed after the rightmost column]
				change ws to entry n of the spacings - (0 - ws + the number of characters in x);
				while ws is greater than 0:
					change x to "[x] ";
					decrement ws by 1;
			say "[x]";
		say line break, run paragraph on;
	say variable letter spacing, run paragraph on;

Grid Layout ends here.
