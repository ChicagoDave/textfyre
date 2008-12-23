"The Basics" by Textfyre, Inc

Include FyreVM Support by Textfyre.

When play begins:
	say "This sample FyreVM game is a straight-forward Inform 7 game. We did not explicitly implement any FyreVM Channel I/O features, but we are using the implicit features. This includes the main, location, score, time, and prompt channels. As you can see in Fyre Sampler, these elements are displayed in their appropriate locations on the Windows Form."

The Backyard is a room. "The backyard is east of a small white house. This side of the house has a single, boarded-up window. The yard itself is covered in a thick layer of leaves, probably blown in from the forest, which can be seen in all directions."

The leaves are scenery in the backyard. "They're just leaves."

Understand "forest debris" and "debris" as leaves.

The window is scenery in the backyard. "The window seems to be recently boarded up."

The house is scenery in the backyard. "It's a small white house. Doesn't look like anybody lives here."

Before opening the window:
	say "You try to pry it open, but someone seems to have used Frobozz Magic VLN's (Very Large Nails). Without magic, there's no hope of opening this window." instead.

Before smelling in the backyard:
	say "The forest debris overwhelms even your sensitive nose." instead.

Before smelling the window while the player is in the backyard:
	say "You try to get a whiff of what's inside the house and you draw back from the distinct smell of a pepper sandwich." instead.

Before smelling the house while the player is in the backyard:
	say "You try to get a whiff of what's inside the house and you draw back from the distinct smell of a pepper sandwich. Your stomach rumbles in response." instead.
