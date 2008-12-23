"Using Controls" by Textfyre, Inc

Include FyreVM Support by Textfyre.

When play begins:
	select the prologue channel;
	say "In 'Using Controls' we set out to begin using explicit control over the output from our game. The text you're reading right now is a part of the 'prologue' and in Fyre Sampler will be displayed as a pop-up window. As you progress further into the game, other controls will be enabled including: menus, an inventory window, and sound.";
	select the main channel.

The Hilltop is a room. "You are standing atop a small hill that clears the local forest ceiling. Off to the east you see the mist of a great river. Closer to you, there is a clearing with what appears a small white house. To the south you can see a series of buildings sticking up through the forest."

Before going nowhere while the player is in the hilltop:
	say "The forest offers no path in that direction." instead.

The Magesterial Oaks is south of the hilltop. "You are standing before a perimeter of magesterial oka trees, clearly guarding a series of buildings beyond. A rusty gate blocks your path to the south and extending southeast and southwest from the gate is an iron wall."

The Rusty Gate is south of The Magesterial Oaks and north of The Compass Rose Clearing. "The gate is a tall, narrow portion of a great iron wall that stretches around the buildings spotted through openings in the forest to the south."

The Rusty Gate is a door. It is scenery.

The wall is scenery in The Rusty Gate. "The wall is corroded and at least three times your height. You notice that nothing of the forest, neight trees nor undergrowth touches any part of it."

Instead of touching the wall:
	say "As your hand nears the wall you see blue sparks raise up to greet your fingers. Before realizing your mistake, your hand connects and closes the now obvious electrical circuit. In the millisecond before your death you see many piles of black dust at the foot of the wall and realize you're about to join them.";
	end the game in death.

The Compass Rose Clearing is a room. "This is a clearing at the entry to the forest buildings. In the center of clearing is a broken and unused water fountain and extending out from the fountain are star points aimed in all eight cardinal directions."

The fountain is in the Compass Rose Clearing. It is scenery. "A shambles really. It's almost as if someone was very cross with the fountain and punched it. Oddly, the [italic type]sound[roman type] of a fountain can be heard here."

After examining the fountain:
	select the sound channel;
	say "fountain:on";
	select the main channel.

After going anywhere from the Compass Rose Clearing:
	select the sound channel;
	say "fountain:off";
	select the main channel.
	

