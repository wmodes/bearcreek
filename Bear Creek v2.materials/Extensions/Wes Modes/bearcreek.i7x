Bearcreek by Wes Modes begins here.

[header levels are volume, book, part, chapter and section]

Volume - Meta

The story headline is "an interactive fiction".
The story genre is "Fiction".
The release number is 2.
The story creation year is 2020.
The story description is "Bear Creek, August 1975.

Looking back, it was that summer, or maybe just that one day that changed everything. KC and the Sunshine Band was on the radio and you were eight years old. A curious daydreamer, on the verge of learning what lay beyond the boundaries of your own little world, and nothing was certain about whether you'd survive the journey."

Book - License

Book - Playtesting

Part - Comments

After reading a command (this is the ignore beta-comments rule):
	if the player's command matches the regular expression "^<^A-Za-z0-9\s>":
		say "(Noted.)";
		reject the player's command.

Part - Transcript

To start_transcript:
	say "Do you want to create a transcript? ";
	if player consents:
		try switching the story transcript on;
		say "Transcript being recorded. Please send completed transcript to wmodes@gmail.com.";
		say "[line break]NOTE: You can add a comment into the transcript by preceding a command with any punctuation.";
	pause the game;
	clear the screen;

Part - Locations

Teleporting is an action applying to one visible thing.
Understand
	"teleport to/-- [any room]"
	as teleporting.

Carry out teleporting: move the player to the noun.

Part - Notes

[Playtesters
	Aaron Reed
	Sia Delacosta
	Mari Jacobson
	Katherine Dalgleish
	Jennifer Bushard
]

[ ACTIONS that people have tried that were not implemented:
	In Region_Blackberry_Area
		reach farther
		enter bush
		enter tree
]

[ THINGS I notice people are generally not trying:
	x Picking blackberries
	x Eating blackberries
	Examining things in general
	Examining dog
	Examining Bear Creek
	Smelling
	Smelling things
]


Book - Extensions

Part - Screen Effects

Include Basic Screen Effects by Emily Short.

Include Glulx Text Effects by Emily Short.

Table of User Styles (continued)
style name 	justification 	italic 	indentation 	first line indentation 	font weight 	fixed width 	relative size 	color
special-style-1 	center-justified 	false 	0 	0 	bold-weight 	false 	0 	--
special-style-2 	center-justified 	true 	0 	0 	regular-weight 	false 	0 	--


Part - Conversation Frameworks

Include Conversation Framework by Eric Eve.

Include Conversational Defaults by Eric Eve.

Include Conversation Responses by Eric Eve.

Part - Epistemology

[Keeping track of what the player character knows and sees]

Include Epistemology by Eric Eve.

Part - Smarter Parser

Include Smarter Parser by Aaron Reed.

Chapter - Configuration

Corrections enabled is true.
Novice mode enabled is true.

[Remove ability to turn on novice mode, etc]
Understand nothing as novice mode toggling.
Understand nothing as corrections toggling.

Chapter - Blank Lines

The blank line replacement is "wait".

The new_blank_line_replacement rule substitutes for the Smarter Parser advanced replace blank line rule.

This is the new_blank_line_replacement rule:
	let T be indexed text;
	now T is the player's command;
	if T is "":
		change the text of the player's command to the blank line replacement.

Chapter - the where can I go rule

[Tries to help players who seem to be trying to find where the exits are, matching commands like >WHICH WAY IS OUT or >CAN I LEAVE.]

The new_where_can_I_go rule substitutes for the where can I go rule.

This is the new_where_can_I_go rule:
	if input contains "(which|what|where|what) (way|direction|door|exit)s?" or input contains "_can i (go|walk|move|travel|explore|leave)":
		identify error as the where can I go rule;
		now reborn command is "which way";
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
where can I go rule	"[as the parser]While compass directions won't always work (especially if you don't know which directions are which without a compass), you can usually go to landmarks you can see (GO TO CLEARING or FOLLOW CREEK or ENTER TRAILER). Exits and landmarks are usually listed in the descriptions.[as normal][command clarification break]"

Chapter - the signs of confusion rule

[Looks for patterns indicating player confusion or frustration, including >I DON'T KNOW..., >WTF, >SO CONFUSED, >HUH??, >INFO, >HOW DO I..., >ACTIONS, and several others.]

Table of Smarter Parser Messages (continued)
rule name		message
signs of confusion rule		"[as the parser]Try typing LOOK for a description of your surroundings. While compass directions won't always work (especially if you don't know which directions are which), you can usually go to landmarks you can see (GO TO CLEARING or FOLLOW CREEK or ENTER TRAILER). Exits and landmarks are usually listed in the descriptions. [paragraph break]Some of the objects mentioned in the description might be worth a closer look with a command like EXAMINE [get noun example]. You can also TAKE or DROP some things, type INVENTORY to see a list of what you're carrying, OPEN or CLOSE containers or doors, and so on.[as normal][command clarification break]"

Chapter - stripping niceties

[Removes the phrases PLEASE or CAN I (and variants) and reparses the command.]

[The stripping niceties rule is not listed in the Smarter Parser rulebook.]

Table of Smarter Parser Messages (continued)
rule name		message
stripping niceties rule		"[run paragraph on]"

Chapter - the asking who are you rule

[Responds to players trying to address the parser or narrator with commands like >WHO ARE YOU, >WHO'S SPEAKING, >WHO AM I TALKING TO, and so on. ]

The asking who are you rule is not listed in the Smarter Parser rulebook.

Chapter - the asking who am I rule

[Answers the question >WHO AM I? with an explanation and a reparsing as >EXAMINE ME.]

The new_who_am_I rule substitutes for the asking who am i rule.

This is the new_who_am_I rule:
	if input contains "who _be i":
		say "[description of player][line break]";
		reject the command.

Chapter - the asking where am I rule

[Answers the question >WHERE AM I or attempts to examine the location (>LOOK AROUND, >EXAMINE ROOM, >SEARCH LOCATION, >WHAT'S IN THE AREA) with a pointer towards >LOOK. ]

[The asking where am I rule is not listed in the Smarter Parser rulebook.]

[The new_where_am_I rule substitutes for the asking where am i rule.

This is the new_where_am_I rule:
	if input contains "where _be i" or
			input contains "(examine|x|look)( at)?( the)? (here|this place|place|room|area|around)" or
			input contains "(search|what _be in) (the )?(room|area|location|scene)":
		try looking;
		reject the command.]

Table of Smarter Parser Messages (continued)
rule name	message
asking where am i rule	"[run paragraph on]"

Chapter - the asking unparseable questions rule

[Rejects commands that look like questions: anything starting with WHO, WHAT, WHERE, WHY, WHICH, HOW, or variants on CAN I.]

The asking unparseable questions rule is not listed in the Smarter Parser rulebook.

[Table of Smarter Parser Messages (continued)
rule name	message
asking unparseable questions rule	"[as the parser]Stick with imperitives. It might be more effective to offer verb - noun command like EXAMINE [get noun example] to interact with the story, or LOOK to get a description of your surroundings.[as normal][paragraph break]"]

Chapter - the stripping adverbs rule

[Reparses the player's command after removing some of the most commonly tried adverbs, including SLOWLY, CAREFULLY, QUICKLY, QUIETLY, and LOUDLY.]

Table of Smarter Parser Messages (continued)
rule name	message
stripping adverbs rule	"[run paragraph on]"

Chapter - the making assertions rule

[Rejects commands that look like assertion statements, such as anything starting with I, HE, SHE, IT, THIS, YOU, or YOUR.]

Table of Smarter Parser Messages (continued)
rule name	message
making assertions rule	"[as the parser]You might want to rephrase your command to start with an imperative verb, like LOOK.[as normal][command clarification break]"

Chapter - the unnecessary movement rule

[Rejects a wide variety of commands that look like attempts to move within a single room, one of the most common newbie moves in IF, with a mini-tutorial message. Commands matched include those starting with phrases like >GO OVER TO, >MOVE AWAY FROM, >STAND NEXT TO, >GET IN FRONT OF, >WALK UP TO, etcetera.]

[The unnecessary movement rule is not listed in the Smarter Parser rulebook.]

Table of Smarter Parser Messages (continued)
rule name		message
unnecessary movement rule		"[as the parser]If you can see an object, you can usually just interact with it directly without worrying about your position[if player is enclosed by something] (although since you're in or on something, you may need to type EXIT first)[end if]. Try a command like EXAMINE [get noun example] for a closer look at something, LOOK to get a new description of this location, or WHICH WAY to see where you can go[as normal].[line break]"

Chapter - the stripping vague words rule

[Rejects commands containing vague words like SOMEONE, ANYWHERE, NOBODY, or EVERYTHING. ]

Table of Smarter Parser Messages (continued)
rule name	message
stripping vague words rule	"[as the parser]You might want to be more specific. Try typing LOOK to get a description of your surroundings.[as normal][command clarification break]"

Chapter - the stripping pointless words rule

[Rejects commands containing hedges like ANYWAY, ALMOST, SO, or JUST, as well as generally meaningless sequential or quantitative words like NOW, NEXT, or MORE, and reparses the command if any words remain, otherwise rejecting it.]

Table of Smarter Parser Messages (continued)
rule name	message
stripping pointless words rule	"[as the parser]Most connecting and comparative words are not necessary.[as normal][command clarification break]"

Chapter - the stripping failed with rule

[Reparses commands that contain unnecessary addenda like >ATTACK MONSTER WITH MY SWORD, >GO NORTH BY THE PATH, >TOUCH ROCK USING MY FINGERTIP, and so on. (Everything from the "with" word on is stripped.) If your story includes a command that legitimately uses "with," you may want to change the message to account for this, or remove this rule altogether. ]

Table of Smarter Parser Messages (continued)
rule name	message
stripping failed with rule	"[run paragraph on]"

Chapter - the gerunds rule

[If the input contains the gerund form of several common IF commands, such as LOOKING, GOING, PUSHING, etc., strips the "ing" and reparses. Most useful in conjunction with other rules; i.e. along with "stripping pointless words" allows a command like >TRY WAITING to be successfully understood.]

Table of Smarter Parser Messages (continued)
rule name	message
no gerunds rule	"[as the parser]You might want to stick with verbs in present tense command form.[as normal][command clarification break]"

Chapter - the unnecessary possessives rule

[If the player's command includes an interior unrecognized word that ends with an apostrophe s, strip the word and reparse. This works because the interior word is most likely to be a possessive in a command like >GET BOB'S JACKET; if the story doesn't recognize the word BOB'S, we can assume this isn't going to be a helpful disambiguation word and try just >GET JACKET instead. We limit our search to interior words to exclude different contexts like >BOB'S A JERK or >GET APPLE'S.]

Chapter - stripping unnecessary addendum rule

[If the parser understood the player's command up to a certain point, and the words before that point look like a standard IF command, try stripping the excess and reparsing. This lets commands like >TAKE BALL I SUPPOSE, >LOOK AROUND THE ROOM, or >KILL THE TROLL IN TERROR work.]

The stripping unnecessary addendum rule is not listed in the Smarter Parser rulebook.

Chapter - the failed communication attempts rule

[If a person is near the player and they typed one of several common greeting words, including HELLO, HI, GREET, SPEAK..., etc., reject the command and print a message pointing towards correct conversation commands.]

The failed communication attempts rule is not listed in the Smarter Parser rulebook.

Chapter - the too many words rule

[If none of the previous rules have matched and the player's command has more than six words, reject it with a tip to try shorter commands.]

Table of Smarter Parser Messages (continued)
rule name		message
too many words rule		"[as the parser]You typed a rather long command. You might want to stick to simpler things like TAKE [get noun example].[as normal][paragraph break]"

[TODO: Remove line break when correcting a command]

Chapter - Style

To say as the parser: say italic type.
To say as normal: say roman type.

To display the active corrections introduction:
	[say "[line break][as the parser]Retrying as:[as normal][line break]";]
	do nothing.

To display the inactive corrections introduction:
	[say "[as the parser]You might try:[as normal] ".]
	do nothing.

To display the corrections instructions:
	[say "[paragraph break][as the parser]Type UNDO if this isn't what you wanted to do, or CORRECT OFF to stop automatically correcting commands.[as normal]";]
	do nothing.

To display the novice instructions:
	[say "[line break][as the parser]To stop these messages entirely, type NOVICE OFF.[as normal]".]
	do nothing.

To display the rule explanation (explanation - a text):
	[say "[explanation][command clarification break]"	]
	say "[explanation]";

To display the reborn command:
	[say ">[reborn command in upper case]".]
	do nothing.



Book - Bibliographical information

Book - Releasing

Release along with cover art.
Release along with a website.
Release along with an interpreter.
Release along with the library card.

Use MAX_DICT_ENTRIES of 2000.
Use MAX_OBJ_PROP_COUNT of 80.

Volume - Mechanics

Book - Commands

Part - Modifications to standard commands

Chapter - Game Configuration

Use no scoring, the serial comma and American dialect. Use MAX_SYMBOLS of 8000. Use full-length room descriptions.

Chapter - Room Descriptions

The room description heading rule does nothing when turn count is 1 and player is in Room_Lost_in_the_Brambles for the first time.

Rule for printing room description details: do nothing.

To say location heading:
	say "[line break][bold type][location][roman type]".

Chapter - Taking Things

Rule for implicitly taking something (called target):
	try silently taking the target;

Rule for clarifying the parser's choice of something:
	do nothing.

Chapter - Moving Player

To move player to (new-location - a room) with little fuss:
	Move player to new-location, without printing a room description;
	say "[line break][bold type][location][roman type][line break]".

Chapter - Waiting

The standard report waiting rule response (A) is "You wait for a bit and time passes."

Chapter - Can't See That

[Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "[regarding the noun](The noun is [noun] whose pronoun is [them])";
	say "You don't see that anywhere around here." instead;]

[The parser error internal rule response (E) is "[We] look around, but don't see that anywhere around here."]

[Remove all the messages that clarify the parser's choice of something]
Include (-
Replace PrintInferredCommand;

[ PrintInferredCommand; ];
-) before "Parser.i6t".



Chapter - Printing Descriptions

The examine undescribed things rule response (A) is "[if Scene_Dreams is not happening][We] [see] nothing [one of]interesting[or]noteworthy[or]special[at random] about [the noun][else]You look at [the noun], but the details are[one of] foggy[or] indestinct[or] fuzzy[at random][end if]."

Part - New commands

Chapter - Out of world commands

Chapter - Credits

Asking for credits is an action out of world.
Understand
	"credits",
	"about"
	as asking for credits.

Carry out asking for credits:
	say "[story title] was created by [story author]. Inform 7, in which it was written, is the work of Graham Nelson. The IF authors Emily Short, Eric Eve, and Aaron Reed provided helpful extensions to Inform. The author is grateful for the testing feedback offered by many good folks since the first version in 2012. The cover was generously provided by Darrin Barry.[paragraph break]The story is dedicated to the Sierra Miwok and Yokut people who lived along the shores of what is now known as Bear Creek."

Chapter - Instructions

Chapter - Pouring

Understand the command "dump/pour" as something new.

pouring_in is an action applying to two visible things.
Understand
	"dump [something] into/in [something]", "pour [something] into/in [something]"
	as pouring_in.

Carry out pouring_in:
	try inserting the noun into the second noun.

	Chapter - Surface_going

Surface_going is an action applying to one thing.
Understand
	"go on/to [visible surface]",
	"walk on/to [visible surface]",
	"climb on/to [visible surface]",
	"jump on/to [visible surface]",
	"cross on/to [visible surface]"
	as surface_going.

Carry out surface_going:
	if destination of noun is Limbo:
		Try entering noun;
	else:
		Try room_navigating destination of noun.

Chapter - Looking_ouside

[When we "look outside" we are examining objects within the room]

A room has some text called outside_view.

Looking_outside is an action applying to nothing.

Understand "look outside/out" as looking_outside.

Carry out looking_outside:
	let this_view be outside_view of location;
	if this_view is empty:
		try looking;
	else:
		say "Outside you can see [this_view].";

Understand "look out of/-- [something]" as examining.

Chapter - Swimming

[We want swimming to be a deliberate act, so when the player asks to swim at the swimming hole, we will give her a warning and hint at her trying again, then we will do it the second time she asks.]

Understand the command "swim/wade/dive" as something new.

Doing_some_swimming is an action applying to nothing.
Understand "swim", "wade", "dive"
	as doing_some_swimming.

Instead of doing_some_swimming when waterbody is not visible:
	say "Good idea. You might want to go down to the creek.";

Doing_some_swimming_in is an action applying to one thing.
Understand
	"go to/in/into [visible waterbody]",
	"swim in/into [visible waterbody]",
	"wade in/into [visible waterbody]",
	"dive in/into [visible waterbody]",
	"jump in/into [visible waterbody]"
	as doing_some_swimming_in.

Instead of Doing_some_swimming_in:
	try doing_some_swimming;

Chapter - Sitting/Lying

Understand the command "lie", "sit" as something new.

lying_down is an action applying to one thing.
Understand
	"lie down/-- on/in [something]",
	"sit down/-- on/in/at [something]"
	as lying_down.

Carry out lying_down:
	if noun is a lie-able supporter:
		try silently entering noun;
		if rule succeeded:
			say "You make yourself comfortable on [the noun].";
		stop the action;
	else if noun is a sit-at-able supporter:
		try silently entering noun;
		if rule succeeded:
			say "You make yourself comfortable at [the noun].";
		stop the action;
	otherwise:
		try entering the noun;

lying_default is an action applying to nothing.

Understand
	"lie", "lie down", "sit", "sit down"
	as lying_default.

Carry out lying_default:
	let list_of_lieables be a list of things;
	add the list of lie-able supporters in location to list_of_lieables;
	add the list of sit-at-able supporters in location to list_of_lieables;
	if the number of entries of list_of_lieables is 0:
		say "There's nowhere comfortable to sit here.";
	else if the number of entries of list_of_lieables is 1:
		try lying_down entry 1 of list_of_lieables;
	else:
		say "Where do you want to sit? There's a few choices: [list_of_lieables]."

Does the player mean entering a lie-able supporter:
	it is likely.

Does the player mean entering something that is not a supporter:
	it is very unlikely.

Understand the command "stand" as something new.

standing_up is an action applying to nothing.
Understand
	"stand", "stand up", "get up", "get off"
	as standing_up.

Carry out standing_up:
	if player is on a lie-able supporter (called the loungy_thing):
		try silently exiting [loungy_thing];
		if rule succeeded:
			say "You push yourself up from [the loungy_thing].";
		stop the action;
	else if player is on a supporter (called the loungy_thing):
		try silently exiting [loungy_thing];
		if rule succeeded:
			say "You stand up from [the loungy_thing].";
		stop the action;
	otherwise:
		say "You are already up.";
		rule fails;

[Procedural rule while exiting or standing_up or getting off (this is the make standing a brief experience rule):
	ignore the describe room stood up into rule;]

Chapter - Climbing

[Borrowed from Supplemental Actions by Al Gorden - Part 08 Climbing ]

[TODO: This could be done MUCH more elegantly, e.g., climb [preposition] could all be treated as one ]

[
	climbing
]

Understand the command "climb" as something new.

Understand
	"climb", "hop", "scale", "jump", "cross"
	as climbing.

report climbing
(this is the climbing rule):
	if the noun is climbable:
		say "You climb [the noun].";
	else:
		say "You can't climb [the noun]." instead.

Does the player mean climbing an unclimbable thing:
	it is unlikely.

[
	climbing up nada
]

climbing-up-nada is an action applying to nothing.
Understand
	"climb up"
	as climbing-up-nada.

Carry out climbing-up-nada:
	try going up.

Does the player mean climbing up an unclimbable thing:
	it is unlikely.

[
	climbing up
]

climbing up is an action applying to one thing.
understand
	"climb [something]",
	"climb up [something]"
	as climbing.

[
	climbing down nada
]

climbing-down-nada is an action applying to nothing.
Understand
	"climb down"
	as climbing-down-nada.

Carry out climbing-down-nada:
	try going down.

Does the player mean climbing down an unclimbable thing:
	it is unlikely.

[
	climbing down
]

climbing down is an action applying to one thing.
understand
	"climb down [something]"
	as climbing down.

instead of climbing down:
	try going down.

[
	climbing in
]

climbing in is an action applying to one thing.
Understand
	"climb in/into [something]"
	as climbing in.

report climbing in
(this is the climbing in rule):
	if the noun is climbable:
		say "You climb [the noun].";
	else if the noun is an enterable container:
		say "You climb into [the noun].";
		now the player is in the noun;
	else:
		say "You can't climb in [the noun]." instead.

Does the player mean climbing in an unclimbable thing:
	it is unlikely.

[TODO: Implement climbing_in_nothing where an assumption is made about climbing into enterable things in location, i.e., climb in]

[
climbing on
]

climbing on is an action applying to one thing.
understand
	"climb on/onto [something]"
	as climbing on.

report climbing on
(this is the climbing on rule):
	if the noun is climbable:
		say "You climb [the noun].";
	else if the noun is an enterable supporter:
		say "You climb onto [the noun].";
		now the player is on the noun;
	else:
		say "You can't climb onto [the noun]." instead.

Does the player mean climbing on an unclimbable thing:
	it is unlikely.

[
climbing out
]
climbing_out_something is an action applying to one topic.
Understand "climb out [text]"
as climbing_out_something.
Carry out climbing_out_something:
	try exiting.

climbing_out_nothing is an action applying to nothing.
Understand "climb out"
as climbing_out_nothing.
Carry out climbing_out_nothing:
	try exiting.

[
climbing over
]

climbing over is an action applying to one thing.
understand "climb over [something]" as climbing over.

report climbing over
(this is the climbing over rule):
	if the noun is climbable:
		say "You climb over [the noun].";
	else:
		say "You can't climb over [the noun]." instead.

Does the player mean climbing over an unclimbable thing:
	it is unlikely.

[
climbing through
]

climbing through is an action applying to one thing.
understand "climb through/thru [something]" as climbing through.

report climbing through:
say "You can't climb through [the noun].".

[
climbing under
]

climbing under is an action applying to one thing.
Understand
	"climb under [something]"
	as climbing under.

[TODO: allow climbing under fallen tree]

report climbing under
(this is the climbing under rule):
	say "You can't climb under [the noun]." instead.

Does the player mean climbing under an unclimbable thing:
	it is unlikely.


Chapter - Dressing

Understand the command "dress" as something new.
Understand "dress", "get dressed" as Dressing.
Dressing is an action applying to nothing.

Carry out dressing:
	Put clothes back on.

To put clothes back on:
	if player is in Room_Swimming_Hole:
		let gettin-stuff be false;
		let gettin-clothes be false;
		[say "stuff: [list of everything that has been carried].";]
		repeat with item running through stuff_you_brought_here:
			if item is visible and item is not held:
				move item to player;
				now gettin-stuff is true;
		if clothes are not worn by player:
			now gettin-clothes is true;
		if tennis_shoes are not worn by player:
			now gettin-stuff is true;
		now clothes are worn by player;
		now tennis_shoes are worn by player;
		if grandpas_shirt is visible:
			now grandpas_shirt is worn by player;
		if gettin-stuff is true or gettin-clothes is true:
			say "You[one of] slowly[or] leisurely[or][at random] gather your stuff[if gettin-clothes is true] and pull your clothes back on[end if].";
		change stuff_you_brought_here to have 0 entries;
	else:
		say "You are already dressed!";


Chapter - Laughing

Laughing is an action applying to nothing.
Understand
	"laugh", "lol", "laugh out loud", "giggle", "smirk", "chuckle"
	as laughing.

Carry out laughing:
	say "You [one of]laugh out loud[or]chuckle heartily[or]giggle loudly[at random][run paragraph on]";
	if people who are not the player are visible and a random chance of 1 in 4 succeeds:
		let reactor be a random visible person who is not the player;
		say " and [Reactor] [one of]looks at[or]glances over at[or]smiles at[at random] you";
	say ".[line break]";

Laughing at is an action applying to one thing.
Understand "laugh at [something]" as laughing at.

Carry out laughing at:
	if the noun is not a person:
		try laughing;
	otherwise:
		say "[Noun] looks first confused and then hurt. You feel bad for laughing.";
		now player is not compassionate.


Chapter - Yelling

Yelling is an action applying to nothing.
Understand
	"yell", "holler", "scream", "shriek", "monkey yell", "yell like a monkey"
	as yelling.

Carry out yelling:
	say "Your [one of]scream echoes off the surrounding hills[or]yell is heard far and wide[or]shriek causes a nearby flock of birds to take flight[at random][run paragraph on]";
	if people who are not the player are visible:
		let affected people be the list of visible people who are not the player;
		let number_of_affected_people be the number of visible people who are not the player;
		if the number_of_affected_people is one:
			say " and [affected people] stares at you in surprise";
		otherwise:
			say " and [affected people] look at you in surprise";
	else:
		say " after which [one of]there is a profound silence[or]several minutes go by before the birds resume their song[or]your throat is sore[at random]";
	say ".[line break]";


Chapter - Petting

Understand
	"pet [something]",
	"pat [something]",
	"hug [something]",
	"kiss [something]"
	as touching.

Instead of kissing someone:
	Try touching the noun.


Chapter - Piling

Piling is an action applying to one thing.
Understand
	"pile [something] over/on/- me/myself/--",
	"pull [something] over/on/- me/myself/--",
	"cover myself/me with/-- [something]"
	as piling.

Carry out piling:
	if the noun is not fallen_leaves:
		say "Hmm. Not sure how to do that.";
	else:
		say "You pile the leaves under yourself for a cozy bed, and then over yourself in a heaping pile for a cozy banket. You are much warmer.";
		now Room_Protected_Hollow is made_cozy;
		now player is covered_in_leaves;
		now player is dirty;

	Part - Howdy?

	[howdy / how are you doing? asking about self]

	Understand "howdy", "how do", "how are/-- you/ya doing/feeling/--", "how is your day/morning/afternoon/evening", "what is/-- up/going on/--", "what's up/going on/--" as asking_howdy.
	asking_howdy is an action applying to nothing.

	Carry out asking_howdy:
		let subject be the current interlocutor;
		try quizzing subject about subject.

Chapter - Thanking

[TODO: Implement thank [Somebody] and thank you]

The default thanks response rules are an object-based rulebook.
The default thanks response rules have default success.

The try default response rule is listed last in the default thanks response rules.

Report thanking (this is the default thanks rule):
  abide by the default thanks response rules for the current interlocutor.

thanking is an action applying to one visible thing.

Understand
	"thanks",
	"thank you/--",
	"thanks [something]",
	"thank you/-- [something]",
	"say thanks/thank you/-- to [something]",
	"tell [something] thanks/thank you/--" as thanking.

[TODO: This works, unless a person is not here and then we get "That's not a verb I recognize"]

Check thanking:
	[say "(DEBUG: checking thanking)";]
	if noun is not a person or noun is player:
		say "You thank the heavens." instead;
	else if noun is not visible:
		say "You'll have to find them first.";

Carry out thanking:
	[say "(DEBUG: carrying out thanking)";]
	now current interlocutor is noun;

Rule for supplying a missing noun when thanking:
	let subject be a random [other] person enclosed by the location;
	if subject is not a person and subject is not an animal:
		say "You thank the heavens.";
	else:
		now the noun is the subject;

Chapter - Attacking

Instead of attacking a thing that is not a person:
	say "You consider giving it a vicious kick, but think better or it."

Instead of attacking someone (called the subject):
	say "[one of]Sometimes you get so mad you wish you had a laser ray that could just zap somebody dead. No, better, a disappearance ray that made someone disappear like they'd never ever existed.
	[paragraph break]But then you think about it a bit, and wonder: What if you disappeared [subject] and [sub_pronoun of subject] was meant to help you or save your life or something later and you'd never know it because [sub_pronoun of subject] never existed? Or if you had a Disappear Ray, why couldn't someone else have one? And what would keep them from disappearing you?[or]If you knew Kung Fu you'd chop [obj_pronoun of subject] to pieces. But then what if [subject] didn't die right away and [sub_pronoun of subject] just laid there suffering? Could you finish [obj_pronoun of subject] off while [sub_pronoun of subject] laid there helpless?[or]What is you hurt [obj_pronoun of subject] and you got put in jail and you never saw your mom again?[cycling][line break]The thought makes you [nervous]. Maybe violence isn't the answer."

Chapter - Singing

Understand the command "sing", "hum" as something new.
Singing is an action applying to nothing.
Understand
	"sing", "hum"
	as singing.

Understand
	"sing [text]" or "hum [text]"
	as a mistake
	("[sing_action][run paragraph on]").

Instead of singing:
	say "[sing_action]".

To say sing_action:
	if a random chance of 1 in 3 succeeds:
		say "You make up a song about [one of]killer red ants that eat everyone[or]picking blackberries until your fingers are bloody[or]riding the train out of town and living like a hobo[at random] [one of][or]to the tune of 'When You Need a Friend'[or]to the tune of 'Baby I'm a Want You'[or]to the tune of 'American Pie'[at random].[run paragraph on]";
	else if player is in Region_Blackberry_Area:
		say "You sing along to [current_song], but you [one of]only know the chorus[or]only know some of the words[or]have to make up most of it[or]don't know most of the words, and you don't really care[at random].[run paragraph on]";
	else:
		say "You sing a little bit of one of your favorite songs, [one of]'Knock Three Times on the Ceiling If You Want Me'[or]'Before the Next Teardrop Falls'[or]'Thank God I'm a Country Boy'[or]'He Don't Love You Like I Love You'[or]'How Sweet It Is To Be Loved By You'[or]'Kung Fu Fighting'[at random], but you [one of]only know the chorus[or]don't really know the words[or]have to make up most of it[or]but you don't know most of the words, but you don't really care[at random].[run paragraph on]";
	if people who are not the player are visible and a random chance of 1 in 3 succeeds:
		let reactor be a random visible person who is not the player;
		say " [Reactor] [one of]looks at[or]glances over at[or]smiles at[at random] you.[run paragraph on]";
	say "[line break]";

Chapter - Jumping

Instead of jumping:
	say "You jump around like a monkey."

Chapter - Peeing

Peeing is an action applying to nothing.

Understand "pee", "urinate", "poop", "piss" as peeing.

Carry out peeing:
	If Scene_Dream_Have_To_Pee is happening:
		say "Probably best to hustle to the restroom in the snack bar.";
	else:
		say "You don't have to go."

Chapter - Crying

Crying is an action applying to nothing.

Understand "cry", "sob", "wail" as crying.

Carry out crying:
	say "You try to hold back your tears but they leak out.";

Chapter - Breathing

Breathing is an action applying to nothing.

Understand "breathe", "take a breath" as breathing.

Carry out breathing:
	say "You take a deep breath. It's calming.";

Chapter - Finding

Finding is an action applying to one visible thing.

Understand "find [something]" as finding.

Carry out finding:
	if noun is visible:
		try examining noun;
	else:
		say "You'll have to be more specific. Perhaps if you stop and observe what's around you.";

Chapter - Stopping

Stopping is an action applying to nothing.

Understand "stop" as stopping.

Carry out stopping:
	say "S.T.O.P. is one of the things you learned at Explorer Camp:[line break]
	S stands for SIT DOWN.[line break]
	T is for THINK.[line break]
	O is for OBSERVE.[line break]
	P stands for PLAN."

Chapter - Observing

Understand "observe" as looking.
Understand "observe [thing]" as examining.

Chapter - Planning

Planning is an action applying to nothing.

Understand "plan" as planning.

Carry out planning:
	say "Good idea. What have you come up with?";

Chapter - Hunting

Hunting is an action applying to one thing.

Understand "hunt [something]", "catch [something]" as hunting.

Carry out hunting:
	if the noun is crickets and crickets are visible:
		say "You sit for a minute in the grass watching carefully, but apparently they are in hiding today. You get up a little disappointed.";
	else if noun is visible:
		try taking noun;
	else:
		say "Yeah, no. That's not likely.";

Chapter - Waking

Instead of waking up:
	if Scene_Dreams is not happening:
		say "Alas, it's not a dream.";
	else if dog_free_to_go is not true:
		say "Try as you might, you can't. Perhaps it's not yet time.";
	else:
		now player is awake;

Chapter - Smelling

An object has some text called scent. The scent of a thing is usually "nothing".

Definition: a thing is scented if the scent of it is not "nothing".

The report smelling rule is not listed in any rulebook.

The last carry out smelling rule:
	if the scent of the noun is "nothing":
		say "[The noun] [if noun is singular-named]doesn't[otherwise]don't[end if] smell like much of anything.";
	otherwise:
		say "[The noun] smell[if noun is singular-named]s[end if] like [the scent of the noun].".

Instead of smelling a room:
	if the scent of the location of the player is not empty:
		say "You smell [the scent of the location of the player].";
	else if the scent of the map region of the location of the player is not empty:
		say "You smell [the scent of the map region of the location of the player].";
	else:
		say "You smell nothing in particular.".

Chapter - Supporters

Understand
	"go on [supporter]",
	"walk on [supporter]",
	"balance on [supporter]"
	as entering

Chapter - Tracks

Follow_tracks is an action applying to nothing.
Understand
	"follow train/green/-- tracks/tunnel" as follow_tracks.

Carry out follow_tracks:
	if player is in Room_Railroad_Tracks:
		say "[one of]The trees crowd in on either side, so there's nowhere to walk but on the tracks. You follow them for a little while but then get scared that a train will come and you will have nowhere to go.
		[paragraph break]You[or]Mom told you about kids who get killed walking on the tracks, so you[or]You walk on down the tracks a bit, and then[stopping] head on back to where the old dirt road crosses the train tracks.";
	else if player is in Room_Dream_Railroad_Tracks:
		try room_navigating Room_Mars;
	else:
		say "Best go to the railroad crossing for that."

Chapter - A New Inventory Command

The print standard inventory rule is not listed in the carry out taking inventory rules.

Carry out taking inventory (this is the print non-standard inventory rule):
	[carried items]
	say "You are carrying ";
	now everything carried by the player is marked for listing;
	now everything worn by the player is not marked for listing;
	now everything unmentionable is not marked for listing;
	if number of marked for listing things carried by the player is greater than 0:
		list the contents of the player, as a sentence, including contents, listing marked items only;
	otherwise:
		say "nothing";
	[worn items]
	now everything carried by the player is not marked for listing;
	[now everything not worn by the player is not marked for listing;]
	now everything worn by the player is marked for listing;
	now everything unmentionable is not marked for listing;
	if number of marked for listing things worn by the player is greater than 0:
		say " and wearing ";
		list the contents of the player, as a sentence, including contents, listing marked items only;
	say "[other_attributes].";

Chapter - New Can't See That Report

[
	Remembering last seen locations

	From Aaron Reed's remembering

	Replaces 'You can't see any such thing' for a seen but out-of-scope noun with a message acknowledging that the parser recognizes the object.
]

Every thing has an object called the remembered location.
	The remembered location of a thing is usually nothing.

Last when play begins (this is the Remembering update remembered positions for first turn rule):
	follow the Remembering update remembered positions of things rule.

Every turn (this is the Remembering update remembered positions of things rule):
	unless in darkness:
		repeat with item running through things that are enclosed by the location:
			if remembered location of item is not holder of item:
				if item is visible:
					now the remembered location of item is the holder of item.

To decide whether (item - an object) acts plural:
	if the item is plural-named or the item is ambiguously plural:
		yes;
	no.

To say was-were of (N - an object):
	if the story tense is future tense:
		say "will have been";
	otherwise if N acts plural:
		say "were";
	otherwise:
		say "was".

To say at the (place - an object):
	carry out the saying the location name activity with place.

saying the location name of something is an activity on objects.

For saying the location name of a room (called place) (this is the Remembering saying room name rule): say "at '[the place]'" (A).

For saying the location name of the location (this is the Remembering saying current location name rule): say "right here" (A).

For saying the location name of a person (called subject) (this is the Remembering saying person name rule): say "in the possession of [the subject]" (A).

For saying the location name of a person who is the player (this is the Remembering saying player name rule): say "in your possession" (A).

For saying the location name of a container (called the holder) (this is the Remembering saying container name rule): say "in [the holder]" (A).

For saying the location name of a supporter (called the holder) (this is the Remembering saying supporter name rule): say "on [the holder]" (A).

[
	my mods to remembering
]

A room has some text called casual_name.

The Remembering saying room name rule response (A) is "[the casual_name of the place]".

[
	Deciding scope and Reporting

	Courtesy of @otistdog https://intfiction.org/t/remembering-mysteries/49840/15?u=wmodes
]

[An alternative to scope testing via direct object tree inspection]
To decide whether (X - thing) has line of sight to (Y - thing):
    if the common ancestor of X with Y is nothing, decide no;
    if Y is enclosed by a closed opaque container that does not enclose X, decide no;
    if X is enclosed by a closed opaque container that does not enclose Y, decide no;
    decide yes.

To decide whether (X - thing) does not have line of sight to (Y - thing):
	if X has line of sight to Y:
		decide no;
	otherwise:
		decide yes.

Definition: a thing is unavailable if it is seen and the player does not have line of sight to it.

After deciding the scope of the player:
	repeat with X running through unavailable things:
		place X in scope.

[Uses before rules to intervene ahead of visibility checks]
Before doing something when the noun is unavailable:
	[say "[The noun] [are] nowhere to be seen." instead.]
	say "You look around, but don't see [the noun]. Last you remember, [they] [was-were of noun] [at the remembered location of noun].[line break]" instead.

Before doing something when the second noun is unavailable:
	if quizzing or implicit-quizzing or conversing or speaking or implicit-conversing:
		continue the action;
	[say "[The second noun] [are] nowhere to be seen." instead.]
	say "You look around, but don't see [the second noun]. Last you remember, [they] [was-were of noun] [at the remembered location of noun].[line break]" instead.


Book - Hints

Book - Default messages



Book - Navigation

Part - Available Exits

A room has some text called the available_exits.

To say available_exits:
	if available_exits of location is not empty:
		say "[available_exits of location]";

To say looking_for_available_exits:
	say "You take a quick look around you: [available_exits of location][line break]";

Part - Navigation Hints

[TODO: Check to see if we can hook this up with similar features of Aaron Reed's Better Parser]

exit_listing is an action applying to nothing.
Understand
	"which way",
	"where do I go",
	"exits",
	"exit"
	as exit_listing.

Carry out exit_listing:
	if available_exits of location is empty:
		say "Sorry, you're on your own here.";
	otherwise:
		say looking_for_available_exits;

To hint_at_navigation:
	say "[one of]You could never remember which way was which, and without your Explorer Scout compass it's more useful to use landmarks to navigate anyway[or]Which direction is that? You might want to use landmarks to navigate[or]Try using landmarks. For example: GO TO CLEARING[line break]Or even try: GO BACK or GO ON[line break]If you need a reminder, try: WHICH WAY[stopping].";

Part - Compass Navigation

[This is only necessary as a work around to something else we need to do:
	First, we want to disuade the player during the first two acts from navigating via compass.
	However, we ourselves need to navigate via compass navigation while trying to navigate
	to an object, as in

	let heading be the best route from the location to the destination

	This returns a heading that we want to navigate toward. So we need a way to pause
	our prohibiition on compass navigation.
]

Yourself can be discouraged_from_compass_navigating.
Yourself can be aware_of_compass_directions.

Every turn when player is not aware_of_compass_directions:
	now player is discouraged_from_compass_navigating.

Check going north when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going northeast when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going east when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going southeast when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going south when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going southwest when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going west when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Check going northwest when player is discouraged_from_compass_navigating:
	hint_at_navigation instead.

Part - Room Navigation

[Basically, if the player and the room are in Region_Dreams OR the player and the room are both not in Region_Dreams, than the room is reachable.]
Definition: A room is reachable
	if it is reachable_in_dreams or
		it is reachable_IRL.

[Everywhere within Region_Dreams is contiguous -- and discontiguous with everything outside of it.]
Definition: A room is reachable_in_dreams
	if the map region of it is Region_Dreams and
		the map region of the location is Region_Dreams.

[Everywhere NOT within Region_Dreams is contiguous -- and discontiguous with everything inside of it.]
Definition: A room is reachable_IRL
	if the map region of it is not Region_Dreams and
		the map region of the location is not Region_Dreams.

Room_navigating is an action applying to one thing.
Understand
	"go back/- to/around/near/by/-- [any reachable room]",
	"return to [any reachable room]",
	"walk to/-- [any reachable room]",
	"run to/-- [any reachable room]" as room_navigating.

Check room_navigating:
	[say "(DEBUG: go from [location of player] to [the noun])[line break]";]
	if the noun is the location, say "Well, happily you're already here." instead;

Carry out room_navigating:
	let initial location be the location;
	let the destination be the noun;
	if the initial location is the destination,
		say "." instead;
	let heading be the best route from the initial location to the destination;
	[say "(DEBUG: heading toward [noun] is [heading])[line break]";]
	if heading is nothing:
		say cant_find_that instead;
	else:
		now player is not discouraged_from_compass_navigating;
		try going heading.

To say cant_find_that:
	say "You're not sure exactly how to get there. [looking_for_available_exits]";

Fail_navigating is an action applying to one thing.
Understand
	"go back/- to/-- [any not reachable room]",
	"return to [any not reachable room]",
	"walk to/-- [any not reachable room]",
	"run to/-- [any not reachable room]"
	as fail_navigating.

Carry out fail_navigating:
	say cant_find_that;


Part - Landmarks and Navpoints


Part - Specific Actions (GO ON and GO BACK)

Going_back is an action applying to nothing.
Understand
	"go back",
	"return"
	as going_back.

Carry out going_back:
	long_range_navigate to return_dest of the map region of the location of the player.

Going_on is an action applying to nothing.
Understand
	"go on/forward",
	"walk on/forward/--",
	"keep going/walking/on",
	"continue going/walking/forward/on/--", "forward", "walk", "get going"
	as going_on.

Carry out going_on:
	long_range_navigate to forward_dest of the map region of the location of the player.

Going_upstream is an action applying to nothing.
Understand
	"go up the/-- creek/river/stream",
	"go upstream/upriver",
	"follow the/-- creek/river/stream up/upstream"
	as going_upstream.

Carry out going_upstream:
	Let destination be upstream_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is as far upstream as I can get here.";
	else if destination is Limbo:
		say "I'm not sure how to go upstream from from here.";
	else:
		try room_navigating destination.

Going_downstream is an action applying to nothing.
Understand
	"go down the/-- creek/river/stream",
	"go downstream/downriver",
	"follow the/-- creek/river/stream"
	as going_downstream.

Carry out going_downstream:
	Let destination be downstream_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is as far downstream as I can get from here.";
	else if destination is Limbo:
		say "I'm not sure how to go downstream from here.";
	else:
		try room_navigating destination.

Going_uppath is an action applying to nothing.
Understand
	"go up the/-- road/path/trail/hill",
	"go uphill"
	as going_uppath.

Carry out going_uppath:
	Let destination be uppath_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is the end of the road, pardner.";
	else if destination is Limbo:
		say "I'm not sure how to get there from here.";
	else:
		try room_navigating destination.

[TODO: "follow path/road" should take you in the same direction you were going toward the end, so we may need another verb for follow]

Going_downpath is an action applying to nothing.
Understand
	"go down the/-- path/trail/road/hill",
	"go downhill",
	"follow the/-- path/trail/road"
	as going_downpath.

Carry out going_downpath:
	Let destination be downpath_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is the end of the road, pardner.";
	else if destination is Limbo:
		say "I'm not sure how to get there from here.";
	else:
		try room_navigating destination.

To long_range_navigate to (destination - a room):
	[say "(DEBUG: Long range nav: [destination])[line break]";]
	if destination is the location of the player:
		say "This is about as far as I can go.";
	else if destination is Limbo:
		say "I'm not sure how to get there from here.";
	else:
		try room_navigating destination.

Part - Elusive Landmarks

[TODO: Create richer generative Dark Woods locations with rises and downslopes, incidental details, etc]

The_distance is a container.
The_distance is in Limbo.

An elusive_landmark is a kind of thing.
An elusive_landmark is scenery.

Definition: an elusive_landmark is distant if it is in the_distance.

landmark_navigating is an action applying to one thing.
Understand
	"go to/near/by/-- [any distant elusive_landmark]",
	"walk to/near/by/-- [any distant elusive_landmark]",
	"run to/near/by/-- [any distant elusive_landmark]"
	as landmark_navigating.

Check landmark_navigating:
	if the noun is visible:
		say "Well, that's right here." instead;
	if the noun is not in the_distance:
		say cant_find_that instead;

To say cant_find_that:
	say "You're no longer sure how to get there. [looking_for_available_exits]";

landmark_nav_counter is a number that varies. landmark_nav_counter is 0.

Carry out landmark_navigating:
	increment landmark_nav_counter;
	say "You head toward the [noun].[run paragraph on] ";
	move_within_dark_woods.

[Procedural rules are deprecated]
[A procedural rule while landmark_navigating:
	ignore the can't reach inside rooms rule.]
The can't reach inside rooms rule does nothing if landmark_navigating.

When play begins:
	Let this_thing be a random elusive_landmark in Limbo;
	Now this_thing is in Room_Dark_Woods_South;
	Let next_thing be a random elusive_landmark in Limbo;
	Now next_thing is in the_distance;

To say movement_in_woods:
	say "[one of]You stumble around in the dark woods[or]You carefully make your way through the forest[or]You follow an uncertain path through the wood[or]You bushwhack your way through the underbrush[at random].".

To move_within_dark_woods:
	say movement_in_woods;
	Let old_near_thing be a random elusive_landmark in Room_Dark_Woods_South;
	Let old_far_thing be a random elusive_landmark in the_distance;
	Let new_far_thing be random elusive_landmark in Limbo;
	Now old_far_thing is in Room_Dark_Woods_South;
	Now new_far_thing is in the_distance;
	Now old_near_thing is off-stage;
	Repeat with item running through stuff_you_brought_here:
		if item is visible and item is not held:
			move item to limbo;
	try looking;

After dropping something (called the item) when player is in Room_Dark_Woods_South:
	add item to stuff_you_brought_here;
	continue the action;

[TODO: Make sure all the stuff_you_brought_here is in Room_Dark_Woods_South and Room_Dark_Woods_North]

Instead of doing anything except examining or landmark_navigating to elusive_landmarks:
	say "This is no time for that. [if Scene_Day_Two is not happening]You are feeling desperate to find your way back to your Honey and Grandpa. You fight back tears and push on.[end if]".


Book - Language Tweaks

Chapter - Pronouns

[A gender identifier is a kind of value. The gender identifiers are ]

[Identifying relates various people to various gender identifiers. The verb to identify as (he identifies as, they identify as, he identified as, it is identified as, he is identifying as) implies the identifying relation.]

A person can be _male, _female, _neutrois, or _critter. A person is usually _neutrois.

Section - Subject Pronouns

[e.g., "All along, she was the one you were thinking of."]

To say sub_pronoun of (subject - a thing):
	follow the sub_pronoun of rulebook for subject.

The sub_pronoun of rulebook is an object based rulebook. The sub_pronoun of rulebook has default success.

sub_pronoun of someone who is _neutrois: say "they".
sub_pronoun of someone who is _male: say "he".
sub_pronoun of someone who is _female: say "she".
sub_pronoun of someone who is _critter: say "it".

[e.g., "She looks at you quizzically."]
To say sub_pronoun_cap of (subject - a person):
	say "[sub_pronoun of subject]" in title case.

Section - Object Pronouns

[e.g., "Were you wanting to ask her something?"]

To say obj_pronoun of (subject - a thing):
	follow the obj_pronoun of rulebook for subject.

The obj_pronoun of rulebook is an object based rulebook. The obj_pronoun of rulebook has default success.

obj_pronoun of someone who is _neutrois: say "them".
obj_pronoun of someone who is _male: say "him".
obj_pronoun of someone who is _female: say "her".
obj_pronoun of someone who is _critter: say "it".

[e.g., "Her, the one you were thinking of."]
To say obj_pronoun_cap of (subject - a person):
	say "[obj_pronoun of subject]" in title case.

Section - Possessive Pronouns

[e.g., "You spend a moment looking at her face."]

To say pos_pronoun of (subject - a thing):
	follow the pos_pronoun of rulebook for subject.

The pos_pronoun of rulebook is an object based rulebook. The pos_pronoun of rulebook has default success.

pos_pronoun of someone who is _neutrois: say "their".
pos_pronoun of someone who is _male: say "his".
pos_pronoun of someone who is _female: say "her".
pos_pronoun of someone who is _critter: say "its".

[e.g., "Her face looks familiar."]
To say pos_pronoun_cap of (subject - a person):
	say "[pos_pronoun of subject]" in title case.


Book - Time

Minutes_per_turn is a time that varies. Minutes_per_turn is three minutes.

Every turn, increase the time of day by minutes_per_turn minus one minute.

To decide what time is sometime in the hour of (this-time - a time):
	let offset be a random number between 0 and 59;
	decide on offset minutes after this-time;

To decide what time is around the hour of (this-time - a time):
	let offset be a random number between -30 and 30;
	decide on offset minutes after this-time;

Part - The World Turns

A time_period is a kind of value.
Time_periods are morning, afternoon, evening, night.
The current_time_period is a time_period that varies.
The current_time_period is morning.

At 6 AM:
	Now the right hand status line is "Early Morning";

At 9 AM:
	Now the right hand status line is "Late Morning";
	queue_report "Morning is getting on, and the air has lost most of its chill." with priority 3.

At 12 PM:
	Now the current_time_period is afternoon;
	Now the right hand status line is "Midday";
	queue_report "Its high noon (or thereabouts), and your shadow is hiding under your feet." with priority 3.

At 2 PM:
	Now the right hand status line is "Early Afternoon";
	queue_report "The sun is slanting down golden. Gnats are drifting in and out of the sunshine in sparkling clouds." with priority 3.

At 3 PM:
	Now the right hand status line is "Late Afternoon";

At 6 PM:
	Now the current_time_period is evening;
	Now the right hand status line is "Early Evening";
	queue_report "Crickets are warming up for the evening symphony, but it only reminds you that you should be home. You can feel yourself starting to cry. You wish you had your mom, or your grandpa was here. Then you really do cry.
	[paragraph break]Eventually, your tears turn to sniffles and you wipe your eyes with your dirty hands." with priority 2.

At 8 PM:
	Now the current_time_period is night;
	Now the right hand status line is "Night";
	queue_report "The last of the sunset's indigo glow has disappeared from the sky." with priority 3.

Part - Event Reporting

[	We create an way to reporting system for all of the sounds, smells, cats, and other events that happen throughout.

	Priority 1 = important events, i.e. things NPCs say or do, premonitions (said last)
	Priority 3 = isolated events or sounds, i.e. the train
	Priority 5 = foreground repeated actions, i.e. cats, dog
	Priority 7 = ambient repeated sounds, i.e. dog barking
	Priority 9 = anything else (said first)

	We might also prune some of the simultaneous events below priority 3, if the reporting seems too crowded.
]

A turnevent is a kind of thing.
A turnevent has a number called priority.
A turnevent has text called description.
10 turnevents are in Limbo.
A turnevent can be momentous or trivial.

Definition: A turnevent is trivial if it has a priority that is greater than 5.
Definition: A turnevent is momentous if it has a priority that is less than 3.
[note that there are events between the two that are neither trivial nor momentous]

coming_events is a container.
coming_events has a truth state called some things said.

To queue_report (event text - text) with/at priority (event priority - a number):
	Let new event be a random turnevent in Limbo;
	Now the description of new event is event text;
	Now the priority of new event is event priority;
	Now new event is in coming_events;

The show reports rule is listed last in the every turn rulebook.
This is the show reports rule:
	if number of turnevents in coming_events is not 0:
		Let turnevent_list be the list of turnevents in coming_events;
		Sort turnevent_list in reverse priority order;
		[say "Turnevent list: [line break]";
		repeat with item running through turnevent_list:
			say " [priority of item] - [description of item].";]
		Repeat with this_event running through turnevent_list:
			let trivial_count be the number of trivial turnevents in coming_events;
			let momentous_count be the number of momentous turnevents in coming_events;
			let total_count be the number of turnevents in coming_events;
			[say "Total events: [total_count] / Trivial events: [trivial_count] / Momentous events: [momentous_count].";]
			[we don't say trivial events if we have momentous things to report]
			if this_event is trivial and momentous_count is zero:
				[We say each of the trivial events together adding 'And' to the last one.]
				if (trivial_count is 1) and (some things said of coming_events is true):
					let new text be indexed text;
					let new text be the description of this_event;
					replace character number 1 in new text with character number 1 in new text in lower case;
					say "And [new text] [run paragraph on]";
				otherwise:
					say "[description of this_event] [run paragraph on]";
				now some things said of coming_events is true;
			else if this_event is not trivial:
				if some things said of coming_events is true:
					say "[line break][line break]";
				say "[description of this_event][run paragraph on]";
				now some things said of coming_events is true;
			move this_event to Limbo;
		if some things said of coming_events is true:
			say "[line break]";
		[clear events]
		now all turnevents in coming_events are in Limbo;
		now some things said of coming_events is false;

[TODO: Find a new rulebook for the above rule that triggers every turn. As it is, some every turn rules that queue_reports get shown one after another.]

Part - Reporting People Speaking

[ This is a shortcut for queue_report.

 	First it checks to see if speaker is present and sets the current interlocutor.

	In it's simplest form it looks like:

		Report Lee saying "blah blah".

	In practice, multiple people can be speaking, so we set the speaker to the last person who spoke:

		Report Honey saying "'Have you heard from Nick about this summer?' Grandpa asks Honey.[paragraph break]'Nothing. Not a word,' Honey says.";

	By default it reports at priority 2, with priority 1 (printed last) reserved for premonitions and other important things.
]

To report (speaker - person) saying (speech_text - text):
	if player is enclosed by location of speaker:
		queue_report speech_text at priority 2;
		now current interlocutor is speaker;

Book - Scenes

A scene can be dramatic. A scene is usually not dramatic.

Part - Scene_Day_One

There is a scene called Scene_Day_One.
Scene_Day_One begins when play begins.
Scene_Day_One ends when Scene_Night_In_The_Woods begins.

When Scene_Day_One begins:
	[turn this on when beta-testing]
	[start_transcript;]
	say story_intro;
	pause the game;
	say Title_Card_Part_1;
	say "[line break]You've wandered away from Honey and Grandpa picking blackberries.";
	Now the right hand status line is "Late Morning";
	Now the time of day is 9:15 AM.

Chapter - Scene_Picking_Berries

Scene_Picking_Berries is a scene.
Scene_Picking_Berries begins when play begins.
Scene_Picking_Berries ends when Scene_Explorations begins.

Chapter - Scene_Grandparents_Conversation

There is a scene called Scene_Grandparents_Conversation.
Scene_Grandparents_Conversation begins when player is in Room_Grassy_Clearing for the first time.
Scene_Grandparents_Conversation ends when Scene_Explorations begins.

When Scene_Grandparents_Conversation begins:
	try saying hello to Grandpa;
	now current interlocutor is Grandpa;
	start_seq_grandparents_chat in one turn from now;
	continue the action.

At the time when start_seq_grandparents_chat:
	now seq_grandparents_chat is in-progress;

Chapter - Scene_Explorations

Scene_Explorations is a scene.
Scene_Explorations begins when player is free_to_wander.
Scene_Explorations ends when Scene_Walk_With_Grandpa begins.

When Scene_Explorations begins:
	Now the time of day is 11:30 AM.

Chapter - Scene_Walk_With_Grandpa

[ This is a scene that begins
	* after Scene_Explorations
	* after player has been to dirt road and seen dog
	* when player is near blackberry clearing ]

There is a scene called Scene_Walk_With_Grandpa.
Scene_Walk_With_Grandpa begins when player has been in Region_Trailer_Indoors and player is in Room_Grassy_Clearing.
Scene_Walk_With_Grandpa ends when Grandpa has been in Room_Grandpas_Trailer and Grandpa is not in Room_Grandpas_Trailer.

When Scene_Walk_With_Grandpa begins:
		now big_bucket is full;
		now seq_grandparents_chat is not in-progress;
		now journey_gpa_walk is in-progress;

When Scene_Walk_With_Grandpa ends:
	now big_bucket is empty.

Chapter - Scene_Helping_Grandpa

There is a scene called Scene_Helping_Grandpa.

Chapter - Scene_Helping_the_Cat_Lady

There is a scene called Scene_Helping_the_Cat_Lady.

[TODO: Implement helping Cat Lady get cat off roof.]

Chapter - Scene_Sheriffs_Drive_By

Scene_Sheriffs_Drive_By is a dramatic scene.
Scene_Sheriffs_Drive_By begins when player has been in Region_Trailer_Park_Area for eight turns and Scene_Tea_Time is not happening and Scene_Hangout_With_Lee is not happening and Scene_Making_Sandwiches is not happening and grandpa is not in Region_Trailer_Park_Area.
Scene_Sheriffs_Drive_By ends when the time since Scene_Sheriffs_Drive_By began is greater than 2 minutes and sheriffs_car is not in Room_D_Loop.

When Scene_Sheriffs_Drive_By begins:
	now seq_sheriffs_drive_by is in-progress;

Chapter - Scene_Visit_With_Sharon

There is a recurring scene called Scene_Visit_With_Sharon.
Scene_Visit_With_Sharon begins when player is in Room_D_Loop.
[ The following is a workaround because the valid code
	Scene_Visit_With_Sharon ends when Scene_Sheriffs_Drive_By begins or (player is not in Room_D_Loop and player is not in Room_Sharons_Trailer).
does not compile - http://inform7.com/mantis/view.php?id=575]
Scene_Visit_With_Sharon ends when Scene_Sheriffs_Drive_By begins.
Scene_Visit_With_Sharon ends when player is not in Room_D_Loop and player is not in Room_Sharons_Trailer.

When Scene_Visit_With_Sharon begins:
	try saying hello to Sharon;
	if Scene_Tea_Time has not happened:
		now seq_sharon_invite is in-progress.

Chapter - Scene_Tea_Time

Scene_Tea_Time is a dramatic scene.
Scene_Tea_Time begins when player has been in Room_Sharons_Trailer for two turns and Scene_Sheriffs_Drive_By is not happening.
Scene_Tea_Time ends when seq_sharon_teatime is run and seq_sharon_teatime is not in-progress.

When Scene_Tea_Time begins:
	now seq_sharon_teatime is in-progress;
	now Sharon is ready-for-tea-time;

Chapter - Scene_Visit_With_Lee

There is a recurring scene called Scene_Visit_With_Lee.
Scene_Visit_With_Lee begins when player is in Room_C_Loop.
Scene_Visit_With_Lee ends when player is not in Room_C_Loop and player is not in Room_Lees_Trailer.

When Scene_Visit_With_Lee begins:
	try saying hello to Lee;
	if Scene_Hangout_With_Lee has not happened:
		now seq_lee_invite is in-progress.

Chapter - Scene_Hangout_With_Lee

Scene_Hangout_With_Lee is a dramatic scene.
Scene_Hangout_With_Lee begins when player has been in Room_Lees_Trailer for one turn and Scene_Sheriffs_Drive_By is not happening.
Scene_Hangout_With_Lee ends when seq_lee_hangout is run and seq_lee_hangout is not in-progress.

When Scene_Hangout_With_Lee begins:
	now seq_lee_hangout is in-progress;

Chapter - Scene_Visit_With_Mary

There is a scene called Scene_Visit_With_Mary.
Scene_Visit_With_Mary begins when player is in Room_Grandpas_Trailer.
Scene_Visit_With_Mary ends when player is not in Room_Grandpas_Trailer.

When Scene_Visit_With_Mary begins:
	try saying hello to Aunt Mary;
	now current interlocutor is Mary.

Chapter - Scene_Mary_Suggestion

Scene_Mary_Suggestion is a dramatic scene.
Scene_Mary_Suggestion begins when Scene_Walk_With_Grandpa is happening and player has been in Room_Grandpas_Trailer for two turns and Grandpa has not been in Room_Grandpas_Trailer.
[Scene_Mary_Suggestion is ended by the seq_mary_suggestion sequence]
Scene_Mary_Suggestion ends when seq_mary_suggestion is run and seq_mary_suggestion is not in-progress.

When Scene_Mary_Suggestion begins:
	now seq_mary_suggestion is in-progress;
	now the time of day is 1:55 PM.

Chapter - Scene_Making_Sandwiches

Scene_Making_Sandwiches is a dramatic scene.
Scene_Making_Sandwiches begins when Scene_Walk_With_Grandpa ends.
[Scene_Making_Sandwiches is ended by the seq_mary_sandwich sequence]
Scene_Making_Sandwiches ends when seq_mary_sandwich is run and seq_mary_sandwich is not in-progress.

When Scene_Making_Sandwiches begins:
	now seq_mary_sandwich is in-progress.

Chapter - Scene_Bringing_Lunch

There is a scene called Scene_Bringing_Lunch.
Scene_Bringing_Lunch begins when Scene_Making_Sandwiches ends.
Scene_Bringing_Lunch ends when Scene_Across_the_Creek begins.

When Scene_Bringing_Lunch begins:
	now dog is loose;
	[now Grandpa is navbiguous;]
	the log_bridge_forms in 50 turns from now.

At the time when the log_bridge_forms:
	now bridge_log_west is in Room_Crossing;
	now pool_log is in Limbo


Chapter - Scene_Across_the_Creek

There is a scene called Scene_Across_the_Creek.
Scene_Across_the_Creek begins when player has been in Room_Wooded_Trail.
Scene_Across_the_Creek ends when Scene_Night_In_The_Woods begins.

When Scene_Across_the_Creek begins:
	Now the time of day is 4:10 AM.


Part - Scene_Night_In_The_Woods

There is a scene called Scene_Night_In_The_Woods.
Scene_Night_In_The_Woods begins when landmark_nav_counter is 3.
Scene_Night_In_The_Woods ends when Scene_Dreams begins.

When Scene_Night_In_The_Woods begins:
	now landmark_nav_counter is 0;
	say "[lost_in_the_woods_payoff]";
	pause the game;
	say Title_Card_Part_2;
	Now the right hand status line is "Evening";
	Let this_thing be random elusive_landmark in Room_Dark_Woods_South;
	Now this_thing is in  Room_Dark_Woods_North;
	Now player is in Room_Dark_Woods_North;


Chapter - Scene_STOP

There is a scene called Scene_STOP.
Scene_STOP begins when player is in Room_Forest_Meadow for first time.
Scene_STOP ends when player is in Room_Protected_Hollow.

When Scene_STOP begins:
	now seq_jody_stop is in-progress.

When Scene_STOP ends:
	now seq_jody_stop is not in-progress.

[S.T.O.P.
S stands for SIT DOWN.
T is for THINK.
O is for OBSERVE.
P stands for PLAN.

Survival priorities: In extreme conditions…

1. You can live 3 hours without shelter.
2. You can live 3 days without water.
3. You can live 3 weeks without food.
]

Chapter - Scene_Make_Shelter

There is a scene called Scene_Make_Shelter.
Scene_Make_Shelter begins when Scene_STOP ends.
Scene_Make_Shelter ends when Room_Protected_Hollow is made_cozy.
[scene ends when player has stacked sticks and moved leaves into fort]


Chapter - Scene_Sleep_One

There is a scene called Scene_Sleep_One.
Scene_Sleep_One begins when
	Room_Protected_Hollow is made_cozy and
	Scene_Defend_the_Fort has not happened and
	Scene_Dreams has not happened.
Scene_Sleep_One ends when
	Scene_Defend_the_Fort begins.

When Scene_Sleep_One begins:
	Now the right hand status line is "Night";
	say "Warm in your cozy nest, you are pretty sure you could sleep.";

Instead of sleeping during Scene_Sleep_One:
	if Room_Protected_Hollow is not made_cozy:
		say "You are too cold to sleep.";
	else:
		now player is asleep;
		say Sleep_Card;
		say "...and are awakened what seems like seconds later. You heard a noise very nearby.";
		try looking;

When Scene_Sleep_One ends:
	now player is awake;

Chapter - Scene_Defend_the_Fort

There is a scene called Scene_Defend_the_Fort.
Scene_Defend_the_Fort begins when
	Scene_Sleep_One is happening and
	player is asleep.
Scene_Defend_the_Fort ends when raccoons are not in Region_Woods_Area.

When Scene_Defend_the_Fort begins:
	now raccoons are in Room_Forest_Meadow;
	now virtual_raccoons are in Room_Protected_Hollow;
	now seq_raccoon_visit is in-progress;

Instead of sleeping during Scene_Defend_the_Fort:
	say "There is no way you are sleeping while wolves or bears are trying to eat you.";

Chapter - Scene_Sleep_Two

There is a scene called Scene_Sleep_Two.
Scene_Sleep_Two begins when
	Room_Protected_Hollow is made_cozy and
	Scene_Defend_the_Fort has ended and
	Scene_Dreams has not happened.
Scene_Sleep_Two ends when
	Scene_Dreams ends.

When Scene_Sleep_Two begins:
	say "Again, warm in your cozy nest, you are pretty sure you could sleep.";

Instead of sleeping during Scene_Sleep_Two:
	if Room_Protected_Hollow is not made_cozy:
		say "Again, you are too cold to sleep.";
	else:
		now player is asleep;
		say Sleep_Card;

Chapter - Scene_Dreams

There is a scene called Scene_Dreams.
Scene_Dreams begins when
	Scene_Sleep_Two is happening and
	player is asleep.
Scene_Dreams ends when Scene_Dog_Dream has happened and player is awake.

When Scene_Dreams begins:
	Now the time of day is 9:15 PM;
	Now the right hand status line is "";
	Now Honey is in Room_Dream_Railroad_Tracks;
	Now grandpa is in Room_Dream_Railroad_Tracks;
	store_all_your_stuff;
	Now flattened coin is in Room_Dream_Railroad_Tracks;
	Now player is asleep;
	Move the player to Room_Car_With_Mom;

When Scene_Dreams ends:
	now seq_dog_convo is not in-progress;
	say "[line break]The dog wags its tail and fades. You slowly shake off the cobwebs of an altogether strange night.";
	pause the game;
	say Title_Card_Part_3;

test dreams with "teleport to meadow / purloin brown paper bag / z / z / z / z / drop paper bag / go to hollow / pile leaves / sleep / z / z / z / sleep"

[During Scene_Dreams player cannot move to next location until the scene for that location is finished]

Chapter - Scene_Dream_About_Drive_In

There is a scene called Scene_Dream_About_Drive_In.
Scene_Dream_About_Drive_In begins when Scene_Dreams begins.
Scene_Dream_About_Drive_In ends when player has been in Room_Drive_In
	and (player holds popcorn or player holds Milk Duds).

Chapter - Scene_Dream_about_Mom

There is a scene called Scene_Dream_about_Mom.
Scene_Dream_about_Mom begins when Scene_Dreams begins.
Scene_Dream_about_Mom ends when player is in Room_Drive_In.

Mom_free_to_go is truth state that varies.
	Mom_free_to_go is false.

When Scene_Dream_about_Mom begins:
	now seq_mom_watching_movie is in-progress

When Scene_Dream_about_Mom ends:
		now seq_mom_watching_movie is not in-progress

Chapter - Scene_Dream_Have_To_Pee

There is a scene called Scene_Dream_Have_To_Pee.
Scene_Dream_Have_To_Pee begins when Scene_Dream_About_Drive_In is happening and the index of seq_mom_watching_movie is 5.
Scene_Dream_Have_To_Pee ends when player has been in Room_Restroom.

[Reminder that you have to pee every few turns]
Every turn during Scene_Dream_Have_To_Pee:
	queue_report "[one of]You suddenly realize that you've been holding it, and you really have to pee[or][one of]You really have to go[or]You do a little dance, your body reminding you that you really have to go[or]Your really really really don't want to wet yourself[cycling][stopping]." with priority 1.

Chapter - Scene_Dream_About_Stepdad

There is a scene called Scene_Dream_About_Stepdad.
Scene_Dream_About_Stepdad begins when player is in Room_Camaro_With_Stepdad.
Scene_Dream_About_Stepdad ends when player is in Room_Dream_Grassy_Field.

stepdad_free_to_go is a truth state that varies.
	stepdad_free_to_go is false.

When Scene_Dream_About_Stepdad begins:
	now seq_stepdad_in_car is in-progress.

When Scene_Dream_About_Stepdad ends:
	now seq_stepdad_in_car is not in-progress.


Chapter - Scene_Dream_About_the_Tango

[
	a scene that triggers tango reports,
	but does not keep player in location (that restriction will be cleared when sheriff arrives)
]

There is a scene called Scene_Dream_About_the_Tango.
Scene_Dream_About_the_Tango begins when player is in Room_Dream_Grassy_Field.
Scene_Dream_About_the_Tango ends when player is in Room_Dream_Railroad_Tracks.

When Scene_Dream_About_the_Tango begins:
	sheriff_plays_music in 2 turn from now;
	[we do this so whatever action is in progress doesn't mess up the reporting rules because sheriff is already there]
	sheriff_goes_to_field in 3 turn from now;

At the time when sheriff_plays_music:
	queue_report "Suddenly, the sheriff rolls up in his car. Neither the Cat Lady nor Lee look at him. The sheriff pops out of his car with a big box, no an accordion! and begins playing music. It's a funny tune and somehow you know it's an Argentine Tango. The Cat Lady and Lee begin to dance." with priority 2;
	now the sheriff is in Limbo;
	now the sheriffs_car is in Room_Dream_Grassy_Field;

At the time when sheriff_goes_to_field:
	now the dream_sheriff is in Room_Dream_Grassy_Field.

Chapter - Scene_Dream_Tracks

There is a scene called Scene_Dream_Tracks.
Scene_Dream_Tracks begins when player is in Room_Dream_Railroad_Tracks.
Scene_Dream_Tracks ends when player is in Room_Mars.

Grandparents_track_done is truth state that varies. Grandparents_track_done is false.

When Scene_Dream_Tracks begins:
 	now seq_grandparents_tracks is in-progress;
	now Honey is in Room_Dream_Railroad_Tracks;
	now Grandpa is in Room_Dream_Railroad_Tracks;

When Scene_Dream_Tracks ends:
 	now seq_grandparents_tracks is not in-progress;
	now Honey is in Room_Mars;
	now Grandpa is in Room_Mars;

Chapter - Scene_Dream_Bouncing

There is a scene called Scene_Dream_Bouncing.
Scene_Dream_Bouncing begins when player is in Room_Mars.
Scene_Dream_Bouncing ends when mars_free_to_go is true.

mars_free_to_go is truth state that varies. mars_free_to_go is false.

When Scene_Dream_Bouncing begins:
 	now seq_grandparents_bounce is in-progress.

Chapter - Scene_Mars_Dream

There is a scene called Scene_Mars_Dream.
Scene_Mars_Dream begins when player is in Room_Mars.
Scene_Mars_Dream ends when player is in Room_Dream_Dirt_Road.

Chapter - Scene_Dog_Dream

Scene_Dog_Dream is a dramatic scene.
Scene_Dog_Dream begins when player is in Room_Dream_Dirt_Road.
Scene_Dog_Dream ends when dog_free_to_go is true.

dog_free_to_go is truth state that varies. dog_free_to_go is false.

When Scene_Dog_Dream begins:
	now seq_dog_convo is in-progress;

Part - Scene_Day_Two

There is a scene called Scene_Day_Two.
Scene_Day_Two begins when Scene_Dreams has ended.

When Scene_Day_Two begins:
	unstore_all_your_stuff;
	now player is in Room_Protected_Hollow;
	now player is awake;
	Now the right hand status line is "Morning";
	Now Sharon is in Room_Other_Shore;
	Now Lee is in Room_Blackberry_Tangle;

test day2 with "purloin brown paper bag / d / d / d / pick berries / pick berries / pick berries/teleport to other shore / go to willow trail / again / go to nav-landmark / again / again / go to meadow / purloin brown paper bag / z / z / z / z / drop paper bag / go to hollow / pile leaves / sleep / z/z/z / sleep / z/z/z/z / get out / go to bathroom / again/ exit/ get popcorn/ go to car/ again/ z/z/z/z/z/z/z/z/z/z/z/z/z/z/z/jump/z/z/z/z/ go to tracks/go on/ z/z/z/z/z/z/ go on/ go on/ z/z/z/z/z/z/z/wake up".

Chapter - Morning After

There is a scene called Scene_Morning_After.
Scene_Morning_After begins when Scene_Day_Two is happening and player is in Room_Forest_Meadow.

Chapter - Scene_Orienteering

There is a scene called Scene_Orienteering.
Scene_Orienteering begins when Scene_Morning_After begins.
Scene_Orienteering ends when player is in Room_Sentinel_Tree.

When Scene_Orienteering begins:
	Change up exit of Room_Forest_Meadow to Room_Sentinel_Tree;
	queue_report "It's time to figure out where you are. Perhaps if you could get a view of the surrounding area." with priority 2;

When Scene_Orienteering ends:
	Change south exit of Room_Forest_Meadow to Room_Dark_Woods_North;
	Change west exit of Room_Forest_Meadow to Room_Dappled_Forest_Path;
	Change south exit of Room_Dark_Woods_North to Room_Dark_Woods_South;
	Change south exit of Room_Dark_Woods_South to Room_Wooded_Trail;
	Change northwest exit of Room_Dark_Woods_North to Room_Dappled_Forest_Path;
	now player is aware_of_compass_directions;
	now player is not discouraged_from_compass_navigating;

Chapter - Scene_Foraging_for_Breakfast

There is a scene called Scene_Foraging_for_Breakfast.
Scene_Foraging_for_Breakfast begins when Scene_Morning_After begins.
Scene_Foraging_for_Breakfast ends when Scene_Found begins.

When Scene_Foraging_for_Breakfast begins:
	now player is hungry.

Every turn during Scene_Foraging_for_Breakfast:
	if the remainder after dividing the turn count by 2 is 0:
		queue_report "[one of]You are quite hungry[or]You didn't have dinner (or lunch!) yesterday, so you are really quite famished[or]You find you are really hungry. Perhaps you can forage something like a good Exporer Scout[cycling]." with priority 1.

[TODO: If player eats berries in pail, they should no longer be hungry.]

Chapter - Scene_Out_of_the_Woods

There is a scene called Scene_Out_of_the_Woods.
Scene_Out_of_the_Woods begins when Scene_Day_Two is happening and (player is in Room_Dappled_Forest_Path or player is in Room_Dark_Woods_South).
Scene_Out_of_the_Woods ends when Scene_Found begins.

Every turn during Scene_Out_of_the_Woods:
	if player is in Room_Wooded_Trail:
		queue_report "[one of]You think you hear someone calling you from up ahead.[or]Is that the Cat Lady calling you?[or]Someone is calling you.[at random]" at priority 1;
	else if player is in Room_Dappled_Forest_Path:
		queue_report "[one of]You think you hear someone calling you from up ahead.[or]Is that Lee calling you?[or]Someone is calling you.[at random]" at priority 1;

Chapter - Scene_Found

There is a scene called Scene_Found.
Scene_Found begins when Scene_Day_Two is happening and (player is in Room_Blackberry_Tangle or player is in Room_Other_Shore).
Scene_Found ends when player is in Room_Grassy_Field.

When Scene_Found begins:
	if player is in Room_Blackberry_Tangle:
		now journey_lee_walk is in-progress;
	else if player is in Room_Other_Shore:
		now journey_sharon_walk is in-progress;

Test found with "test day2 / get up / climb pine tree / d".

Chapter - Scene_Reunions

There is a scene called Scene_Reunions.
Scene_Reunions begins when Scene_Found ends.

Instead of room_navigating or going during Scene_Reunions:
	say "Now that you are home, you don't want to go anywhere else.".

Chapter - Scene_Long_Arm_of_the_Law

There is a scene called Scene_Long_Arm_of_the_Law.
Scene_Long_Arm_of_the_Law begins when Scene_Day_Two is happening and player has been in Region_Trailer_Park_Area for 5 turns
[scene ends when sherriff leaves]

Chapter - Scene_Parents_Arrive

There is a scene called Scene_Parents_Arrive.
Scene_Parents_Arrive begins when Scene_Reunions ends.

Chapter - Scene_Fallout

There is a scene called Scene_Fallout.


Book - Storytelling Elements

Part - Title Cards

[When play begins:
	say story_intro;
	pause the game;
	say Title_Card_Part_1;
	say "[line break]You've wandered away from Honey and Grandpa picking blackberries.";
	now the right hand status line is "Late Morning".]

Banner_displayed is truth state that varies. Banner_displayed is false.
To say story_intro:
	say "Looking back, it was that summer, or maybe just that one day that changed everything. [paragraph break]KC and the Sunshine Band was on the radio, your mom and Honey and Grandpa loved you, and you were eight years old. A fragile moment that seemed like it would last forever and would never be quite the same again. You were a curious daydreamer on the verge of learning what lay beyond the boundaries of your own little world.
	[paragraph break]There were changes coming -- and there was nothing certain about whether you'd survive the journey. Or not.[line break]";
	[[line break][banner text]";
	Now banner_displayed is true.]

[Rule for printing the banner text when banner_displayed is true: do nothing.]

To say Title_Card_Part_1:
	clear the screen;
	say paragraph break;
	say "[first custom style]Part 1[line break]";
	say "[second custom style]A Fateful Day[line break]";
	say paragraph break;
	say line break;
	say italic type;
	say "[second custom style]Memories may be beautiful and yet[line break][second custom style]What's too painful to remember[line break]
	[second custom style]We simply choose to forget[line break]
	[second custom style]-- Gladys Knight And The Pips, 1975";
	say roman type;
	say paragraph break;
	pause the game;

To say Title_Card_Part_2:
	clear the screen;
	say paragraph break;
	say "[first custom style]Part 2[line break]";
	say "[second custom style]Lost[line break]";
	say paragraph break;
	say line break;
	say "[second custom style]Now my old world is gone for dead[line break]
	[second custom style]Cos I can't get it out of my head.[line break]
	[second custom style]-- Electric Light Orchestra, 1975";
	say roman type;
	say paragraph break;
	pause the game;

To say Title_Card_Part_3:
	clear the screen;
	say paragraph break;
	say "[first custom style]Part 3[line break]";
	say "[second custom style]Fallout[line break]";
	say paragraph break;
	say line break;
	say "[second custom style]Butterflies are free to fly [line break]
	[second custom style]Fly away[line break]
	[second custom style]high away[line break]
	[second custom style]bye bye [line break]
	[second custom style]-- Elton John, 1975";
	say roman type;
	say paragraph break;
	pause the game;

To say Sleep_Card:
	say "[one of]You are surprisingly tired. You nod off almost immediately[or]After your long day, you find that you can't keep your eyes open for another moment.[in random order]";
	pause the game;
	clear only the main screen;

To pause the/-- game:
say "[paragraph break]Press any key to continue.";
wait for any key;
clear the screen.

Part - Premonitions

[
	These are not really a separate kind of thing, but they help set the mood, tension, and to some degree the pacing of the story, so we've gathered them all here. (I suspect there are more premonition-like things scattered around however.)
]

When Scene_Grandparents_Conversation begins:
	queue_report "[italic type]You get a funny, sad feeling out of nowhere, that this is the last time you will pick berries with Honey and Grandpa.[roman type]" with priority 1;
	continue the action.

After going to Room_Dirt_Road for the first time:
	queue_report "[italic type]This dog makes you suddenly queasy, though you couldn't have known then what part it would play in what happened.[roman type]" with priority 1;
	continue the action.

To do Sharon_Teatime_Premonition:
	queue_report "[italic type]A sudden thought: What if you are here talking to the Cat Lady and something happens to your Grandpa or Honey? Or worse, your mom? You struggle to think about something else.[roman type]" at priority 1.

To say Lee_Invite_Premonition:
	say "[italic type]You remember your grandma's warning and suddenly feel [nervous], but something tells you it will be okay. You couldn't say why, but you trust Lee.[roman type]".

When Scene_Bringing_Lunch begins:
	Premonition_About_Something_Wrong in 30 turns from now;
	continue the action.

At the time when Premonition_About_Something_Wrong:
	queue_report "[italic type]You get a feeling something is wrong. What if something happened to your grandpa?[roman type]" with priority 1;

After going to Room_Long_Stretch during Scene_Bringing_Lunch:
	if player is not dog_warned:
		queue_report "[italic type]Something is different. The hairs on your arm and the back of your neck stand up.[roman type]" at priority 1;
		now player is dog_warned;
	continue the action.

After going to Room_Crossing for the first time:
	queue_report "[italic type]Something about the crossing makes you [nervous] like watching a glass fall off of a countertop in slow motion.[roman type]" at priority 1;
	continue the action.

After going to Room_Dirt_Road during Scene_Bringing_Lunch:
	Premonition_About_Another_Way in three turns from now;
	continue the action.

At the time when Premonition_About_Another_Way:
	queue_report "[italic type]You've got to get back to the clearing. There must be another way.[roman type]" at priority 1;

To say Sharon_Stepdad_Premonition:
	say "[italic type]For a moment, you share her vision -- a rocky shore stretching for miles and miles -- a child picking among the rocks completely and hopelessly alone. [roman type]".

After going to Room_Dark_Woods_South during Scene_Across_the_Creek:
	Woods_Premonition in one turn from now;
	continue the action;

At the time when Woods_Premonition:
	say "[italic type]You get a funny feeling like the forest is looking back at you, and you shiver[roman type].";

Part - Payoffs

To say blackberry_payoff:
	say "That should be enough to satisfy Honey.
	[paragraph break]Even though you love picking blackberries -- and you certainly love blackberry jam, blackberry pie, blackberries and cream, or just eating fresh blackberries -- you've been picking berries all morning. You must have picked a [italic type]million[roman type] pails already. And you want to see if the red ants ate the dead cricket you put near their hole. Oh, and you want to see if you can find a lucky penny. And you may even want to swim.".

To say swimming_payoff:
	say "You stand at the edge of the rocks curling your toes over the edge. You hesitate before jumping in. At the count of three. One. Two.
	[paragraph break]Two and a half.[paragraph break]
	Two and three quarters.
	[paragraph break]THREE!
	[paragraph break]You jump in feet first and plummet straight down, the world of air and trees and clouds receding far above. You go down down down letting yourself fall slowly until you feel a jolt as your feet bump the rocks at the bottom of the pool.
	[paragraph break]In the moment before you run out of air, you look up at an enchanted underwater world. Fingers of sunlight flicker through the green twilight. Even the very water around you shimmers before your eyes.
	[paragraph break]You push off the bottom and return to the surface with a gasp of delicious air and climb back up on the rocks. You feel courageous".

To say crossing_payoff:
	say "You made it across the creek.
	[paragraph break]You look back at your precarious bridge. You can't believe you made it over the rocks and over that piece of driftwood! Yeah! Heck with that stupid dog.
	[paragraph break]Now you can make it back to Grandpa and Honey. This is the other side of the river, an area you've never been, but you think it connects with the overgrown blackberry trail. it's darker here and a little cooler. The woods look kind of scary on this side, and it makes you [nervous]. But you remind yourself that trees are just trees, there is nothing to be afraid of in the woods.".

To say treetop_payoff:
	say "Looking around, you can see the [italic type]whole world[roman type].
	[paragraph break]Directly under you, you can see the dirt road and Bear Creek and the stone bridge, and you notice there is a place you might cross the creek below the swimming hole.
	[paragraph break]In the distance, you can see the mountains, brown and green, edged with trees all the way around, and not just Bear Creek below you, but the river a ways over there. And out that way is town, barely visible through trees.  And the forest stretching out endlessly in every direction.
	[paragraph break]The railroad tracks which wind gently from one direction pass almost beneath you and disappear in gentle S-curves in the other direction. You can see the trailer park and that might be Honey and Grandpa's trailer. Everything looks so small, like looking at an ant hill. A giddy feeling pushes up out of you, and you can't stop laughing.";

To say lost_in_the_woods_payoff:
	say "The afternoon shadows are lengthening and it is slowly getting on toward evening. You should be home by now. Honey and Grandpa will be worried. You fight back a brief wave of misery and trudge on. But it's no use. Part of the time you are pretty sure you are going in circles. The rest of the time you are scared you are getting lost deeper in the forest.
	[paragraph break]For a while there, you felt you were close to finding your way back, but now everything looks completely unfamiliar -- and to be honest, a bit sinister. Like the forest is trying to [italic type]keep[roman type] you here, to lead you astray, lead you deeper into the woods. The trees lean in toward you. The underbrush grabs as your clothing.
	[paragraph break]But no, that's stupid. You fight back panic. It's nobody's fault but your own. You should have been more careful, more observant. A good Explorer Scout would never get lost like this. Stupid stupid stupid, you berate yourself. Again, you think about your Honey and Grandpa at home. The smell of blackberry jam cooking. Watching TV on the floor with your grandpa. And your mom.  It's all too much.
	[paragraph break]You have to admit it: You are hopelessly lost.
	[paragraph break]You sit down right where you are and sob miserably.";

Book - Sequence Mechanics

Part - Action Sequences

[	Questions:
		* How is this run during each turn?
			An every turn thing?
			An every turn during a scene thing?
			Or just scheduled for next move?
		* How do we remember the important deets about each sequence while it is running?
			A: If sequences are their own kind of thing, they can keep track of their own deets, e.g., have_run, seq_index

	Flow of sequencer:
		Check if interrupted, if yes, delay one turn
		Increment sequence count
		Get action associated with this count
		Do it ]

Chapter - The Properties

A sequence is a kind of thing.

A sequences has a rule called the action_handler.

A sequences has a rule called the interrupt_test.

A sequences has a number called the index.

A sequences has a number called the length_of_seq.

A sequences has a number called the turns_so_far.

A sequence can be in-progress.
	It is usually not in-progress.

A sequence can be run.
	It is usually not run.

Chapter - The Mechanics

Every turn:
	repeat with this_seq running through every in-progress sequence:
		step a sequence for this_seq;

To step a sequence for (this_seq - a sequence):
	now this_seq is run;
	increase turns_so_far of this_seq by one;
	follow the interrupt_test of this_seq;
	if rule failed and number of in-progress rants is zero:
		increase index of this_seq by one;
		follow the action_handler of this_seq;
		if rule failed:
			decrease index of this_seq by one;
		if index of this_seq is the length_of_seq of this_seq:
			now this_seq is not in-progress;
			now index of this_seq is zero;
	[say "Sequence [this_seq] - in progress (turns: [turns_so_far of this_seq]; index: [index of this_seq]; actions: [length_of_seq of this_seq]).";]

Chapter - An Example

[
	Lee's Visit Sequence - An Example
]

[seq_lees_visit is a sequence.
	The action_handler is the seq_lees_visit_handler rule.
	The interrupt_test is seq_lees_visit_interrupt_test rule.
	The length_of_seq is 3.

This is the seq_lees_visit_handler rule:
	let index be index of seq_lees_visit;
	if index is 1:
		say "Lee busts in and says, 'Duuuuuude, whaz up?'";
		now lee is in Room_Lees_Trailer;
	else if index is 2:
		say "Lee looks you up and down, 'Where you been, man. You look like shit.'";
	else if index is 3:
		say "Seriously, dude. You better go take a shower and change your clothes.";

This is the seq_lees_visit_interrupt_test rule:
	if we are speaking to Lee, rule succeeds;
	if player is not in Room_Lees_Trailer, rule succeeds;
	rule fails.

After going to Room_Lees_Trailer:
	now seq_lees_visit is in-progress;
]


Part - NPC_Journeys

Chapter - The Properties

[TODO: Make it so the player can simply type "follow [npc]"]

An npc_journey is a kind of thing.

An npc_journey can be in-progress.
	It is usually not in-progress.

An npc_journey can be run.
	It is usually not run.

An npc_journey has a person called the npc.

An npc_journey has a room called the origin.

An npc_journey has a room called the destination.

[How long has the NPC been in this location]
An npc_journey has a number called time_here.
	Time_here is usually zero.

[How long does the NPC want to wait at each location]
An npc_journey has a number called wait_time.
	Wait_time is usually 1.

[How long does the NPC wait if the player's not there]
An npc_journey has a number called max_wait.
	Max_wait is usually 3.

[Does the NPC wait for the player?]
An npc_journey has a truth state called waits_for_player.
	Waits_for_player is usually true.

[Did we arrive?]
An npc_journey has a truth state called arrived.
	Arrived is usually false.

An npc_journey has a rule called the interrupt_test.

An npc_journey has a rule called the action_at_start.

An npc_journey has a rule called the action_at_end.

An npc_journey has a rule called the action_before_moving.

An npc_journey has a rule called the action_after_waiting.

An npc_journey has a rule called the action_catching_up.

Chapter - The Mechanics

Every turn:
	repeat with this_journey running through every in-progress npc_journey:
		take one step on this journey for this_journey;

To take one step on this journey for (this_journey - an npc_journey):
	[
		set some local vars to make things easier
	]
	let npc be the npc of this_journey;
	let origin be the origin of this_journey;
	let destination be the destination of this_journey;
	now this_journey is run;
	now npc of this_journey is described;
	[increment the counter for this location]
	increment time_here of this_journey;
	[say "DEBUG: [npc] has been at [location of npc] for [time_here of this_journey] turns.";]
	[
		If NPC is still at origin, we do origin things.
	]
	if location of npc is origin:
		[say "DEBUG: [npc] is at the origin, [location of npc].";]
		[if player is not here:]
		if location of npc does not enclose player:
			[don't increment the count.]
			decrement time_here of this_journey;
		[if player is here:]
		else:
			[do/continue start of journey actions]
			follow the action_at_start of this_journey;
	[
		IF NPC is on their joourney...
	]
	if location of npc is not destination:
		[
			Determine if player is ahead or behind NPC.
		]
		let npc_moves be the number of moves from the location of npc to destination;
		let player_moves be the number of moves from the location of the player to destination;
		[
			If player is ahead of NPC, we catch up to them.
		]
		if player_moves is less than npc_moves:
			[say "DEBUG: [npc] thinks you are ahead of her.";]
			[move the npc to player's location]
			move npc to location of player;
			[say "DEBUG: [npc] is moving to player's location.";]
			[reset counter]
			now time_here of this_journey is one;
			[do catchup action]
			follow the action_catching_up of this_journey;
		[
			If player is behind NPC, NPC waits or moves on.
		]
		else if player_moves is greater than npc_moves:
			[say "DEBUG: [npc] thinks you are behind them.";]
			[say "DEBUG: [npc] has been waiting [time_here of this_journey] turns at [location of npc].";]
			[
				Is the NPC ready to move?
			]
			[...as long as NPC is not at destination already]
			if location of npc is not destination:
				[If NPC is ready to move:]
				if npc is ready to move on this_journey:
					[say "DEBUG: [npc] is ready to move.";]
					[If NPC should wait:]
					if waits_for_player of this_journey is true:
						say "[npc] is waiting for you[one of][or] [casual_name of location of NPC][cycling]. You should probably get going.";
						[say "DEBUG: [npc] will wait for you [max_wait of this_journey] turns.";]
						[if npc has not been waiting max time:]
						if time_here of this_journey <  max_wait of this_journey:
							[say "DEBUG: [npc] is still waiting for you.";]
							[stop the action]
							stop the action;
					[Move NPC one move ahead.]
					let heading be the best route from location of npc to destination;
					let next_room be the room heading from location of npc;
					try silently npc going heading;
					[say "DEBUG: [npc] is moving to [next_room].";]
					[Reset counter.]
					now time_here of this_journey is zero;
		[
			Otherwise, if player is here, NPC waits or moves on.
		]
		else if location of npc encloses player:
			[say "DEBUG: [npc] thinks you are here.";]
			[If NPC has been waiting too long (and not at origin), NPC moves on.]
			if time_here of this_journey > wait_time of this_journey and location of npc is not origin:
				[do grumpy wait action]
				[say "DEBUG: [npc] is grumpy because they had to wait for you.";]
				follow the action_after_waiting of this_journey;
			[If NPC is ready to move, NPC says something and moves on.]
			if npc is ready to move on this_journey:
				[do moving action]
				follow the action_before_moving of this_journey;
				[move npc one step ahead]
				let heading be the best route from location of npc to destination;
				let next_room be the room heading from location of npc;
				try silently npc going heading;
				[say "DEBUG: [npc] is moving to [next_room].";]
				[Reset counter]
				now time_here of this_journey is zero;
	[
		If NPC is at destination, we do destination things (if the player is there).
	]
	if location of npc is destination:
		[say "DEBUG: [npc] is at the destination, [location of npc].";]
		[If player is not here:]
		if location of npc does not enclose player:
			[Reset counter]
			now time_here of this_journey is zero;
		[if player is here:]
		else:
			[do end of journey actions]
			[say "DEBUG: npc: [npc], npc location: [location of npc]; here: [time_here of this_journey], npc at destination: [if location of npc is destination]yes[else]no[end if]; player location: [location of player]; player here: [if location of npc encloses player]yes[else]no[end if].";]
			follow the action_at_end of this_journey;
			[if rule succeeds, stop the journey]
			if rule succeeded:
				[this_journey is not in-progress]
				now this_journey is not in-progress;


[
	[
		Determine if player is ahead or behind
	]
	let npc_moves be the number of moves from the location of npc to destination;
	let player_moves be the number of moves from the location of the player to destination;
	[if player is ahead, do catchup action immediately]
	if player_moves is less than npc_moves:
		move npc to location of player;
		follow the action_catching_up of this_journey;
	[if player is behind and if waits_for_player, wait]
	else if player_moves is more than npc_moves:
		now the player_status of this journey is behind;
	[if here, do stuff here]
	else:
		now the player_status of this journey is here;
	[
		increment the counter (time_here)
	]
	[we increment time_here if:
		npc doesn't wait for player, or
		npc is not at the origin, or
		npc waits for player and they are there]
	if waits_for_player of this_journey is false or location of npc is not origin:
		increment time_here of this_journey;
	else if waits_for_player of this_journey is true and location of npc encloses player:
		increment time_here of this_journey;
	say "(DEBUG: NPC Journey of [npc] from [origin] to [destination][line break][npc] in [location of npc] for [time_here of this_journey] turns)[line break]";
	[
		if npc is still at origin
	]
	if location of npc is origin:
		[do action_at_start (which may include action before player arrives)]
		follow the action_at_start of this_journey;
		[if rule succeeds continue]
		if rule failed:
			stop the action;
	[
		if npc arrives at destination
	]
	if location of npc is destination:
		[do action_at_end]
		follow the action_at_end of this_journey;
		[if rule succeeds, stop the journey]
		if rule succeeded:
			[this_journey is not in-progress]
			now this_journey is not in-progress;
		stop the action;
	[make sure npc shows up in room descriptions]
	now npc of this_journey is described;
	[if NPC is interrupted]
	if npc is interrupted on this_journey:
		if time_here of this_journey >=	 wait_time of this_journey:
			[let's not increment time_here]
			now time_here of this_journey is wait_time of this_journey minus one;
		[don't move NPC]
		stop the action;
	[if we are not ready to move]
	if not npc is ready to move on this_journey:
		[don't move NPC]
		stop the action;
	[
		npc is ready to move
	]
	[remember where we are for later]
	let this_room be the location of npc;
	[get the heading to the destination]
	let heading be the best route from location of npc to destination;
	let next_room be the room heading from location of npc;
	[if player is not here]
	if player is not in this_room:
		[should NPC wait for player]
		if waits_for_player of this_journey is true:
			[if player is behind NPC we wait]
			[lets find out if they are ahead or behind NPC]
			[determine if player is in direction of destination]
			let player_heading be the best route from location of npc to location of player;
			let next_room_to_player be the room player_heading from location of npc;
			[if player is behind npc]
			if next_room is not next_room_to_player:
				[and NPC has not waited TOO long]
				if time_here of this_journey is less than max_wait of this_journey:
					[don't move NPC]
					[say "(DEBUG: [npc] is waiting for you and will wait for [max_wait of this_journey] turns)[line break]";]
					stop the action;
				[else:
					say "(DEBUG: [npc] is tired of waiting for you)[line break]";]
			[else:
				say "(DEBUG: [npc] thinks you are up ahead)[line break]";]
		[else:
			say "(DEBUG: [npc] is not waiting for you)[line break]";]
	[
		when we get here, NPC is ready to move and either:
			a) player is visible, or
			b) NPC doesn't wait, or
			c) player is ahead of NPC, or
			d) NPC has waited long enough
		so we move the NPC
	]
	[if player is in NPC's current location]
	if player is in this_room:
		[if npc has waited too long]
		if time_here of this_journey >=  wait_time of this_journey and this_room is not origin:
			[do grumpy waiting action]
			follow the action_after_waiting of this_journey;
		[we say/do our normal moving out action]
		follow the action_before_moving of this_journey;
	[move npc]
	say "(DEBUG: [npc] is moving to [next_room])[line break]";
	try silently npc going heading;
	[time_here = 0]
	now time_here of this_journey is zero;
	[if player is in new location, we say/do catchup action]
	if player is in next_room:
		[we say/do catchup action]
		follow the action_catching_up of this_journey;
]

To decide if npc is interrupted on (this_journey - a npc_journey):
	[if interrupt rule succeeds, no]
	follow the interrupt_test of this_journey;
	if rule succeeded:
		decide yes;
	[if npc is still talking, no]
	if number of in-progress rants is not zero:
		decide yes;
	decide no;

To decide if npc is ready to move on (this_journey - a npc_journey):
	[if time is not up, no]
	if time_here of this_journey is less than wait_time of this_journey:
		decide no;
	decide yes;

Chapter An Example Journey



Book - Conversation system

Part - Conversation Rules

Does the player mean quizzing about a subject:
	it is very likely.
Does the player mean implicit-quizzing a subject:
	it is very likely.
Does the player mean informing about a subject:
	it is very likely.
Does the player mean implicit-informing a subject:
	it is very likely.
Does the player mean requesting for a subject: it
	is very likely.
Does the player mean implicit-requesting a subject:
	it is very likely.

Part - Talk to Someone

Instead of saying hello to someone (called the target):
	if the current interlocutor is target:
	 	say "You are already talking to [target]. Perhaps you can try to ask or tell them something. Maybe 'Ask [target] about something,' or 'Tell [target] about something.'[command clarification break]" instead;
	else:
		continue the action;


Part - You Talking to Me?

To decide if we are talking/speaking to/at (char1 - a person):
	if char1 is current interlocutor:
		if conversing, decide yes;
		if speaking, decide yes;
		if implicit-conversing, decide yes;
	decide no.

Part - Multi-Part Rants

[	The rules:
		these can interrupt other sequences
		they have people they rely on to utter them (the speaker)
		they only continue if player is in same location
		any other speaking to the NPC is ignored (this is challenging) ]

Chapter - The Properties

A rant is a kind of thing.
A rant has a table name called the quote_table.
A rant has a person called the speaker.
A rant has a room called the orig_room.
A rant has a number called the index.
A rant can be in-progress.
	It is usually not in-progress.
A rant can be run.
	It is usually not run.

Chapter - The Mechanics

Every turn:
	repeat with this_rant running through every in-progress rant:
		step_a_rant for this_rant;

To step_a_rant for (this_rant - a rant):
	if index of this_rant is zero:
		now this_rant is run;
		now orig_room of this_rant is the location of the player;
	increase index of this_rant by one;
	let index be index of this_rant;
	let orig_room be orig_room of this_rant;
	let max_quotes be the number of rows in quote_table of this_rant;
	[if player is in orig_room and speaker of this_rant is in orig_room:]
	report speaker of this_rant saying quote in row index of the quote_table of this_rant;
	[if speaker of this_rant is visible:
		queue_report quote in row index of the quote_table of this_rant with priority 1;]
	if index is max_quotes:
		now this_rant is not in-progress;
		[ we repeat the last quote from here on out ]
		now index of this_rant is max_quotes minus one;
	[say "rant [this_rant] - in progress (index: [index of this_rant]; rows: [number of rows in quote_table of this_rant], number: [number of in-progress rants]).";]

Instead of doing something to someone (called the target):
	if we are speaking to the target:
		repeat with this_rant running through every in-progress rant:
			if the speaker of this_rant is the target:
				say "[The target] [one of]didn't seem to hear you[or]is still talking[or]still has more to say[or]is still going on[at random]." instead;
				[stop the action;]
	continue the action;


Part - Topics

[
	Topics allow the PC to refer to them in dialogue with NPCs. This allows our NPC to be able to converse about almost anything whether it is visible (or even in the game) or not.

	>ask honey about trailer
	"You wanting to go back? If you head back to the house, you try and help your Aunt Mary out," Honey says.

]

Chapter - Characters

Dad is a familiar _male man. Understand "dad/father/Nick/Nicolas/papa" as dad.
Joseph is a familiar _male man. Understand "joe/joseph", "cat lady's husband", "Sharon's husband" as joseph.

Grandpa, Honey, Aunt Mary, Sharon, Lee, Sheriff, stepdad, Mom, Joseph are familiar.

Chapter - Places

topic_forest is a subject.
	The printed name is "woods".
	Understand "dark/-- forest/woods" as topic_forest.

[topic_swimming is a subject. Understand "swim/swimming/diving" as topic_swimming.
Does the player mean quizzing about topic_swimming: it is likely.
Does the player mean informing about topic_swimming: it is likely.]

The deep pool is familiar.

topic_trailer is a subject.
	The printed name is "trailer".
	Understand "trailer/house/home" as topic_trailer.

topic_creek is a subject.
	The printed name is "Bear Creek".
	Understand "creek/river/water", "Bear Creek" as topic_creek.

topic_bridge is a subject.
	The printed name is "old stone ridge".
	Understand "old/-- stone/-- bridge" as topic_bridge.

Grandpa's-Virtual-Trailer is familiar.

Train tracks are familiar.

topic_tree is a subject.
	The printed name is "tall Doug fir".
	Understand "big/pine/fir/tall/-- doug/-- fir/tree/branches" as topic_tree.

topic_creek is a subject.
	The printed name is "Bear Creek".
	Understand "bear/-- river/creek/crick/water/stream" as topic_creek.

Chapter - Big Topics

topic_dreams is a subject.
	The printed name is "dreams".
	Understand "am/are/-- i/you/-- having/-- a/-- dream/dreams/visions/sleeping" as topic_dreams.

topic_life is a subject.
	The printed name is "life".
	Understand "living/life" as topic_life.

topic_love is a subject.
	The printed name is "love".
	Understand "love" as topic_love.

topic_death is a subject.
	The printed name is "death".
	Understand "dying/death" as topic_death.

topic_work is a subject.
	The printed name is "works".
	Understand "work/job/jobs/retirement" as topic_work.

topic_family is a subject.
	The printed name is "family".
	Understand "aunts/uncle/uncles/brother/brothers/sister/sisters/nephew/nephews/niece/nieces/grandchildren/grandkid/grandkids/grandson/granddaugher/daughter/daughters/son/sons/kids/family/pack/owner/territory" as topic_family.

topic_war is a subject.
	The printed name is "war".
	Understand "Vietnam/Nam/ww2/battle/war/service", "ww ii/2", "world war 2/two/--", "Vietnam war" as topic_war.

topic_indians is a subject.
	The printed name is "indians".
	Understand "indians/Miwok/pineridge/reservation/rez/Dakota/Lakota/aim", "Sierra Miwok", "Miwok people", "Pine Ridge", "american/-- indian movement" as topic_indians.

Chapter - Various Objects

Cigarettes are familiar.

The dog is familiar.

The radio is familiar.

topic_cat is a subject.
	The printed name is "cats".
	Understand "yellow/tiger/black/skinny/white/gray/fluffy/tortoise-shell/calico/tomcat/skinny/patchy/dirty/bony/-- cat/tabby/cats/kitty/kitties/kitten/kittens", "tabby cat" as topic_cat.

topic_jam is a subject.
	The printed name is "jam".
	Understand "blackberries/blackberry/berries/berry/-- jam/jelly/preserves/pot/pan/goo/stove/kitchen", "black berry jam/jelly/preserves" as topic_jam.

The bucket is familiar.

topic_berries is a subject.
	The printed name is "blackberries".
	Understand "bunch/handful/lots/-- of/-- ripe/big/-- black/-- blackberries/blackberry/berries/berry" as topic_berries.

topic_tea is a subject.
	The printed name is "tea".
	Understand "teatime/teaparty/tea/teacup/teacups/teapot/teapots/cozy/cozies/teacozy/teacozies/strainer", "tea-time", "tea time/ceremony/party" as topic_tea.

topic_lunch is a subject.
	The printed name is "lunch".
	Understand "lunch", "tuna/-- sandwiches" as topic_lunch.


Book - Special Mechanics

Part - Complicated Properties

Chapter - Some Things and Their Properties

A thing can be unmentionable. [reserved for underwear, clothing, and shoes]

A thing can be floating or sinking. Things are usually sinking.

A supporter can be lie-able. Supporters are usually not lie-able.
A supporter can be sit-at-able. Supporters are usually not sit-at-able.

A thing is either climbable or unclimbable. a thing is usually unclimbable.

[A thing can be familiar or unfamiliar. A thing is usually unfamiliar.]
A subject is a kind of thing. A subject is usually familiar.

Definition: a container is empty if the number of things in it is zero.
Definition: a supporter is empty if the number of things on it is zero.
[Definition: a thing is empty if the number of things encased by it is zero.]
Definition: a thing is non-empty if it is not empty.

Chapter - Surfaces

A surface is a kind of fixed in place undescribed enterable supporter.
A surface has a room called destination. Destination is Limbo.

Chapter - Waterbodies

A waterbody is a kind of fixed in place undescribed enterable container.

Chapter - Wet Things

A thing can be wet or dry. Things are usually dry.

Things have a number called dry_time. The dry_time is usually 8.
Things have a number called dry count.

Every turn when the number of wet things is greater than 0:
	Repeat with item running through wet things:
		if item is not in Bear Creek and item is not in deep pool:
			Decrease the dry count of item by one;
		If dry count of item is less than one:
			Now item is dry;
			If item is visible and dry_time of item is greater than 1:
				say "Finally, [the item] [if noun is singular-named]is[otherwise]are[end if] drying out."

To make (item - a thing) wet:
	now item is wet;
	now dry count of item is dry_time of item;

Part - Complicated Multi-Quantity Things

Chapter - Blackberries

Test bb with "go to bridge/g/g/pick berries/g/g/eat berries/go to bridge/g/g".

Understand "pick [a thing]" as picking.
Picking is an action applying to one thing.

Check picking:
	if noun is handful_of_berries or noun is berries_in_pail:
		try picking backdrop_berries;
		stop the action;
	else if noun is backdrop_berries:
		if player is not in Region_Blackberry_Area:
			say "You'll have to go back to the berry brambles.";
			stop the action;
	otherwise:
		say "Silly, you can't pick that.";
		stop the action;

Carry out picking:
	try taking backdrop_berries.

Does the player mean picking backdrop_berries:
	it is very likely.
Does the player mean doing anything except picking backdrop_berries:
	it is unlikely.
["Does the player mean" rules clarify the noun, not the verb. I think the following are unneeded, but not sure]
Does the player mean doing anything except taking or picking handful_of_berries:
	it is very likely.
Does the player mean doing anything to berries_in_pail:
	it is likely.

Section - backdrop_berries

[that is, the berries on the bush ]

Instead of taking the backdrop_berries:
	[ pick into pail, if possible ]
	if pail is visible or pail is held by player:
		if pail is full:
			say "Your pail is already full. You should probably dump it into Honey and Grandpa's bucket.";
		otherwise:
			say "[pick_berries]. [run paragraph on]";
			put_berries_in_pail;
			[have the parser notice the berries_in_pail;]
	[ pick into big_bucket, if possible ]
	else if big_bucket is visible:
		say "[pick_berries]. [run paragraph on]";
		put_berries_in_bucket;
	[ otherwise, we just got our hands ]
	else:
		if handful_of_berries is carried by player:
			say "Your hands are already full of berries. Perhaps if you got your pail...";
		else:
			[otherwise we put berries in player's hand]
			now player holds handful_of_berries;
			say "[pick_berries].";

To say pick_berries:
	say "[one of]You stretch and manage to pick a few[or]By working on tiptoes, you are just able to pick a few[or]You gather up the easy ones right in front until you have a handful of[or]You notice some ripe ones down near your knees and grab a bunch of[at random] ripe blackberries";

Instead of eating backdrop_berries:
	say "[pick_berries] [eat_berries].";

Instead of inserting backdrop_berries into something:
	try inserting pail into second noun.

Section - Berries in the pail

[that is, the berries in the pail (or the big_bucket) ]

A berries_in_pail is a undescribed sinking edible thing.
	The printed name is "bunch of ripe berries".
	A berries_in_pail are in pail.
	The description of berries_in_pail is "You've picked a big bunch of blackberries. [looking_closely_at_berries].".
	The scent is "mmm, blackberry jam, blackberry pie, yum".
	Understand "bunch/handful/lots/-- of/-- ripe/big/-- black/-- blackberries/blackberry/berries/berry", "blackberries/blackberry/berries/berry in pail" as berries_in_pail.

To say looking_closely_at_berries:
	say "Looking at them, you notice that the color goes from deep red to deepest black. [one of]The sweetest ones are the ones that aren't shiny. You know that from experience[or]Your hands are stained red all the way to your wrist[or] You notice a tiny weeny white spider crawling on one of the berries[or] One of these berries is still green[or] A couple of these berries are kind of too ripe and look like little raisins[at random]".

Rule for printing the name of the pail:
  say "[printed name of pail]";
	    omit contents in listing.

Instead of eating berries_in_pail:
	eat_berries_from_pail;

Instead of drinking berries_in_pail:
	try eating berries_in_pail;

Instead of dropping berries_in_pail:
	say "Now why would you want to drop all of those beautiful berries you picked? You can't bring yourself to do it.".

[procedural rules are removed.]
[this allows us to things to the berries (dropping them, eating them, feeding them to dog, etc) without taking them out of pail]
[Procedural rule while doing anything to the berries_in_pail:
	ignore the carrying requirements rule;
	ignore the can't show what you haven't got rule;]

The carrying requirements rule does nothing if doing anything to the berries_in_pail.

The can't show what you haven't got rule does nothing if doing anything to the berries_in_pail.

Instead of inserting berries_in_pail into something:
	try inserting pail into second noun.

Instead of taking berries_in_pail when player holds pail and player is in Region_Blackberry_Area:
	try picking backdrop_berries;
Instead of taking berries_in_pail when player holds pail and player is not in Region_Blackberry_Area:
	say "There are too many to hold in your hands. You can eat some though. Or better yet, when your pail gets full, dump them in Honey and Grandpa's bucket for jam.";

To say eat_berries:
	say "You eat a few of the berries[one of]. Yum[or]. Oh yum[or]. Delicious[or]. Sour. Some of these weren't quite ripe[or]. Oh those were really sweet[or]. Yum[or]. You can feel the little seeds between your teeth[in random order][if player is hungry]. That may have been the best thing you've ever eaten. You are reminded of something: 'Hunger is the best seasoning,' your grandpa always says[end if]";
	now player is not hungry;

[TODO: When you try to get or eat berries outside of the Region_Blackberry_Area and there is none, you get "You can't see any such thing." This could be improved]

Section - Berries in Hand

[the handful of ripe berries, that is, the berries we can hold ]

A handful_of_berries is a sinking edible thing.
	The printed name is "handful of ripe berries".
	handful_of_berries are in Limbo.
	The description of handful_of_berries is "You've picked a big handful of blackberries. [looking_closely_at_berries].".
	The scent is "mmm, blackberry jam, blackberry pie, yum".
	Understand "bunch/handful/lots/-- of/-- ripe/big/-- black/-- blackberries/blackberry/berries/berry" as handful_of_berries.

Instead of eating handful_of_berries:
	say "[eat_berries].";
	now noun is in Limbo.

Section - The Pail

[TODO: oops.
	>put berries in pail
	You can't put something inside itself
]

[TODO: oops.
	>put sandwich in pail
	You put the tuna sandwich into your pail
]

Instead of inserting handful_of_berries into pail:
	put_berries_in_pail.

Instead of taking berries_in_pail when pail is not held by player and pail is visible:
	try taking pail.

To put_berries_in_pail:
	now berries_in_pail is in pail;
	if pail is empty:
		say "You drop the berries into your pail.";
		now pail is quarter-full;
		now berries_in_pail is in pail;
	else if pail is quarter-full:
		say "You drop the berries into your pail which is about half full.";
		now pail is half-full;
	else if pail is half-full:
		say "You drop the berries into the pail which is getting close to full.";
		now pail is three-quarter-full;
	else if pail is three-quarter-full:
		say "You carefully put these blackberries in the pail which is now heaping. You should probably dump the berries in Honey and grandpa's bucket.";
		now pail is full;
		if player is warned_by_grandma:
			say "[line break][blackberry_payoff]";
			now player is free_to_wander;
	else if pail is full:
		say "Your pail is already full. You should probably dump it into Honey and grandpa's bucket.";
		stop;
	now handful_of_berries is in Limbo;

To eat_berries_from_pail:
	if pail is full:
		now pail is three-quarter-full;
	else if pail is three-quarter-full:
		now pail is half-full;
	else if pail is half-full:
		now pail is quarter-full;
	else if pail is quarter-full:
		now pail is empty;
		now berries_in_pail is in Limbo;
	else if pail is empty:
		say "Your pail is empty.";
		stop the action;
	say "[eat_berries]. Now your pail is [if pail is empty]empty[else if pail is quarter-full]quarter-full[else if pail is half-full]half-full[else if pail is three-quarter-full]mostly full[else]very full[end if].";

Instead of going when pail is full and pail is held by player:
	if Scene_Picking_Berries is happening:
		say "[one of]With your heaping full pail, you imagine tripping and blackberries going everywhere and getting in trouble[or]Your full pail is making you nervous[or]You are concentrating so hard on your full pail, your hands start to shake and a ripe berry tumbles off into the dirt[or]You have to stop for a minute to catch your breath and steady your hands holding your full pail[or]You walk slowly, steading your pail full of blackberries[stopping].";
	else:
		say "You eat some of the berries from your pail, so it is less full.";
		Now pail is three-quarter-full;
	continue the action;



[Does player mean inserting backdrop_berries into pail:
	It is very likely.

Does player mean inserting berries_in_pail into pail:
	It is very unlikely. ]

Section - The Bucket

[TODO:
>dump berries
What do you want to dump the bunch of ripe berries into?
>big bucket
You can't see any such thing.]

Instead of taking or attacking or kissing the big_bucket,
	say "A glance from Honey and you get the message that you better not.".

Instead of searching big_bucket:
	try examining big_bucket.
Instead of taking big_bucket:
	say bucket_is_heavy.
Instead of inserting big_bucket into something:
	say bucket_is_heavy.

To say bucket_is_heavy:
	say "That's going to be pretty heavy. Better leave it for Grandpa to carry."

Instead of inserting something into big_bucket:
 	if noun is handful_of_berries:
		put_berries_in_bucket;
	else if noun is berries_in_pail or noun is pail:
		if pail is empty:
			say "Your pail is empty. You may want to pick some more.";
		else:
			say "You carefully dump your berries into the half-full bucket.";
		now pail is empty;
		now berries_in_pail is in Limbo;
	else if noun is backdrop_berries:
		if pail is visible:
			try inserting pail into second noun;
		else:
			say "You pick some berries into the big bucket.";
	else:
		say "A glance from Honey and you realize you better not put that in there.".

To put_berries_in_bucket:
	Now handful_of_berries is in Limbo;
	say "You drop the berries into the big bucket.";

["Does the player mean" rules, ref: http://inform7.com/book/WI_18_32.html]

Does the player mean inserting pail into big_bucket:
	It is very likely.

Does the player mean inserting berries_in_pail into big_bucket:
	It is very likely.

Does the player mean inserting handful_of_berries into big_bucket:
	It is likely.

Does the player mean inserting backdrop_berries into big_bucket:
	It is possible.

Section - Dropping Blackberries

Some dirty_mush is an undescribed edible thing.
	The printed name is "dirty mush".

Instead of doing anything to dirty_mush,
	say "Ew, yuck.".

Instead of dropping handful_of_berries:
	throw_berries_back.

Instead of throwing handful_of_berries at something:
	throw_berries_back.

Instead of inserting handful_of_berries into something:
 	if second noun is big_bucket:
		continue the action;
	else:
		throw_berries_back.

Instead of putting handful_of_berries on something:
	throw_berries_back.

[ This rule will only apply if we do not have any berries ]
Check dropping backdrop_berries:
	say "You'll have to pick some first.";
	rule fails.

To throw_berries_back:
	say "The ripe berries hit the ground and immediately turn to dirty mush.";
	move the noun to Limbo;
	now dirty_mush is in location;
	[have the parser notice dirty_mush;]

Chapter - Rocks

A loose_rock is a kind of thing.
	Loose_rocks are always undescribed and sinking.
	10 loose_rocks are in Room_Railroad_Tracks.
	The printed name is "rock".
	The printed plural name is "rocks".
	Understand "rock" as loose_rock.

Instead of taking the mound_of_rock:
	let chosen rock be a random loose_rock in Room_Railroad_Tracks;
	if chosen rock is nothing: [That is, there were no rocks remaining]
		say "[rock_refusal]";
	otherwise:
		move the chosen rock to the player;
		say "You pick up one of the rocks."

Does the player mean taking loose_rock:
	it is very unlikely.

Does the player mean taking mound_of_rock:
	it is very likely.

To say rock_refusal:
	say "That's plenty. Are you building your own railroad?"

Rule for implicitly taking the mound_of_rock:
	let chosen rock be a random loose_rock in Room_Railroad_Tracks;
	if chosen rock is nothing: [That is, there were no rocks remaining]
		say "[rock_refusal]";
	otherwise:
		move the chosen rock to the player;
		say "(picking up one of the rocks)";
		now the noun is the chosen rock.

Rule for clarifying the parser's choice of the mound_of_rock while taking:
	say "(from the rocks that line the track)[line break]".

[Every turn when the number of loose_rocks is greater than 0:
	let chosen rock be a random off-stage rock;
	move the chosen rock to Room_Railroad_Tracks.]

[Instead of throwing loose_rock when player is in Room_Railroad_Tracks:
	try dropping the noun.]

[still a host of problems: throwing, confusion with the mound_of_rock etc]

Instead of dropping loose_rock when player is in Room_Railroad_Tracks:
	throw rock back.

Instead of putting the loose_rock on train tracks:
	throw rock back.

Instead of putting the loose_rock on mound_of_rock:
	throw rock back.

To throw rock back:
	say "You throw the rock back into the mound of ballast.";
	move the noun to Room_Railroad_Tracks.

Instead of dropping the loose_rock:
	if player is in Region_Trailer_Indoors:
		say "Maybe not such a good idea, indoors.";
	else:
		throw rock away;

Instead of throwing the loose_rock at someone (called the target):
	if target is dog:
		say "The dog barely dodges the rock, then erupts into a furious storm of barking.";
		now the dog is rock-aware;
	else:
		say "That seems like a really terrible idea. You think better of it.";

Instead of throwing the loose_rock at something:
	try dropping the noun.

To throw rock away:
	if player is in Room_Halfway_Up or
	player is in Room_Top_of_Pine_Tree or
	player is in Room_Sentinel_Tree:
		say "The rock sails out into space before dropping with a crash among the bushes far below.";
	else:
		say "You throw the rock and it disappears into the bushes.";
	move the noun to Room_Railroad_Tracks.

Part - Devices and Things With A Mind of Their Own

Chapter - Tuning

Understand "watch [something]", "play [something]", "turn on [something]" as switching on.

Understand "tune [something]", "tune station/channel/dial on [something]", "adjust [something]", "change station/channel/dial on [something]", "turn station/channel/dial on [something]" as tuning_this.
tuning_this is an action applying to one thing.

Check tuning_this:
	if noun is not a device:
		say "Hm, I don't know how to tune that." instead;

Carry out tuning_this:
	Try tuning;

[TODO: reverse these two verbs, i.e., make the one with no noun make assumptions and the one with a noun can do the action - this will make the article work properly. ]

Understand "tune radio/tv/station/stations/channel/channels/dial/dials",
"adjust radio/tv/station/stations/channel/channels/dial/dials",
"change station/stations/channel/channels/dial/dials",
"turn station/stations/channel/channels/dial/dials",
"change tv/radio station/stations/channel/channels/dial/dials",
"turn tv/radio station/stations/channel/channels/dial/dials" as tuning.
Tuning is an action applying to nothing.

Check tuning:
	if sharons_tv is visible:
		if sharons_tv is not switched on:
			say "You'll have to turn the set on first." instead;
	else if Honeys_tv is visible:
		if Honeys_tv is not switched on:
			say "You'll have to turn the set on first." instead;
	else if lees_tv is visible:
		if lees_tv is not switched on:
			say "You'll have to turn the set on first." instead;
	else if portable transistor radio is not visible:
		say "Hmm. There's nothing to tune here." instead;

Carry out tuning:
	if portable transistor radio is visible:
		try taking portable transistor radio;
	else if lees_tv is visible:
		change_TV_channel;

Chapter - The Radio

[Instead of doing anything except object-navigating or examining or listening or smelling or quizzing or informing or implicit-quizzing or implicit-informing radio, say "[one of]Better leave it alone or Honey will kill you.[or]Seriously, you know not to touch Honey's stuff.[or]Not a good idea.[stopping]"]

Every turn when location of player is in Region_Blackberry_Area or player is in Room_Stone_Bridge:
	if time_for_a_new_song,
		report_new_song_begins;

When play begins:
	Sort Table of Pop Songs in random order.

Song Number is a number that varies. The Song Number is 1.
Song Timer is a number that varies. The Song Timer is 1.
Global song length is a number that varies. The Global song length is 3.

To report_new_song_begins:
	queue_report "[one of]On [distant_radio], a new song begins: [current_song][or]You hear [distant_radio] playing a new song: [current_song][or]The song [current_song], begins playing on [distant_radio][or]After a DJ break, [distant_radio]'s playing [current_song][in random order]." with priority 4;

To say what_song_is_playing:
	if radio is visible:
		say "Honey's transistor radio is sitting on the bank playing [current_song]";
	otherwise:
		say "You hear [distant_radio] playing [current_song]";

To say distant_radio:
	say "[if player is in Room_Grassy_Clearing]Honey's [otherwise if player is in Room_Lost_in_the_Brambles or player is in Room_Blackberry_Tangle]the nearby [otherwise]a [one of]far-away[or]distant[or]crackly far-off[or]faint[at random] [end if]radio".

To say current_song:
	Let Current title be the title in row Song Number of the Table of Pop Songs;
	Let Current artist be the artist in row Song Number of the Table of Pop Songs;
	Let Current fave be the fave in row Song Number of the Table of Pop Songs;
	if current fave is "Y":
		say "'[current title][one of]' by [current artist],[or],'[at random] [one of]a good one[or]one of your favorites[or]another song you really like[or]one you like to sing to[or]one you remember singing with your mom in the Camaro[as decreasingly likely outcomes]";
	otherwise:
		say "'[current title]'";

To go_to_next_song:
	increase Song Number by 1;
	if Song Number is greater than number of rows in Table of Pop Songs,
		Now Song Number is 1;

To decide if time_for_a_new_song:
	if song timer is greater than global song length
	begin;
		go_to_next_song;
		Now song timer is 1;
		Decide Yes;
	end if;
	Increase song timer by 1;
	Decide No.

Table of Pop Songs
Title	Artist	Length	Fave
"Love Will Keep Us Together"	"Captain and Tennille"	3	"Y"
"Rhinestone Cowboy"	"Glen Campbell"	3	"Y"
"Before the Next Teardrop Falls"	"Freddy Fender"	3	"Y"
"My Eyes Adored You"	"Frankie Valli"	3	"Y"
"Shining Star"	"Wind and Fire"	3	"N"
"Laughter In the Rain"	"Neil Sedaka"	3	"Y"
"One of These Nights"	"The Eagles"	3	"N"
"Thank God I'm a Country Boy"	"John Denver"	3	"Y"
"The Best of My Love"	"The Eagles"	3	"N"
"Kung Fu Fighting"	"John Douglas"	3	"N"
"Black Water"	"The Doobie Brothers"	3	"N"
"Another Somebody Done Somebody Wrong Song"	"BJ Thomas"	3	"Y"
"He Don't Love You Like I Love You"	"Tony Orlando and Dawn"	3	"Y"
"Pick Up the Pieces"	"... actually, you're not sure"	3	"N"
"Why Can't We Be Friends"	"War"	3	"N"
"Wasted Days and Wasted Nights"	"Freddy Fender"	3	"N"
"Please Mr Postman"	"The Carpenters"	3	"N"
"Sister Golden Hair"	"America"	3	"N"
"Lucy In the Sky With Diamonds"	"Elton John"	3	"N"
"Mandy"	"Barry Manilow"	3	"Y"
"Have You Never Been Mellow"	"Olivia Newton-John"	3	"Y"
"Cat's In the Cradle"	"Harry Chapin"	3	"Y"
"Wildfire"	"someone you don't know"	3	"Y"
"Feelings"	"Morris Albert"	3	"N"
"When Will I Be Loved"	"Linda Ronstadt"	3	"N"
"You're the First, the Last, My Everything"	"Barry White"	3	"Y"
"You're No Good"	"Linda Ronstadt"	3	"Y"
"Feel Like Makin' Love"	"Bad Company"	3	"N"
"How Sweet It Is To Be Loved By You"	"James Taylor"	3	"Y"
"Never Can Say Goodbye"	"Gloria Gaynor"	3	"N"
"When Will I See You Again"	"someone you don't recognize"	3	"Y"
"Lonely People"	"America"	3	"Y"

Chapter - The TV

Every turn when player is in Room_Lees_Trailer and lees_tv is switched on:
	if current action is not tuning or examining lees_tv or switching on lees_tv:
		if time_for_a_new_show:
			report_new_tv_show_begins;
		else if a random chance of 1 in 3 succeeds:
			say show_is_still_playing.

[Instead of watching when in Region_Blackberry_Area, say what_song_is_playing.]

Show Index is a number that varies.
TV Channel is a number that varies.
	The tv channel is 5.
Show Timer is a number that varies.
	The show timer is 1.
Global show length is a number that varies.
	The global show length is 15.
current_show is a text that varies.
Current reaction is a text that varies.

When play begins:
	Now the show index is a random number from 1 to 5;
	find_show_in_table;

After switching on lees_tv:
	say what_show_is_playing;
	say line break;

[ Channels: 2abc, 4nbc, 5local, 7cbs, 9pbs ]

To change_TV_channel:
	if TV Channel is 2:
		say "You change the TV from channel 2 to channel 4.";
		now TV Channel is 4;
	else if TV Channel is 4:
		say "You change the TV to channel 5.";
		now TV Channel is 5;
	else if TV Channel is 5:
		say "You change the TV to channel 7.";
		now TV Channel is 7;
	else if TV Channel is 7:
		say "You change the TV channel all the way around from 7 to 2, skipping 9 since nothing is ever on.";
		now TV Channel is 2;
	find_show_in_table;
	say "[line break][current_show] is on. [current reaction][line break]";

To report_new_tv_show_begins:
	queue_report "[one of]On the little TV, after a few commercials, [current_show] begins[or][current_show] starts on Lee's little TV[or]After a bunch of commercials, [current_show] is on[at random]. [current reaction]" with priority 4;

To say what_show_is_playing:
	say "The little black and white TV is playing [current_show]. [current reaction]";

To say show_is_still_playing:
	say "[one of][current_show] is still blaring on Lee's TV[or]Lee's TV is still playing [current_show][or][current_show] is on Lee's little TV[at random].";

To find_show_in_table:
	repeat through Table of TV Shows:
		if Channel entry is TV Channel and Index entry is Show index:
			now current_show is show entry;
			now current reaction is reaction entry;

To go_to_next_show:
	increase show index by 1;
	if show index is greater than 5, now show index is 1;
	find_show_in_table;

To decide if time_for_a_new_show:
	if show timer is greater than global show length :
		go_to_next_show;
		Now show timer is 1;
		Decide Yes;
	Increase show timer by 1;
	Decide No.

Table of TV Shows
Show	Channel	Index	Reaction
"General Hospital"	2	1	"This is one of mom's shows. There's a hospital and lots of people falling in love and stuff. Ick."
"Ryan's Hope"	2	2	"Who are these people?  This isn't one of the soaps your mom watches. There's a hospital. There's a bar. There's a priest. Who cares?"
"The $10,000 Pyramid"	2	3	"The category is [']green thumb['], things grown in the garden. Yawn."
"All my Children"	2	4	"This is one of your mom's shows. Some lady is leading a protest against the War in Vietnam and another lady is angry about it."
"One Life to Live"	2	5	"There's a lady talking to a guy who doesn't know who he is or where he is."
"Another World"	4	1	"This is another soap opera that you don't know, not one of your mom's."
"Days of our Lives"	4	2	"You know this one, 'Like sands through the hourglass... so are the Days of Our Lives.' But you don't recognize any of the characters or what's happening."
"The Hollywood Squares"	4	3	"Yuk yuk. Celebrities you don't know making jokes you don't get. Is there a game in this game show? You're not quite sure."
"Wheel of Fortune"	4	4	"Guess the letter, like hangman. Kind of boring. You're never able to figure out the words before the people on the show guess it. Honey gets it every time."
"The Brady Bunch"	4	5		"You know this one. Bobby writes a book report about his hero Jesse James. Then in a dream, Bobby and the rest of the family are on a train, all dressed up old timey when Jesse James robs the train and shoots the family. Weird."
"I Love Lucy"	5	1	"You've definitely seen this one. Lucy is stuck out on the balcony dressed as Superman during Little Ricky's birthday party."
"Gomer Pyle"	5	2		"Sgt. Carter is yelling at Gomer Pyle who is just smiling and saying friendly things to him, making the sergeant even madder. It makes you laugh, but you can't help feeling sorry for Gomer."
"My Three Sons"	5	3	"Two of the boys are setting up their own company to match people up on dates."
"The Twilight Zone" 	5	4	"This is your very favorite show and you know this episode. The people on the street all suspect the others are aliens and start to fight each other."
"The Big Valley"	5	5	"This show is kind of like mom's soap operas, but in the wild west. There's a gunfight in the street and a girl in a saloon and some other stuff."
"The Price is Right"	7	1	"This is sometimes fun. You don't know the prices of things really, but the game is interesting and easy to guess. And players always win a new car."
"The Young and the Restless"	7	2	"Mom doesn't watch this one, and you can see why. There's a lady crying -- no a bunch of ladies crying, and one lady lying down is dying or something. Geez."
"As The World Turns"	7	3	"More people in a hospital. Do all soap operas have to happen in hospitals? Why? This time with a ghost.  A ghost in a hospital. Jeez."
"Search for Tomorrow"	7	4	"Kissy kiss kiss. A boy and a girl kissing with dramatic music. And someone lurking angrily in the background."
"Guiding Light"	7	5	"At least this soap opera isn't in a hospital. It's a court room instead. But the people are still doing the same things, yelling at each other and crying and stuff."

Chapter - The Train

[TODO: Match these up with scenes - possibly replace all time-based things with random during appropriate scene]
When play begins:
	schedule morning train for around the hour of 11:30 AM;
	schedule afternoon train for around the hour of 3:30 PM;
	schedule evening train for around the hour of 7 PM.

The distant-train is scenery. It is in Limbo.
	The printed name is "distant train".
	The description is "[first time]You are looking down at the train from above! Kinda weird. [only]You can see the train on the tracks moving toward the crossing far below your perch. This is a freight train with all kinds of cars. You see tankers and box cars and some others you don't recognize from here.".
	Understand "train", "railroad", "far away", "distant", "crossing", "tracks" as distant-train.

[Does the player mean doing anything to distant-train when player is in top of pine tree: It is likely.]
Does the player mean doing anything to distant-train when player is not in Room_Top_of_Pine_Tree:
	It is very unlikely.

At the time when morning train enters area:
	queue_report "You think you hear the morning train blowing its whistle way off in the hills." with priority 3.

At the time when morning train is nearby:
	queue_report "You hear a train whistle in the distance." with priority 3;
	if player is in Room_Top_of_Pine_Tree:
		queue_report "Looking toward the sound of the train, you can actually see it rounding the hill outside of town." with priority 2;
	move distant-train to Room_Top_of_Pine_Tree.

At the time when morning train hits the crossing:
	queue_report "You hear the morning train whistle, loud and close, as it hits the crossing." with priority 3;

At the time when afternoon train enters area:
	queue_report "You hear the train, pretty far off still." with priority 3.

At the time when afternoon train is nearby:
	queue_report "You hear the train whistle blowing as it goes through town." with priority 3;
	if player is in Room_Top_of_Pine_Tree:
		queue_report "Looking toward the sound of the train, you can actually see it rounding the hill outside of town." with priority 2;
	move distant-train to Room_Top_of_Pine_Tree.

At the time when afternoon train hits the crossing:
	queue_report "The train whistle screams as it hits the crossing." with priority 3;

At the time when evening train enters area:
	queue_report "Was that a train whistle or just the wind whooshing through the tree tops?" with priority 3.

At the time when evening train is nearby:
	queue_report "You hear a train whistle in the distance, a lonely far off sorta sound." with priority 3;

At the time when evening train hits the crossing:
	queue_report "You hear the train at the crossing as it goes by your house. You think for a moment of Honey and Grandpa and how worried they will be and how much you miss them." with priority 3;

To show train crossing:
	if player is in Room_Railroad_Tracks:
		if player is not train_experienced:
			queue_report "The train arrives!
			[paragraph break]You see the single light of the locomotive as it comes around the bend while it is still a ways away. The track begins to hum and you hear the squeal of the wheels on the curve. There's a moment where it just kind of hangs there in space[if player is on the train tracks]. The engineer sees you standing on the tracks and blows the whistle LOUD and long! It very nearly scares the pee out of you. You leap off to safety, tripping on the rail![otherwise].[end if]
			[paragraph break]The train is suddenly very close and moving very fast. You can feel hot air the train pushes ahead of it. The locomotive roars past you with a terrifying racket. Then car after car is swooshing past you, clanking and clattering.
			[paragraph break]It isn't until half the train goes by that you remember to count cars and then it's too late. With the sound of the train still ringing in your ears, you are suddenly aware of the smell of dust and grease in the air[if player is on the train tracks]. You pick yourself up and dust yourself off[end if]." at priority 2;
		otherwise:
			queue_report "The train arrives!
			[paragraph break]When the train comes around the bend and you see the headlight, y[if player is on the train tracks]ou immediately feel like you have to pee and without even thinking step off the rails. Y[end if]ou watch it wavering in the heat waves coming off the rails. This time you are not going to let it sneak up on you, so you concentrate on the moment when it changes from far away to close. It's in the distance. It's in the distance. It's in the distance.
			[paragraph break]And then wham! It's right here and LOUD! WAHHHHHHH! Whoosh! Clang! Bang! Clackity clack! Clackity clack!
			[paragraph break]This time you remember to count the cars, but you forget the number as soon as the last car goes by with a final clatter." at priority 2;
		if player is on train tracks:
			now player is courageous;
			queue_report "Though your close call with the train scared you, you also feel tremendously brave." at priority 1;
			try silently getting off Train tracks;
		now player is train_experienced;
	else if location of player is Room_Top_of_Pine_Tree:
		queue_report "The train is approaching the dirt road near the trailer park, passing almost directly beneath you. It sounds it's whistle for the crossing. Still loud, even up here! For a moment, you can see the whole train, end to end. It's going fast, and before you know it, the train is past the crossing, past the trailer park, and around the next bend and out of sight." at priority 2;
		move distant-train to Limbo.

At the time when morning train arrives:
	if penny is on train tracks:
		now penny is in Limbo;
		now flattened coin is on train tracks;
		now the flattened coin is marked for listing;
	show train crossing.

At the time when afternoon train arrives:
	if penny is on train tracks:
		now penny is in Limbo;
		now flattened coin is on train tracks;
		now the flattened coin is marked for listing;
	show train crossing.

train delay is a number that varies.

To schedule morning train for (arrival - a time):
	morning train enters area at 12 minutes before arrival;
	morning train is nearby at 7 minutes before arrival;
	morning train hits the crossing at 2 minutes before arrival;
	morning train arrives at arrival.

To schedule afternoon train for (arrival - a time):
	afternoon train enters area at 12 minutes before arrival;
	afternoon train is nearby at 7 minutes before arrival;
	afternoon train hits the crossing at 2 minutes before arrival;
	afternoon train arrives at arrival.

To schedule evening train for (arrival - a time):
	evening train enters area at 7 minutes before arrival;
	evening train is nearby at 5 minutes before arrival;
	evening train hits the crossing at 2 minutes before arrival.


Volume - World

Book - Regions & Rooms

Limbo is a room.
The description is "This is a white featureless space stretching off into (apparent) infinity. There are indistinct people and things here wandering aimlessly around."

Some_Limbo_People are in Limbo.
The printed name is "some indistinct people".

Some_Things are in Limbo.
The printed name is "some indistinct things".

A region has a room called return_dest.
A region has a room called forward_dest.
A region has a room called upstream_dest.
A region has a room called downstream_dest.
A region has a room called uppath_dest.
A region has a room called downpath_dest.

Part - Region_Blackberry_Area

Section - Description

Region_Blackberry_Area is a region.
Room_Lost_in_the_Brambles, Room_Grassy_Clearing, Room_Blackberry_Tangle, Room_Willow_Trail, Room_Lost_Trail, Room_Dappled_Forest_Path are in Region_Blackberry_Area.
The scent of Region_Blackberry_Area is "sunshine and dust and the tang of ripe blackberries".

Section - Navigation

The return_dest of Region_Blackberry_Area is Room_Grassy_Clearing.
The forward_dest of Region_Blackberry_Area is Room_Grandpas_Trailer.
The upstream_dest of Region_Blackberry_Area is Room_Grassy_Clearing.
The downstream_dest of Region_Blackberry_Area is Room_Stone_Bridge.
The uppath_dest of Region_Blackberry_Area is Room_Grassy_Clearing.
The downpath_dest of Region_Blackberry_Area is Room_Stone_Bridge.

Section - Backdrops

Some backdrop_blackberry_brambles is backdrop in Region_Blackberry_Area.
	The printed name is "berry brambles".
	The description is "[if player is in Room_Willow_Trail]The blackberry brambles are thinner here, forming prickly walls on either side of the trail[otherwise]The brambles are as high as you are, higher actually[end if]. They are heavy with berries, the very ripest ones always just out of reach."
	Understand "brambles/bramble/bushes/bush/thicket/vines/plant" as backdrop_blackberry_brambles.

Some backdrop_berries are backdrop in Region_Blackberry_Area.
	The printed name is "bunch of ripe berries".
	The description is "There are some big, ripe berries over there. If you could reach just a little bit farther or maybe get in there, maybe you could reach them."
	Understand "bunch/handful/lots/-- of/-- ripe/big/-- black/-- blackberries/blackberry/berries/berry" as backdrop_berries.
	The scent is "mmm, blackberry jam, blackberry pie, yum".

Some backdrop_paths are backdrop in Region_Blackberry_Area.
	The printed name is "paths".
	The description of backdrop_paths is "Berry pickers down here along Bear Creek have carved out paths through the brambles."
	Understand "path/paths/trail/trails" as backdrop_paths.

Some backdrop_sunlight is backdrop in Region_Blackberry_Area.
	The printed name is "sunlight".
	The description is "The sunlight comes slanting through the trees in the [if current_time_period is morning]morning light. The air is still crisp here in the shade with the early promise of a hot midsummer day[otherwise]afternoon light. Under the trees, the air is cooler[end if]."
	Understand "light/sun/sunlight/sunshine/sky/clouds", "sun shine/light", "shade" as backdrop_sunlight.

Backdrop_creek is backdrop in Region_Blackberry_Area.
	The description is "You can't see the creek through the tall brambles, but you can hear it.".
	Understand "bear/-- river/creek/crick/water/stream" as backdrop_creek.

Section - Rules and Actions

Instead of listening when location of player is in Region_Blackberry_Area,
say "[what_song_is_playing]. You can hear the creek burbling nearby.[if Grandpa is in Room_Grassy_Clearing] And Honey and Grandpa are talking nearby.[end if]";


Chapter - Room_Lost_in_the_Brambles

Section - Description

Room_Lost_in_the_Brambles is a room.
The printed name is "Lost in the Brambles".
The description is "[one of]You were sure that this was a better spot than where you've been picking all morning. But here too, the biggest ripest berries seem just out of reach. You pick a few ripe berries and drop them in your pail[or]This spot, a little ways from where Honey and Grandpa are picking, has some good berries[stopping]. Under the pine trees, the air smells good.
[paragraph break]Looking around: [available_exits]
[paragraph break][description of backdrop_sunlight]".
Understand "lost/-- in/-- the/-- brambles" as Room_Lost_in_the_Brambles.
The scent is "sunshine and that dusty fragrance of pine trees that you remember from hiking with Grandpa in the mountains".
The casual_name is "lost in the brambles".

Section - Navigation

The available_exits of Room_Lost_in_the_Brambles is "The grassy clearing where Honey and Grandpa have been picking is just down the hill from here."

Section - Objects

Section - Backdrops

Some pine trees are backdrop in Room_Lost_in_the_Brambles.
	The description is "Pine trees fringe the tangle of berry brambles.". Understand "tree/pines/pine" as pine trees.
	The scent is "sharp pine pitch".

Section - Rules and Actions

[Instead of climbing some pine trees, say "Hardly worth the effort.".	]

Chapter - Room_Grassy_Clearing

Section - Description

The Room_Grassy_Clearing is a room.
The printed name is "Grassy Clearing".
The description is "[if turn count is 1][bold type][location][roman type][line break][end if][one of]The water churgles in the nearby creek but you can't see it through the forest of blackberry brambles all around you. Every summer since you were little, you pick blackberries with your Honey and Grandpa down along Bear Creak[or]You are near the creek, but it can't be seen through the blackberry brambles[stopping]. This is a pleasant clearing carpeted with stubbly grass under a sycamore tree. There are paths and clearings beaten down among the brambles that allow you to squeeze in to get the ripest berries. [if big_bucket is visible]There is a big bucket in the middle of the clearing. [end if][if grandpas_shirt is in location]Grandpa's shirt and Honey's portable transistor radio are[else]Honey's portable transistor radio is[end if] on the bank under the tree playing music.
[paragraph break][first time]Looking around, you see places you can go: [only][available_exits]".
Understand "grassy/-- clearing" as Room_Grassy_Clearing.

The casual_name is "at the grassy clearing".

Section - Navigation

Room_Grassy_Clearing is south of Room_Lost_in_the_Brambles and down from Room_Lost_in_the_Brambles.

The available_exits of Room_Grassy_Clearing is "Along the path and down the creek, there's a tangle of blackberry bushes. Up the hill is the blackberry brambles where you've been picking for a while.".

Section - Objects and People

The big_bucket is scenery unopenable open container in Room_Grassy_Clearing.
	The printed name is "big bucket".
	The description is "There's a big bucket that Honey and Grandpa have been putting their berries into, about half full now.".
	Understand "big/-- bucket" as big_bucket.
	The big_bucket can be empty, quarter-full, half-full, three-quarter-full, or full.
	The big_bucket is quarter-full.
	The scent is "the delicious smell of ripe berries".

The portable transistor radio is scenery.
	It is in Room_Grassy_Clearing.
	It is a familiar device.
	The printed name is "portable transistor radio".
	The description of the radio is "[one of]Honey's little portable transistor radio is sitting on the bank [if grandpas_shirt is in location]beside grandpa's shirt [end if]under the tree. You've always been fascinated by it, as much by its perfect cube shape and woodgrain finish as anything. The tiny volume knob is missing, but there is a piece of something that looks like wax or plastic jammed in its place. The[or]Honey's transistor[stopping] radio is on and is tuned to a station playing pop music."
	Understand "knob", "cube", "woodgrain", "plastic", "wax", "music", "finish" as the portable transistor radio.
	The scent is "ozone".
	The indefinite article is "Honey's".
	Include (- with articles "Honey's" "the" "a", -) when defining portable transistor radio.

Grandpas_shirt is an undescribed thing in Room_Grassy_Clearing.
	The printed name is "Grandpa's shirt".
	The description is "This is the warm green plaid shirt that grandpa always wears[if grandpas_cigarettes are in location]. There are a pack of cigarettes in the pocket[end if]."
	It is a wearable [floatable] thing.
	Understand "Grandpa's/Grandpas/Grampa's/Grampas/plaid/green/warm/-- shirt" as grandpas_shirt.
	The dry_time of grandpas_shirt is 6.
	The scent is "cigarettes and cologne".

grandpas_cigarettes are scenery in Room_Grassy_Clearing.
	The printed name is "cigarettes".
	The indefinite article is "Grandpa's".
	The description is "These are Grandpa's cigarettes. Lucky Strikes. He's been smoking since World War Two.
	[paragraph break][italic type]You didn't know it then, but you had ten more years with Grandpa. It turns out, two packs a day for three or four decades can kill a man.[roman type]".
	Understand "cig/cigs/cigarette/cigarettes/smokes/pack/tobacco", "lucky strikes/strike", "pack of cig/cigs/smokes/cigarettes" as grandpas_cigarettes.
	The scent is "mmm, tobacco. You've always liked the smell".

Section - Backdrops and Scenery

A sycamore tree is [climbable] scenery in Room_Grassy_Clearing.
	The description is "You know this is a sycamore tree from YWCA Nature Camp. White flaky bark, big broad furry leaves.".

Some stubbly grass is scenery in Room_Grassy_Clearing.
	It is a lie-able surface.
	Understand "pleasant", "weeds", "carpet" as stubbly grass.

Some pine trees are backdrop in Room_Grassy_Clearing.

A low bank is scenery in Room_Grassy_Clearing.
	The description is "Honey's little portable transistor radio is sitting on the bank [if grandpas_shirt is in location]beside grandpa's shirt [end if]under the tree.".

Section - Rules and Actions



Chapter - Room_Blackberry_Tangle

Section - Description

Room_Blackberry_Tangle is a room.
The printed name is "Blackberry Tangle".
The description is "There are paths through the brambles, a maze with tantalizing fruit. Although this area is mostly picked since you and Honey and Grandpa came this way when you started picking this morning. You can still find some ripe berries though.
[paragraph break][available_exits]".
Understand "blackberry/-- tangle/maze" as Room_Blackberry_Tangle.

The casual_name is "in the blackberry tangle".

Section - Navigation

Room_Blackberry_Tangle is south of Room_Grassy_Clearing and down from Room_Grassy_Clearing.
East of Room_Blackberry_Tangle is nowhere.
[When Scene_Day_Two has begun:
	East of Room_Blackberry_Tangle is Room_Dappled_Forest_Path.]

The available_exits of Room_Blackberry_Tangle is "Through the blackberry tangle, there's a trail going down along the creek shaded by lush green willow trees. Back the way you came is the clearing where Honey and Grandpa have been picking. ";

Section - Objects

Section - Backdrops

Some pine trees are backdrop in Room_Blackberry_Tangle.

Section - Rules and Actions

[Transition text]
Instead of going to Room_Blackberry_Tangle when player is in Room_Dappled_Forest_Path:
	say "You fight your way through the blackberry brambles ripping your clothes in several places. You almost turn back at several points. But at last, finally, you emerge in a familiar place.";
	now player is clothing_ripped;
	continue the action.


Chapter - Room_Willow_Trail

Section - Description

Room_Willow_Trail is a room.
The printed name is "Willow Trail".
The description is "This is a trail running roughly parallel the creek with tall blackberry brambles on either side. In one place, there are [willows] hanging down over the trail that tickle the back of your neck as you duck under them.
[paragraph break][available_exits]".
Understand "blackberry/willow/willows trail/--" as Room_Willow_Trail.

The casual_name is "on the willow trail".

Section - Navigation

Room_Willow_Trail is south of Room_Blackberry_Tangle and down from Room_Blackberry_Tangle.

The available_exits of Room_Willow_Trail are "The trail turns to cross the overgrown stone bridge across Bear Creek. [if Scene_Day_One has not ended]You came this way with Honey and Grandpa this morning. [end if]Or you can go back toward the grassy clearing upstream. It also looks like this trail used to continue on this side downstream, but is now hidden by underbrush. You could try to follow the lost trail."

Section - Objects

Section - Backdrops and Scenery

Willows are scenery in Room_Willow_Trail.
	The initial appearance is "[description of willows]".
	The description is "Weeping willows dangle over the trail. These are smaller trees than the ones that line the banks of Bear Creek.".
	Understand "tree/trees/willow/lush/green", "willow trees" as willows.

Section - Rules and Actions


Chapter - Room_Lost_Trail

Room_Lost_Trail is a room.
The printed name is "Lost Trail".
The description is "You follow the trail on this side of the creek until it is lost, then bushwhack for a little bit, before returning discouraged. Perhaps it is a trail, but there are definitely easier ways to go for now. Still you wonder where it goes.
[paragraph break][available_exits]".
Understand "lost/-- trail", "underbrush" as Room_Lost_Trail.

The casual_name is "on the lost trail".

Section - Navigation

Room_Lost_Trail is south of Room_Willow_Trail.

The available_exits of Room_Lost_Trail are "Try as you might, looks like you don't have much choice but to head back to the willow trail."


Chapter - Room_Dappled_Forest_Path

Section - Description

Room_Dappled_Forest_Path is a room.
The printed name is "Dappled Forest Path".
The description is "This is a wide path, more of a long meadow really, that cuts through the forest toward the creek. Clumps of occasional trees making forrays from the denser woods create patches of pleasant dappled light. There are scattered thickets of blackberry here.
[paragraph break][available_exits]".
The scent is "tangy pine".
Understand "dappled/-- forest/-- path" as Room_Dappled_Forest_Path.

The casual_name is "on the dappled forest path".

Section - Navigation

East of Room_Dappled_Forest_Path is Room_Forest_Meadow.
West of Room_Dappled_Forest_Path is Room_Blackberry_Tangle.
South of Room_Dappled_Forest_Path is Room_Dark_Woods_North.

The available_exits of Room_Dappled_Forest_Path are "You can make your way east back to your forest meadow and your fort, or you can continue west toward the creek. A break in the woods to the south goes somewhere."

Section - Objects

Section - Backdrops & Scenery


Part - Region_River_Area

Section - Description

Region_River_Area is a region.
Room_Stone_Bridge, Room_Swimming_Hole, Room_Crossing are in Region_River_Area.

Section - Navigation

The return_dest of Region_River_Area is Room_Grassy_Clearing.
The forward_dest of Region_River_Area is Room_Grandpas_Trailer.
The upstream_dest of Region_River_Area is Room_Swimming_Hole.
The downstream_dest of Region_River_Area is Room_Crossing.
The uppath_dest of Region_River_Area is Room_Long_Stretch.
The downpath_dest of Region_River_Area is Room_Crossing.

Section - Backdrops and Scenery

Some backdrop_thick_trees are backdrop in Region_River_Area.
	The printed name is "thick trees".
	The description of backdrop_thick_trees is "The thick trees overhead make deep shade below[if current_time_period is morning]. The morning light filters through the leaves[else if current_time_period is afternoon], a welcome relief from the summer heat. The afternoon sunlight slants as rays through the leaves[else] under a twilit sky[end if]."
	Understand "trees", "tree", "branches" as backdrop_thick_trees.

Some backdrop_sunlight is backdrop in Region_River_Area.

Section - Rules and Actions

Instead of examining backdrop_sunlight when player is in Region_River_Area:
	try examining backdrop_thick_trees.


Chapter - Room_Stone_Bridge

Section - Description

Room_Stone_Bridge is a room.
The printed name is "Stone Bridge".
The description is "[one of]The trail crosses an old stone bridge -- an excellent place to sit on a sunny day -- from which you can look down into Bear Creek[or]The road may have crossed the creek over an old stone bridge at one time but is now just a narrow trail. From here you can peer down into Bear Creek[stopping]. Movement in the sparkling water and the old mossy bridge catch your eye. [stuff_about_the_creek].
[paragraph break][available_exits]".
The scent is "cool creek water and mossy stone".
Understand "old/-- stone/-- bridge", "river/creek/stream" as Room_Stone_Bridge.

The casual_name is "at the stone bridge".

Section - Navigation

Room_Stone_Bridge is west from Room_Willow_Trail and down from Room_Willow_Trail.

The available_exits of Room_Stone_Bridge are "On one side of the bridge, the path turns out into a dirt road that runs parallel to the creek. On the other side, the blackberry trail goes up the creek back toward the berry picking spot. You can also get in the creek or go to a grassy bank from here."

Section - Objects

Section - Backdrops and Scenery

The old stone bridge is scenery in Room_Stone_Bridge.
	It is a enterable supporter.
	The description is "The trail goes over the old bridge that was probably part of some old road. The stones of the old bridge are covered with moss. Horsetails and ferns are growing at the shady base of the bridge.".
	Understand "base/bridge/trail/narrow/under" as old stone bridge.

Bear Creek is a waterbody in Room_Stone_Bridge.
	The description is "In places, the creek seems like just a trickle, then other places it is as wide as a river. Here, it is broad and shallow as it [if player is in Room_Stone_Bridge]goes under the bridge[otherwise]flows over and around the rocky creek bed[end if]. There are bright stars twinkling on the water with pebbles and tiny minnows below. It smells like wet rocks.
	[paragraph break][stuff_about_the_creek]."
	Understand "bear/-- river/crick/water/stream" as Bear Creek.
	The scent is "cool creek water. It tingles your nose sort of".

[TODO: Make sure all names with an underscore have a printed name. Otherwise, they show up in disabugation]
Some floating_stuff is scenery in Bear Creek.
	The printed name is "floating stuff".
	Understand "leaf/leaves/skeeters/shimmering/flash/little/minnow/minnows/branch/branches/stick/sticks/stars/star/reflection/reflections/pebble/pebbles" as floating_stuff.

A boulder is a lie-able surface in Room_Stone_Bridge.
	The printed name is "boulder in the creek".
	The description is "Near the grassy bank, there is a rounded boulder in the creek. It looks like a turtle emerging from the water." Understand "boulders/rounded/turtle/rock/rocks" or "big rock" as boulder.

The grassy bank is a lie-able surface in Room_Stone_Bridge.
	Understand "grassy/-- shore/bank" as grassy bank.

Moss is scenery in  Room_Stone_Bridge.
	The description of moss is "Thanks to science camp, you're able to identify plants in the Riparian Zone. That means the area around the banks of a river."
	Understand "horsetail/horsetails/fern/ferns/moss/mosses", "horse tails" as moss.

Section - Rules and Actions

To say stuff_about_the_creek:
	say "[one of]You watch two leaves swirl by on the current[or]You follow water skeeters darting about[or]You catch a glimmering flash in the depths near a boulder[or]Little minnows are swimming about in the shallows[or]A branch floats by, catching for a moment on the bottom, and then continues on[in random order]";

Instead of taking floating_stuff:
	say "You reach for them, [one of]but they drift on down the river[or]and they move just out of reach[or]but they sink out of sight below the water[at random]."

Instead of examining floating_stuff,
	try examining bear creek.

Instead of taking moss, say "Best to leave the native plants for the health of the Riparian Ecosystem. (Thanks, Nature Camp.)"

Instead of entering Bear Creek,
	try doing_some_swimming.

Instead of doing_some_swimming in Room_Stone_Bridge:
	say "The water is too shallow to swim, so you roll up your pant legs and wade in, soaking your tennies. Uh oh, will you get in trouble for that? But the water is chill and refreshing.";
	make tennis_shoes wet	;
	now dry_time of tennis_shoes is 10;

Test bridge with "d.d.d.get berries.again.again.again.d.d.d.";


Chapter - Room_Swimming_Hole

Section - Description

Room_Swimming_Hole is a room.
	The printed name is "Swimming hole".
	The description is "[if player was in Room_Long_Stretch]Down a long wooded trail that zigs down the bank, you emerge from the thick woods, and the trees open up to the sky. [end if]The swimming hole lies before you, a deep pool carved out of and surrounded by smooth granite rocks. It is big enough that you can swim like they taught you at the YWCA from one end to the other, and deep enough to dive off the rocks.
	[paragraph break][available_exits]".
	The scent is "cool creek water and mossy rocks".
	Understand "swimming/-- hole/pool", "hole/pool", "zigzag/steep trail" as Room_Swimming_Hole.

The casual_name is "at the swimming hole".

Section - Navigation

Room_Swimming_Hole is east of Room_Long_Stretch, and down from Room_Long_Stretch.

The available_exits of Room_Swimming_Hole is "It is possible to walk along the rocky shore downstream to another spot along the creek. Back up the trail leads through the woods back to the dirt road."

Section - Objects

A pool_log is a thing in Room_Swimming_Hole.
	The printed name is "floating length of log".
	The description is "There is a floating length of log here, bobbing around at the edges of the swimming hole."
	Understand "floating/-- length of log", "floating/-- log/wood/driftwood" as pool_log.

Section - Backdrops and Scenery

The deep pool is a waterbody in Room_Swimming_Hole.
	The description is "The creek tumbles down some big granite rocks here and forms a deep pool. You can't see the bottom. And that makes you [nervous]."
	Understand "deep pool", "swimming hole", "Bear/-- river/creek/crick/water/stream" as deep pool.

Some smooth granite rocks are a lie-able surface in Room_Swimming_Hole.

The rocky_shore_north is a surface in Room_Swimming_Hole.
	The printed name is "rocky shore".
	The description is "You can walk along the creek downstream over a rocky shore.".
	The destination is Room_Crossing.
	Understand "rocks", "rocky/-- shore/bank" as rocky_shore_north.

[Instead of entering rocky_shore_north:
	try room_navigating Room_Crossing;]

Section - Rules and Actions

[Transition text]
Instead of going to Room_Swimming_Hole when player is in Room_Long_Stretch:
	say "As you step out of the oppressive heat, the cool shade is a welcome relief. You work your way down the steep trail.";
	continue the action.

[Transition text]
Instead of going to Room_Swimming_Hole when player is in Room_Crossing:
	say "You carefully navigate the rocky bank, making your way upstream.";
	continue the action.

Instead of taking pool_log, say "Too heavy."

Instead of taking off clothes in Room_Swimming_Hole:
	say "You look around again to see if you are alone[one of]. The path from the dirt road is deep forest and there is no one else at the swimming hole[or] and there is no one in sight[stopping]. So you carefully strip down to your skivvies, folding your clothes on the rocks.";
	drop_all_your_stuff;

Instead of taking off tennis_shoes in Room_Swimming_Hole:
	say "You take off your shoes and put them on the rocks.";
	move tennis_shoes to location;

Instead of going from Room_Swimming_Hole:
	put clothes back on;
	continue the action.

Instead of entering deep pool:
	try doing_some_swimming.

Instead of jumping in Room_Swimming_Hole:
 	try doing_some_swimming.

Deep pool has a number called swim attempts. Swim attempts is 0.

Instead of doing_some_swimming in Room_Swimming_Hole:
	increase swim attempts of deep pool by 1;
	if swim attempts of deep pool is greater than 1:
		say "[if clothes are worn]You look around again to see if you are alone[one of]. The path from the dirt road is deep forest and there is no one else at the swimming hole[or] and there is no one in sight[stopping]. So you carefully strip down to your skivvies, folding your clothes on the rocks. [run paragraph on][end if][one of][swimming_payoff][or]You leap in! Cold! But you get used to it, and it feels good. Actually, it feels great, as you swim around for a bit[or]You try diving like they taught you at the YWCA, but you're scared of conking your head. So your uncommitted dive turns into a belly flop[or]You make a huge splash[or]The water feels refreshing on this hot day[or]You dip in the cool water and swim about[stopping]. When you get out of the water, [one of]the warm air feels good on your skin[or]you dry quickly in the warm air[or]you stand in the cool shade, and you get a sudden chill[in random order].[paragraph break]";
		now player is courageous;
		now player is swim_experienced;
		drop_all_your_stuff;
		make underwear wet;
	else:
		say "Hmm, are you sure? [if clothes are worn]You don't have a bathing suit, so you'd have to strip down to your undies[otherwise]The water is likely to be pretty cold[end if].";


Chapter - Room_Crossing

Section - Description

Room_Crossing is a room.
The printed name is "The Crossing".
The description is "Here the creek broadens out a little and, except for a place in the middle where the current is swift, there are big stones, boulders really, scattered about in the river.
[paragraph break][available_exits]".
The scent is "cool creek water and mossy rocks".
Understand "crossing" as Room_Crossing.

The casual_name is "at the river crossing".

Section - Navigation

North of Room_Crossing is Room_Swimming_Hole.
East of Room_Crossing is Room_Other_Shore.

The available_exits of Room_Crossing are "The shoreline ends at a steep bank further downstream, though it looks like you might be able to cross the creek to the other shore on the boulders in midstream. You can also go back along the rock shore to the swimming hole upstream."

Instead of entering rocky_shore_south:
	try room_navigating Room_Swimming_Hole;

Instead of entering boulders_west:
	try room_navigating Room_Other_Shore;

Instead of entering bridge_log_west:
	try room_navigating Room_Other_Shore;

Instead of climbing swift_current_west:
	try room_navigating Room_Other_Shore.

Instead of jumping when player is in Room_Crossing:
	try room_navigating Room_Other_Shore.

Section - Objects

A bridge_log_west is a surface in Limbo.
	The printed name is "a floating length of log".
	The initial appearance is "A log has floated down the creek and is wedged in the boulders in the middle of the creek.".
	The description is "A log has floated downstream in the swift current. It is wedged between two boulders forming a kind of bridge."
	The destination is Room_Other_Shore.
	Understand "floating/-- length/-- of/-- bridge/wood/driftwood/log west/--", "drift wood" as bridge_log_west.

Section - Backdrops and Scenery

The rocky_shore_south is a surface in Room_Crossing.
	The printed name is "rocky shore".
	The description is "You can walk along the creek downstream over a rocky shore.".
	The destination is Room_Swimming_Hole.
	Understand "rocks", "rocky/-- shore/bank" as rocky_shore_south.

Some boulders_west are a surface in Room_Crossing.
	The printed name is "scattered boulders".
	The description is "There are scattered boulders in the creek bed on which you might be able to cross."
	The destination is Room_Other_Shore.
	Understand "scattered/-- boulder/boulders/stones/rocks" as boulders_west.

The swift_current_west is a waterbody in Room_Crossing.
	The printed name is "swift current".
	It is a enterable unopenable open container.
	The description is "The river here narrows to a swift current, too broad to jump across and too swift to wade or swim -- or in any case, you're not willing to risk drowning here."
	Understand "bear/swift/-- river/creek/crick/water/stream/gap/chasm/current" as swift_current_west.

A steep bank is scenery in Room_Crossing.
	The description of steep bank is "It's pretty steep. And covered in poison oak."

Section - Rules and Actions

Test crossing with "s.s.s.w.w.s.e.s.".

[Transition text]
Instead of going to Room_Crossing when player was in Room_Swimming_Hole:
		say "You carefully navigate the rocky bank, making your way downstream.";
		Continue the action.

[Transition text]
Instead of going east when player is in Room_Crossing:
 	if bridge_log_west is not visible:
		say "You [one of]get part way across on the boulders[or]hop from boulder to boulder out into the broad river[in random order], but there is an sizeable gap in the middle and a really swift current. You consider jumping across, but the slippery rocks make you reconsider.";
	else:
		say "You hop from boulder to boulder to the middle of the broad river and take a tentative step onto the floating log. Though it bobs a bit, you find that it is wedged quite firmly between the rocks. A few quick steps and you are across.";
		continue the action;

Instead of taking bridge_log_west, say "Too heavy."

Instead of climbing steep bank:
	say "You try to climb the bank, but slide back down. Too steep. Maybe you can cross the creek to the other side."

Understand "jump across" as jumping when player is in Room_Crossing.

Understand "cross [visible thing]" as climbing when player is in Room_Crossing.

Instead of searching swift_current_west:
	try examining swift_current_west;

Instead of entering swift_current_west,
	try doing_some_swimming.

Instead of doing_some_swimming in Room_Crossing:
	say current_swim_refusal.

To say current_swim_refusal:
	say "The current here is too strong and it scares you. You saw a TV show once with your grandpa about people in rafts and one man fell off and got caught under a rock and drowned. You think better of the idea.";



Part - Region_Dirt_Road

Region_Dirt_Road is a region.
Room_Dirt_Road, Room_Long_Stretch, Room_Railroad_Tracks, Room_Grassy_Field are in Region_Dirt_Road.

Section - Backdrops & Scenery

Some backdrop_sunlight is backdrop in Region_Dirt_Road.

The rutted_road is backdrop in Region_Dirt_Road.
	The description is "The old creekside road is seldom used now and in poor condition with deep ruts and sandy areas. Nowadays it is only used by people walking down to Bear Creek from the highway, fishermen and berry pickers mostly. There is tall grass growing right down the middle of the road.".
	Understand "road/trail/path/ruts/sand", "deep ruts", "tall grass" as rutted_road.

Section - Navigation

The return_dest of Region_Dirt_Road is Room_Grassy_Clearing.
The forward_dest of Region_Dirt_Road is Room_Grandpas_Trailer.
The upstream_dest of Region_Dirt_Road is Room_Stone_Bridge.
The downstream_dest of Region_Dirt_Road is Room_Picnic_Area.
The uppath_dest of Region_Dirt_Road is Room_B_Loop.
The downpath_dest of Region_Dirt_Road is Room_Dirt_Road.


Chapter - Room_Dirt_Road

Section - Description

Room_Dirt_Road is a room.
The printed name is "End of the Dirt Road".
The description is "[one of]The trail over the stone bridge turns into a dirt road here which slopes gently upward running along the creek.[or]The dirt road slopes down as it runs along the creek before turning into a trail over the stone bridge[stopping]. The old creekside road is seldom used now and in poor condition with deep ruts and sandy areas. Nowadays it is only used by people walking down to Bear Creek from the highway, fishermen and berry pickers mostly. Here, someone's field backs up to the road and is separated by a chain link fence. The field is a mass of tall weeds and old junk cars.
[paragraph break][available_exits]".
The scent is "sunshine and dust".
Understand "dirt/-- road", "end", "end of the/-- dirt/-- road" as Room_Dirt_Road.

The casual_name is "at the end of the dirt road".

Section - Navigation

Room_Dirt_Road is up from Room_Stone_Bridge and west of Room_Stone_Bridge.

The available_exits of Room_Dirt_Road are "The old dirt road continues on uphill for a long stretch running parallel to the creek downstream. Back toward the old stone bridge, the road narrows to a ragged trail as it crosses the bridge."

Section - Objects and People

The dog is in Room_Dirt_Road

[There is a dog here defined in her own section below.]

Section - Backdrops and Scenery

Someone's field is backdrop in Room_Dirt_Road.
	The description is "Someone's field backs up to the road and is separated by a chainlink fence. The field is a mass of tall weeds and old junk cars.". Understand "yard" as Someone's field.

A chainlink fence is backdrop in Room_Dirt_Road.
	The description is "A chainlink fence, drooping in the middle, fences off the field[if dog is loose]. There is a sizable hole dug under the fence[end if]."
	Understand "chain link", "cyclone fence" as chainlink fence.

Some old junk cars are backdrop in Room_Dirt_Road.
	The description is "These are old-timey cars. Big boxy things with big rounded fenders." Understand "rusty", "model-t", "old", "timey" as junk cars.

Section - Rules and Actions


Chapter - Room_Long_Stretch

Section - Description

Room_Long_Stretch is a room.
The printed name is "Long Stretch".
The description of Room_Long_Stretch is "This is a really long stretch of the dirt road that climbs up the hill. You can see the heat shimmering off of the ground. Grass grows up through the middle of the road, and deep rocky ruts suggest it hasn't been used as anything but river access for hikers and fishermen in a long time. The long road is alternately shaded by pines and exposed to the scorching sun. The air smells hot with a particular piney fragrance that always reminds you of the foothills of the Sierras.
[paragraph break][available_exits]".
The scent is "sunshine and dust".
Understand "long stretch" as Room_Long_Stretch.

The casual_name is "at the long stretch of dirt road".

Section - Navigation

Room_Long_Stretch is south of Room_Dirt_Road and up from Room_Dirt_Road.

The available_exits of Room_Long_Stretch is "At one place along this long stretch, there is a steep trail zigzagging down the bank toward the swimming hole. Otherwise the dirt road goes on for a ways along the creek downstream until it crosses the railroad tracks. Back the other way is the end of the dirt road and the stone bridge.
[paragraph break]Along the road, in a clear stretch on the uphill side of the road, is an impressively tall pine tree that you've climbed before."

Section - Objects

Section - Backdrops & Scenery

A Doug fir is [climbable] scenery. It is in Room_Long_Stretch. The description of the Doug Fir is "There is a hugely tall pine tree here. Grandpa said it was called Doug Fir (not fur like a dog, but fir, which is a kind of pine tree). The tree is on the uphill side of the road below a low bluff. The branches are almost low enough to climb which you've done a couple of times but never all the way to the top.".
Understand "tree/trees/branches/pine/pines/tall/bluff/low/fir/fur", "doug fir/fur", "pine tree/trees", "doug fir tree/trees" as Doug Fir.
The scent is "delightful piney fragrance".

Section - Rules and Actions

[Transition text]
Instead of going to Room_Long_Stretch when player is in Room_Swimming_Hole:
	say "You clamber up the steep trail. As you step out of the shaded trail, the heat is like a physical force that pushes against you.";
	continue the action.

Instead of going from Room_Long_Stretch:
	if player has been in Room_Long_Stretch and player has not been in Room_Top_of_Pine_Tree:
		say "Dang, you're pretty sure you've climbed all the way to the top of that tall pine tree before.";
	continue the action.

Instead of jumping in Room_Long_Stretch:
	try going up.


Chapter - Room_Railroad_Tracks

Section - Description

Room_Railroad_Tracks is a room.
The printed name of Room_Railroad_Tracks is "Southern Pacific Tracks".
The description of Room_Railroad_Tracks is "Railroad tracks cross the old dirt road here in a small rise. The tracks run alongside the trailer park fence in one direction and into a tunnel of green in the other. As you cross the tracks, you see a sign that says 'Property of Southern Pacific.'[first time] Your grandpa sometimes takes you down here to watch the train go by. He taught you the name of all the cars and used to work on the railroad.[only]
[paragraph break][available_exits][penny_status]".
The scent is "dust and grease".
Understand "railroad/train/sp/-- tracks", "southern pacific tracks", "railroad/train/sp crossing" as Room_Railroad_Tracks.

The casual_name is "at the railroad tracks".

Section - Navigation

Room_Railroad_Tracks is south of Room_Long_Stretch.
Down from Room_Railroad_Tracks is Room_Long_Stretch.

The available_exits of Room_Railroad_Tracks is "Across the tracks is a grassy field and the trailer park beyond. Back the other way is the long dirt road gently sloping down along the creek. Or you could follow the railroad tracks which disappear into a green tunnel of trees."

Section - Objects

Some train tracks are an undescribed fixed in place enterable supporter in Room_Railroad_Tracks.
	The description is "The steel rails are shiny on top and rusty on the sides. the wooden ties are supported by a mound of dark gray rock.".
	Understand "tracks", "track", "rails", "rail", "traintracks", "railroad", "rail road", "ties", "rusty", "shiny" as train tracks.

A penny is in Room_Railroad_Tracks.
	The initial appearance is "Hey, there's the penny you lost when you came here with Grandpa to make train pennies!".
	The description of penny is "Ah, this is a wheat penny. Its tiny numbers say 1956.".
	Understand "coin" as penny.

[TODO: The train no longer flattens the penny, fix that.]

A flattened coin is a described thing in Limbo.
	The initial appearance is "[if player is not in Room_Dream_Railroad_Tracks]Hey, the train flattened the wheat penny! You made a lucky coin![else]Your lucky penny is here.[end if]".
	The description is "The train rolled over your penny and turned it into a flattened oval. You can't read it anymore, but you can see a very faint image of Lincoln with a stretched head.".
	The printed name of the flattened coin is "flattened train penny."
	Understand "lucky/flattened/flat/train/-- penny/coin" as flattened coin.

A mound_of_rock is a undescribed fixed in place supporter in Room_Railroad_Tracks.
	The printed name is "mound_of_rock".
	The description is "Grandpa called these ballast, rocks that line the railroad tracks."
	Understand "mound of rock/rocks", "rock/-- mound", "rock/rocks/stone/stones" as mound_of_rock.

A green tunnel is undescribed fixed in place enterable container in Room_Railroad_Tracks.
	The description is "The trees grow close on either side of the tracks, and their branches touch above."
	Understand "green/-- tunnel", "trees/branches" as green tunnel.

Section - Backdrops & Scenery

A sign is backdrop in Room_Railroad_Tracks.
	The description is "The sign is posted on the trailer park side of the tracks on a tall pole. It reads 'PROPERTY OF SOUTHERN PACIFIC RAILROAD. TRESPASSING, LOITERING FORBIDDEN BY LAW.'"

Section - Rules and Actions

After entering train tracks:
	say "Was that a train? Mom tells you not to play anywhere near the railroad tracks. You nervously step between the tracks, experimentally trying to balance on one rail. Be careful."

To say penny_status:
	if penny is on train tracks:
		say "[paragraph break]Your penny is still balanced on the rails.[run paragraph on]";
	else if flattened coin is on train tracks:
		say "[paragraph break]The train ran over your penny and it's flattened on the tracks! You jump up and down in excitement.[run paragraph on]";

Instead of putting the penny on the train tracks:
	say "You carefully place the penny on one of the rails.";
	now penny is on train tracks.

Instead of dropping penny when player is on train tracks:
	say "You carefully place the penny on one of the rails.";
	now penny is on train tracks.

Instead of room_navigating Room_Railroad_Tracks when player is in Room_Railroad_Tracks:
	try follow_tracks.


Chapter - Room_Grassy_Field

Section - Description

Room_Grassy_Field is a room.
The printed name of Room_Grassy_Field is "Grassy Field".
The description of Room_Grassy_Field is "This is the grassy field behind the trailer park. On either side of the rutted dirt road, golden grasses rise to your waist. The grassy field is dried golden and catches the summer sun. You like to come out here and catch grasshoppers and crickets.
[paragraph break][available_exits]".
The scent is "the sweet smell of dried hay".
Understand "grassy/-- field" as Room_Grassy_Field.

The casual_name is "in the grassy field near the trailer park".

Section - Navigation

Room_Grassy_Field is south of Room_Railroad_Tracks.

The available_exits of Room_Grassy_Field is "Through an open gate is the picnic area of the trailer park. Back the other way are the railroad tracks."

Section - Objects

Section - Backdrops & Scenery

The back gate is backdrop in Room_Grassy_Field.
	The description is "This wooden gate is at the back of the tailer park is used to go to the grassy field, across the tracks, and down to the creek. It is usually open in the daytime."

A grassy field is backdrop in Room_Grassy_Field.
	The description is "The dried grass reaches up to your waist."
	Understand "grass/field", "grassy field" as grassy field.

The back fence is backdrop in Room_Grassy_Field.

Some crickets are backdrop in Room_Grassy_Field.

Some ticks are backdrop in Room_Grassy_Field.

Section - Rules and Actions

Instead of climbing back fence, say "Perhaps it is easier to just go around through the gate."

Instead of doing anything except examining to back gate:
	say "You better leave that alone. You don't want to get in trouble."

gate_going is an action applying to nothing.
Understand "go to/through/in/-- back/-- gate", "enter back/-- gate", "exit back/-- gate" as gate_going.

Carry out gate_going:
	if player is in Room_Grassy_Field:
		try room_navigating Room_Picnic_Area;
	else if player is in Room_Picnic_Area:
		try room_navigating Room_Grassy_Field;
	else if player is in Room_Dream_Grassy_Field:
		say "It feels fuzzy and indistict, the details blury.[line break]";
	else:
		say "You don't see the gate here."

Part - Region_Up_In_Tall_Fir

Region_Up_In_Tall_Fir is a region.
Room_Halfway_Up, Room_Top_of_Pine_Tree are in Region_Up_In_Tall_Fir.

Section - Backdrops & Scenery

Some backdrop_sunlight is backdrop in Region_Up_In_Tall_Fir.

Section - Navigation

The return_dest of Region_Up_In_Tall_Fir is Room_Long_Stretch.
The forward_dest of Region_Up_In_Tall_Fir is Room_Top_of_Pine_Tree.
The upstream_dest of Region_Up_In_Tall_Fir is Limbo.
The downstream_dest of Region_Up_In_Tall_Fir is Limbo.
The uppath_dest of Region_Up_In_Tall_Fir is Limbo.
The downpath_dest of Region_Up_In_Tall_Fir is Limbo.


Chapter - Room_Halfway_Up

Section - Description

Room_Halfway_Up is a room.
The printed name is "Halfway Up".
The description is "You're about Halfway Up the tree, really pretty high. The branches definitely get thinner higher up. But here the branches are about as big around as your leg and you are sitting on a particularly sturdy one[first time]. In fact, you're feeling pretty comfortable up here. You make a monkey yell to tell the other monkeys you are now the ruler of the forest[only].
[paragraph break]Looking around, it's hard to see much of anything, although you can see [dog_from_a_distance] through the thick branches. It looks like the view is much better higher up.".
The scent is "pine sap".

The casual_name is "halfway up the big pine tree".

Section - Navigation

Room_Halfway_Up is up from Room_Long_Stretch.

The available_exits of Room_Halfway_Up is "You can climb back down or climb further up, but is it safe?"

Section - Objects

Section - Backdrops and Scenery

A Doug_Fir2 is an climbable backdrop in Room_Halfway_Up.
	The printed name is "Doug Fir".
	The description is "This is a gigantic Doug fir with thick branches near the bottom, thinning near the top. As you climb higher you can see the surrounding countryside.".
	Understand "tree/trees/branches/pine/pines/tall/bluff/low/fir/fur", "doug fir/fur", "pine tree/trees", "doug fir tree/trees" as Doug_Fir2.
	The scent is "piney fragrance".

Section - Rules and Actions

[Ensure retries and transition text]
Instead of going to Room_Halfway_Up when player is in Room_Long_Stretch:
	Increase pine tree tries of player by one;
	if pine tree tries of player is less than 3:
		say "[one of]You jump to reach the lowest branch and hang there struggling for a few moments before dropping back to the ground frustrated[or]This time, you get a leg up and hang there like a monkey, but can't quite get up on the lowest branch. You drop down when your arms start shaking[stopping].
		[paragraph break][one of]You [italic type]know[roman type] you've climbed this tree before and you were probably smaller then too. Maybe you should try again?[or]You pretty sure you've climbed this tree before. You remember that your grandpa always says that the most important character traits are courage, perseverance and self-reliance.[stopping]";
		rule fails;
	else if pine tree tries of player is not less than 3:
		say "Using the rise on the uphill side of the tree, you are able to get a hold of a branch and swing your leg over, dangling precariously for a few moments, before pulling yourself upright. After that, the tree is pretty easy to climb[first time]. Although you've now got sap all over your hands[only].";
		Now player is sappy;
		Now player is persistent;
		Now player is resourceful;
		Now player is tree_experienced;
		continue the action;

Instead of climbing Doug_Fir2:
	try going up.

Instead of climbing up when player is in Room_Halfway_Up:
	try going up.

Does the player mean climbing the Doug_Fir2 when player is in Room_Halfway_Up:
	It is very likely.
Does the player mean climbing up the Doug_Fir2 when player is in Room_Halfway_Up:
	It is very likely.

[Encourage retry and transition text]
Instead of going to Room_Long_Stretch when player is in Room_Halfway_Up:
	if treetop tries of the player is less than 2:
		say "You descend the tree, disappointed not to reach the top, and drop the last few feet to the ground.";
	else if treetop tries of the player is 2:
		say "You descend the tree favoring your aching ribs, but feeling like you let the tree discourage you. You carefully ease yourself to the ground.";
	otherwise:
		say "You work your way down the tree, dropping the last few feet to the ground.";
	continue the action;

Instead of jumping in Room_Halfway_Up,
	say "Looking down, you get a sudden crazy urge to leap into space. You resist the urge.";

Instead of yelling in Room_Halfway_Up,
	say "Your [one of]scream echoes off the surrounding hills[or]yell is heard far and wide[or]shriek causes a nearby flock of birds to take flight and it is known by all the monkeys of the forest that you are the undisputed leader of the monkeys now and forever[at random].";

Instead of throwing when player is in Room_Halfway_Up:
	try dropping the noun.

Instead of dropping when player is in Room_Halfway_Up:
	say "You're not likely to find that again if you throw that from here. You change your mind."


Chapter - Room_Top_of_Pine_Tree

Section - Description

Room_Top_of_Pine_Tree is a room.
The printed name is "Room_Top_of_Pine_Tree".
The description is "This is very close to the very top. You are holding on to the narrow trunk of the tree. You can feel it sway in the faint breeze. It is slightly cooler up here. [treetop_payoff]".
The scent is "pine sap".

The casual_name is "at the top of the big pine tree".

Section - Navigation

Room_Top_of_Pine_Tree is up from Room_Halfway_Up.

The available_exits of Room_Top_of_Pine_Tree is "Only one way to go from here and that's down."

Section - Objects

Section - Backdrops & Scenery

A Doug_Fir2 is backdrop in Room_Top_of_Pine_Tree.

The distant-creek is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "Bear Creek". The description is "Except for near the stone bridge and the swimming hole, you can only see tiny snatches of Bear Creek. Mostly, it is a dense line of trees that crosses under you.".
Understand "creek/water/stream", "Bear Creek" as distant-creek.

The distant-river is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "faraway river". The description is "You can barely see it in the summer haze. Looking beyond the faraway highway where the foothills flatten out, you can see a ribbon of green that you think is the river.".
Understand "faraway river", "river/valley/ribbon/highway/foothills" as distant-river.

The distant-town is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "distant town". The description is "You can't really see town, but you can see a few buildings, a church steeple, a water tower peeking through the trees beyond the hill.".
Understand "distant town", "town/steeple/church/tower/buildings", "church steeple", "water tower" as distant-town.

The distant-road is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "dirt road". The description is "You can see the long stretch of the dirt road under you from the train tracks to the stone bridge. [if dog is not loose]You can't quite see the dog and the fence[else]You see [italic type]something[roman type] moving around in the road[end if].".
Understand "road/trail/path/stretch/dog", "dirt road", "long stretch" as distant-road.

The distant-bridge is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "stone bridge". The description is "You can just make out the stone bridge, the grassy bank, part of the creek through the trees. Even from here, it looks shady and nice.".
Understand "bridge/stone/grassy/bank/shady", "grassy bank", "stone bridge" as distant-bridge.

The distant-pool is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "swimming hole". The description is "It is hard to see through the trees, but you can see sunlight glinting off the water in the swimming hole.".
Understand "swimming/hole/pool/glint/reflection", "swimming hole" as distant-pool.

The distant-forest is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "distant forest". The description is "The forest rolls out dark and endless over the hills that surround you."
Understand "distant forest", "forest/woods/trees/hills/around/mountains" as distant-forest.

The distant-tracks is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "railroad tracks". The description is "The tracks wind below you from beyond town out past the trailer park and the highway."
Understand "track/tracks/railroad/train", "train/railroad tracks" as distant-tracks.

The distant-trailers is scenery. It is in Room_Top_of_Pine_Tree. The printed name is "trailer park". The description is "You can see a bunch of trailers in neat rows and the picnic bench and the gate and some people moving around. You can't see your bike or tell which one is Honey and Grandpa's trailer though."
Understand "trailer/trailers/park" as distant-trailers.

Section - Rules and Actions

Test treetop with "s.s.s.w.w.s.u.u.u.u.u.u.".

[Ensure retry and transition text]
Instead of going to Room_Top_of_Pine_Tree when player is in Room_Halfway_Up:
	Increase treetop tries of player by one;
	if treetop tries of player is less than 3:
		say "[one of]Should you go any higher? You notice that the branches definitely thin out near the top of the tree. But you think about your grandpa who fought in World War 2.[or]You work your way higher into the pine tree, the branches are thinner but still seem pretty stable and--
		[paragraph break]SNAP!
		[paragraph break]--down you go!
		[paragraph break]Miraculously, you catch yourself going down! But not before clobbering yourself in the ribs pretty hard. It knocks the wind out of you and for a few minutes, you can't even say 'Ow.' You've fallen back to where you were a second ago. Perhaps if you try again sticking to the thicker branches.[line break]
		[location heading][line break][stopping]";
		now player is injured;
		rule fails;
	else if treetop tries of player is 3:
		say "This time you work your way around to the sunny side of the tree where the branches are a little bit thicker. You test each branch a little and keep a hold of another branch before committing your weight. In this way, you slowly make your way up to the top.";
		Now player is courageous;
		Now player is treetop_experienced;
	otherwise:
		say "You slowly climb to the top of the tree, carefully avoiding weak or thin branches.";
	continue the action.

[Transition text]
Instead of going to Room_Halfway_Up when player is in Room_Top_of_Pine_Tree:
	say "You carefully work your way down from the top, avoiding the thinner branches.";
	continue the action.

Instead of jumping in Room_Top_of_Pine_Tree:
	say "Looking down, you get a sudden crazy urge to leap into space. You resist the urge.";

Instead of yelling in Room_Top_of_Pine_Tree,
	say "Your [one of]scream echoes off the surrounding hills[or]yell is heard far and wide[or]shriek causes a nearby flock of birds to take flight and it is known by all the monkeys of the forest that you are the undisputed leader of the monkeys now and forever[at random].";

Instead of throwing when player is in Room_Top_of_Pine_Tree:
	try dropping the noun.

Instead of dropping when player is in Room_Top_of_Pine_Tree:
	say "You're not likely to find that again if you throw that from here. You change your mind."

[Does the player mean examining distant-train:
	it is very likely.
Does the player mean examining distant-tracks:
	it is possible.]


Part - Region_Trailer_Park_Area

Region_Trailer_Park_Area is a region.
Region_Trailer_Outdoors is a region.
Region_Trailer_Indoors is a region.

Region_Trailer_Outdoors and Region_Trailer_Indoors are in Region_Trailer_Park_Area.

Room_Picnic_Area, Room_B_Loop, Room_C_Loop, Room_D_Loop are in Region_Trailer_Outdoors.

Room_Sharons_Trailer, Room_Lees_Trailer, Room_Grandpas_Trailer are in Region_Trailer_Indoors.

Section - Backdrops & Scenery

Some backdrop_sunlight is backdrop in Region_Trailer_Outdoors.

Some sun through the windows is backdrop in Region_Trailer_Indoors. The description of sun through the windows is "[if current_time_period is not evening]The [current_time_period] sun streams through the windows dappled by the trees outside[otherwise]It is growing darker outside[end if]."
Understand "sunlight", "sunshine", "light", "sky", "curtains", "window" as sun through the windows.

Section - Navigation

The return_dest of Region_Trailer_Outdoors is Room_Grassy_Clearing.
The forward_dest of Region_Trailer_Outdoors is Room_Grandpas_Trailer.
The upstream_dest of Region_Trailer_Outdoors is Limbo.
The downstream_dest of Region_Trailer_Outdoors is Limbo.
The uppath_dest of Region_Trailer_Outdoors is Room_B_Loop.
The downpath_dest of Region_Trailer_Outdoors is Room_Stone_Bridge.

The return_dest of Region_Trailer_Indoors is Room_Grassy_Clearing.
The forward_dest of Region_Trailer_Indoors is Limbo.
The upstream_dest of Region_Trailer_Indoors is Limbo.
The downstream_dest of Region_Trailer_Indoors is Limbo.
The uppath_dest of Region_Trailer_Indoors is Limbo.
The downpath_dest of Region_Trailer_Indoors is Limbo.


Chapter - Room_Picnic_Area

Section - Description

Room_Picnic_Area is a room.
The printed name is "Picnic Area".
The description of Room_Picnic_Area is "At the back of the trailer park, there is a scraggly little Room_Picnic_Area with a patchy lawn that smells like mowed grass. A little cluster of tall trees is against the back fence.
[paragraph break][available_exits]".
The scent is "dust and mowed grass".
Understand "picnic area" as Room_Picnic_Area.

The casual_name is "in the picnic area of the trailer park".

Section - Navigation

Room_Picnic_Area is south of Room_Grassy_Field.

The available_exits of Room_Picnic_Area are "Along the road, is the rest of the trailer park starting with D Loop. Through the back gate is the grassy field."

Section - Objects

Section - Backdrops & Scenery

The back gate is backdrop in Room_Grassy_Field.
The back fence is backdrop in Room_Picnic_Area.

A patchy lawn is backdrop in Room_Picnic_Area.
	The description is "The scraggly lawn is down to bare dirt in spots and around the edges, but near the picnic table is green and freshly mowed."
	Understand "patchy", "mowed", "mown", "grass" as patchy lawn.

A picnic table is backdrop in Room_Picnic_Area.

A little cluster of tall trees is backdrop in Room_Picnic_Area.
	The description is "This little cluster of tall trees is huddled at the back of the Room_Picnic_Area against the back fence. The branches don't start until half way up the tree."
	Understand "tree" as little cluster of tall trees.

The back fence is backdrop in Room_Picnic_Area.
	The description is "This is the back fence of the trailer park."

An ant hill is a fixed in place thing in Room_Picnic_Area.
	The initial appearance is "There is an impressive red ant hill near the picnic table[first time]. Red ants are your sworn enemies. They're the ones who started the war, not you. A bunch of them ganged up and bit you, and all you were doing was trying to put them in a bottle for your ant colony[only]. [ant stuff].".
	The description is "This ant hill rises up higher than the top of your sneakers. [ant stuff].".
	Understand "anthill/anthole", "ant hill/colony/mound/burrow/hole", "hill/colony/mound/burrow/hole", "red ant/ants" as ant hill

Some remains, a seed, and a drop of something on the pavement are scenery in Room_Picnic_Area.

A huge Jerusalem cricket is scenery in Room_Picnic_Area.
The description is "This huge translucent brown bug is totally gross when it is alive, so now that it is half smashed, half decayed and swarming with red ants, it is indescribably disgusting. You are totally fascinated.";

Section - Rules and Actions



Chapter - Room_D_Loop

Section - Description

The Room_D_Loop is a room.
The printed name is "D Loop".
The description is "The D Loop of the trailer park is pretty much like the B and C Loops. Rows of trailers on either side, many fringed with teeny tiny gardens of flowers and shrubs. The most noteworthy thing on this loop is the Cat Lady's trailer, painted bright pink and white with an outrageously overflowing flower garden out in front.
[paragraph break][available_exits]".
The scent is "that smell when water falls on hot asphalt".
Understand "d loop", "loop d" as Room_D_Loop.

The casual_name is "in D loop of the trailer park".

Section - Navigation

East from Room_D_Loop is Room_Picnic_Area.
West from Room_D_Loop is Room_C_Loop.
Inside and south from Room_D_Loop is Room_Sharons_Trailer.

The available_exits are "You can go to the C Loop on the way to Honey and Grandpa's trailer. Or you can go back to the picnic area at the back of the trailer park."

Section - Objects

The sharons_virtual_trailer is a fixed in place undescribed enterable container in Room_D_Loop. 	The printed name is "Cat Lady's trailer".
	The description is "The most noteworthy thing on this loop is the Cat Lady's trailer, painted bright pink and white with an outrageously overflowing flower garden out in front."
	Understand "catlady's/catladys/sharon's/sharons/shannon's/shannons/pink/-- trailer/house/place/home", "cat lady's/ladys trailer/house/place/home" as sharons_virtual_trailer.

Section - Backdrops & Scenery

The Sharon's garden is scenery. It is in Room_D_Loop.
	The printed name is "Cat Lady's garden".
	The description is "The Cat Lady's garden is overflowing with red and orange and white and yellow flowers."
	Understand "cat lady's garden", "Sharon's/Shannon's/-- garden", "flowers/plants", "red/orange/white/yellow", "hose" as Sharon's garden.
	The scent is "perfumy flowers. A bit too much actually."

Trailers are backdrop in Room_D_Loop.
	The description is "The trailers all look pretty much the same to you, give or take a cyprus tree here or a yard filled with colorful gravel.".
	Understand "loop/street/neighborhood" as trailers.

Some gardens are backdrop in Room_D_Loop.
	The description is "Some of those trailers that don't have yards full of gravel, have tiny little gardens in front[if player is in Room_D_Loop]. But while some people's gardens consist of a few succulents or bushes, the Cat Lady's garden looks like a flower truck exploded[end if].".
	Understand "gravel", "yards" as gardens.

Big old cars are backdrop in Room_D_Loop.
	The description is "Most of the cars parked under the carports are enormous. Some of them are like antiques with fins and everything.".
	Understand "driveway/carport", "car port" as big old cars.

Section - Rules and Actions

Instead of entering sharons_virtual_trailer:
	try room_navigating Room_Sharons_Trailer.

Instead of inserting something into sharons_virtual_trailer:
	say "You might want to just go in there."


Chapter - Room_Sharons_Trailer

Section - Description

Room_Sharons_Trailer is a room.
The printed name is "Cat Lady's Trailer".
The description is "[one of]The first thing you notice is the smell of cat pee and rotten fish[or]You are starting to get used to the smell[stopping]. Rose-tinted light comes slanting through the dingy ruffled curtains. The Cat Lady's Trailer is full of lace doilies, porcelain figurines, and most of all cats -- sitting, lying, prowling, and meowing. The little figures catch your eye."
The scent is "Yucky fish and cat pee".
The outside_view is "D Loop".
Understand "catlady's/catladys/sharon's/sharons/shannon's/shannons/pink/-- trailer/house/place/home", "cat lady's/ladys trailer/house/place/home" as Room_Sharons_Trailer.

The casual_name is "in the Cat Lady's trailer".

Section - Navigation

Outside from Room_Sharons_Trailer is Room_D_Loop.
North from Room_Sharons_Trailer is Room_D_Loop.

Section - Objects

Mika figure is an undescribed [sinkable] thing in Room_Sharons_Trailer. The description of Mika is "It looks just like your cat Mika. It's white and black with all the spots in the right place. It even has Mika's one droopy ear.".
Understand "figurine", "statue", "sculpture", or "toy" as Mika.
The Mika figure can be palmed.

Your teacup is on Cat Lady's kitchen table. It is an unopenable open container. The description is "[one of]This is a teacup -- not at all like the coffee mugs at home -- made of china, complete with a delicate little handle. The complicated rose-colored pattern may be dogs and fancy men on horses. Your teacup is [or]Your teacup is [stopping][if your teacup is unfilled]empty[else]full of tea barely worthy of the name, a lukewarm watery somewhat tea-flavored liquid[end if]."
Understand "cup/teacup/tea/mug/glass/lukewarm/watery/tea-flavored/liquid", "tea cup" as teacup.
Your teacup can be filled or unfilled. It is unfilled.
[Some tepid tea is an undescribed edible thing.
The description is "This tea is barely worthy of the name, a lukewarm watery somewhat tea-flavored liquid."]

Section - Backdrops & Scenery

Cat Lady's couch is a lie-able surface in Room_Sharons_Trailer.
	The indefinite article is "".
	The printed name is "what was formerly a loveseat".
	The description is "This once was a loveseat. Now it is a pile of cat-shredded upholstery and stuffing, and smells like cat pee.".
	Understand "sofa", "loveseat", "couches", "divan", "cat pee", "shredded", "upholstery", "stuffing" as Cat Lady's couch.

The Cat Lady's kitchen table is an undescribed fixed in place enterable sit-at-able supporter  in Room_Sharons_Trailer.
	It is an enterable sit-at-able supporter.
	The description is "This is the kitchen table, half buried in cat food cans and bags and other stuff. There is a space cleared off for teacups, teapot, tea cozies, and tea things which occupy a corner. There are a few chairs around the table, some are even clear enough to sit on.".
	Understand "kitchen", "cat food", "can/cans", "bag/bags", "chairs", "chair" as Cat Lady's kitchen table.

Some tea things are scenery on Cat Lady's kitchen table.
	The description is "A china teapot, a tea cozy, teacups and saucers, and other mysterious tea things occupy a corner of the table. All the china is in a dizzyingly complex rose-colored pattern."
	Understand "tea cups/pot/pots/cozy/cozies/strainer/saucer/saucers/thing", "teapot/teacup/teacozy/teacozies/teastrainer/pattern/dizzying", "cups/pot/pots/cozy/cozies/strainer/saucer/saucers/china/rose/rose-colored/mysterious/thing" as tea things.

Your teacup is an undescribed unopenable open container on Cat Lady's kitchen table.
	The description is "[one of]This is a teacup -- not at all like the coffee mugs at home -- made of china, complete with a delicate little handle. The complicated rose-colored pattern may be dogs and fancy men on horses. Your teacup is [or]Your teacup is [stopping][if your teacup is unfilled]empty[else]full of tea barely worthy of the name, a lukewarm watery somewhat tea-flavored liquid[end if]."
	Understand "cup/teacup/tea/mug/glass/lukewarm/watery/tea-flavored/liquid", "tea cup" as teacup.

Your teacup can be filled or unfilled. It is unfilled.

[Some tepid tea is an undescribed edible thing.
The description is "This tea is barely worthy of the name, a lukewarm watery somewhat tea-flavored liquid."]

[Instead of taking tea things,... what? the default's not good enough?]

The sharons_tv is scenery device in Room_Sharons_Trailer.
	The printed name is "TV".
	The description is "This is a standard color set, but not as big and fancy as Honey's.".
	Understand "tv/television/tele/tely/telly/boob/tube/set" as sharons_tv.
	The indefinite article is "the".
	Include (- with articles "The" "the" "a", -) when defining sharons_tv.

Knickknacks are scenery.
	They are in Room_Sharons_Trailer.
	The description of knickknacks is "The house is full of this stuff. Especially little porcelain figurines of cats. On little shelves, in glass cabinets, everywhere[if player does not hold Mika figure][one of]. You notice[or]. You are especially taken with[stopping] one that looks exactly like Mika[end if].".
	Understand "Porcelain", "figurines", "figures", "sculpture", "lace", "doilies", "shelves", "shelf", "glass", "cabinets", "cabinet" as knickknacks.

Mika figure is an undescribed sinking thing in Room_Sharons_Trailer.
	The description of Mika is "It looks just like your cat Mika. It's white and black with all the spots in the right place. It even has Mika's one droopy ear.".
	Understand "figurine", "statue", "sculpture", or "toy" as Mika.
The Mika figure can be palmed.

Section - Rules and Actions

Instead of drinking teacup:
	if player does not hold teacup:
		try silently taking teacup;
	if player holds teacup:
		if teacup is filled:
			say "You bring the tiny teacup to your lips and drain it in a sip or two. The tea is lukewarm and watery, but okay.";
			now your teacup is unfilled;
		else:
			say "You bring the cup to your lips only to find that it's empty.";

Instead of taking tea things:
	say "Best not to mess with that.";

Does the player mean doing anything to tea things: it is unlikely.

Understand "get --/more tea", "fill teacup" as a mistake ("It would be rude for a guest to fill their own teacup. Honey's efforts to teach you manners were not wasted.").

Instead of switching on the sharons_tv:
	if sharons_tv is not switched on:
		say "[first time][description of sharons_tv]
		[paragraph break][only]The moment you start to turn it on, the Cat Lady comes in and says, 'Let's keep that off for now. My shows are on soon. You can watch with me then.'";

Instead of taking Mika:
	if player is in Room_Sharons_Trailer:
		say "[one of]You quickly palm the figurine, but the Cat Lady[if Sharon is in Room_D_Loop] comes in at just that moment and [end if] immediately notices it missing. 'Oh be careful with that, Dear,' she says, plucking the Mika figure out of your hand. 'That was made all the way in Ohio.' She places it back on the shelf in the exact same place. [if Sharon is in Room_D_Loop]
		[paragraph break]She looks back at you one more time before going back out to her garden[end if][or]You're not sure you want to risk it again[stopping].";
		now Mika figure is palmed;
		now Mika is familiar;
	otherwise:
		continue the action;

Instead of going north when player is in Room_Sharons_Trailer and (Mika has been palmed):
	say "You look at the Cat Lady[if Sharon is in Room_D_Loop] outside watering her plants[otherwise] who's not paying attention for one moment[end if] and[paragraph break]with your heart pounding in your throat, you pocket the little Mika figurine.";
	Now player holds Mika;
	Now player is courageous;
	Continue the action.

[Instead of doing anything except object_navigating or examining or taking or quizzing or informing or implicit-quizzing or implicit-informing Mika, say "Best to just keep that in your pocket for now."]

Instead of touching Mika,
	try examining Mika.

Instead of showing Mika to Sharon,
	try giving Mika to Sharon.

Instead of giving Mika to Sharon:
	Say "[one of]'Well, I'll be. You are an honest, sweet little child.' she says. 'That little black and white cat was given me by my Joseph, God rest his soul. But, dearie, I want you to have it now. It belongs with you.' There are tears in her eyes. She closes your fist around the figurine and pats your hand, 'And you keep that little kitty safe now, you hear?' A shiver seems to pass though the Cat Lady, and she says seriously, 'And yourself too.'[or]She shakes her head, no.[stopping]";
	Now player is compassionate;
	Now player is mika_experienced;




Chapter - Room_C_Loop

Section - Description

The Room_C_Loop is a room.
The printed name is "C Loop".
The description is "C Loop is pretty much like B and D Loops. Rows of trailers on either side, all different colors[one of], though the one's across from Lee's trailer go red, brown, green, red, brown, green, which is weird. Did they do that on purpose?[run paragraph on][or].[run paragraph on][stopping] The most noteworthy thing on this loop for you is Lee's trailer, though it looks pretty much like every other one. [line break]
[paragraph break][available_exits]".
The scent is "Lee's cigarette smoke lingering in the air".
Understand "C Loop", "loop c" as Room_C_Loop.

The casual_name is "in C loop of the trailer park".

Section - Navigation

East from Room_C_Loop is Room_D_Loop.
West from Room_C_Loop is Room_B_Loop.
Inside and south from Room_C_Loop is Room_Lees_Trailer.

The available_exits are "You can go to B Loop where Honey and Grandpa's trailer is, or you can go back to D Loop."

Section - Objects

lees_virtual_trailer is a fixed in place undescribed enterable container in Room_C_Loop.
	The printed name is "Lee's trailer".
	The description is "Lee's trailer looks pretty much like every other one, brown or beige or light green. If you close your eyes, you can't remember which."
	Understand "lee's/lees/-- trailer/house/place/home" as lees_virtual_trailer.

Section - Backdrops & Scenery

A lawn chair is scenery. It is in Room_C_Loop.
	The description is "[if Lee is visible]Lee is sitting in the lawn chair[else]The lawn chair sits dutifully waiting for Lee[end if]."

A coffee can is backdrop in Room_C_Loop and in Room_Lees_Trailer.
	The printed name is "coffee can filled with stinky cigarette butts".
	Understand "cigarette butts", "ashtray" as coffee can.

Trailers are backdrop in Room_C_Loop.
Gardens are backdrop in Room_C_Loop.
Big old cars are backdrop in Room_C_Loop.

Section - Rules and Actions

Instead of entering lees_virtual_trailer:
	try room_navigating Room_Lees_Trailer.

Instead of inserting something into lees_virtual_trailer:
	say "You might want to just go in there."


Chapter - Room_Lees_Trailer

[TODO: Make sure the two seq work together going in and out of trailer (ie make sure Lee's not in two places at once), same with Sharon]

Section - Description

[TODO: Choose nearest location:
>go to c loop
C Loop
>go to trailer
Which do you mean, Cat Lady's Trailer or Lee's Trailer]

Room_Lees_Trailer is a room.
The printed name is "Lee's Trailer".
The description is "Lee's trailer is empty. Or nearly so. [first time]It looks like he moved in yesterday, but you know he's been here for a long time. Where is his furniture?[only] There is a small table with [if newspaper is on lees_table]a newspaper[else]some stuff[end if] on it and a single chair. A tiny black and white TV on a crate. And that's about it.".
The scent is "Lee's cigarette smoke lingering in the air".
The outside_view is "C Loop".
Understand "Lee's/lees/-- trailer/house/place/home" as Room_Lees_Trailer.

The casual_name is "in Lee's trailer".

Section - Navigation

Outside from Room_Lees_Trailer is Room_C_Loop.
North from Room_Lees_Trailer is Room_C_Loop.

Section - Objects

The lees_table is a undescribed fixed in place enterable sit-at-able supporter in Room_Lees_Trailer.
	The printed name is "table".
	The indefinite article is "Lee's".
	The description is "Like the rest of Lee's trailer, the table is mostly empty[if there is something on lees_table]. On the table, there's [a list of things on lees_table][end if].".
	Understand "table/chairs/chair" as lees_table.

A newspaper is floating undescribed thing on lees_table.
	The description is "[if newspaper is wet]The newspaper has gotten wet and is now unreadable[else if newspaper is stained]The newspaper is stained and is now unreadable[else]This is the local newspaper. Usually when grandpa reads the newspaper or Honey does the crossword, you ask for the comics[one of]. An article on the front page catches your eye[or]. Among the usual disasters, bombings, and boring politics, there is an article about the Viking lander to Mars[stopping][end if]."
	Understand "news/newspaper/paper/journal" as newspaper.
	The dry_time is 20.
	The newspaper can be stained.

An article is an undescribed part of the newspaper.
	The description is "[if newspaper is wet]The soggy newspaper is pretty much unreadable until it dries out.[else]Among the articles about a disaster in China (some dam broke and killed a lot of people), bombings in England, some stuff about Vietnam, and lots and lots of boring politics, there is a cool article about the Viking space probe! The first space ship to the surface of Mars! Will they find water? Martian people? (Unlikely. The orbital probes didn't see any sign of a Martian civilization.) There is a photo and a diagram of the Viking lander on page 3 and you memorize all the parts.
	[paragraph break]You spend a few minutes thinking about being an explorer on the Martian surface, where you'd weigh less than half of what you do on Earth and would be able to jump high in the air like a superhero. If you could do that here, you would leap out of the trailer park, up into the top of the big pine tree.[end if]".
	Understand "article/story/viking/lander/mars/comics/comic" as article.

A coffee mug is an undescribed unopenable open container on lees_table.
	The indefinite article is "Lee's".
	The description is "The mug has some kind of blue and yellow coat of arms on it, and says underneath in fancy letters 'Brave and True.'[run paragraph on] [if coffee mug is empty]There is nothing in Lee's coffee mug except gross.[end if][line break]".
	Understand "mug/cup/glass", "coffee mug/cup" as coffee mug.
	The scent is "stale bitter coffee".

The lees_tv is an undescribed fixed in place device in Room_Lees_Trailer.
	The printed name is "TV".
	The description is "This is a tiny portable black and white set with a giant channel changer and bent rabbit ears propped on a crate[if lees_tv is switched on] [what_show_is_playing][else].[end if]".
	Understand "tv/television/tele/tely/telly/boob/tube/set/crate/box/antenna/antennas/antena", "boob tube", "rabbit ears" as lees_tv.
	The indefinite article is "the".
	Include (- with articles "The" "the" "a", -) when defining lees_tv.

The purple_heart is a familiar thing in Limbo.
	The printed name is "Purple Heart".
	The description is "This is a gold medal with a purple ribbon. It's shaped like a heart with a purple background with a guy in the middle. The guy looks like Geroge Washington or someone. It's considerably heavier than it appears[first time].[paragraph break][if lee is visible]Lee watches you with evident enjoyment as you check out the gift.[run paragraph on][end if] Suddenly you remember that you got in trouble for the ball bearing Lee gave you from his machine shop and your mom told you to give it back. And you didn't. Because you thought it would hurt Lee's feelings.[line break][paragraph break][italic type]What will happen if your mom discovers this? You determine to hide the medal and not let her find out.[roman type][only].".
	Understand "war/service/purple/-- medal/heart/ribbon" as purple_heart.
	The indefinite article is "the".
	Include (- with articles "The" "the" "a", -) when defining purple_heart.

Section - Backdrops & Scenery

Section - Rules and Actions

Instead of inserting newspaper into pail:
	say "That's a good idea if you want to get berry stains all over it. You think better of it."

Instead of taking coffee mug:
	say "Your manners suggest that it is better to leave Lee's coffee cup alone.";

Instead of switching on lees_tv:
	if lees_tv is not switched on:
		say "Lee is the only one who lets you watch TV whenever you want and even change the channels. You switch on Lee's little black and white set.";
	continue the action;

Instead of showing purple_heart to someone:
	if second noun is not Lee:
		say "You want to show the Purple Heart, but also want to keep the feeling to yourself. Plus, what if they make you give it back? You think better of it.";
	else:
		say lee_purple_heart_story;

Instead of giving purple_heart to someone:
	if second noun is not Lee:
		say "What if they make you give it back? You think better of it.";
	else:
		say lee_purple_heart_story;



Chapter - Room_B_Loop

Section - Description

The Room_B_Loop is a room.
The printed name is "B Loop".
The description is "B Loop is just like C and D Loops, except Honey and Grandpa's trailer is right here[first time], and if you say it really really fast -- B Loop B Loop B Loop B Loop Bloop Bloop Bloop -- it sounds funny[only]. Rows of trailers on either side, some with big old cars, some not. Other than your grandparent's trailer, there's nothing really interesting here[if bicycle is visible]. Well, except for your bike[end if].
[paragraph break][available_exits]".
Understand "loop b" as Room_B_Loop.
The scent is "the scent of blackberries drifting out of Honey and Grandpa's trailer".
Understand "B Loop", "loop b" as Room_B_Loop.

The casual_name is "in B loop of the trailer park".

Section - Navigation

East from Room_B_Loop is Room_C_Loop.
Inside and south from Room_B_Loop is Room_Grandpas_Trailer.

The available_exits are "You can go in to Honey and Grandpa's trailer of course. Or you can go back to C Loop and the train tracks behind the trailer park."

Section - Objects

The grandpas_virtual_trailer is a fixed in place undescribed enterable container in Room_B_Loop.
	The printed name is "Honey and Grandpa's trailer".
	The description is "Honey and Grandpa's trailer is white with dark brown trim, and has hanging ferns from the porch.".
	Understand "Grandpa's/grandpas/honey's/honeys/grandma's/grandmas/-- trailer/house/place/home" as grandpas_virtual_trailer.

Your bicycle is a fixed in place thing in Room_B_Loop.
	The description is "This is your trusty red Schwinn with a white banana seat. Unfortunately, the tires are so flat it barely rolls. Poo."
	Understand "bike/bicycle/red/tires/flat" as your bicycle.

Section - Backdrops & Scenery

Trailers are backdrop in Room_B_Loop.
Gardens are backdrop in Room_B_Loop.
Big old cars are backdrop in Room_B_Loop.

Section - Rules and Actions

Instead of entering grandpas_virtual_trailer:
	try room_navigating Room_Grandpas_Trailer.

Instead of inserting something into grandpas_virtual_trailer:
	say "You might want to just go in there."

Instead of taking bicycle, say "Unfortunately, the tires of your bicycle are so flat it barely rolls.".

Understand "ride bike/bicycle" as a mistake ("Unfortunately, the tires of your bicycle are so flat it barely rolls.").

Understand "fix bike" as a mistake ("if only you knew how to do that, you'd ride like the wind.");


Chapter - Room_Grandpas_Trailer

Section - Description

Room_Grandpas_Trailer is a room.
The printed name is "Honey and Grandpa's Trailer".
The description is "This trailer feels comfy to you, as much home as your real home with your mom. Honey and Grandpa have lived here as long as you remember[one of]. All these things are touchstones of familiarity, the floral-patterned couch on which you and Grandpa cuddle and watch Bowling for Dollars, the big TV, even the brown carpeting with its mottled pattern that looks like lichen on rocks[or]. All of the familiar stuff, the couch and the TV are here[stopping].
[paragraph break]Today all the windows are steamed up. Fragrant steam wafts from the kitchen. Occasionally, you hear the rattle of jars and lids being washed and set out.".
The scent is "what it would smell like if you lived inside a blackberry pie".
The outside_view is "B Loop and your broken bicycle".
Understand "Grandpa's/grandpas/honey's/honeys/grandma's/grandmas trailer" as Room_Grandpas_Trailer.

The casual_name is "in Honey and Grandpa's trailer".

Section - Navigation

Outside from Room_Grandpas_Trailer is Room_B_Loop.
North from Room_Grandpas_Trailer is Room_B_Loop.

Section - Objects

Section - Backdrops & Scenery

The pot_of_blackberry_jam is scenery in Room_Grandpas_Trailer.
	The description of the pot_of_blackberry_jam is "The pot of blackberry jam is bubbling blackly on low heat like the La Brea Tar Pits -- but better smelling. Aunt Mary is staring off into space and stirring the pot continuously. There are jam_jars and lids set out ready to receive the jam when it is ready. Generally, Aunt Mary shoos you  away when she is making jam.".
	Understand "pot of blackberry/-- jam", "pot/pan", "blackberry/-- goo/jelly/jam/preserves", "stove/kitchen/burner" as pot_of_blackberry_jam.
	The scent is "the most intense blackberry smell ever. Like when blackberries dream of being the best blackberries they can be, this is what they dream".

Some jam_jars are scenery in Room_Grandpas_Trailer.
	The description of the jam_jars is "Jars and lids and pots and pans and paraffin and tongs and boiling water are laid out strategically all over the kitchen. Who knew making jam was so complicated?".
	Understand "jar", "lid/lids", "parafin/paraffin/wax", "tongs", "water", "boiling" as jam_jars.

The Honeys_tv is undescribed fixed in place device in Room_Grandpas_Trailer.
	The printed name is "TV".
	The description is "This is Honey's big color TV in its wooden case, pretty much like the one you have at home with mom, but with lighter wood. On weekend nights you lie on the floor with Grandpa and watch Bowling for Dollars, Wild World of Animals, and sometimes, if you and mom aren't going home early, Wonderful World of Disney on Sunday night.".
	Understand "honeys/honey's/-- big/color/-- television/tv/tele/tely/telly/boob/tube/set" as honeys_tv.
	The indefinite article is "the".
	Include (- with articles "The" "the" "a", -) when defining honeys_tv.

The floral print couch is a lie-able surface in Room_Grandpas_Trailer.
		The description is "Sometimes you curl up on Honey's floral print couches with a crocheted afghan and a book and spend the afternoon.".
	Understand "sofa", "couches", "divan", "floral-print" as floral print couch.

The carpet is a lie-able surface in Room_Grandpas_Trailer.
		The description of the carpet is "The carpet is this strange mottled gold-brown that looks a little bit like fallen Autumn leaves gone indistinct after the first winter rain. In any case, it is nice to lie on with grandpa and watch TV.".
	Understand "rug", "floor" as carpet.

Section - Rules and Actions

Does the player mean doing anything to pot_of_blackberry_jam: it is likely.

Instead of searching pot_of_blackberry_jam,
	try examining pot_of_blackberry_jam.

Instead of doing anything to pot_of_blackberry_jam when player is in Room_Grandpas_Trailer:
	if examining pot_of_blackberry_jam or smelling pot_of_blackberry_jam:
		continue the action;
	else:
		warn_about_jam.

Instead of doing anything to jam_jars when player is in Room_Grandpas_Trailer:
	if examining jam_jars:
		continue the action;
	else:
		warn_about_jam.

To warn_about_jam:
	say "'[one of]Oh be careful, dear. The pot is very hot,[or]Oh! Don't burn yourself, dear[or]I don't want you to get hurt, dearie[at random]' Aunt Mary shoos you out of the kitchen.".

Instead of switching on Honeys_tv:
	say "[first time][description of Honeys_tv]
	[paragraph break][only]The moment you start to turn it on, Aunt Mary comes in from the kitchen and says, '[one of]Don't you turn on that thing. If you are bored, go out and play[or]I don't want to tell your grandmother that you were in here watching TV on such a beautiful day[or]What did I tell you? Now get[stopping].'".


Part - Region_Woods_Area

Section - Description

Region_Woods_Area is a region.
Room_Other_Shore, Room_Wooded_Trail, Room_Dark_Woods_South, Room_Dark_Woods_North, Room_Forest_Meadow, Room_Protected_Hollow, and Room_Sentinel_Tree are in Region_Woods_Area.

Section - Navigation

The return_dest of Region_Woods_Area is Limbo.
The forward_dest of Region_Woods_Area is Room_Forest_Meadow.
The upstream_dest of Region_Woods_Area is Room_Forest_Meadow.
The downstream_dest of Region_Woods_Area is Room_Other_Shore.
The uppath_dest of Region_Woods_Area is Room_Other_Shore.
The downpath_dest of Region_Woods_Area is Room_Forest_Meadow.

Section - Backdrops and Scenery

Some backdrop_thick_trees are backdrop in Region_Woods_Area.

Some backdrop_sunlight is backdrop in Region_Woods_Area.

Section - Rules and Actions

Instead of examining backdrop_sunlight when player is in Region_Woods_Area,
	try examining backdrop_thick_trees.


Chapter - Room_Other_Shore

Section - Description

Room_Other_Shore is a room.
The printed name is "Other Shore".
The description is "[if Scene_Day_Two has not happened]You are on the far side of the creek where trees come right down to the water. [else]You are back at Bear Creek on the other shore from the swimming hole and the road.  Trees come right down to the water. [end if]A wooded trail goes into the forest.
[paragraph break][available_exits]".
The scent is "cool creek water and mossy rocks".
Understand "other/-- shore" as Room_Other_Shore.

The casual_name is "on the other shore of the creek".

[TODO: >cross river
You look around, but don't see Backdrop_creek. Last you remember, it was .]

Section - Navigation

West of Room_Other_Shore is Room_Crossing.
East of Room_Other_Shore is Room_Wooded_Trail.

The available_exits of Room_Other_Shore are "[if Scene_Day_Two has not happened]The creek here curves around in a funny way, but you're pretty sure that this trail must connect with the blackberry trail on this side of the creek. That was this way, right? This trail is darker and more wooded, but it looks like it gets lighter up ahead. Back the way you came, you can get most of the way across the creek by hopping from boulder to boulder.[else]You can get back across the creek by hopping from boulder to boulder and crossing on the log. Or you can go east back the way you came on the wooded trail.[end if]";

Instead of room_navigating Room_Willow_Trail when player is in Room_Other_Shore:
	try room_navigating Room_Dark_Woods_North.

Instead of entering boulders_east:
	try room_navigating Room_Crossing.

Instead of climbing swift_current_east:
	try room_navigating Room_Crossing.

Instead of entering bridge_log_east:
	try room_navigating Room_Crossing.

Instead of jumping when player is in Room_Other_Shore:
	try room_navigating Room_Crossing.

Section - Objects

A bridge_log_east is a surface in Room_Other_Shore.
	The printed name is "a floating length of log".
	The initial appearance is "A log has floated down the creek and is wedged in the boulders in the middle of the creek.".
	The description is "A log has floated downstream in the swift current. It is wedged between two boulders forming a kind of bridge."
	The destination is Room_Crossing.
	Understand "floating/-- length/-- of/-- bridge/wood/driftwood/log", "drift wood" as bridge_log_east.

Section - Backdrops and Scenery

Some boulders_east are a surface in Room_Other_Shore.
	The printed name is "scattered boulders".
	The description is "There are scattered boulders in the creek bed on which you might be able to cross."
	Understand "scattered/-- boulder/boulders/stones/rocks" as boulders_east.
	The destination is Room_Crossing.

The swift_current_east is a waterbody in Room_Other_Shore.
	The printed name is "swift current".
	It is a enterable unopenable open container.
	The description is "The river here narrows to a swift current, too broad to jump across and too swift to wade or swim -- or in any case, you're not willing to risk drowning here."
	Understand "bear/swift/-- river/creek/crick/water/stream/gap/chasm/current" as swift_current_east.

Section - Rules and Actions

[Transition text]
Instead of going west when player is in Room_Other_Shore:
	if bridge_log_east is not visible:
		say "You [one of]get part way across on the boulders[or]hop from boulder to boulder out into the broad river[in random order], but there is an sizeable gap in the middle and a really swift current. You consider jumping across, but the slippery rocks make you reconsider.";
	else:
		say "You hop from boulder to boulder to the middle of the broad river and take a few steps across the floating log. Halfway across, it shifts alarmingly and you jump the last few feet almost losing your balance. The log bobs back and settles into its place between the rocks.";
		continue the action;

Understand "jump across" as jumping when player is in Room_Other_Shore.

Understand "cross [visible thing]" as climbing when player is in Room_Other_Shore.

Instead of searching swift_current_east:
	try examining swift_current_east;

Instead of entering swift_current_east,
	try doing_some_swimming.

Instead of doing_some_swimming in Room_Other_Shore:
	say current_swim_refusal.

test shore with "teleport to other shore /abstract bridge west to crossing";

Chapter - Room_Wooded_Trail

Section - Description

Room_Wooded_Trail is a room.
The printed name is "Wooded Trail".
The description is "[if Scene_Day_Two has not happened]You are on a wooded trail going back toward Honey and Grandpa's blackberry picking spot. You think. You're pretty sure. You hear the creek over there on your left. Or is that another little stream?[else]You are on a wooded trail that you hope leads from the dark woods to the crossing. It looks kinda familiar.[end if]
[paragraph break][available_exits]".
The scent is "musty forest smell".
Understand "wooded trail" as Room_Wooded_Trail.

The casual_name is "on the wooded trail".

Section - Navigation

North of Room_Wooded_Trail is Room_Dark_Woods_South.
West of Room_Wooded_Trail is Room_Other_Shore.

The available_exits of Room_Wooded_Trail are "[if Scene_Day_Two has not happened]Best to keep going to the blackberry trail. It should connect up here in a bit. You look back the way you came. You could always go back to the shore and cross the creek. But then there's the dog.[else]You could go back into the dark wood and try another route or you can follow this trail west and see if it goes to the crossing.[end if]"

Section - Objects

Section - Backdrops

Section - Rules and Actions

Instead of room_navigating Room_Willow_Trail when player is in Room_Wooded_Trail:
	try room_navigating Room_Dark_Woods_North.

Chapter - Room_Dark_Woods_South

Section - Description

Room_Dark_Woods_South is a room.
The printed name is "Dark Woods".
The description is "[if Scene_Day_Two is not happening][day1_woods_desc][else][day2_woods_desc][end if].[paragraph break][available_exits]".
The scent is "musty forest smell".

To say day1_woods_desc:
	say "You are [one of]no longer sure where you are[or]not completely certain which way to go[or]confused[or]feeling lost[cycling]. The woods look familiar and altogether strange. It's difficult to get your bearings[first time]. You can see what might be rabbit or deer trails leading into the woods, but you are no longer sure which one takes you back to either the creek or to the blackberry trail[only]. Here there is [a list of elusive_landmarks in Room_Dark_Woods_South]";

To say day2_woods_desc:
	say "These dark woods are considerably easier to navigate by daylight. You recognize some of the landmarks you spotted last night: a madrone tree, a huge stump";

The casual_name is "in the dark woods".

[TODO: pick random elusive_landmarks and place in Room_Dark_Woods_North and Room_Dark_Woods_South - maybe two in each]

[TODO: Make sure all the things dropped in Room_Dark_Woods_South are scattered in Room_Dark_Woods_North and Room_Dark_Woods_South on day2]

Section - Navigation

North of Room_Dark_Woods_South is Room_Dark_Woods_North.
South of Room_Dark_Woods_South is nowhere.
[Later when Scene_Day_Two is happening:
	South of Room_Dark_Woods is Room_Wooded_Trail.]

The available_exits of Room_Dark_Woods_South are "[if Scene_Day_Two is not happening][day1_woods_exits][else][day2_woods_exits][end if].".

To say day1_woods_exits:
	say "[one of]In the distance, there is[or]Finally, a ways off, there is[or]Wait, in the distance, you can just make out[or]Not too far off is[or]Whew, in the distance you can just make out[or]Okay, that looks familiar, just over there[in random order] [a list of elusive_landmarks in the_distance][if a random chance of 1 in 2 succeeds]. [one of]This may be the way back to Honey and grandpa. You long to give him a hug and never let go[or]Is that the way back to the blackberry trail? You hope so[in random order][end if]";

To say day2_woods_exits:
	say "There isn't exactly a path, but you are moving in a consistent direction. You're pretty sure you are walking parallel to the creek. You can go back toward the forest meadow to the north, or you can continue south where you think you see a wooded trail";

Instead of room_navigating when player is in Room_Dark_Woods_South and Scene_Night_In_The_Woods is not happening:
	say cant_find_that;

Section - Objects

Section - Backdrops & Scenery

A white tree is an elusive_landmark in Limbo.
	The description is "Looking closer you see the tree is a dogwood growing in a place where the woods are thinner."
	Understand "white/light tree/trees", "dogwood tree/--", "nav-landmark"  as white tree.

A huge madrone tree is an elusive_landmark in Limbo.
	The description is "This is a particularly huge madrone tree whose branches twist far above your head."
	Understand "huge/-- madrone tree", "nav-landmark" as huge madrone tree

A burned out tree is an elusive_landmark in Limbo.
	The description is "This tree went through a fire at some point, but still lived. The inside is all burnt, but the outside looks like a normal tree."
	Understand "burned out/-- tree", "nav-landmark"  as burned out tree.

A bright patch in the woods is an elusive_landmark in Limbo.
	The description is "This is a bright patch in the woods with darker woods all around."
	Understand "bright/light/-- patch/clearing", "bright/light/-- patch/clearing in/of the/-- woods", "nav-landmark"  as bright patch in the woods.

[TODO: Review ALL of the understand rules for objects esp adjectives]

The sound_of_the_creek is an elusive_landmark in Limbo.
	The printed name is "sound of the creek".
	The description is "Well, you can't see it, but you thought you heard the sound of the distant creek. Now you are not so sure."
	Understand "sound/creek", "sound of the/-- creek", "nav-landmark"  as sound_of_the_creek.
	The indefinite article of sound_of_the_creek is "the".

An enormous tree stump is an elusive_landmark in Limbo.
	The description is "This is an enormous tree stump that is as tall as you are, at least twice as wide as your spread arms. It must have been cut down many years ago."
	Understand "enormous/big/huge/-- tree/-- stump", "nav-landmark"  as enormous tree stump.

A broad trail is an elusive_landmark in Limbo.
	The description is "This trail is a little bit broader than the others, though now that you are here it seems to peter out in the nearby woods."
	Understand "broad/-- trail/path", "nav-landmark"  as broad trail.

A giant fern is an elusive_landmark in Limbo.
	The description is "This is a fern growing taller than you, its fronds spraying outward like a green fountain."
	Understand "giant/huge/big/-- fern", "nav-landmark"  as giant fern.

Section - Rules and Actions

[TODO: Test dropping stuff in dark woods]

Instead of listening to the sound_of_the_creek:
	try examining noun;

Instead of listening when player is in Room_Dark_Woods_South and sound_of_the_creek is visible:
	try examining sound_of_the_creek;

[Rule for printing the name of a room when location is Room_Dark_Woods_South and Scene_Night_In_The_Woods has been happening for exactly 1 turn:
		stop.]

[Rule for printing the locale description when location is Room_Dark_Woods_South and Scene_Night_In_The_Woods has been happening for 1 turn:
		stop.]


Chapter - Room_Dark_Woods_North

Section - Description

Room_Dark_Woods_North is a room.
The printed name is "Dark Woods".
The description is "[if Scene_Day_Two is not happening]The woods still look familiar and strange, but no longer sinister. It helped to cry. You are no longer afraid. You dry your eyes and look around. You still see deer trails leading in various directions into the woods, and here there is [a list of elusive_landmarks in Room_Dark_Woods_North][else]These dark woods are considerably easier to navigate by daylight. You recognize some of the landmarks you spotted last night: a bright clearing, a burned out tree[end if].
[paragraph break][available_exits]".
The scent is "musty forest smell".
Understand "dark woods" as Room_Dark_Woods_North.

The casual_name is "in the dark woods".

Section - Navigation

North of Room_Dark_Woods_North is Room_Forest_Meadow.
South of Room_Dark_Woods_North is nowhere.

[Later when Scene_Day_Two is happening:
	South of Room_Dark_Woods_North is Room_Dark_Woods_South.
	Northwest of Room_Dark_Woods_North is Room_Dappled_Forest_Path.]

The available_exits of Room_Dark_Woods_North are "[if Scene_Day_Two is not happening]But finally, through a thinning in the trees, you see the golden grass of what looks like a forest meadow glowing in the last of the sunset light.[else]There isn't exactly a path, but it is easier to keep going in a consistent direction. You believe you are steering rougly parallel to the creek and the road you saw from the sentinel tree. You can go back to the forest meadow which you figure is north, or you can continue south through the woods to see if you can reach the wooded trail.[end if]".

Section - Objects

Section - Backdrops & Scenery

Section - Rules and Actions


Chapter - Room_Forest_Meadow

Section - Description

Room_Forest_Meadow is a room.
The printed name is "Forest Meadow".
The description is "[if Scene_Day_Two has not happened][meadow_desc_day1][else][meadow_desc_day2][end if].
[paragraph break][available_exits]".
The scent is "musty forest smell".
Understand "forest/-- meadow", "golden/-- grass" as Room_Forest_Meadow.

To say meadow_desc_day1:
	say "You have found a dark shaded forest meadow with tall grass up to your waist[first time]. You can't help thinking about ticks. You got a tick once in your neck and Honey had to burn it out with a cigarette[only]. There is a steady symphony of crickets tuning up for the night. Seeing the darkening sky overhead makes you [nervous]";

To say meadow_desc_day2:
	say "This is the dark forest meadow you found last night, except in the morning light, it is bright and crispy cold. The meadow still makes you think of ticks, but you try not to as you push through the tall grass. You can see paths in a few different directions";

The casual_name is "in the forest meadow".

Room_Forest_Meadow can be observed.

Section - Navigation

East from Room_Forest_Meadow is Room_Protected_Hollow.

[Later when Scene_Day_Two is happening:
	Up from Room_Forest_Meadow is Room_Sentinel_Tree.]
Up from Room_Forest_Meadow is nowhere.

[After player has visited Sentinel_Tree:
	West of Room_Forest_Meadow is Room_Dappled_Forest_Path;
	South of Room_Forest_Meadow is Room_Dark_Woods_North.]
West from Room_Forest_Meadow is nowhere.
South from Room_Forest_Meadow is nowhere.

The available_exits of Room_Forest_Meadow are "[if Scene_Day_Two has not happened][meadow_exit_day1][else if Scene_Orienteering has not ended][meadow_exit_day2_before_orient][else][meadow_exit_day2_after_orient][end if]."

To say meadow_exit_day1:
	say "The forest is impenetrably thick in most directions and you aren't excited about re-entering the dark woods anyway[if Room_Forest_Meadow is observed]. At the darkened edge of the meadow, you notice there is a place where a fallen tree has taken out the underbrush[end if]";

To say meadow_exit_day2_before_orient:
	say "Your fort is at the edge of the meadow nestled under a few fallen trees. And there is a tall pine tree at the other side of the meadow";

To say meadow_exit_day2_after_orient:
	say "You can now make out a dappled forest path going west that may head toward the blackberry tangle. Another break in the trees heads south through the dark woods, the direction you must have come from last night. Your fort is at the edge of the meadow nestled under a few fallen trees. And there is the sentinel tree at the other edge of the meadow";

Section - Objects

Section - Backdrops & Scenery

Some meadow grass is lie-able surface in Room_Forest_Meadow.
	The description is "Here there is tall dry grass up to your waist. You try not to think about ticks."
	Understand "tall/high/dry/meadow/-- grass/weeds", "meadow" as meadow grass.

A fallen tree is a fixed in place undescribed enterable container in Room_Forest_Meadow.
	The description is "This is a big tree that has fallen over several smaller ones and forms a sort of protected hollow."
	Understand "protected/-- hollow/cave/nest/underbrush/fort", "in/under fallen/- tree" as fallen tree.

Some crickets are backdrop in Room_Forest_Meadow.
	The description is "You can hear the clear sound of crickets even if you can't see them. Fun fact: Only boy crickets make music and they use their wings to do it. Also, their ears are on their knees."
	Understand "sound/-- of/-- crickets/grasshoppers" as crickets.

Some ticks are backdrop in Room_Forest_Meadow.
	The description is "God, you hope you don't find any of them. Or better yet, you hope they don't find you."

A virtual_sentinel_tree is climbable scenery in Room_Forest_Meadow.
	The printed name is "tall pine tree".
	The description is "This is a tall pine tree at the edge of the meadow. The low branches hang almost to the ground. This tree is asking to be climbed."
	Understand "tall/-- pine/sentinel/-- tree" as virtual_sentinel_tree.

Section - Rules and Actions

[keep player here until they Scene_STOP is over]
Instead of going to Room_Protected_Hollow when Room_Forest_Meadow is not observed:
	say "You're not going anywhere until you have a plan.";

Instead of climbing virtual_sentinel_tree:
	try room_navigating Room_Sentinel_Tree;

Instead of entering fallen tree:
	try room_navigating Room_Protected_Hollow.

Instead of climbing in fallen tree:
	try room_navigating Room_Protected_Hollow.

Instead of listening when player is in Room_Forest_Meadow and Scene_Night_In_The_Woods is happening:
	if raccoons are in Room_Forest_Meadow:
		say "The critters are waiting. It sounds like the world is holding its breath.";
	else:
 		say "You can hear the sound of crickets in the dry grass around you.";

Instead of listening to crickets:
	try examining crickets.

Instead of taking crickets:
	try hunting crickets.

Test woods with "purloin brown paper bag / teleport to other shore / go to willow trail / again "


Chapter - Room_Protected_Hollow

Section - Description

Room_Protected_Hollow is a room.
The printed name is "Protected Hollow".
The description is "[if Scene_Dreams has not ended][hollow_desc_day1][else][hollow_desc_day2][end if].
[paragraph break][available_exits]".
The scent is "musty forest smell, like dirt or mushrooms".
The outside_view is "the meadow".
Understand "protected/-- hollow", "fallen tree", "my/-- fort" as Room_Protected_Hollow.
Understand "protected/-- hollow/cave/nest" as Room_Protected_Hollow.

The casual_name is "in the protected hollow".

To say hollow_desc_day1:
	say "This is a protected hollow formed where a big tree has fallen over several smaller ones making a perfect fort. It is dark and would normally be kind of scary, but the dark woods are scarier[first time]. It helps to have some shelter. The Explorer Scouts taught you that shelter is the first thing you are supposed to find in a survival situation[only]";

To say hollow_desc_day2:
	say "You wake up in a protected hollow formed where a big tree has fallen over several smaller ones making a perfect fort. The sunlight streaks in through the branches above you[first time]. All things considered, it was rather cozy. Your mom wasn't crazy about you going to Explorer Scouts, but your stepdad said you had to. And even though you hated it at first, you learned stuff [only]. Under the protection of the fallen logs, you've made a nest of dried leaves which kept you insulated from the cold";

Room_Protected_Hollow can be made_cozy.

Section - Navigation

Outside from Room_Protected_Hollow is Room_Forest_Meadow.
West from Room_Protected_Hollow is Room_Forest_Meadow.

The available_exits of Room_Protected_Hollow are "You can climb back out and go back to the forest meadow."

Section - Objects

Some fallen_leaves are fixed in place in Room_Protected_Hollow.
	The printed name is "fallen leaves".
	The initial appearance is "[if Scene_Defend_the_Fort is not happening][fallen_leaves_appearance][end if]".
	The description is "These are probably the leaves from last autumn that have blown beneath the fallen trees. They are crispy and dry and might make a soft bed and even a warm blanket if you could pile the leaves."
	Understand "dried/fallen/-- leaves" as fallen_leaves.

To say fallen_leaves_appearance:
	if Room_Protected_Hollow is not made_cozy:
		say "There is a thick carpet of fallen leaves, dried now in the summer heat. They crunch beneath you.[run paragraph on]";
	else:
		say "You are in the middle of a warm, dry pile of leaves.[run paragraph on]"

Section - Backdrops & Scenery

Some crickets are backdrop in Room_Protected_Hollow.

Section - Rules and Actions

[Transition text]
Instead of going to Room_Protected_Hollow when player is in Room_Forest_Meadow:
	say "You crawl into the low hollow formed by the fallen tree.";
	continue the action.

[Transition text]
Instead of going to Room_Forest_Meadow when player is in Room_Protected_Hollow and Room_Protected_Hollow is made_cozy:
	say "You shake off the pile of leaves and crawl out of your nest.";
	now Room_Protected_Hollow is not made_cozy;
	continue the action.

Instead of listening when player is in Room_Protected_Hollow and Scene_Night_In_The_Woods is happening:
	if raccoons are in Room_Forest_Meadow:
		say "You hear a thumping, rustling sound. Is something trying to get at you?";
	else:
		say "You hear nothing but the crickets playing their love songs and the stars whirring in their orbits overhead.";

Every turn when Scene_Night_In_The_Woods is happening and
	player is in Room_Protected_Hollow and
	Room_Protected_Hollow is not made_cozy:
	if Scene_Defend_the_Fort is not happening:
		say "[one of]You are awfully chilly. You wish you had a blanket to keep warm[or]It's good to have shelter, but it's still too cold to sleep[or]Unless you find a way to keep warm, you are still in danger of hypothermia[cycling]."

Instead of taking fallen_leaves:
	try piling fallen_leaves.


Chapter - Room_Sentinel_Tree

Section - Description

Room_Sentinel_Tree is a room.
The printed name is "Top of the Sentinel Tree".
The description is "This is a tall pine tree, though not as tall as the massive tree near the trailer park. From here you can see the surrounding woods, and hey! There's Bear Creek! And you can see the stone bridge a ways off and can just make out the line of the long dirt road. There are trees blocking your view of where you think the trailer park is, and your heart gives a little lurch thinking about home.
[paragraph break][available_exits]".
The scent is "tangy pine".
Understand "tall/-- pine/-- tree", "pine", "sentinel tree" as Room_Sentinel_Tree.

The casual_name is "in the sentinel tree".

Section - Navigation

Down from Room_Sentinel_Tree is Room_Forest_Meadow.

The available_exits of Room_Sentinel_Tree are "Looking at the morning sun above your protected hollow, you know that's east. Bear Creek and the dirt road are to the west, and it looks like there might be a path in that direction from the forest meadow to the blackberry tangle. That makes the dark woods you came through last night south. From here, the only way is down, but at least now you have a better idea which way to go."

Section - Objects

Section - Backdrops & Scenery

Section - Navigation

Section - Rules and Actions

[Transition text]
Instead of going to Room_Sentinel_Tree when player is in Room_Forest_Meadow:
	say "You easily climb the low branches and carefully pull yourself to the top where you are high above the forest.";
	continue the action.

[Transition text]
Instead of going to Room_Forest_Meadow when player is in Room_Sentinel_Tree:
	say "You carefully work your way down from the top.";
	continue the action.

Instead of jumping in Room_Sentinel_Tree:
	say "Looking down, you get a sudden crazy urge to leap into space. You resist the urge.";

Instead of throwing when player is in Room_Sentinel_Tree:
	try dropping the noun.

Instead of dropping when player is in Room_Sentinel_Tree:
	say "You're not likely to find that again if you throw that from here. You change your mind."


Part - Region_Dreams

Section - Description

Region_Dreams is a region.
Room_Car_With_Mom, Room_Drive_In, Room_Snack_Bar, Room_Restroom,
Room_Camaro_With_Stepdad, Room_Dream_Grassy_Field, Room_Dream_Railroad_Tracks, Room_Mars, Room_Chryse_Planitia, Room_Dream_Dirt_Road are in Region_Dreams.

Section - Backdrops and Scenery

[TODO: Replace default examine uninteresting object with fuzzy dream response.]

[TODO: Create an ambiguous sky backdrop. Is it day? Is it night? ]

Section - Navigation

The return_dest of Region_Dreams is Room_Car_With_Mom.
The forward_dest of Region_Dreams is Room_Dream_Dirt_Road.
The upstream_dest of Region_Dreams is Limbo.
The downstream_dest of Region_Dreams is Limbo.
The uppath_dest of Region_Dreams is Limbo.
The downpath_dest of Region_Dreams is Limbo.

Section - Rules and Actions


Chapter - Room_Car_With_Mom

Section - Description

Room_Car_With_Mom is a room.
The printed name is "In The Car at the Drive-In".
The description is "[one of]It's Friday and your mom picked you up from school to take you to the drive-in. You know all of this, but not how you got here. You can still smell your take out dinner from Del Taco. You love these times with mom, though some part of your mind notes that they stopped when she met your stepdad. The movie is The Omen, which probably isn't a kids movie[or]You are watching a movie with mom at the drive-in[stopping]."
The scent is "bean burritos and taco sauce".
The outside_view is "the movie. [description of movie]".
Understand "Car With Mom" as Room_Car_With_Mom.

The casual_name is "at the drive-in in a dream".

Section - Navigation

Outside from Room_Car_With_Mom is Room_Drive_In.

Section - Objects

Some Del Taco wrappers on the floor are in Room_Car_With_Mom.
The description is "Some Fridays your mom picks you up from After School Care and takes you out to Del Taco. Then you go to the drive-in if there is a good movie playing."
The scent is "bean burritos and taco sauce".

Money is held by mom.
The printed name is "a dollar bill".
The description is "Mom gave you a dollar. George Washington is on this bill. You look at it carefully. What does Annuit Coeptis Novus Ordo Seclorum mean?"
Understand "dollar/cash/bill" as money.

Section - Backdrops and Scenery

The movie is backdrop in Room_Car_With_Mom.
The description is "The movie is playing on the big screen. In the last of the sunset light, you can still see the figures of kids running around at the playground at the front of the drive-in. It seems unsettling that some parents would let their kids run around in the dark.[paragraph break]Mom always tries to take you to the drive-in when there's a good movie playing. [first time]Your favorite was Escape From Witch Mountain, though it was a little scary. No wait, your favorite was Bengi. Mom loved that one too. [paragraph break][only]This one, The Omen, is scary and probably not made for kids. It's about an evil child protected by witches and dogs who kills people by looking at them."
	Understand "film/drive-in/omen/window", "drive in" as movie.

The Camaro is backdrop in Room_Car_With_Mom.
The description is "This is mom's Camaro that she's had since you were a baby. It's green and has black bucket seats. You and mom go everywhere in it, especially to Honey and Grandpa's almost every weekend."
Understand "Camaro/car/seats/dash/dashboard" as Camaro.

Section - Rules and Actions

[keep player here until they finish their convo with mom]
Instead of going to Room_Drive_In when mom_free_to_go is not true:
	say "You can't bring yourself to leave yet. There is something important here."


Chapter - Room_Drive_In

Section - Description

Room_Drive_In is a room.
The printed name is "At the Drive-In".
The description is "The movie is playing on the big screen. The drive-in is like a big parking lot but with bumps that cars can drive up on. There are a million cars here on a Friday night and each one is parked beside a pole that has the speakers you can put in your car. There is trash and drifts of spilled popcorn on the ground.
[paragraph break][available_exits]".
The scent is "popcorn".
Understand "drive-in/lot", "drive in", "parking lot" as Room_Drive_In.

The casual_name is "at the drive-in in a dream".

Section - Navigation

East of Room_Drive_In is Room_Snack_Bar.
Inside from Room_Drive_In is Room_Camaro_With_Stepdad.

The available_exits of Room_Drive_In are "You can get back in the car or head to the snack bar from which waves of popcorn smell are emerging."

Section - Objects

Virtual_camaro is fixed in place climbable enterable container in Room_Drive_In.
	The printed name is "Mom's Camaro".
	The initial appearance is "Mom's Camaro is here parked among the other cars.".
	The printed name is "Mom's Camaro".
	The description is "Mom's car is green and sleek with a black vinyl top."
	Understand "Camaro/car" as virtual_camaro.

Virtual_snack_bar is undescribed fixed in place enterable container in Room_Drive_In.
	The printed name is "the snack bar".
	The description is "The snack bar sign says 'Snack Shack.."
	Understand "snack bar/shack" as Virtual_snack_bar.

Section - Backdrops and Scenery

The movie is backdrop in Room_Drive_In.

Speaker poles are scenery in Room_Drive_In.
The description is "These are the poles that hold the speakers that you put on your window. Once mom almost drove off without putting the speaker back."

Some drive_in_cars are scenery in Room_Drive_In.
The description is "There are millions of cars here. You memorize where your mom's car is so you don't get lost."
Understand "cars" as drive_in_cars.

Some bumps are scenery in Room_Drive_In.
The description is "These are also called 'berms,' but you're not sure how you know that. Driving up on the berm with the car pointed into the sky is your favorite part of going to the drive-in."
Understand "berms/berm" as bumps.

Spilled_popcorn is scenery in Room_Drive_In.
The printed name is "spilled popcorn".
The description is "There is popcorn blowing in drifts on the ground turning the drive-in into a winter wonderland. The popcorn squeeks when you step on it."
Understand "spilled/-- popcorn/snow", "popcorn" as spilled_popcorn.

Some paper trash is scenery in Room_Drive_In.

Section - Rules and Actions

Instead of going to Room_Drive_In when player is in Room_Car_With_Mom:
	say "'Want to pick us up some Milk Duds?' mom asks, handing you some money.
	[paragraph break]Mom smiles at you, 'Hurry back,' and, as you shut the car door, adds 'I love you, pumpkin.'";
	now player has money;
	continue the action.

[TODO: Why doesn't this work?]
Instead of climbing virtual_camaro,
	try entering virtual_Camaro.

Instead of entering virtual_camaro:
	Try room_navigating Room_Camaro_With_Stepdad.

Instead of room_navigating Room_Camaro_With_Stepdad when Room_Restroom is unvisited:
	say "You really have to go. Better visit the restroom first."

Instead of entering Virtual_Snack_Bar,
	try room_navigating Room_Snack_Bar.


Chapter - Room_Snack_Bar

Section - Description

Room_Snack_Bar is a room.
The printed name is "The Snack Bar".
The description is "The line is smaller since the movie's already started. There is a big popcorn maker full of popcorn behind the counter. Candy is stacked behind glass in the counter. The floor is checked like a checkers board, and you try to only walk on the black squares. There is a lady at the counter helping people. She looks a little like the Cat Lady. The smell of popcorn and melted butter makes you want some.
[paragraph break][available_exits]".
The scent is "fresh popped popcorn and melted butter".
The outside_view is "the drive-in".
Understand "snack bar", "snackbar", "snack-bar", "snack shack" as Room_Snack_Bar.

The casual_name is "at the snack bar in a dream".

Section - Navigation

West of Room_Snack_Bar is Room_Drive_In.
Outside of Room_Snack_Bar is Room_Drive_In.
East of Room_Snack_Bar is Room_Restroom.

The available_exits of Room_Snack_Bar are "The door to the restroom is down at the end, or you can go back to the car."

Section - Objects and People

The counter lady is a undescribed _female woman in Room_Snack_Bar.
The description of the counter lady is "She looks like the Cat Lady from the trailer park, but younger somehow, and prettier. She's wearing a uniform. She looks bored as she helps the customers."
Understand "cat lady", "uniform/sharon" as counter lady.

Popcorn is edible thing in Limbo.
Popcorn can be empty, half-full, or full. Popcorn is full.
Popcorn_countdown is a number that varies. Popcorn_countdown is 8.
The printed name of popcorn is "[if popcorn is full]a heaping tub of popcorn[else if popcorn is half-full]a tub of popcorn [else]the popcorn tub from the drive-in[end if]".
The description is "This is [if popcorn is full]a small heaping tub of fresh buttered popcorn[else if popcorn is half-full]a tub of popcorn[else]the tub that your popcorn came in, sadly, empty now except for a slick of butter[end if] from the drive-in snack bar."
Understand "tub" as popcorn.
The scent is "fresh popped popcorn and melted butter".

Milk Duds are edible things in Limbo.
The printed name is "a big box of Milk Duds".
The description is "This is the a box of Milk Duds from from the drive-in snack bar. You like the way they solidly clunk around inside when you shake it."

Section - Backdrops and Scenery

Some_people are scenery in Room_Snack_Bar.
The printed name is "some people".
The description is "The people look impatient. They are probably in a hurry to get back to their movie."
Understand "people/line/customers" as some_people.

Popcorn_maker is scenery in Room_Snack_Bar.
The printed name is "popcorn".
The description is "The popcorn maker is sending forth great clouds of steam and fresh popcorn, making the whole snack bar smell amazing. It makes your mouth water."
Understand "popcorn maker", "popcorn" as popcorn_maker.

Candy_selection is scenery in Room_Snack_Bar.
The printed name is "candy".
The description is "In the glass case, there is a wide variety of candies in large boxes, all printed in bright colors. But you only have eyes for your favorite, Milk Duds."
Understand "candy/counter/case", "milk duds" as candy_selection.

Section - Rules and Actions

Test snacks with "teleport to car with mom / go to snack bar / go to snack bar".

[Popcorn]

Does the player mean doing anything other than buying to popcorn_maker:
	if player carries popcorn, it is unlikely.

Instead of taking or eating popcorn_maker:
	try buying popcorn_maker.

Instead of buying popcorn_maker when player is in Room_Snack_Bar:
	if Scene_Dream_Have_To_Pee is happening:
		say "Probably best to visit the restroom first.";
	else if the player has money:
		say "[snack_bar_interaction]She turns efficiently and fills up a tub of popcorn. You awkwardly take the popcorn, spilling a little on the counter. She says, 'That'll be a dollar, hon.' She takes your dollar, smiles, and turns to the next customer.";
		now money is in Limbo;
		now player has popcorn;
	else:
		say "Unfortunately, you have no more money."

[TODO: Implement eating the popcorn tub down.]
Instead of eating popcorn:
	decrement popcorn_countdown;
	if popcorn_countdown is less than 1:
		now popcorn is empty;
	else if popcorn_countdown is less than 7:
		now popcorn is half-full;
	say "You stuff several handfulls of popcorn in your mouth getting lost in the buttery goodness. [if popcorn is full]There is still a good bit left[else if popcorn is half-full]There is still some left[else]Alas, now it is empty[end if]."

[Candy]

Does the player mean doing anything other than buying to candy_selection:
	if player carries Milk Duds, it is unlikely.

Instead of taking or eating candy_selection:
	try buying candy_selection.

Instead of buying candy_selection when player is in Room_Snack_Bar:
	if Scene_Dream_Have_To_Pee is happening:
		say "Probably best to visit the restroom first.";
	else if the player has money:
		say "[snack_bar_interaction]She bends down and takes a box of Milk Duds from the glass counter and hands it to you. She says, 'That'll be a dollar, hon.' She takes your dollar, smiles, and turns to the next customer.";
		now money is in Limbo;
		now player has Milk Duds;
	else:
		say "Unfortunately, you have no more money."

To say snack_bar_interaction:
	say "You stand in the short line for a few minutes until you reach the counter. The Cat Lady turns to you and says 'What can I get you, hon?'
		[paragraph break]You take a deep breath and gather up your courage to say loudly and clearly what you want. You glance back at the line that has formed behind you and get a [nervous] feeling and chicken out. You hold up the dollar bill and silently point to what you want. The Cat Lady smiles.[paragraph break]"

Instead of eating Milk Duds,
	say "You take [one of]two[or]three[at random] Milk Duds from the box and [one of]chew them[or]savor their chocolatey caramely goodness[or]decide to just suck them until they are gone which lasts until you forget and chew them anyway[at random]."

[Counter Lady]

Instead of doing anything to counter lady when player is in Room_Snack_Bar:
	if examining counter lady:
		continue the action;
	else:
		say "She's helping other customers and doesn't seem to hear you."

Instead of going to Room_Camaro_With_Stepdad when player is in Room_Drive_In:
	if Scene_Dream_About_Drive_In is happening:
		say "Before you get in the car, you remember there's something you have to do.";
		stop the action;
	else:
		continue the action;



Chapter - Room_Restroom

Section - Description

Room_Restroom is a room.
The printed name is "Snack Bar Restroom".
The description is "[first time]Oh, what a relief. You use the facilities just barely in time.[paragraph break][only]The restroom is all white tile including the floors and wall. Your footsteps echo in a funny way. The stuff they use to make it not smell bad, smells bad and makes your nose tingle.
[paragraph break][available_exits]".
The scent is "the stuff they use to make it not smell bad which makes you feel like you have to sneeze. Still, that's better than the terrible pit toilets you had to use at the state park that you went to with Honey and Grandpa. One time you cried because you had to go but didn't want to go into the smelly toilets".
Understand "restroom/bathroom/toilet/potty", "bath/rest room" as Room_Restroom.

The casual_name is "at the snack bar in a dream".

Section - Navigation

West of Room_Restroom is Room_Snack_Bar.
Outside of Room_Restroom is Room_Snack_Bar.

The available_exits of Room_Restroom are "The only door out goes back to the snack bar."

Section - Objects

Section - Backdrops and Scenery

Section - Rules and Actions



Chapter - Room_Camaro_With_Stepdad

Section - Description

Room_Camaro_With_Stepdad is a room.
The printed name is "The Camaro".
The description is "You are in mom's Camaro. Your stepdad is driving. He focuses on the road and you can sense an edge of anger just beneath the surface.[first time] How did you get here? Where's mom?[only]".
The scent is "".
The outside_view is "the highway. [description of road]".
Understand "Camaro/car" as Room_Camaro_With_Stepdad.

The casual_name is "in a dream".

Section - Navigation

Outside from Room_Camaro_With_Stepdad is Room_Dream_Grassy_Field.

Section - Objects

Section - Backdrops and Scenery

The Camaro is backdrop in Room_Camaro_With_Stepdad.

The cigarette lighter is scenery in Room_Camaro_With_Stepdad.

The road is backdrop in Room_Camaro_With_Stepdad.
	The description is "The road and the trees zoom by as the car barrels down the highway.".
	Understand "trees/road/window/highway/outside" as road.

Virtual_Mom is scenery in Room_Camaro_With_Stepdad.
	The printed name is "Mom".
	The description is "Mom is no longer here."
	Understand "mom" as Virtual_Mom.

Section - Rules and Actions

[Transition text]
Instead of going to Room_Camaro_With_Stepdad when player is in Room_Drive_In:
	say "With the logic of dreams, you're in the car speeding down the road.";
	Continue the action.

Instead of searching road:
	try examining road.

Instead of doing anything except examining to cigarette lighter:
	say "No way. Touching that is a good way to lose a hand."

Instead of jumping when player is in Room_Camaro_With_Stepdad:
	try room_navigating Room_Dream_Grassy_Field.

Instead of going to Room_Dream_Grassy_Field when player is in Room_Camaro_With_Stepdad:
	if stepdad_free_to_go is false:
		say "[one of]Are you sure? The car's still moving.[or]You've got to get out of here, but how and when?[or]Wait. Maybe he will stop or slow down up ahead.[stopping]";
		stop the action;
	else:
		continue the action;


Chapter - Room_Dream_Grassy_Field

Section - Description

Room_Dream_Grassy_Field is a room.
The printed name is "Grassy Field".
The description is "This is the grassy field behind the trailer park. On either side of the rutted dirt road, golden grasses rise to your waist. [if dream_sheriff is not visible]The Cat Lady and Lee are here standing face-to-face. They look intense. Are they going to fight? Kiss? [else]The sheriff is playing a tango on the accordion -- somehow you know the loping rhythm is a tango - and Lee and the Cat Lady are dancing cheek to cheek, doing a series of tight turns and spins. You didn't even think they even liked each other.[end if]
[paragraph break][available_exits]".
The scent is "the sweet smell of dried hay".
Understand "Dream grassy/-- field" as Room_Dream_Grassy_Field.

The casual_name is "in a dream".

Section - Navigation

Room_Dream_Grassy_Field is east of Room_Camaro_With_Stepdad.

The available_exits of Room_Dream_Grassy_Field are "The gate to the trailer park seems fuzzy and out of focus. The railroad crossing is a little clearer.[if dream_sheriff is visible] The only way from here is to go on.[end if]";

Section - Objects and People

Dream_sharon is a undescribed _female woman in Room_Dream_Grassy_Field.
The description of the dream_sharon is "This is the Cat Lady alright, though none of her cats are here at the moment. She's definitely not wearing a bathrobe now, but a fancy dress that swishes around her legs and high heels. Her hair is in tight curls and her makeup is elegant. She looks beautiful. She stares in to Lee's eyes[if dream_sheriff is not visible]. What's going to happen?[else] as they dance.[end if]".
Understand "cat lady", "sharon/curls/makeup", "high heels", "evening/-- dress" as dream_sharon.

Dream_lee is a undescribed _male man in Room_Dream_Grassy_Field.
The description of the dream_lee is "Lee has his long black hair pulled back in a neat ponytail. He's not wearing his army pants, but a fancy tuxedo and a bowtie. He looks quite handsome. He's staring intensely at the Cat Lady[if dream_sheriff is not visible]. What is happening?[else] as they Tango.[end if]".
Understand "lee/ponytail/tuxedo/tie/bowtie" as dream_lee.

Dream_sheriff is an undescribed _male man.
THe printed name is "The Sheriff".
The description of dream_sheriff is "The sheriff sits on the hood of his car with his big smokey the bear hat looking serious, and playing the accordion with gusto."
Understand "sheriff/sherif/sherriff/sherrif/deputy/police/officer/pig/bill/hat/glasses" as dream_sheriff.

Section - Backdrops & Scenery

The back gate is backdrop in Room_Dream_Grassy_Field.

A grassy field is backdrop in Room_Dream_Grassy_Field.

The back fence is backdrop in Room_Grassy_Field.

Section - Rules and Actions

Instead of going to Room_Dream_Grassy_Field when player is in Room_Camaro_With_Stepdad:
	say "You open the car door and look at the surface of the road speeding by. You gather your courage and prepare to jump. Mark's hand shoots out to stop you. You duck the hand, glancing back at Mark's startled face, and jump.
	[paragraph break][line break][line break]...And land surprisingly softly, with no more force than if you had fallen down from a standstill. You pick yourself up to familiar surroundings.";
	continue the action.

Every turn when player is in Room_Dream_Grassy_Field:
	if dream_sheriff is visible:
		report_on_the_dance;

To report_on_the_dance:
		queue_report "[one of]As you watch the dancers, [or]As you watch, [or]Now, [stopping][one of]Lee spins the Cat Lady while her dress swishes around her, then lowers her into an elegant dip with her hand extended[or]they step together, first forward, then to the side, then back as if they are one person[or]Lee swishes the Cat Lady first right than left, their feet moving like magic in elegant slides beneath them[or]Lee and the Cat Lady step slow, slow, quick, quick, drag in a beautiful rhythm to the sheriff's accordion tango[or]the Cat Lady slowly lifts her knee and wraps her leg around Lee as he turns her quickly than slowly in an embrace[in random order]." at priority 1.

Instead of doing anything to dream_sharon when player is in Room_Dream_Grassy_Field:
	if examining dream_sharon:
		continue the action;
	else:
		if dream_sheriff is not visible:
			say "She looks intense. Better not bother them.";
		else:
			say "She's busy dancing the tango.";

Instead of doing anything to dream_lee when player is in Room_Dream_Grassy_Field:
	if examining dream_lee:
		continue the action;
	else:
		if dream_sheriff is not visible:
			say "He looks intense. Better not bother them.";
		else:
			say "He's too busy dancing."

Instead of doing anything to dream_sheriff when player is in Room_Dream_Grassy_Field:
	if examining dream_sheriff:
		continue the action;
	else:
		say "He's busy playing accordion."

[keep player here until they observe the dance]
Instead of going to Room_Dream_Railroad_Tracks when Scene_Dream_About_the_Tango is happening:
	if dream_sheriff has been in Room_Dream_Grassy_Field for less than two turn:
		say "Wait, you want to see what will happen.";
	else:
		continue the action.


Chapter - Room_Dream_Railroad_Tracks

Section - Description

Room_Dream_Railroad_Tracks is a room.
The printed name is "Train Crossing".
The description is "Railroad tracks cross the old dirt road here in a small rise with a sign. The tracks disappear into a tunnel of green.
[paragraph break][available_exits][penny_status]".
The scent is "dust and grease".
Understand "dream/-- railroad/train/sp/-- tracks", "southern pacific tracks", "railroad/train/sp crossing" as Room_Dream_Railroad_Tracks.

The casual_name is "at the railroad tracks in a dream".

Section - Navigation

Room_Dream_Railroad_Tracks is east of Room_Dream_Grassy_Field.

The available_exits of Room_Dream_Railroad_Tracks is "The open gate and the trailer park seems hazy and indistinct. The dirt road doesn't really seem to lead anywhere now. You could follow the railroad tracks though. The only way now is to go on."

Section - Objects

Some dream_train_tracks are an enterable supporter in Room_Dream_Railroad_Tracks.
	The printed name is "train tracks".
	The description of train tracks is "The steel rails are shiny on top and rusty on the sides. the wooden ties are supported by a mound of dark gray rock."
	Understand "tracks", "track", "rails", "rail", "traintracks", "railroad", "rail road", "ties", "rusty", "shiny" as dream_train_tracks.

A dream_mound_of_rock is an undescribed fixed in place supporter in Room_Dream_Railroad_Tracks.
	The printed name is "a mound_of_rock".
	The description is "Grandpa called these ballast, rocks that line the railroad tracks."
	Understand "rock/rocks/stone/stones" as dream_mound_of_rock.

A dream_green_tunnel is an undescribed fixed in place enterable container in Room_Dream_Railroad_Tracks.
	The printed name is "green tunnel".
	The description is "The trees grow close on either side of the tracks, and their branches touch above."
	Understand "green/tree/-- tunnel", "trees/branches", "tunnel of green/trees" as dream_green_tunnel.

Section - Backdrops & Scenery

A dream_sign is scenery in Room_Dream_Railroad_Tracks.
	The description is "The sign next to the tracks reads, 'PROPERTY OF THE RAILROAD. LUCKY PENNIES, THROWING ROCKS, WALKING ON TRACKS FORBIDDEN BY LAW.'"
	Understand "posted/railroad/warning/-- sign" as dream_sign.

The back fence is backdrop in Room_Dream_Railroad_Tracks.

The open back gate is backdrop in Room_Dream_Railroad_Tracks.

The back fence is backdrop in Room_Dream_Railroad_Tracks.

Section - Rules and Actions

Instead of putting anything on dream_train_tracks:
	say "You are pretty sure no trains are coming here.".

Instead of room_navigating Room_Railroad_Tracks when player is in Room_Dream_Railroad_Tracks:
	try follow_tracks.

Instead of taking dream_mound_of_rock:
	say "You won't need to be armed here."

Test dream-tracks with "teleport to car with mom.go to bathroom.again.again.again.teleport to dream tracks."

Chapter - Room_Mars

Section - Description

Room_Mars is a room.
The printed name is "On Mars".
The description is "This is the surface of Mars, the red planet, at least 100 million miles from Earth. [if grandpa is visible]You recognize it instantly from the Viking photos. Thick red dust scattered with various-sized dark rocks all under an orange-pink sky. You also know that it should be -80 degrees Fahrenheit, but you aren't feeling the cold. And though there is a very light unbreathable atmosphere, you aren't wearing a suit. You stumble, trying to get the hang of walking in the light gravity, only about a third of Earth's gravity. How high could you jump here?[else]Now you just feel lonely and alone. You are no longer excited at the prospect of this alien world.
[paragraph break][available_exits][end if]".
The scent is "billion year old dust".
Understand "Mars" as Room_Mars.

The casual_name is "in a dream about Mars".

Section - Navigation

Room_Mars is east of Room_Dream_Railroad_Tracks.

The available_exits of Room_Mars is "Here on this flat plain, you can go in any direction.[if Scene_Dream_Bouncing has ended] At this point, what is there left to do but go on?[end if]"

Section - Objects

A black rock is in Room_Mars.
The description is "Despite being an artifact of an alien world, it is strangely familiar like rocks you've picked up and tossed a million times at home on Earth. The word 'igneous' comes to mind out of geology books you've looked through. It means 'from fire.' It must have been spit out of the Martian volcanos billions of years ago and settled here on the plains."
Understand "black/martian/-- rock" as black rock.

Section - Backdrops and Scenery

Martian_sky is backdrop in Room_Mars.
The printed name is "Martian sky".
The description is "You take a look at the familiar but utterly alien sky. It's very light blue around the sun, and changes through violet, pink, and finally orange near the impossibly close horizon.[if Scene_Dream_Bouncing has ended] You scan the sky and can find no sign of Honey and Grandpa.[end if]".
Understand "blue/violet/orange/pink/-- sky" or "sun" as martian_sky.

Instead of examining or taking black rock:
	say "You pick up the palm-sized rock and look at it. [description of black rock] You put the Martian rock in your pocket.";
	now player has black rock;

Thick red dust is backdrop in Room_Mars.
The description is "The surface of mars is covered with thick red dust, punctuated with dark rocks. Your feet make footprints in dust that has been disturbed only by occasional dust storms for tens of millions of years."
Understand "thick/-- red/-- dust/ground/dirt" as thick red dust.

Section - Rules and Actions

[Transition text]
Instead of going to Room_Mars when player is in Room_Dream_Railroad_Tracks:
	say "You follow the railroad tracks walking silently with Honey and Grandpa, briefly balancing on the rails while you hold Honey's hand. This time, you're not worried about a train coming. You walk for a while humming a little tune. You look down and realize you've lost the train tracks and see only red dust.";
	Now honey is in Room_Mars;
	Now grandpa is in Room_Mars;
	Continue the action.

Instead of jumping when player is in Room_Mars:
	if grandpa is visible:
		say "[one of]You give a little experimental jump in the light gravity and sail up at least half your height. Grandpa and Honey watch you.[or]You try another experimental jump, this time a little harder, leaping at least your height. Grandpa smiles and Honey says, 'Be careful, Hon.'[or]This time, you really give it a good effort, jumping as high as you can, sailing to a startling height. For a moment, you are afraid you won't come down and will sail off into the sky, and Grandpa dives forward to catch you. But you reach the top of your flight and touch down lightly.[or]This time, you jump more cautiously.[stopping]";
	else:
		say "You make a halfhearted little jump, your heart not really into it.";

[keep player here until Honey and grandpa are gone]
Instead of going to Room_Chryse_Planitia when Scene_Dream_Bouncing is happening:
	say "You don't want to leave without Honey and Grandpa."

test mars with "teleport to mars.purloin honey. purloin grandpa.".


Chapter - Room_Chryse_Planitia

Section - Description

Room_Chryse_Planitia is a room.
The printed name is "Chryse Planitia".
The description is "Hey, here's the Viking 1 Lander. So that means you must be on Chryse Planitia. I guess you learned something from all those articles you read in Grandpa's newspaper.
[paragraph break][available_exits]".
The scent is "billion year old dust".
Understand "Chryse Planitia" as Room_Chryse_Planitia.

The casual_name is "in a dream about Mars".

Section - Navigation

[TODO: Fix this:
	>walk
	You'll have to say which compass direction to go in
]

Room_Chryse_Planitia is east of Room_Mars.

The available_exits of Room_Chryse_Planitia is "Other than the lander, there is nothing else here. Scanning the too-near horizon, there's little to see out there either. The only thing to do is to go on."

Section - Objects

Section - Backdrops and Scenery

Martian_sky is backdrop in Room_Chryse_Planitia.

Thick red dust is backdrop in Room_Chryse_Planitia.

The Viking 1 Lander is scenery in Room_Chryse_Planitia.
	The description is "The is the first Viking lander. It is shaped like a flying saucer, short and squat, with three tripod legs. It's about your height, not counting the communication dish on top. It has all kinds of complicated devices, wires, and tubes. It has a light dusting of Martian dust. It will be here for centuries, sending back pictures until it malfunctions."
	Understand "viking/-- 1/-- lander", "viking/saucer/tripod/legs/dish/communications/devices/wires/tubes" as Viking 1 lander.

Section - Rules and Actions

[Transition text]
Instead of going to Room_Chryse_Planitia when player is in Room_Mars:
	say "You scan the sky looking for Honey and Grandpa. As you walk-hop in the light gravity along the surface of Mars, your tennis shoes padding in the red dust, you see something in the distance. It gets closer as you walk for what seems like hours.";
	continue the action;

Instead of jumping when player is in Room_Chryse_Planitia:
	say "You don't have much enthusiasm for jumping now.";

Instead of doing anything except examining to Viking 1 lander:
	say lander_denial;

Instead of throwing anything at Viking 1 lander:
	say lander_denial;

To say lander_denial:
	say "[one of]You have a lot of respect for the NASA engineers that got the Viking lander all these tens of millions of miles. You'd hate to mess something up and damage the lander[or]You're not going to mess with this delicate machine[stopping]."

Chapter - Room_Dream_Dirt_Road

Section - Description

Room_Dream_Dirt_Road is a room.
The printed name is "Dirt Road".
The description is "The dirt road slopes down as it runs along the creek before turning into a trail over the stone bridge. There is a field full of tall weeds and junk cars separated by a chainlink fence. There is a sizable hole dug under the fence.".
The scent is "sunshine and dust".
Understand "Dream Dirt Road" as Room_Dream_Dirt_Road

The casual_name is "in a dream".

Section - Navigation

Room_Dream_Dirt_Road is east of Room_Chryse_Planitia.

The available_exits of Room_Dream_Dirt_Road are "The old dirt road that runs uphill is vague. Back toward the old stone bridge, the road narrows to a ragged trail but after that it gets fuzzy.[if dog_free_to_go is true] Time to go on or wake up.[end if]"

Section - Objects and People

[The dog is in Room_Dream_Dirt_Road]

[There is a dog here defined in her own section below.]

Section - Backdrops and Scenery

Someone's field is backdrop in Room_Dream_Dirt_Road.

The road is backdrop in Room_Dream_Dirt_Road.

A chainlink fence is backdrop in Room_Dream_Dirt_Road.

Some old junk cars are backdrop in Room_Dream_Dirt_Road.

Some tall weeds are backdrop in Room_Dream_Dirt_Road.

Some tall grass are backdrop in Room_Dream_Dirt_Road.

Section - Rules and Actions

[Transition text]
Instead of going to Room_Dream_Dirt_Road when player is in Room_Chryse_Planitia:
	say "As you walk, you look at your feet and notice that the dust has changed to a more familiar color.";
	continue the action.

[keep player here until they finish their convo with dog]
Instead of going_on when player is in Room_Dream_Dirt_Road:
	if dog_free_to_go is not true:
		say "You're pretty sure, the dog will not let you.";
	else:
		try waking up;


Book - People

Part - Jody (the Player Character)

The player is a _neutrois person.
The player is in Room_Lost_in_the_Brambles.
The description of player is "What's to say? You are eight and a half, and you are going into 4th grade in the fall. [one of]And you like watching the Wonderful World of Disney on Sunday night and Bowling for Dollars with your grandpa[or]And you and your mom play car games when you drive to Honey and Grandpa's house on the weekends[or]And you've lived in more different places than you are years old, so it's hard for you to make friends[or]And you like riding your bike on dirt roads around Honey and Grandpa's house[or]And you love cats, most of all, your cat Mika[or]And you have a crush on someone in school but you'd never in a million billion qazillion years tell anybody[in random order][other_attributes]."
[Understand "jody/Jodi/Jojo/jodie" as me.]
Understand "jody/Jodi/Jojo/jodie", "you", "me" as yourself.

Chapter - Properties

Yourself can be injured.
Yourself can be sappy.
Yourself can be dirty.
Yourself can be clothing_ripped.
Yourself can be covered_in_leaves.
Yourself can be arm_aware1.
Yourself can be arm_aware2.
Yourself can be hungry.

Yourself is either awake or asleep.
 	Yourself is awake.

Yourself can be dog_warned.

Yourself can be perceptive.
Yourself can be courageous.
Yourself can be confident.
Yourself can be resourceful.
Yourself can be affectionate.
Yourself can be persistent.
Yourself can be compassionate.
Yourself can be violent.

Yourself can be train_experienced.
Yourself can be dog_experienced.
Yourself can be swim_experienced.
Yourself can be tree_experienced.
Yourself can be treetop_experienced.
Yourself can be mika_experienced.
Yourself can be lee_experienced.
Yourself can be sharon_experienced.
Yourself can be found_by_lee.
Yourself can be found_by_sharon.

The player has a number called persistence count. Persistence count is 0.
The player has a number called Pine Tree Tries.
	Pine Tree Tries is 0.

The player has a number called Treetop Tries.
	Treetop Tries is 0.

Yourself can be warned_by_grandma.
Yourself can be free_to_wander.

Chapter - Possessions

Some tennis_shoes are an undescribed unmentionable floating thing.
	The printed name is "tennis shoes".
	Tennis_shoes are worn by the player.
	The description of tennis_shoes is "Your white and black tennies[if tennis_shoes are wet], now soaking wet[end if]".
	Understand "sneakers/shoes/shoe/tennies/feet" as tennis_shoes.
	The dry_time of tennis_shoes is 10.
	The indefinite article of tennis_shoes is "your".
	Include (- with articles "Your" "your" "a", -) when defining tennis_shoes.

Some clothes are an undescribed unmentionable floating thing.
	Clothes are worn by the player.
	The description of clothes is "Your pants and blue Mickey Mouse T-shirt".
	Understand "clothing", "dress", "pants", "tshirt", "t-shirt", "tee", "skirt", "blouse" as clothes.
	The dry_time of clothes is 10.
	The indefinite article of clothes is "your".
	Include (- with articles "Your" "your" "a", -) when defining clothes.

Some underwear are an undescribed unmentionable floating thing.
	Underwear is worn by the player.
	The description of underwear is "Mom buys you plain white cotton underwear[if underwear is wet], now slightly damp[end if]."
	Understand "panties", "drawers", "skivvies", "undies", "bra", "shorts", "jockeys", "boxers", "briefs" as underwear.
	The dry_time of underwear is 8.
	The indefinite article of underwear is "your".
	Include (- with articles "Your" "your" "a", -) when defining underwear.

Your hands are an undescribed unmentionable thing.
	Your hands are part of the player.
	The printed name is "your hands".
	The description is "Your fingers are stained blue with blackberries[if player is sappy] and spotted with pine pitch[end if].".
	Understand "hand", "fingers", "palms", "pine/tree sap", "pitch" as hands.
	The indefinite article of hands is "your".
	The scent is "[if player is not sappy]blackberries[else]tangy pine[end if]".
	Include (- with articles "Your" "your" "a", -) when defining hands.

Your arm is an undescribed unmentionable thing.
	Your arm is part of the player.
	The printed name is "your arm".
	The description of arm is "Looking carefully, you can see marks on your arm where your step-dad grabbed you, and it's still a little tender".
	The indefinite article of arm is "your".
	Understand "arms/forearm/forearms/bicep/biceps" as your arm.
	Include (- with articles "Your" "your" "a", -) when defining arm.

Instead of examining arm:
	now player is arm_aware2;
	continue the action;

A pail is an unopenable floating open container.
	The printed name is "your pail".
	It is held by the player.
	The description of the pail is "This is [one of]a purple pail with a yellow handle. You recognize this pail from your trip to the beach with mom. She had to run out and get it when the waves tried to steal it. You thought she'd be mad, but you both laughed and laughed. That was a long time ago[or]your purple beach pail[stopping][if pail is empty]. The pail is empty, but it is still stained from juice at the bottom[else if pail is quarter-full]. It has a good number of ripe berries in it and a puddle of purple juice[else if pail is half-full]. It is about half full of berries[else if pail is three-quarter-full]. It is getting pretty full of blackberries[otherwise]. ripe blackberries heap over the rim of the pail. You are careful not to spill them[end if]."
	Understand "purple/-- pail/juice" as pail.

A pail can be empty, quarter-full, half-full, three-quarter-full, or full.
	It is quarter-full.

The dry_time of pail is 1.
	Include (- with articles "Your" "your" "a", -) when defining pail.

Instead of searching pail:
	try examining pail.

Chapter - Rules and Actions

To say nervous:
	say "[one of]nervous[or]queasy[or]anxious[or]uncomfortable[or]freaked out[or]unsettled[in random order]";

To say other_attributes:
	let list_of_attributes be a list of indexed text;
	if tennis_shoes are wet and underwear are wet:
		add "your shoes and undies are wet" to list_of_attributes;
	else if tennis_shoes are wet:
		add "your shoes are wet" to list_of_attributes;
	else if underwear are wet:
		add "your undies are wet" to list_of_attributes;
	if player is sappy:
		add "your hands are spotted with pine pitch" to list_of_attributes;
	if player is dirty:
		add "you are filthy" to list_of_attributes;
	if player is clothing_ripped:
		add "your clothes are tattered" to list_of_attributes;
	if player is covered_in_leaves:
		add "you have leaves in your hair and clothes" to list_of_attributes;
	if player is injured:
		add "your ribs still ache" to list_of_attributes;
	if player is arm_aware2:
		add "your arm hurts a little" to list_of_attributes;
	if the number of entries of list_of_attributes is greater than 0:
		say ". And [list_of_attributes]";
	if the number of entries of list_of_attributes is greater than 2:
		say ". You are going to get in such big trouble";
	if player is arm_aware1:
		say ". Looking carefully, you can see marks on your arm where your step-dad grabbed you, and it's still a little tender";
		now player is not arm_aware1;
		now player is arm_aware2;

Instead of smelling player:
	if tennis_shoes are wet or underwear are wet:
		say "You smell wet.";
	else if player is dirty or player is covered_in_leaves:
		say "You smell like dirt.";
	else if player is sappy:
		say "Your hands smell like pine sap.";
	else:
		say "You don't smell like much of anything."

Instead of dropping pail during Scene_Picking_Berries:
	say "You're going to need that for berry picking. You hold on to it for now.".

To drop_all_your_stuff:
	[say "stuff: [list of every held thing].";]
	repeat with item running through every held thing:
		add item to stuff_you_brought_here;
	now everything carried by player is in location;
	move clothes to location;
	move tennis_shoes to location;
	if player holds grandpas_shirt:
		move grandpas_shirt to location;

[we keep a list of things dropped so we can pick them up later]
stuff_you_brought_here is a list of objects that varies.

Stuff_storage is a container in Limbo.

To store_all_your_stuff:
	now everything carried by player is in stuff_storage;

To unstore_all_your_stuff:
	now everything carried by player is in Limbo;
	now everything in stuff_storage is carried by player;

Instead of taking off clothes, say "Better keep those on for now. If you were going swimming, maybe."
Instead of taking off tennis_shoes, say "Better keep those on for now."
Instead of taking off underwear, say "No way! You're not taking those off!"

[TODO: test whether this is needed]
[Instead of doing anything except examining clothes, say "Better keep that on for now."
Instead of doing anything except examining tennis_shoes, say "Better keep those on for now."
Instead of doing anything except examining underwear, say "Better keep those on."]


Chapter - Sequences

[ seq_jody_stop sequence
summary: Jody has a series of realizations/memories that help them not freak out.
trigger: Scene_STOP begins, i.e., 2 turns in Room_Forest_Meadow ]

seq_jody_stop is a sequence.
	The action_handler is the seq_jody_stop_handler rule.
	The interrupt_test is seq_jody_stop_interrupt_test rule.
	The length_of_seq is 6.

This is the seq_jody_stop_handler rule:
	let index be index of seq_jody_stop;
	if index is 3:
		queue_report "You think of how worried Honey and grandpa must be, and you start breathing hard. You can feel tears wanting to squeeze out. 'Stop,' you say outloud to yourself." at priority 1;
	else if index is 4:
		queue_report "You draw in quick breaths to keep from crying. 'Stop. Stop. Stop.'" at priority 1;
	else if index is 5:
		queue_report "And suddenly a memory: [paragraph break][italic type]You and other campers yelling 'Stop!' at Explorer Camp. 'What do you do if you're ever lost in the woods?' Debbie asks the group again. 'STOP!' the campers shout.[roman type][paragraph break]The tears are gone. You can breathe again. You remember what to do: Stop. Sit down. Think. Observe. Plan. S-T-O-P. You drop to the ground right where you are in the tall grass.[paragraph break][italic type]Think.[roman type] You could get hurt stumbling around in the dark. Better to wait until morning or until you're found.[paragraph break][italic type]Observe.[roman type] You take a good look around you for the first time. You can hear crickets. You can see trees against the twilight. Stars are coming out. Even now, you can see that they are beautiful. As your eyes adjust, you can see new details in the trees around the meadow.[paragraph break][italic type]Plan.[roman type] The facts you learned in Explorer Camp come tumbling out at you: You can live for 3 weeks without food, 3 days without water, but only 3 hours without shelter.[paragraph break]You need to find shelter." at priority 1;
		Move player to the meadow grass, without printing a room description;
		Now Room_Forest_Meadow is observed;
	else if index is 6:
		queue_report "[one of]You have a plan. Find shelter[or]Hypothermia is a real risk in the chilly forest at night. Time to find a place to shelter[or]You look closer at the edge of the forest[stopping]." at priority 1;
		[We do the following, because we want this step to repeat]
		decrease index of seq_jody_stop by one;
		[we make sure this ends when Scene_STOP ends]

This is the seq_jody_stop_interrupt_test rule:
	[nothing stops this rule]
	rule fails.


Part - Honey

Honey is a _female woman.
The initial appearance is "[honey_initial_description]".
The description of Honey is "She's stern with a sneaky smile. Sometimes you think you hate Honey. Though, thinking about it, you remember how when you stayed the summer at Honey and Grandpa's house, she taught you to make pots on the potter's wheel. And how she took you for a ride on the motorcycle. You know she loves you, but why does she have to be so mean sometimes?".
Understand "grandma/grandmother/gramma/granma/gram/ma/grams", "Elinore/Ellinore/Elie/Ellie" as Honey.
Honey is in Room_Grassy_Clearing.

Chapter - Properties

Chapter - Rules and Actions

To say honey_initial_description:
	if Grandpa is not visible:
		if player is in Region_Blackberry_Area:
			say "Honey is here picking berries. [run paragraph on]";
		else:
			say "Honey is here.[run paragraph on]";
	else:
		if player is in Region_Blackberry_Area:
			say "Honey and Grandpa are here picking berries.[run paragraph on]";
			now honey is not marked for listing;
			now grandpa is not marked for listing;
		else:
			say "Honey and Grandpa are here waiting for you.[run paragraph on]";
			now honey is not marked for listing;
			now grandpa is not marked for listing;

[
	Honey picking berries
]

Player has a number called attempts_to_leave.
	Attempts_to_leave is zero.

Instead of going down when player is in Room_Grassy_Clearing:
	if Scene_Picking_Berries is happening:
		say "[one of]Honey looks up, as you go by[or]Honey notices as you go past[or]Honey catches your eye and give you a Meaningful Look as you pass[or]Honey looks up as you go by and you catch a flicker of annoyance[as decreasingly likely outcomes].";
	else if Scene_Explorations is happening:
		say "Honey looks up and says, '[one of]Have fun, but don't wander too far[or]Stay where you can hear me call[or]Don't go too far[cycling].'";
	continue the action;

Instead of going down when player is in Room_Blackberry_Tangle during Scene_Picking_Berries:
	Increase attempts_to_leave of Player by 1;
	say "[one of]Ever vigilant[or]Again[or]Once again[or]Of course[stopping], Honey looks down the trail and sees you [one of]wandering[or]leaving[or]exploring[at random]. [one of]'Hey, why don't you stay here with us? Don't you want to help your Honey and grandpa? One more pail, okay?'[run paragraph on][or]'Hey Ants-In-The-Pants, are you getting bored? Why don't you come pick some more berries?'[run paragraph on][or]'I want you to pick one more pail before you go exploring.'[run paragraph on][or]'Uh. What did I tell you?'[run paragraph on][or]She gives you A Look.[run paragraph on][stopping] You reluctantly head back to the clearing.";
	Move player to Room_Grassy_Clearing with little fuss;
	now player is warned_by_grandma;

Chapter - Responses

[
	Preliminaries and greetings
]

Greeting response for Honey:
	say "'Hello, [honeys_nickname],' Honey says[Honey stuff].";

Implicit greeting response for Honey:
	do nothing;

Farewell response for Honey:
	say "'Bye, [honeys_nickname]. Stay close,' Honey says.";

Implicit farewell response for Honey:
	say "'Oh, [one of]don't let me keep you from your busy schedule[or]don't let me keep you[or]goodbye, I guess[at random],' says Honey who goes back to her berry picking.";

To say honeys_nickname:
	say "[one of]kiddo[or]hon[or]sweetie[or]buster[as decreasingly likely outcomes]";

To say Honey stuff:
	if a random chance of 1 in 3 succeeds:
		say " and [one of]gives you a tight little smile[or]pats her head to see if her hair is still up[or]rubs her lips firmly[at random]";

[
	Defaults
]

Default tell response for Honey:
	if the second noun is not nothing:
		say "'That's great, [honeys_nickname]. [Honeys_berry_urging]' Honey goes back to picking.[line break][line break]";
	else:
		say "She looks a little irritated. 'Okay. [Honeys_berry_urging]'[line break][line break]";

To say Honeys_berry_urging:
	say "[one of]You gonna pick any more berries[or]You done picking blackberries[or]Are you going to help your Honey and Grandpa[at random]?[run paragraph on]";

Default ask response for Honey:
	say "'I[one of]'m not sure[or] don't know[or] really don't know[at random]. Ask your grandpa,' Honey says.";

Default give-show response for Honey:
	say "'I'm not sure what you want me to do with it. Ask your grandpa,' Honey goes back to her task.";

Default ask-for response for Honey:
	if player holds second noun:
		say "'Looks like you already got it, [honeys_nickname],' Honey says.";
	else:
		say "'That's not going to happen, [honeys_nickname],' Honey says.";

Default thanks response for Honey:
	say "'Sure,' Honey says.";

Default yes-no response for Honey:
	if saying yes:
		say "'Okay, then get to it,' Honey says.";
	else:
		say "'I'm not going to argue with you about it,' Honey says.".

Default response for Honey:
	say "'Go talk to your grandpa,' Honey says.";

Instead of touching Honey:
	say "'Aw, thanks [honeys_nickname],' she says.";
	Now player is affectionate;

[
	Responses
]

Response of Honey when asked-or-told about player:
	say "'Right now, you're pretty good at getting in my hair,' Honey says only half joking.[run paragraph on][if player is in Region_Blackberry_Area] 'You don't want to pick any more berries? Maybe you don't want to eat blackberry jam later.'[end if][line break]".

Response of Honey when asked-or-told about Honey:
	say "'About me? Well, I have a grandchild that asks a lot of questions,' Honey says. 'What do you want to know?'".

Response of Honey when asked-or-told about Grandpa:
	say "'Ah, your grandpa. He's probably a smarter man than I give him credit for,' Honey says, leaving you wondering what that means exactly.".

Response of Honey when asked-or-told about Aunt Mary:
	say "'Ah, my sister Mary, your great-great -- no, only one great -- your great Aunt. She was the baby in the family until I came along as an accident when your great grandma was pretty old. She's kind of loosing her marbles lately, I think.'[run paragraph on][one of][if grandpa is visible] She looks over at Grandpa, 'John, don't you think?'[line break][paragraph break]Grandpa looks up from picking berries. 'What?'[paragraph break]'Mary. You think she's cracking up?'[paragraph break]'Oh, leave her alone,' Grandpa says. 'Why do you have to pick on your sister?'[end if][or][paragraph break][stopping]".

Response of Honey when asked-or-told about Lee:
	say "'Stay away from him,' Honey looks up seriously. Is she mad at you? 'I mean it. He's not right. Something about him's not quite right.'".

[Response of Honey when asked-or-told about Sheriff:
	say "".]

Response of Honey when asked-or-told about Mom:
	say "[one of]'Don't worry about your mom,' Honey says, 'She'll be fine. Why don't you go over and help your grandpa some.'[or]'I said, she'll be fine,' Honey snaps.[stopping]".

Response of Honey when asked-or-told about topic_dreams:
	say "'What do you think, [honeys_nickname]?' Honey asks, 'Your grandpa only dreams about fishing. Me, I don't sleep enough these days to dream. But I get pretty good at crosswords.'".

Response of Honey when asked-or-told about topic_berries:
	say "'I'd like you to pick one more pail before you go wondering off,' she says.".

Response of Honey when asked-or-told about bucket:
	say "[if Scene_Bringing_Lunch is happening]'Your grandpa is taking that up to your Aunt Mary to get started on the jam,' Honey says.[else]'After you pick a pail, you can dump it into our bucket,' Honey says.[end if]".
[TODO ensure that response is approp for day 2]

Response of Honey when asked-or-told about radio:
	say "'You keep your little hands off of it,' Honey says.".

[Response of Honey when asked-or-told about pail:
	say "".]

Response of Honey when asked-or-told about topic_jam:
	say "'Mary and I are using Mama's recipe. That's why it's so good,' Honey smiles. 'Let's see, I guess Mama's your great-grandmother.'".

Response of Honey when asked-or-told about cigarettes:
	say "'You keep away from those,' Honey says.".

Response of Honey when asked-or-told about topic_trailer:
	say "'You wanting to go back? If you head back to the house, you try and help your Aunt Mary out,' Honey says.".

Response of Honey when asked about train tracks:
	say "'Don't you let me catch you playing anywhere near those tracks, or I'll paddle your bottom,' Honey says.".
Response of Honey when told about train tracks:
	if player is not train_experienced:
		say "'Don't you let me catch you playing anywhere near those tracks, or I'll paddle your bottom,' Honey says.";
	else:
		say Honey's train response;

To say Honey's train response:
	say "[one of]'You better not have,' Honey says menacingly.[or]Honey says nothing, but grabs your arm and spins you around and spanks your butt hard enough to really hurt while you are still struggling to protect yourself. 'I hope you remember [italic type]that[roman type], next time you think about going near those tracks.'[paragraph break]Your wails die down to hiccupy sobs after a few minutes.[or]'You want another dose of that memory medicine?' Honey says threateningly.[stopping]";

Response of Honey when asked-or-told about flattened coin or given-or-shown flattened coin:
	say Honey's train response;

Response of Honey when asked-or-told about dog:
	say "'Keep away from that dog,' Honey says. 'He tried to bite your grandpa once and then the owner yelled at your grandpa for it. Can you imagine that?'".

[Response of Honey when asked-or-told about forest:
	say "".]

Response of Honey when asked-or-told about topic_creek:
	say "'You can wade in the creek down by the bridge,' Honey says. 'Make sure you take your tennies off first though. I don't want you tracking wet shoes and mud into the house.'".

Response of Honey when asked-or-told about topic_bridge:
	say "'I love that old bridge. It's over a hundred years old. You can see ferns and stones and little fish under the bridge,' Honey says rather sweetly.".

Response of Honey when asked-or-told about deep pool or asked-or-told about deep pool:
	say "'I don't want you swimming without your grandpa there,' Honey says.".

Response of Honey when asked about topic_life:
	say "'That seems like one of those questions for your grandpa. He'll talk your ear off,' Honey says.".

Response of Honey when asked about topic_love:
	say "'I love you, [honeys_nickname],' Honey says.".

Response of Honey when asked about topic_death:
	say "'Why are you being so morose? I don't like to talk about it,' Honey says curtly.".

Response of Honey when asked about topic_war:
	say "Honey looks thoughtful, 'In the war, I worked in an ammunition factory in Long Beach with thousands of women. The building where I worked was far far away from any other buildings in case it exploded.'".

Response of Honey when asked about topic_work:
	say "'I used to manage the Button Box, but when your grandpa retired so did I,' Honey says. 'In the war, I worked in a munitions factory.'".

Response of Honey when asked about topic_family:
	say "'That's a big subject, [honeys_nickname]. Maybe we can sit down later and look at some of the pictures of our family,' Honey says. 'I'll bet you don't even remember [one of]your Aunt Ethel who we visited in Portland[or]your Great Uncle Charley who has the rock shop[or]your grandpa's brother Marvin out in the desert[in random order].'".

Chapter - Rants

Response of Honey when asked-or-told about Sharon:
	now gma_sharon_rant is in-progress.
gma_sharon_rant is a rant.
	The quote_table is the Table of gma_sharon_rant.
	The speaker is Honey.

Table of gma_sharon_rant
Quote
"'That crazy old coot. I told your mom the other day I caught her standing out in her garden in the middle of the night talking to the flowers,' Honey says, 'but that's not all.[run paragraph on][if grandpa is visible]' She turns toward Grandpa, 'John, did I tell you this?[end if]'"
"'I couldn't sleep because your grandpa's snoring was keeping me up and I was taking a walk,' Honey says, 'and that's when I caught Sharon talking to her flowers.'"
"Honey says: 'I asked the cat lady, [']What are you doing?['] and she said, [']I'm keeping my babies safe from slugs.['] And then she gives me the nuttiest smile. Okay, I told her, most of us just put snailbait out in the daytime.'"
"Honey shakes her head, 'That cat lady is a crazy old nut.'"

Response of Honey when asked-or-told about Dad:
	now gma_dad_rant is in-progress.
gma_dad_rant is a rant.
	The quote_table is the Table of gma_dad_rant.
	The speaker is Honey.

Table of gma_dad_rant
Quote
"'Did you get a birthday card from him this year? No? Surprise! I didn't think so,' Honey says angrily. Is she mad at you? Or mad at your dad? But why?"
"'We haven't heard from him this whole year. I guess no visit with your dad this summer,' Honey says with a grim smile."
"'I think it takes more than being at the right place at the right time to be a father,' Honey says, and after a moment, 'Sorry, [honeys_nickname], I'm not mad at you. I'm mad about grown up stuff.'"
"'I'm done waiting for him to step up and be your father,' Honey says."

Response of Honey when asked-or-told about stepdad:
	now gma_stepdad_rant is in-progress.
gma_stepdad_rant is a rant.
	The quote_table is the Table of gma_stepdad_rant.
	The speaker is Honey.

Table of gma_stepdad_rant
Quote
"'Now, here's a guy who has some problems, but really knows how to generously share them with others,' Honey says[if grandpa is visible]. Grandpa gives her a Look[end if]."
"Honey's eyes spark dangerously, 'I told your mom that if I saw Mark put his hand on you one more time, you were coming to live with us,' she says, and suddenly you feel scared, though you're not sure why."
"'If I get a call from your mom in the middle of the night one more time, I'm going to drive there myself and your step-dad's gonna have some real problems,' Honey says in a rush[if grandpa is visible]. Grandpa gives her another Look[end if]."
"Honey clenches her teeth and growls but says no more."

Chapter - Sequences

[ seq_grandparents_chat sequence
summary: Honey and Grandpa talk about other characters
conditions: during Picking Blackberries when player is in or near blackberry clearing.
trigger: the player is in blackberry clearing for two turns ]

seq_grandparents_chat is a sequence.
	The action_handler is the seq_grandparents_chat_handler rule.
	The interrupt_test is seq_grandparents_chat_interrupt_test rule.
	The length_of_seq is 13.

This is the seq_grandparents_chat_handler rule:
	let index be index of seq_grandparents_chat;
	if a random chance of 1 in 2 succeeds:
		rule fails;
	else:
		if player is in Room_Lost_in_the_Brambles or player is in Room_Blackberry_Tangle:
			queue_report "You hear Honey and Grandpa talking and you perk up your ears." at priority 1;
		else if player is in Room_Grassy_Clearing:
			if index is 1:
				Report Honey saying "Honey and Grandpa continue their conversation: 'Have you heard from Nick about this summer? Is he planning a visit or are we just left guessing?' Grandpa asks Honey.[paragraph break]'Nothing. Not a word,' Honey says.";
			else if index is 2:
				queue_report "[grandparent_random]" at priority 2;
			else if index is 3:
				Report Honey saying "'Did you call Rachel?' Honey asks Grandpa. 'Sounded like she wanted to talk to her dad.'";
			else if index is 4:
				Report Grandpa saying "'I'll call her tonight, see how she is,' Grandpa says to Honey.";
			else if index is 5:
				Report Honey saying "'You're not worried about her?' Honey asks Grandpa in a low voice glancing your way, 'With Mark?' You keep your head down and try to look like you are concentrating on picking berries.";
			else if index is 6:
				Report Grandpa saying "'Well, you know Rach, she can take care of herself,' Grandpa says to Honey, 'She's a big girl.' And after a moment, 'But I'll tell ya...'";
			else if index is 7:
				Report Grandpa saying "You wander a little distance away, but close enough that you can still hear. 'I do not like the way he treats, ah, the little one. At all.' Grampa says.";
			else if index is 8:
				queue_report "[grandparent_random]" at priority 1;
			else if index is 9:
				Report Honey saying "'I don't know,' Honey says quietly. 'I trust Rachel too, but still. I'm not happy how it's turning out with this guy. Maybe it happened too quickly.";
			else if index is 10:
				Report Honey saying "'Did you ask about the arm?' Honey asks Grandpa, glancing in your direction.";
				now player is arm_aware1;
			else if index is 11:
				Report Grandpa saying "'I did ask about the arm, but I didn't find out anything,' Grandpa says, looking over at you. 'To think that asshole, pardon my French, might have...' Grandpa just shakes his head.";
			else if index is 12:
				Report Honey saying "'I wouldn't put anything past him when he's been drinking,' Honey says to Grandpa. 'Yeah, he's a charmer. What was Rachel thinking?'";
			else if index is 13:
				queue_report "[grandparent_random]" at priority 1;
				[We do the following, because we want this step to repeat]
				decrease index of seq_grandparents_chat by one;
				[we make sure this ends when Scene_Walk_With_Grandpa begins]

This is the seq_grandparents_chat_interrupt_test rule:
	if we are speaking to Grandpa, rule succeeds;
	if we are speaking to Honey, rule succeeds;
	rule fails.

To say grandparent_random:
	say "[one of]'Oh, Mary went to the doctor last week and found out about that thing on her neck,' Honey says to Grandpa. 'Turns out it's nothing, but they took it off anyway.' Grandpa just nods silently.[or]'Is that fellow Mark coming here when Rachel comes to pick up Jody?' Grandpa asks Honey, 'I'm not sure I can keep from giving him a piece of my mind.'[or]'It burns my britches that Mark wants that kid to call him [']dad,['] Grandpa says quietly to Honey.[or]'Remind me when we get into town, I need to pick up my new pair of eyes,' Honey says to Grandpa.[or]'That sheriff came by again asking about Lee,' Grandpa says.[paragraph break]'I'm not sure why you trust him,' Honey says. 'I'd be happy if I never saw that guy again.'[paragraph break]'The sheriff or Lee?' Grandpa asks.[paragraph break]'Both!' Honey laughs.[or]'You're tuneless whistling again,' Honey says to Grandpa. You hadn't even noticed any whistling.[or]'How close is the bucket to being full?' Grandpa asks Honey who ignores him. 'Never mind,' he says, looking in it himself, 'We have more berries to pick.'[or]'How you doing over there, [grandpas_nickname]?' Grandpa asks you.[or]Honey says to Grandpa, 'Did I tell you that I caught Sharon being crazy in the middle of the night?' Grandpa seems to ignore her and she doesn't repeat it.[or]'Hey, [honeys_nickname],' Honey calls to you. 'When you go with grandpa to take the bucket to the trailer, can you ask Mary about lunch?'[or]Honey asks Grandpa, 'Are you going swimming later with the kiddo?'[paragraph break]'If we have time,' Grandpa says.[or]'I heard Lee had another one of his freak outs, screaming about the war, last week,' Honey says to Grandpa.[paragraph break]'Give him a break. He doesn't have it easy,' Grandpa says.[in random order]".

[TODO in a long list of random utterances, make it so new interlocutor is set]

[ grandparents_tracks sequence
summary: Honey and Grandpa at the tracks
conditions: when player is on Room_Dream_Railroad_Tracks.
trigger: the player is in Room_Dream_Railroad_Tracks ]

seq_grandparents_tracks is a sequence.
	The action_handler is the seq_grandparents_tracks_handler rule.
	The interrupt_test is seq_grandparents_chat_interrupt_test rule.
	The length_of_seq is 7.

This is the seq_grandparents_tracks_handler rule:
	let index be index of seq_grandparents_tracks;
	if player is in Room_Dream_Railroad_Tracks:
		if index is 1:
			Report Grandpa saying "'Hey, [grandpas_nickname]. We've been waiting for you,' Grandpa says gently. Honey smiles at you.";
		else if index is 2:
			Report Grandpa saying "Grandpa puts his hand on your shoulder, 'You've had quite a time, haven't you? Don't you worry about it, about him.' Who is grandpa talking about?";
		else if index is 3:
			Report Grandpa saying "'Sometimes we worry about you,  [grandpas_nickname],' grandpa says, 'But it'll be okay, I promise.'";
		else if index is 4:
			Report Honey saying "Honey leans over and whispers, 'Try as we might, we may not always be able to keep you safe, [honeys_nickname].' She takes a deep breath, 'But I know you can take care of yourself when you need to.'";
		else if index is 5:
			Report Grandpa saying "'Let's see where this journey takes us', Grandpa says, inviting you with his hand to follow the tracks.";
			now grandparents_track_done is true;
		else if index is 5:
			Report Honey saying "Grandpa says, 'Let's get going. I think we're meant to follow these,' he says gesturing at the tracks. [paragraph break]Honey laughs, 'There's a metaphor there somewhere.'";
		else if index is 6:
			Report Grandpa saying "[one of]'Time to go,' says grandpa.[or]Honey says, 'Let's see what's next, [honeys_nickname],' pointing at the tracks.[or]'Time to make like a hobo', says grandpa looking at the tracks.[at random]";
			[We do the following, because we want this step tp repeat]
			decrease index of seq_grandparents_tracks by one;
			[we make sure this ends when Scene_Dream_Tracks ends]

This is the seq_grandparents_tracks_interrupt_test rule:
	rule fails.

[ grandparents_bounce sequence
summary: Honey and Grandpa bounce on Mars
conditions: during Scene_Dream_Bouncing when player is on Mars.
trigger: the player is on Mars ]

seq_grandparents_bounce is a sequence.
	The action_handler is the seq_grandparents_bounce_handler rule.
	The interrupt_test is seq_grandparents_bounce_interrupt_test rule.
	The length_of_seq is 7.

This is the seq_grandparents_bounce_handler rule:
	let index be index of seq_grandparents_bounce;
	if player is in Room_Mars:
		if index is 2:
			Report Grandpa saying "Honey and Grandpa both stumble in the light gravity. Honey looks concerned, but Grandpa looks thrilled. 'Hmm,' he says smiling broadly taking several experimental hops.";
		else if index is 4:
			queue_report "Honey smiles as she gives a little jump and sails high. Grandpa gives a bigger jump and flies almost as high as he is tall. They are both laughing." at priority 1;
		else if index is 6:
			Report Grandpa saying "'Watch this!' Grandpa says like a little kid and leaps high into the air yelling 'Woo!' while Honey laughs.";
		else if index is 7:
			queue_report "Grandpa gathers up his strength, squating down and taking a tremendous leap. He sails into the air and his smile turns to sudden concern. He's floating away. 'John!' Honey yells leaping after him too high to stop. Honey and Grandpa lift high in the air.[paragraph break]'Ellie!' Grandpa yells from far above. 'Help!' they both yell while you watch helplessly. You jump as high as you can, but can't reach them.[paragraph break]You call to them and watch as they both float away into the Martian sky, becoming smaller and smaller dots until you can no longer see them.[paragraph break]There is nothing to do but flop down on the ground sobbing miserably. [paragraph break]After a long while you dry your tears and haul yourself up out of the red dust." at priority 1;
			now seq_grandparents_bounce is not in-progress;
			now mars_free_to_go is true;
			now Honey is in Limbo;
			now Grandpa is in Limbo;

This is the seq_grandparents_bounce_interrupt_test rule:
	rule fails.


Part - Grandpa

[TODO: Decide whether Grandpa/grandpa should be capitalized, and then make it consistent.]

Grandpa is an undescribed _male man in Room_Grassy_Clearing.
	The initial appearance is "[grandpas_initial_appearance]".
	The description of Grandpa is "Grandpa is, well, Grandpa. He's not tall. He's not fat. He has a bald spot right on top of his head like a little hat. He's like a bull, kind of, but skinnier and wears a warm plaid shirt. Today he's in a t-shirt, but usually. He smells good, like cigarettes and that stuff he puts on his face when he shaves.[if a random chance of 1 in 3 succeeds]
	[paragraph break]While you are looking, he sees you and smiles.[end if]".
	Understand "grampa/granpa/grandfather/gramp/pa/gramps/John" as grandpa.
	The scent is "something familiar, like cigarettes and the stuff he uses when he shaves".

Chapter - Properties

Chapter - Rules and Actions

To say grandpas_initial_appearance:
	[if location of player is Room_Grassy_Clearing:
		now grandpa is not marked for listing;
		now grandpa is undescribed;
	else:]
		say "Your Grandpa is here[if Grandpa holds big_bucket and big_bucket is full] with the big bucket full of berries[else if Grandpa holds big_bucket and big_bucket is empty] with the empty bucket[end if].";

Instead of touching Grandpa:
	say "Grandpa gives you a big hug.";
	Now player is affectionate;

Chapter - Responses

[
		Preliminaries and greetings
]

Greeting response for Grandpa:
	say "[grandpas_greeting].";

To say grandpas_greeting:
	say "'[one of]Well[or]Hey[or]Hm[as decreasingly likely outcomes] [grandpas_salutation], [grandpas_nickname],' Grandpa says[if a random chance of 1 in 2 succeeds] and [grandpa_stuff][end if]";

Implicit greeting response for Grandpa:
	do nothing;

Farewell response for Grandpa:
	say "'Okay, see you later, [grandpas_nickname],' Grandpa says.";

Implicit farewell response for Grandpa:
	do nothing;

[Do we want to have Jody name in here, or is it better if the PC is a blank slate for the player to project onto?]
To say grandpas_nickname:
	say "[one of]Peanut[or]Whistle Britches[or]Monkey[or]Ragamuffin[or]Bud[or]Tootsie Roll[or]Noodle[or]JoJo[or]JoBear[as decreasingly likely outcomes]";

To say grandpas_salutation:
	say "[one of]hello[or]hi[or]hello there[or]hi there[or]what's cookin['][or]what's doin['][as decreasingly likely outcomes]";

To say grandpa_stuff:
		say "[one of]smiles[or]ruffles your hair[or]pats your head[or][if pail is visible and pail is empty]glances in your pail[else if pail is visible]plucks a berry from your pail and pops it in his mouth with a smile[else]looks around for your pail[end if][at random]";

[
	Defaults
]

[Possibilities:
	default ask response for the banker:
	default answer response for the banker:
	default tell response for the banker:
	default ask-tell response for the banker:

	defaullt give response for the banker:
	default show response for the banker:
	default give-show response for the banker:

	default ask-for response for the banker:
	default yes-no response for the banker:

	default response for the banker: ]

Default tell response for Grandpa:
	if the second noun is not nothing:
		say "'[The second noun]? [one of]Yep[or]Alright[or]You're the expert[or]You know it[at random], [grandpas_nickname],' Grandpa smiles.";
	else:
		say "'Hm, [one of]you don't say[or]you think[or]are you sure[at random]?' Grandpa says, [one of]distracted[or]looking for his cigarettes[or]mopping his forehead with his [']kerchief[at random].";

Default ask response for Grandpa:
	say "'Hm, [one of]not sure[or]good question[or]got me[at random], [grandpas_nickname],' Grandpa shrugs.";

Default give-show response for Grandpa:
	say "'Hm, [one of]looks good, but I'm no expert[or]looks good, don't lose it[or]you hold on to that[at random],' Grandpa smiles and hands it back to you.";

Default ask-for response for Grandpa:
	if player holds second noun:
		say "'Easily done, you kidder. You already got it,' Grandpa smiles.";
	else:
		say "'Oh, though I wish I could,' Grandpa smiles.";

Default thanks response for Grandpa:
	say "'Of course,' Grandpa says and [grandpa_stuff].";

Default yes-no response for Grandpa:
	if saying yes:
		say "[one of]'Oh good,' Grandpa says, smiling.[or]'Yes, sir,' Grandpa agrees.[or]Grandpa nods.[at random]";
	else:
		say "'[one of]You seem pretty sure,[run paragraph on][or]I can't change your mind?[run paragraph on][or]Are you sure?[run paragraph on][at random]' Grandpa says, smiling.[line break][line break]";

Default response for Grandpa:
	say "'Hmm, if you say so, [grandpas_nickname],' Grandpa says.";

[
	Responses
]

Response of Grandpa when asked-or-told about player:
	say "'Well, [grandpas_nickname], [one of]I've known you since you were just a twinkle in your mama's eye[or]You're gettin['] so big. I remember when you were just knee high to a grasshopper[or]I have a grandchild who looks just like you and loves [stuff I like][or]I can't remember, do you still like [stuff I like]? Help me out[in random order],' Grandpa says.".

To say stuff I like:
	say "[one of]graham crackers[or]vanilla pudding[or]berry jam[or]Wild World of Animals[or]playing in the dirt[at random]";

Response of Grandpa when asked-or-told about Grandpa:
	say "'Well, what can I tell ya, [grandpas_nickname]? I yam wat I yam.' Grandpa gives you his best Popeye squint and makes a muscle with his real-life Popeye arms covered with his real-life sailor tattoos.".

Response of Grandpa when asked-or-told about Honey:
	say "[if player is in Region_Blackberry_Area]Grandpa looks over toward where she's picking berries[else]Grandpa looks back toward the creek[end if], 'She's your Grandma Honey[one of]. Don't worry about her[or]. Her bark's worse than her bite[or]. She loves the heck out of you[in random order], [grandpas_nickname].'".

Response of Grandpa when asked-or-told about Aunt Mary:
	say "'She's your Honey's older sister. Did you know your Honey had twelve brothers and sisters. Let's see, you know Uncle Charley and Aunt Ethel and Aunt Mary,' Grandpa says counting on his fingers. 'Mary has grandkids that are your mom's age.'".

Response of Grandpa when asked-or-told about Lee:
	say "'I don't know much about him, [grandpas_nickname],' Grandpa says. 'He's pretty quiet and keeps mostly to himself. I heard from your Aunt Mary that he served in Vietnam.'".

[Response of Grandpa when asked-or-told about Sheriff:
	say "".]

Response of Grandpa when asked-or-told about stepdad:
	say "[one of]'Mark? He seemed like a nice enough guy when I met him, but...' Grandpa looks like he's going to get mad at you, 'he better start being a whole heck of a lot nicer to you and your[if player is in Room_Grassy_Clearing]--'[paragraph break]Honey cuts him off, 'John, that's enough. Remember, little pitchers have big ears.'[paragraph break]Grandpa leans down and says a little quieter, 'Well, you just know that your mom, your Honey, and your grandpa love you,' and he [grandpa_stuff].[else] mom or he's going to have to answer to me. That's all I have to say.'[end if][or]Grandpa face goes tight. 'I don't think I can rightly say anything more about that without saying anything I don't want to.'[stopping]".

Response of grandpa when asked-or-told about topic_dreams:
	say "'We all have dreams, [grandpas_nickname]. Sometimes as you get older, or if you get to be an old man like me, you have different dreams than you did when you were a young man,' grandpa says, 'These days, I dream about a quiet river with a fishing pole.'".

Response of grandpa when asked-or-told about topic_creek:
	say "'Well, I love that old creek. It's one of the reasons we bought our house here,' grandpa says, 'You know we call it [']Bear Creek,['] but the Miwok people who lived here long before us had another name for it. I've never known this creek's true name.'".

Response of grandpa when asked-or-told about topic_indians:
	say "'The Miwok people used to live in these hills along Bear Creek,' grandpa says, 'You know, there are still remains of houses and petroglyphs, those are drawings on rocks, made by Indians who lived here long before we came here.'".

Response of Grandpa when asked-or-told about topic_berries:
[Response of Grandpa when asked about backdrop_berries or told about backdrop_berries:]
	say "'How you doing, [grandpas_nickname]?' Grandpa [grandpa_stuff]. 'You helping your Honey and grandpa make blackberry jam?'".

[TODO: Grandpa doesn't respond here]

Response of Grandpa when asked-or-told about bucket:
	say "[if Scene_Bringing_Lunch has not happened]'That's our berry pickin' bucket, [grandpas_nickname]. Soon as we get that filled up I'm gonna take it up to your Aunt Mary,' Grandpa says. 'You going to help me?'[else if Scene_Bringing_Lunch is happening]'Got to take this up to Mary, so she can turn this into jam,' Grandpa says. 'You gonna help your old grandpa get this up to the house?'[else]'I gotta get this down to your Honey before she needs to dump her pail,' Grandpa says. 'You wanna walk with me?'[end if]".

[TODO ensure that response is approp for day 2]

[Response of Grandpa when asked-or-told about pail:
	say "".]

Response of Grandpa when asked-or-told about topic_jam:
	say "'Your Honey and Aunt Mary make the best blackberry jam in the whole world,' Grandpa smiles. 'Or at least I think so.'".

Response of Grandpa when asked-or-told about grandpas_shirt or given-or-shown grandpas_shirt:
	say "[if player does not hold grandpas_shirt]'You can wear it if you want, [grandpas_nickname][else]'You hold on to that for me, [grandpas_nickname][end if],' Grandpa says.".

Response of Grandpa when asked-or-told about cigarettes:
	say "'That's grown-up business, [grandpas_nickname]' Grandpa says seriously. 'And I hope you never never smoke.'".

Response of Grandpa when asked-or-told about topic_trailer:
	say "Our house? We've been living there since you were knee-high to a grasshopper. Do you remember when the big truck moved our trailer into place? No, you wouldn't remember that. You were a babe in your mama's arms.".

Response of Grandpa when asked about train tracks:
	say "'You be careful around those train tracks, a train could roll right over you and not even blink,' Grandpa says.".

Response of Grandpa when told about train tracks:
	if player is not train_experienced:
		say "'Yeah? The one that runs by the trailer park? You can hear it going by if you listen,' Grandpa says. 'Maybe later we can put pennies on the track again.'";
	else:
		say Grandpa's train response;

To say Grandpa's train response:
	say "[one of]'Holy smoke! You are one lucky little [grandpas_nickname]!' Grandpa lowers his voice, 'You better hope your Honey doesn't find out about this or she'd paddle your be-hind. But I'm just glad you are okay.'[or]'You be careful around those train tracks. A train could roll right over you, easy as pie,' Grandpa says. 'I don't want to hear any more about you playing by the tracks.'[stopping]";

Response of Grandpa when given-or-shown penny:
	say "'Maybe later we can put that on the tracks. Hold on to that and don't lose it.' Grandpa says and [grandpa_stuff].".

Response of Grandpa when asked-or-told about flattened coin or given-or-shown flattened coin:
	say "[Grandpa's train response][line break]He admires the flattened coin [one of][or]again [stopping]for a moment, 'But I have to admit, that is one handsome lucky penny you have there, isn't it?'";

Response of Grandpa when asked-or-told about dog:
	say "'Yeah, I know about that pooch,' Grandpa says. 'That dog needs to give it a rest.'".

[Response of Grandpa when asked-or-told about forest:
	say "".]

Response of Grandpa when asked about topic_tree:
	say "'The big tree up by the road? That's called a Doug Fir,' Grandpa says. 'They're tall and straight, but sometimes blow down if there's a big storm.'".
Response of Grandpa when told about topic_tree:
	say "'The big tree up by the road? [if player has not been in Room_Top_of_Pine_Tree]I heard you climbed that tree before. You be careful[else]You climbed all the way to the top? When did you get so big and strong[end if],' Grandpa says, smiling.".

Response of Grandpa when asked-or-told about topic_creek:
	say "[one of]'The water in that creek came from up in the mountains. Maybe it was snow yesterday on the top of some mountain peak,' Grandpa looks toward the creek. 'When I came here the first time and saw that creek, and smelled these pines and heard the wind rustle through the tops of the trees, I knew I would live here someday.'[or]'Beautiful, isn't it?' Grandpa says.[stopping]".

Response of Grandpa when asked-or-told about topic_bridge:
	say "[one of]'This old bridge has probably been here a hundred years. Maybe miners drove their carts over that bridge to get to their claims up in the hills,' Grandpa says.[or]'Have you waded down in the creek?' Grandpa says.[stopping]".

Response of Grandpa when asked-or-told about deep pool:
	say "[one of]'I know you are almost a grown up, but you be careful down at that old swimming hole,' Grandpa says. 'Maybe tomorrow we can go swimming.'[or]'If you really want to go swimming, maybe we can go and get your swimsuit and go down there together,' Grandpa says, 'I don't want you to go swimming by yourself.'[stopping]".

Response of Grandpa when asked-or-told about topic_lunch:
	say "'Isn't it just about lunch time?' your grandpa smiles. 'You know me, you can set your watch to my stomach.'";

Response of Grandpa when asked about topic_life:
	say "'Life is good. I can't complain, [grandpas_nickname]. I have you and your mother and your grandma Honey,' Grandpa looks at the sky for a moment. 'There were times when I thought I'd never be so lucky. Like when I was in the war.'".

Response of Grandpa when asked about topic_work:
	say "'Well, you know I work for the city, but I'm retiring in a few years,' Grandpa says.".

Response of Grandpa when asked about topic_love:
	say "'Well, there's not much in the world I love more than you, my little [grandpas_nickname],' Grandpa says and [grandpa_stuff].".

Response of Grandpa when asked about topic_death:
	say "'Death is just part of life, my little [grandpas_nickname],' Grandpa says and [grandpa_stuff].".

Response of Grandpa when asked about topic_family:
	say "'Well, you have a lot of family that loves you, your mom, your Honey, your old grandpa, your Aunt Mary,' Grandpa says. 'Even your dad loves you, in his way.'".

Response of Grandpa when asked-or-told about topic_war:
	say "'War is not a lot of fun, I can tell you that,' Grandpa says[one of]. 'Even though I didn't see a lot of action in dubya-dubya-two like a lot of guys, it was a pretty brutal, mean time. Even for people like your Honey who were helping out here at home.'[or].[stopping]".

Response of Grandpa when asked-or-told about ants:
	say "'You better watch out, [grandpas_nickname],' Grandpa says. 'Those red ants pack a mean bite.'".

[
	Grandpa picking berries
]

Every turn when player is in Room_Grassy_Clearing and Grandpa is in Room_Grassy_Clearing and a random chance of 1 in 20 succeeds:
	queue_report "Grandpa pauses for a minute from his berry picking and [one of]wipes his forehead with his handkerchief and rests against a tree[or]lights a cigarette and smokes for a bit[at random]." with priority 2.

Chapter - Rants

Response of Grandpa when asked-or-told about Sharon:
	now gpa_cat_lady_rant is in-progress.
gpa_cat_lady_rant is a rant.
	The quote_table is the Table of gpa_cat_lady_rant.
	The speaker is Grandpa.

Table of gpa_cat_lady_rant
Quote
"'Oh, Sharon?' Grandpa laughs, 'You call her the Cat Lady? You got that from your Honey and your mom. They're bad influences on you and I can't wait to tell them,' he says with a smile.[paragraph break]'I hope you don't call her that to her face,' he says seriously. 'Though she's a nice old lady and probably wouldn't even care.'"
"'Sharon's a nice old lady who's had a hard life. You be nice to her, [grandpas_nickname],' Grandpa says."

Response of Grandpa when asked-or-told about Mom:
	now gpa_mom_rant is in-progress.
gpa_mom_rant is a rant.
	The quote_table is the Table of gpa_mom_rant.
	The speaker is Grandpa.

Table of gpa_mom_rant
Quote
"'Your mom? What's on your mind, [grandpas_nickname]?' Grandpa looks serious, 'Don't worry about her. She can take care of herself. Your mama will always love you more than anything in the whole world.'"
"'Your mom's just gone to work things out with your step-dad.' Grandpa forces a smile, 'You watch, she'll be back in a jiffy. She should be home tomorrow. But she'll be okay.'"
"'Your mama will be just fine,' Grandpa says."

Response of Grandpa when asked-or-told about Dad:
	now gpa_dad_rant is in-progress.
gpa_dad_rant is a rant.
	The quote_table is the Table of gpa_dad_rant.
	The speaker is Grandpa.

Table of gpa_dad_rant
Quote
"'Your dad? Well,' Grandpa says, 'you know, he and I always got along fine. I think he's a good guy, but I don't like that he doesn't see much of you.'"
"'Well, [grandpas_nickname], your dad is what he is, I guess,' Grandpa says, 'I think he loves you but doesn't always know how to show it.'"

Chapter - Sequences

[
	Grandpa on Walk

	This is a journey that begins
		* after Scene_Explorations
		* after player has been to trailer park indoors
		* when player is in blackberry clearing

 	What happens on Grandpa's walk:
		* turn 1: 1 turn warning, grandpa tells you he wants your help
		* turn 2: grandpa gets bucket, asks you to come along, and goes one step closer to goal
		* turn n: you arrive where grandpa is waiting, maybe he says something if it has been more than a turn
		* turn n+1: one turn after you arrive, grandpa says something to you and goes one step closer
		* turn n+m: if you take more than m turns to get to him and you are a location away, grandpa comes to get you and ask if you are coming
]

test gw with "teleport to grandpas trailer / teleport to grassy clearing / teleport to willow trail".

journey_gpa_walk is an npc_journey.
	The npc is Grandpa.
	The origin is Room_Grassy_Clearing.
	The destination is Room_Grandpas_Trailer.
	The wait_time is 2.
	The max_wait is 8.
	Waits_for_player is true.
	The interrupt_test is the journey_gpa_walk_interrupt_test rule.
	The action_at_start is the journey_gpa_walk_start rule.
	The action_at_end is the journey_gpa_walk_end rule.
	The action_before_moving is the journey_gpa_walk_before_moving rule.
	The action_after_waiting is the journey_gpa_walk_after_waiting rule.
	The action_catching_up is the journey_gpa_walk_catching_up rule.

This is the journey_gpa_walk_interrupt_test rule:
	if we are speaking to Grandpa, rule succeeds;
	rule fails.

[
	Grandpa Begins Walk
]

This is the journey_gpa_walk_start rule:
	if grandpa is not visible:
		if player is in Region_Blackberry_Area:
			queue_report "[one of]You hear grandpa calling you from the blackberry clearing.[or]Grandpa's calling you from the clearing[or]Grandpa's calling you[at random]" at priority 1;
		else if player is in Region_River_Area or player is in Region_Dirt_Road:
			if a random chance of 1 in 2 succeeds:
				queue_report "[one of]You think you hear your Grandpa calling you[or]Is that grandpa calling you?[or]That sounds like Grandpa calling you.[or]From over by the blackberry clearing, you think grandpa's calling.[at random]" at priority 1;
		rule fails;
	else:
		if time_here of journey_gpa_walk is 1:
			Report Grandpa saying "'Hey, [grandpas_nickname],' Grandpa says looking at you, 'I'm gonna take this bucket of berries up to your Aunt Mary. You gonna help your old grandpa?'";
			rule fails;
		else if time_here of journey_gpa_walk is 2:
			Report Grandpa saying "'Okay, I'm headed back to the house, [grandpas_nickname]. Why don't ya come with me?' Grandpa says. He picks up the big bucket with one hand that you probably couldn't even budge.";
			now Grandpa holds bucket;
		rule succeeds;

This is the
journey_gpa_walk_before_moving rule:
	queue_report "[if a random chance of 1 in 2 succeeds]'[one of]Okay, I'm heading out. You coming?'[run paragraph on][or]You coming?'[run paragraph on][or]Let's get a move on,'[run paragraph on][or]Okay, let's go,'[run paragraph on][or]You coming with your grandpa?'[run paragraph on][or]Almost there,'[run paragraph on][or]Come on, lazybones,'[run paragraph on][cycling] [end if]Grandpa [if player is in Region_Blackberry_Area]heads off toward the old bridge[else if player is in Room_Stone_Bridge]crosses the bridge to the dirt road[else if player is in Room_Railroad_Tracks]heads for the grassy field[else if player is in Room_Grassy_Field]goes through the back gate into the trailer park[else if player is in Region_Dirt_Road]heads off toward the railroad tracks[else if player is in Room_B_Loop]goes into his and Honey's trailer[else]is headed for B Loop[end if]." at priority 1;

This is the
journey_gpa_walk_after_waiting rule:
	Report Grandpa saying "[one of]Grandpa looks amused, 'Wanna keep me waiting, huh?'[or]Grandpa looks impatient, 'You want to come with me, or not?'[or]Grandpa looks irritated, '[grandpas_nickname], I'm glad you came with me, but don't make me wait for you.'[or]Grandpa looks mad, 'Now, [grandpas_nickname], I've been waiting here for you while you're doing I don't know what. I think you can show a little more respect for your old grandpa and hurry along.'[or]Grandpa looks mad at you for making him wait.[stopping]";

This is the
	journey_gpa_walk_catching_up rule:
	queue_report "Grandpa catches up to you [if player is in Stone Bridge]at the stone bridge[else if player is in Region_Blackberry_Area]along the trail[else if player is in Room_Dirt_Road]as you reach the dirt road[else if player is in the Room_Picnic_Area]as you go through the back gate into the trailer park[else if player is in Room_Long_Stretch]as you walk along the dirt road[else if player is in Room_Railroad_Tracks]as you reach the railroad crossing[else if player is in Room_Grandpas_Trailer]and comes into the trailer hauling the big bucket[else]as you head toward B Loop[end if].[run paragraph on] [if a random chance of 1 in 3 succeeds or player is in Room_Grassy_Clearing] '[one of]You gonna wait for your old grandpa, [grandpas_nickname]?'[or]Ah, to be young again,'[or]Alright, Speedy Gonzolas,'[or]Your old grandpa can barely keep up with you,'[or]I got ya, [grandpas_nickname],'[at random] Grandpa says, smiling.[end if]" at priority 3;

[
	Grandpa in Trailer
]

This is the
		journey_gpa_walk_end rule:
	if time_here of journey_gpa_walk is 1:
		Report Mary saying "'Mornin['], Mary,' Grandpa says as he comes in.[paragraph break]'How's the berry picking?' Mary asks.";
		rule fails;
	else if time_here of journey_gpa_walk is 2:
		Report Grandpa saying "'Pretty good,' Grandpa says, gesturing at the bucket, 'We got a whole bucketfull for you. Old Whistle Britches here, picked most of these and ate twice as many more.' Grandpa winks at you.[paragraph break]Grandpa helps your Aunt Mary pour the bucket of berries slowly into several giant pots with a series of juicy plops.";
		now bucket is empty;
		rule fails;
	else if time_here of journey_gpa_walk is 3:
		Report Mary saying "Your grandpa gets a big glass of water from the sink and drinks it.
		[paragraph break]Aunt Mary turns to you, 'Sweetheart, Can I get your help making lunch?'";
		now seq_mary_sandwich is in-progress;
		rule fails;
	else if time_here of journey_gpa_walk is 4:
		Report Grandpa saying "'I better hustle back,' Grandpa says, 'before Ellie needs the bucket.' Grandpa turns to you on his way out, 'See you down there, [grandpas_nickname].' Grandpa squeezes your shoulder and heads out the door.";
		now grandpa is in Room_Grassy_Clearing;
		rule succeeds;


Part - Sharon

[TODO: To invite introspection and examining ones self, Sharon (as with Lee) should ask sincerely about the player]

[TODO: Double check the entire teatime seq]

Sharon is a _female woman in Room_D_Loop.
	The printed name is "Cat Lady".
	The initial appearance is "[sharons_initial_appearance]".
	The description is "[sharon_description]".
	Understand "cat lady", "Sharon", "lady", "Sharon", or "Shannon" as Sharon.
	The indefinite article is "the".
	Include (- with articles "The" "the" "a", -) when defining Sharon.

To say sharons_initial_appearance:
	if Scene_Day_One is happening:
		say "The Cat Lady is [if Scene_Sheriffs_Drive_By is happening]talking to the Sheriff[else if Sharon is tending-garden]out in front of her trailer watering her tiny, overflowing garden[else if Sharon is feeding-cats]in the kitchen cooking fish for her cats[else if Sharon is watching-tv]sitting in front of a soap opera on her old black and white TV[otherwise]here[end if]. [one of]Her hair is kinda crazy[or]She is still wearing her bathrobe or a dress that looks like a bathrobe[or]She is absently humming to herself[or]She is staring briefly into space[in random order][if a random chance of 1 in 2 succeeds], and that makes you a little [nervous][end if][first time]. She's always been nice to you, even if your grandma doesn't like her[only]. There is a yellow tabby cat rubbing against her legs.";
	else:
		say "The Cat Lady is here.";

To say sharon_description:
	if Scene_Day_One is happening:
		say "[first time]She has a name, but you never can remember it, especially since both your mom and Honey call her the crazy cat lady behind her back. Is it Sharon? Shannon? And that's not all they call her. Honey says she is a crazy old B-I-T-C-H. But she's always been nice to you. [only]Her makeup is a little bit too thick and she seems to wear a bathrobe at all hours, but you can see how she used to be pretty when she was young.";
	else:
		say "The Cat Lady is dressed for an expedition. Her hair is tucked under a ball cap. She's wearing hiking pants and boots, and a tan vest with lots of pockets. When you ask her about it, she says, 'This is my mushroom hunting gear, dearie. Didn't you know I spend a lot of time in the woods?' You have to admit you didn't.";

Chapter - Properties

Chapter - Rules and Actions

[
	Scheduling & Tasks
]

Sharon can be tending-garden, feeding-cats, watching-tv, or ready-for-tea-time.
Sharon is tending-garden.
[TODO: these should be scenes instead, since they can contradict each other]

When play begins:
	Sharon feeds cats at sometime in the hour of 12:00 PM;
	Sharon tends garden at sometime in the hour of 2:00 PM;
	Sharon watches TV at sometime in the hour of 3:30 PM;

To prepare Sharon for Tea Time:
	Move Sharon into her trailer;
	Now Sharon is ready-for-tea-time;

At the time when Sharon tends garden:
	if dramatic scene is happening:
		Sharon tends garden in 10 minutes from now;
		stop;
	if Sharon is ready-for-tea-time:
		Report Sharon saying "The Cat Lady, glances [if player is in Room_Sharons_Trailer]out the window[otherwise]at her trailer[end if] and says, 'I was going to water the garden, but we're having so much fun, I'll do it later.'";
		Sharon tends garden in 15 minutes from now;
	Otherwise:
		Report Sharon saying "The Cat Lady, glances [if player is in Room_Sharons_Trailer]out the window[otherwise]at her trailer[end if] and says, 'Well, [sharons_nickname], I have to go water the garden.' [run paragraph on]";
		Move Sharon out of her trailer;
		Now Sharon is tending-garden;
		if Sharon is visible:
			queue_report "[line break]She uncoils the hose and starts watering her sad little garden in front of her trailer." at priority 2;

At the time when Sharon resumes gardening:
	if sharon is not in Room_D_Loop:
		move Sharon out of her trailer;
	now Sharon is tending-garden;

At the time when Sharon watches TV:
	if dramatic scene is happening:
		Sharon watches TV in 10 minutes from now;
		stop;
	if Sharon is ready-for-tea-time:
		Report Sharon saying "The Cat Lady glances [if player is in Room_Sharons_Trailer]at the TV[otherwise]at her trailer[end if] and says, 'One of my shows is on, but it is so much fun talking to you, I'll skip it.'";
		Sharon watches TV in 15 minutes from now;
	Otherwise:
		Report Sharon saying "The Cat Lady glances [if player is in Room_Sharons_Trailer]at the TV[otherwise]at her trailer[end if] and says, 'Well, [sharons_nickname], my favorite show is on. You can join me if you want.' [run paragraph on]";
		Move Sharon into her trailer;
		Now Sharon is watching-tv;
		if Sharon is visible:
			queue_report "She sits down in front of her old black and white TV and turns on a soap opera." at priority 2;

At the time when Sharon feeds cats:
	if dramatic scene is happening:
		Sharon feeds cats in 10 minutes from now;
		stop;
	if Sharon is ready-for-tea-time:
		Report Sharon saying "The Cat Lady [sharon_stuff] and says, 'The little dearies are hungry, but we're having so much fun, aren't we?'";
		Sharon feeds cats in 15 minutes from now;
	Otherwise:
		Report Sharon saying "The Cat Lady [sharon_stuff] and says, 'Well, [sharons_nickname], I have to go feed the kitties.' [run paragraph on]";
		Move Sharon into her trailer;
		Now Sharon is feeding-cats;
		if Sharon is visible:
			queue_report "She moves into the kitchen and starts cooking up smelly fish for her cats." at priority 2;

To move Sharon out of her trailer:
	if player is in Room_D_Loop:
		queue_report "The Cat Lady steps out of her trailer, going slowly down the steps. The tabby shoots out the door ahead of her, almost tripping her." at priority 3;
	otherwise if player is in Room_Sharons_Trailer:
		queue_report "She steps outside. The tabby shoots out the door soon as it is open." at priority 3;
	Now Sharon is in Room_D_Loop;
	Now Tabby is in Room_D_Loop;

To move Sharon into her trailer:
	if player is in Room_D_Loop:
		queue_report "She goes into her trailer, going slowly up the steps. The tabby cat licks its paw and, after a bit, follows through the cat door." at priority 3;
	otherwise if player is in Room_Sharons_Trailer:
		Report Sharon saying "The Cat Lady comes into the trailer and sees you, 'Hi, [sharons_nickname].' The tabby cat follows through the cat door.";
	Now Sharon is in Room_Sharons_Trailer;
	Now yellow tabby is in Room_Sharons_Trailer;

Chapter - Responses

[
	Preliminaries and greetings
]

Greeting response for Sharon:
	say "[one of]'Oh, hello, [sharons_nickname],' the Cat Lady says, 'So good to see you. Out for an adventure today?'[or]'Oh, hi again, [sharons_nickname]. Will you spend a few minutes talking to your old neighbor?' the Cat Lady says[if a random chance of 1 in 3 succeeds] who [sharon_stuff][end if].[stopping]";

Implicit greeting response for Sharon:
	do nothing;

Farewell response for Sharon:
	say "'Goodbye now, [sharons_nickname],' the Cat Lady says.";

Implicit farewell response for Sharon:
	do nothing.

To say sharons_nickname:
	say "[one of]dear[or]dearie[or]sweetheart[or]honey[at random]";

To say sharon_stuff:
		say "[one of]carelessly ruffles the fur of a cat you'd be scared to get near[or]pats the yellow tabby on the head so heavily you can see it squash down like a shock absorber[or]gently removes a kitten trying to climb her like a tree[or]picks off clumps of cat hair that have settled on you[at random]";

[
	Defaults
]

Default give-show response for Sharon:
	say "'Thanks, dearie, not sure I'd know what to do with it,' says the Cat Lady[if a random chance of 1 in 3 succeeds] as she [sharon_stuff][end if].";

Default response for Sharon:
	say "'Oh yes, [sharons_nickname], of course,' the Cat Lady says[if a random chance of 1 in 3 succeeds] as she [sharon_stuff][end if].";

Default ask response for Sharon:
	say "'Well, I don't know, [sharons_nickname],' the Cat Lady says.";

Default tell response for Sharon:
	say "'[one of]Oh yes, [sharons_nickname], I can see it now![run paragraph on][or]How delightful![run paragraph on][or]Oh please tell me more, [sharons_nickname],[or]You don't say? That's great![run paragraph on][or]Have you talked to your grandpa about that?[run paragraph on][or]You must be thrilled, [sharons_nickname],[at random]' the Cat Lady says[if a random chance of 1 in 3 succeeds] as she [sharon_stuff][end if].";

Default thanks response for Sharon:
	say "'Oh, of course, dear,' the Cat Lady says, 'You are very welcome.'";

Default yes-no response for Sharon:
	if saying yes:
		say "'Alright, good,' the Cat Lady nods.";
	else:
		say "'Oh?' the Cat Lady frowns.";

Instead of touching Sharon:
	say "'What a sweet one you are,' she says.";
	Now player is affectionate;

[
	Responses
]

Response of Sharon when asked-or-told about player:
	say "'Well [sharons_nickname], you are the sweetest child and my very favorite neighbor,' the Cat Lady says patting you on the head affectionately.".

Response of Sharon when asked-or-told about Grandpa:
	say "'Your grandfather is such a nice man,' the Cat Lady says. 'Just the other day, he helped me get Zoey out of the neighbor's tree[if grandpa is visible].' She smiles at your Grandpa and puts her hand on his arm.[else].'[end if]".

Response of Sharon when asked-or-told about Honey:
	say "The Cat Lady looks a little uncomfortable, 'Your grandmother is very beautiful,' she says after a moment.".

Response of Sharon when asked-or-told about Aunt Mary:
	say "'Oh, Mary,' she claps her hands together, 'such a dear heart. I love her cooking and her preserves.'".

Response of Sharon when asked-or-told about Sharon:
	say "'Oh, [sharons_nickname], I've nothing really to say about myself,' the Cat Lady says.".

Response of Sharon when asked-or-told about Sheriff:
	say "'Oh, Bill's a nice man. He checks on me at least once a week,' the Cat Lady says[if sheriff is visible] smiling at the Sheriff[end if].".

Response of Sharon when asked-or-told about Mom:
	say "'Your mom, [sharons_nickname], you better treat her like an angel, because she is. You know she came and brought me soup when I had pneumonia? And went to the store and got me medicines.".

Response of Sharon when asked-or-told about Dad:
	say "'I didn't know your dad, [sharons_nickname], but I heard he was a very charming man,' the Cat Lady says.".

Response of Sharon when asked-or-told about topic_jam:
	say "'I love your grandmother's preserves,' says the Cat Lady.";

Response of Sharon when asked-or-told about topic_trailer:
	say "'I've lived here for 20 years, [sharons_nickname]. I've seen people come and go,' says the Cat Lady.";

Response of Sharon when asked-or-told about dog:
	say "Oh dogs, they absolutely terrorize my babies. Just the other day, several of my kitties had to defend their very lives from a ferocious doggy that someone brought in to the park on a leash. It served that bad dog right and he had to be taken to the vet.";

Response of Sharon when asked-or-told about topic_tea:
	say "'Oh, I dearly love tea time, don't you, [sharons_nickname]?' the Cat Lady asks.";

Response of Sharon when asked for topic_tea [or implicit-asked for tea]:
	if Scene_Tea_Time is happening:
		say "'Oh sure, dearie.' [run paragraph on]";
		refill the teacups;
	else:
		continue the action;

Response of Sharon when asked-or-told about flattened coin or given-or-shown flattened coin:
	say "'A lucky train penny,' the Cat Lady says admiring it and handing it back to you. 'You made that right out here by the tracks?'".

Response of Sharon when asked-or-told about mika:
	say "'That little black and white cat figurine was given me by my Joseph, when we went to Dakron, Ohio for our thirtieth anniversary,' the Cat Lady says.".

[Response of Sharon when given-or-shown mika:
	I'm just going to leave this as an instead rule for now, since it is well-tested.]

Response of Sharon when asked about topic_work:
	say "'My job, [sharons_nickname], is taking care of all my babies,' the Cat Lady says.";

Response of Sharon when asked about topic_love or asked about Joseph or asked about topic_family:
	say "The Cat Lady looks wistful for a moment, 'When my Joseph was alive...' and she just kind of drifts off and doesn't finish.";

To say cat lady prattle:
	say "[one of]The Cat Lady leans toward you. 'Tell me about your [one of]explorations[or]adventures[or]wanderings[at random]. What about [one of]the train tracks[or]the creek[or]blackberries[or]the swimming hole[or]the big pine tree[at random]?'[run paragraph on][or]What is the news with your [one of]grandpa[or]Aunt Mary[or]mom[at random]?' the Cat Lady asks.[run paragraph on][or]The Cat Lady gestures at your cup, 'Do you like your tea?' she asks[one of][or] again[stopping].[run paragraph on][or]The Cat Lady looks serious. 'Are things going okay with your new step-dad? Is that going okay?'[run paragraph on][or]'Is your grandmother still mad at me?' the Cat Lady asks.'She's been angry at me for years. Ever since I spoke up about her and Joseph's friendship.' The Cat Lady is lost in thought.[run paragraph on][in random order]".

Chapter - Rants

Response of Sharon when asked-or-told about Lee:
	now sharon_lee_rant is in-progress.
sharon_lee_rant is a rant.
	The quote_table is the Table of sharon_lee_rant.
	The speaker is Sharon.

Table of sharon_lee_rant
Quote
"'Now, that man,' the Cat Lady flutters her hands, 'I don't like to talk bad about anybody, but, oh, oh.'"
"'One time, that man -- Lee -- he kicked one of my [italic type]babies[roman type] when she went into his trailer,' the Cat Lady says."
"'Another time, Lee yelled at me, I thought he was going to [italic type]kill[roman type] me, when I accidentally scared him one night,' the Cat Lady's says. 'I didn't [italic type]mean[roman type] to scare him, I was just on an evening walk. I had to call the sheriff before he'd settle down.'"
"'I know Lee had a hard time in Vietnam,' the Cat Lady says, 'but there is no call to take it out on me.'"

Response of Sharon when asked-or-told about stepdad:
	now sharon_stepdad_rant is in-progress.
sharon_stepdad_rant is a rant.
	The quote_table is the Table of sharon_stepdad_rant.
	The speaker is Sharon.

Table of sharon_stepdad_rant
Quote
"'Well, your mom just got married and we all wished her the best of luck,' the Cat Lady says, 'It hasn't always been easy for her.' And in spite of himself, that man really does love your mom.[paragraph break]She looks off into the distance and gets a funny look on her face, 'I see it will be very tough for a while as well.'[paragraph break][Sharon_Stepdad_Premonition][paragraph break]You almost start to cry, but hold it in."
"'Don't worry about that,' the Cat Lady says, 'Your mom is an [italic type]angel[roman type]. I've never seen a mother who loved her child more than her.'"

Response of Sharon when asked-or-told about topic_cat:
	now sharon_cat_rant is in-progress.
sharon_cat_rant is a rant.
	The quote_table is the Table of sharon_cat_rant.
	The speaker is Sharon.

Table of sharon_cat_rant
Quote
"'Oh my babies,' the Cat Lady says, clasping her hands to her chest, 'Joseph and I couldn't have children, but I always had a kitty. Then after Joseph was gone, I found a tiny scrawny yellow tabby kitten starving and mewling at my door one afternoon.'"
"'I fed this little tabby cat and loved him. For a while, I didn't think he'd make it, but now he's my best friend in the whole world,' the Cat Lady says ruffling the head of the yellow tabby."
"'A few years ago, I found a one-eyed mama cat heavy with kittens living under my porch. She wouldn't let me get near her at first,' a frown crosses her face, 'Actually, she still won't let me touch her, but she had a whole litter of beautiful kittens, that I've fed and taken care of.'"
"The Cat Lady looks at some of the cats running around, 'I'm not sure where some of these darling kitties came from, but I love them, every one.'"

Chapter - Sequences

[
	Invite Sequence
]

seq_sharon_invite is a sequence.
	The action_handler is the seq_sharon_invite_handler rule.
	The interrupt_test is seq_sharon_invite_interrupt_test rule.
	The length_of_seq is 2.

This is the seq_sharon_invite_handler rule:
	let index be index of seq_sharon_invite;
	if Sharon is visible:
		now current interlocutor is Sharon;
	if index is 2:
		Report Sharon saying "'Won't you come in for a moment?' the Cat Lady gestures at her trailer, 'I just love guests. And I do so enjoy talking to you.'";

This is the seq_sharon_invite_interrupt_test rule:
	if player is not in Room_D_Loop or Sharon is not visible:
		rule succeeds;
	if we are speaking to sharon:
		rule succeeds;
	if Scene_Sheriffs_Drive_By is happening:
		rule succeeds;
	rule fails.

[
	Tea Time Sequence
]

seq_sharon_teatime is a sequence.
	The action_handler is the seq_sharon_teatime_handler rule.
	The interrupt_test is seq_sharon_teatime_interrupt_test rule.
	The length_of_seq is 6.

This is the seq_sharon_teatime_handler rule:
	let index be index of seq_sharon_teatime;
	if Sharon is visible:
		now current interlocutor is Sharon;
	if index is 1:
		if sharon is not in Room_Sharons_Trailer:
			Move Sharon into her trailer;
		now sharon is ready-for-tea-time;
		Report Sharon saying "'Oh, how I love visitors. And you are such a dear heart,' the Cat Lady says, looking at you in a way that makes you nervous. 'I know! I know! Tea time! Let's have a little tea party.' She clasps her hands to her chest.";
	else if index is 2:
		Report Sharon saying "'[if player is not on Cat Lady's kitchen table]Oh, [sharons_nickname], won't you sit down?' the Cat Lady says, pointing at the half-buried kitchen table[else]Oh good, you are already at the table,' the Cat Lady bubbles[end if]. 'I'll get the tea ready.' She bustles around at the sink, in her cupboards, and with the tea things.";
		do Sharon_Teatime_Premonition;
	else if index is 3:
		Report Sharon saying "'[if player is not on Cat Lady's kitchen table]Please, [sharons_nickname], sit down[else]Oh goodie[end if].' The Cat Lady fills the teapot from a kettle that she didn't bother to heat.[paragraph break]'I love a tea party, don't you?' the Cat Lady asks, but leaves you no time to answer. 'Tell me about your life, [sharons_nickname]. What adventures have you had since we talked last?'";
	else if index is 4:
		if sharon is visible:
			if player is not on Cat Lady's kitchen table:
				queue_report "You make yourself comfortable at the Cat Lady's kitchen table." at priority 3;
				try silently entering the Cat Lady's kitchen table;
			Report Sharon saying "The Cat Lady fills your cup and her own from the teapot. 'I'm terribly sorry, [sharons_nickname], I don't have tea biscuits. I'm out right now,' she looks accusingly at a particularly fat cat lying on a chair. 'Sam got into the cupboard and ate every last one.' You wonder that the cat can jump up on anything, let alone get into the cupboard.";
			now your teacup is filled;
			Now player is confident;
			Now player is sharon_experienced;
	else if index is 5:
		if turns_so_far of seq_sharon_teatime is less than 40 and player is on Cat Lady's kitchen table:
			decrease index of seq_sharon_teatime by one;
			if sharon is visible:
				if your teacup is unfilled and a random chance of 2 in 3 succeeds:
					refill the teacups;
				queue_report "[cat lady prattle]" at priority 2;
		else:
			now index of seq_sharon_teatime is 6;
			now index is 6;
	if index is 6:
		Report Sharon saying "'Oh [sharons_nickname], it's been so nice talking to you. I can see you have to go,' the Cat Lady hugs you and pinches your cheek gently which makes you squirm. 'You are growing so big. And so... such a lovely child,' she says looking you up and down, embarrassing you.";
		if player holds your teacup:
			queue_report "You return your teacup to the table." at priority 1;
			now your teacup is on the Cat Lady's kitchen table;
		Sharon resumes gardening in two turns from now;
		Now player is compassionate;

This is the seq_sharon_teatime_interrupt_test rule:
	if player is not in Room_Sharons_Trailer and player is not on Cat Lady's kitchen table:
		[a condition so if player leaves, the cat lady doesn't get stuck waiting]
		if turns_so_far of seq_sharon_teatime is greater than 40:
			rule fails;
		else:
			rule succeeds;
	if we are speaking to sharon, rule succeeds;
	rule fails.

To refill the teacups:
	say "The Cat Lady re-fills [if a random chance of 1 in 2 succeeds]both of your cups[else]your cup[end if] with more tepid tea.";
	now your teacup is filled;

[
	Sharon on Walk

	This is a journey that begins
		* during Scene_Found
		* when player is in Room_Other_Shore

 	What happens on Sharon's walk:
		* beginning: Sharon hugs you and says some stuff and sets off to return you home
		* turn n: you arrive where sharon is waiting, maybe he says something if it has been more than a turn
		* turn n+1: one turn after you arrive, sharon says something to you and goes one step closer
		* turn n+m: if you take more than m turns to get to him and you are a location away, sharon comes to get you and ask if you are coming
		* end: Sharon returns you to your family and tells where they found you, Lee arrives
]

[test gw with "teleport to sharons trailer / teleport to grassy clearing / teleport to willow trail".]

[TODO: Create a rule that prevents us from going anywhere but toward goal during this walk]

journey_sharon_walk is an npc_journey.
	The npc is Sharon.
	The origin is Room_Other_Shore.
	The destination is Room_Grassy_Field.
	The wait_time is 2.
	The max_wait is 10.
	Waits_for_player is true.
	The interrupt_test is the journey_sharon_walk_interrupt_test rule.
	The action_at_start is the journey_sharon_walk_start rule.
	The action_at_end is the journey_sharon_walk_end rule.
	The action_before_moving is the journey_sharon_walk_before_moving rule.
	The action_after_waiting is the journey_sharon_walk_after_waiting rule.
	The action_catching_up is the journey_sharon_walk_catching_up rule.

This is the journey_sharon_walk_interrupt_test rule:
	if we are speaking to Sharon, rule succeeds;
	rule fails.

[
	Sharon Begins Walk
]

This is the journey_sharon_walk_start rule:
	if time_here of journey_sharon_walk is 1:
		Report Sharon saying "The Cat Lady, you suddenly remember her name is Sharon, sees you as you emerge from the woods and her eyes go wide. 'Oh my,' she says clutching her breast. Sharon sweeps you up in a huge hug, 'Oh my, we were so worried. Look at you.' she holds you out and looks you up and down. Instead, you look at Sharon and notice she's dressed entirely differently than you are used to seeing her.";
		rule fails;
	else if time_here of journey_sharon_walk is 2:
		Report Sharon saying "'Dearie, your grandparents are beside themselves with worry,' Sharon says, 'I have to get you back home. We've been looking everywhere.'";
	rule succeeds;

This is the
journey_sharon_walk_before_moving rule:
	queue_report "[if a random chance of 1 in 2 succeeds][sharon_urging] [run paragraph on][end if]Sharon [if player is in Room_Other_Shore]crosses the river to the crossing[else if player is in Room_Crossing]crosses the rocky shore toward the swimming hole so lightly and deftly it makes you reconsider her age. Previously, you thought of her as 'old,' now you're not so sure[else if player is in Room_Swimming_Hole]makes her way up the steep trail to the dirt road[else if player is in Room_Railroad_Tracks]crosses the tracks and heads to the grassy field[else if player is in Region_Dirt_Road]heads off toward the railroad tracks[else]is headed back to the trailer park[end if]." at priority 1;

To say sharon_urging:
	queue_report  "'[one of]I'm so glad we found you, [sharons_nickname],'[or]Your grandpa was so worried,'[or]Oh dear, are you okay? We need to get you home,'[or]Everyone was looking for you, they are going to be so relieved,'[or]Let's get you home,'[or]We're almost there, dear,'[or]Okay, dearie, let's bring you home,'[cycling]" at priority 3;

This is the
journey_sharon_walk_after_waiting rule:
	queue_report "[one of]'Hurry along, dear,' Sharon says, 'We have to get you home.'[or]'You know, your grandparents are worried sick about you,' Sharon says, 'Let's not dawdle, shall we?'[or]Sharon looks irritated about having to wait, but says nothing.[or]'Now I don't mind if we spend all day out here,' Sharon says, 'But I would think you'd have a little more respect and concern for your grandpa and grandma who are worries about you.'[or]Sharon looks mad at you for making her wait.[stopping]" at priority 3;

This is the
	journey_sharon_walk_catching_up rule:
	queue_report "Sharon catches up to you[if player is in Room_Crossing], carefully crossing the river on the floating log[else if player is in Room_Swimming_Hole] at the swimming hole[else if player is in Room_Railroad_Tracks] as you reach the railroad crossing[else if player is in Room_Grassy_Field] in the big grassy field[else if player is in Region_Dirt_Road] as you walk along the dirt road[end if]. [if a random chance of 1 in 3 succeeds or player is in Room_Grassy_Clearing] '[one of]I can barely keep up with you, [sharons_nickname],'[or]In a hurry to be going home, I see,'[or]So much vim and vigor!'[at random] Sharon says.[end if]" at priority 3;

This is the journey_sharon_walk_end rule:
	if time_here of journey_sharon_walk is 1:
		Now Honey is in Room_Grassy_Field;
		Now Grandpa is in Room_Grassy_Field;
		Report Grandpa saying "Honey and grandma come running across the field from the back gate of the trailer park. Suddenly, everyone is talking at once.[paragraph break]Sharon: 'I found him down by the creek.'[paragraph break]Grandpa: '[grandpas_nickname], I...' and falters. He tries several times to say something, but gives up and just puts his hand on your shoulder to steady himself.[paragraph break]Honey, who is not normally the sentimental one, looks stern but has tears in her eyes and sweeps you up in a big hug and says nothing.[paragraph break]To your surprise, you start to cry.";
		rule fails;
		[TODO: Make sure if player says something here, that everyone's responses make sense for this moment.]
	else if time_here of journey_sharon_walk is 2:
		Now Lee is in Room_Grassy_Field;
		Report Sharon saying "'He was on the other side of the creek, near the woods,' Sharon says.[paragraph break]'Thank you,' Honey says quietly. 'We didn't know if...' She doesn't complete the thought.[paragraph break]Grandpa picks you up and gives you a giant bear hug.[paragraph break]Lee arrives from the crossing, starts to say, 'I looked out by...' and sees you and stops and lets out a deep breath. He looks relieved. You are suddenly aware that everyone was out looking for you and worried to death.";
		rule fails;
		[TODO: Make sure player cannot go anywhere at this time.]
	else if time_here of journey_sharon_walk is 3:
		Report Sharon saying "'I think it's time I headed home,' Sharon says looking suddenly very tired.[paragraph break]'And maybe time for a drink,' Lee says. 'I'm glad you made it home, Jody,' and ruffles your hair tenderly. 'You're a trouper.' He heads back to the trailer park with Sharon right behind him.[paragraph break]Grandpa is still carrying you and you're glad to be safe in his big sailor arms. He and Honey walk back to their trailer, Honey with her hand on grandpa's shoulder.";
		Now Sharon is in Room_Sharons_Trailer;
		Now Lee is in Room_Lees_Trailer;
		Now Honey is in Room_B_Loop;
		Now Grandpa is in Room_B_Loop;
		Move player to Room_B_Loop, without printing a room description;
		queue_report "[bold type][location][roman type]" at priority 1;
		rule succeeds;

Part - Lee

[TODO:
"Hey, Jody," Lee says, "How you doin'?".
>talk to lee
You are already talking to Lee]

Lee is a _male man in Room_C_Loop.
	The initial appearance is "[lees_initial_appearance][first time] [description of lee][only]".
	The description is "You think maybe Lee is your mom's age, but looks much older, like he's already lived a lot. He has long black hair pulled back in an untidy ponytail. He's wearing a tanktop and green army pants. Honey tells you to stay clear of him, but he always says hi to you politely and might be the only person you know who calls you by your name."
	Understand "lee/veteran/vet" as Lee.
	The scent is "cigarettes and alcohol".

To say lees_initial_appearance:
	if Scene_Day_One is happening:
		if Lee is in Room_C_Loop:
			say "Lee is sitting on a lawn chair in his empty carport, chain smoking.";
		else if Lee is in Room_Lees_Trailer:
			say "Lee is [if lees_tv is switched on]watching TV[else]here[end if].";
	else:
		say "Lee is here.";

[TODO: Handle listing multiple people in one location]

Chapter - Properties

Chapter - Rules and Actions

Instead of touching Lee:
	say "You're not sure at all if it's the right thing to do or whether you're sure you even want to, but you do, and Lee gives you a pat on the back and you can see his eyes have kind of teared up and he turns away to wipe them.";
	Now player is affectionate.

At the time when lee_resumes_smoking:
	if lee is not in Room_C_Loop:
		move_lee_out_of_his_trailer;

To move_lee_into_his_trailer:
	now Lee is in Room_Lees_Trailer;
	if player is in Room_Lees_Trailer:
		Report Lee saying "Lee comes in stubbing out his cigarette in an ashtray and says, 'Hey, Jody.'";
	else:
		queue_report "Lee gives you a wave and heads inside his trailer." at priority 3;

To move_lee_out_of_his_trailer:
	now Lee is on the lawn chair;
	if player is in Room_Lees_Trailer:
		queue_report "Lee gives you a wave and heads out the door, grabbing a pack of smokes on the way outside." at priority 3;
	else:
		Report Lee saying "Lee comes out of his trailer, gives you a nod, sits down in his chair, and lights up a smoke.";

[TODO: Every turn when Lee is not talking, do Lee stuff, smoke cigarette, etc ]

Chapter - Responses

[
	Lee's Preliminaries and greetings
]

Greeting response for Lee:
	say "[one of]'Hey, Jody,' Lee says, 'How you doin[']?'.[or]'Hi again, Jody,' Lee says.[stopping]";

Implicit greeting response for Lee:
	do nothing;

Farewell response for Lee:
	say "'See ya, [lees_nickname],' Lee says.";

Implicit farewell response for Lee:
	do nothing.

To say lees_nickname:
	say "Jody";

To say Lee stuff:
	say "[one of]looking awkward[or]watching you[or]hanging out[at random]";

[
	Defaults
]

Default give response for Lee:
	say "'Hey, man, thanks. You keep it though,' says Lee[if a random chance of 1 in 3 succeeds] [Lee stuff][end if].";

Default show response for Lee:
	say "'Hey, that's cool,' Lee says.";

Default response for Lee:
	say "'Hmm, yeah cool,' Lee says.";

Default ask response for Lee:
	say "'Well, like a lot of things, I don't know much about that[one of][or] either[stopping], [lees_nickname],' Lee says.";

Default thanks response for Lee:
	say "'Don't mention it,' Lee says and looks away.";

Response of Lee when saying yes:
	say "Lee smiles.";

Response of Lee when saying no:
	say "Lee frowns but says nothing.";

Response of Lee when saying sorry:
	say "'Ah no, don't be sorry,' Lee says, 'I'm sorry. I'm the one who should be sorry.'";

[
	Responses
]

Response of Lee when asked-or-told about player:
	say "'What's to tell?' Lee asks. 'You are one badass little trooper who ain't gonna let nothing get you down. Nah, you got [']em licked, believe me.'".

Response of Lee when asked-or-told about Grandpa:
	say "'I don't know your grandpa that well, but he's always cool to me,' Lee says.".

Response of Lee when asked-or-told about Honey:
	say "'I got nothing to say about your grandma,' Lee says.".

Response of Lee when asked-or-told about Mary:
	say "'She seems like a pretty nice old lady,' Lee says.".

Response of Lee when asked-or-told about Lee:
	say "'I don't know, Jody. I don't like to talk about myself,' Lee says.".

Response of Lee when asked-or-told about Sharon:
	say "Lee glances toward D Loop. 'I don't have nothin['] to say about that lady,' Lee says, 'but don't even get me started on her cats.'".

Response of Lee when asked-or-told about Sheriff:
	say "'Ah, man, don't even get me started on that fat pig,' Lee says. 'I don't have beef with every cop like some guys, but this sheriff is always trying to bust my chops. Reminds me of some of the Em-Fics we had in Nam. Some of them, good guys. Some of them, a-holes trying to make a point. Excuse my language.".

Response of Lee when asked-or-told about Mom:
	say "[one of]'I know your mom. Rachel,' Lee says seriously. 'She's good people. I get people up in my face all the time. People avoiding me. Your mom, she smiles nicely at me and tells me hello.
	[paragraph break]After a moment, he says, 'I think you're pretty lucky. To have a mom like that.'[or]'Yep,' Lee says 'I think you're lucky to have a mom who loves you like that.'[stopping]".

Response of Lee when asked-or-told about Dad:
	say "'Yeah, I definitely don't know your dad,' Lee says. 'Is he around much? Do you see him ever?'".

Response of Lee when asked-or-told about stepdad:
	say "'I don't know your step-dad, man,' Lee says, 'I heard him yelling at your mom once, but I'm in no position to criticize.'".

Response of Lee when asked-or-told about topic_tree:
	say "'I must have spent half my time up in the treetops when I was a kid,' Lee says. 'Fell out of some too. I even built a treehouse deep in the woods. Not much to look at, but it was a great hideout. I made friends with squirrels and birds. I liked to think I was part of the Squirrel clan.' Lee takes a drag from his cigarette.[if player is tree_experienced] 'I guess you might be part of that clan too.'[end if]".

Response of Lee when asked-or-told about topic_jam or topic_berries:
	say "'You know, I grew up around here. Guess that's why I came back here,' Lee says mostly to himself. 'I used to pick blackberries in August too. Me and my brother used to pick berries and eat every single one until our tongues and our fingers were purple and our bellies were sore.'".

Response of Lee when asked-or-told about topic_trailer:
	say "'Ah, I don't know,' Lee says. 'This is where I hang my hat. It could be any place. It could be somewhere else tomorrow.'".

Response of Lee when asked-or-told about dog:
	say "'I can't stand dogs now,' Lee says. 'There were some dogs in our unit and, lemme tell you, they weren't your pet Spot. Nah, they were mean machines. It just about broke my heart to see them at first because I used to love dogs. But they'd just as happily take your arm off as look at you.".

Response of Lee when asked-or-told about flattened coin or given-or-shown flattened coin:
	say "'Oh, hey that's neat,' Lee says with authentic wonder. 'I used to do that. Train pennies, we called [']em.'".

Response of Lee when asked-or-told about train tracks:
	say "'Oh hey, you be careful, man,' Lee says seriously.".

Response of Lee when asked about topic_work:
	say "'I ain't working right now. I tried to take a few jobs when I got back, but I'm still, I don't know. Too jumpy. And too angry. That's what one boss said when they fired me,' Lee says and takes a drag. 'Now Uncle Sam pays me to sit around and be a broken army toy.'".

Response of Lee when asked about topic_love:
	say "'I don't know a thing about it,' Lee says. 'Not a single goddamn thing. Pardon my language.'".

Response of Lee when asked-or-told about topic_family:
	say "'Ah, my family. Yeah, I don't talk to [']em much anymore. My mom. My dad. My brother,' Lee says, 'My mom grew up in Pine Ridge. That's a genuine Indian rez, man.'[paragraph break]'Did you know I was married? Might even still be. When I came back, she couldn't take it and split.' Lee lights another cigarette. 'I guess good for her. Get out while the gettin's good.'".

Response of Lee when asked-or-told about purple_heart:
	if purple_heart is not in Limbo:
		say lee_purple_heart_story;
	else:
		continue the action;

To say lee_purple_heart_story:
	say "'It was nothing,' Lee says, though you can tell he's pleased to be able to give you the gift. 'You hold on to that. That's for your courage and endurance.'[paragraph break]'You know, they gave me that when I got hurt in the war,' Lee says, 'I wasn't even shot. I just crashed a jeep,' Lee laughs. 'I was a driver at the base in Da Nang and there was a rocket attack. A fuel tank went up and I turned to look. Hit a Jersey barrier. Add so I got a purple heart like a hero.'[paragraph break]";

[transition text]
Instead of going from Room_Lees_Trailer during Scene_Hangout_With_Lee:
	say "You give a wave to Lee as you go.[paragraph break]'Alright, drop by any time, Jody,' Lee says. 'You take care of yourself. And don't let the assholes get you down,' he adds with a wink.";
	if index of seq_lee_hangout is greater than 4:
		now seq_lee_hangout is not in-progress;
		lee_resumes_smoking in four turns from now;
	continue the action.

Chapter - Rants

Response of Lee when asked-or-told about topic_cat:
	now lee_cat_rant is in-progress.
lee_cat_rant is a rant.
	The quote_table is the Table of lee_cat_rant.
	The speaker is Lee.

Table of lee_cat_rant
Quote
"'Honestly, I don't mind cats. I like them really,' Lee says, taking a long drag off of his cigarette. 'They're independent. They're smart. They're survivors. They're only interested in people as long as they feed them.' Lee glances toward D Loop."
"'But over there,' Lee says, 'That's not a lady who loves cats. That's a lady who collects things. And it happens to be cats."
"Lee is angry and stubs out his cigarette in a coffee can. 'They're living things, man! They need to be loved. And petted. And each one needs a name and to be cared for and to feel unique in the whole world.' He wipes his eyes angrily."
"'Sorry, I get carried away,' Lee says. 'I really like cats.'"

Response of Lee when asked about topic_war:
	now lee_war_rant is in-progress.
lee_war_rant is a rant.
	The quote_table is the Table of lee_war_rant.
	The speaker is Lee;

Table of lee_war_rant
Quote
"'I don't want to talk about it,' Lee snaps and turns away. You're suddenly regretful and embarrassed that you brought it up."
"Lee turns to you and softens, 'I know you didn't mean anything by it, man. It's just hard, you know?' You don't really know, but you hold Lee's gaze. 'It was hard being there and it was hard coming home. I feel like I don't really fit anywhere anymore.'"
"'I heard about a few people who came home and protesters were in their face and so on, but I never got any of that,' Lee continues. 'Hell, I don't blame them. If I'da stayed home, I mighta been right there with [']em. Protesting.'
[paragraph break]After a moment, he continues, 'No, I didn't get any of that, man. What I got was nothing.'"
"'I'm still so angry and hurt, I don't even know what to do with myself.' Lee looks at you. 'I don't even know why I'm telling you all this.'
[paragraph break]He takes a long drag of his cigarette and the smoke blows around your head. Lee waves the smoke away from you and stubs his cigarette out in a coffee can. 'I got people making nice, people tiptoeing around me, nobody -- and I mean nobody -- asking about the war.'"
"'No one asked me, [']Hey, dude, did you kill anyone?['] Or [']Hey, what were you most scared of?[']' Lee seems really angry, but for some reason you're not scared. 'Nah, nobody asked me nothin[']. Nobody asked me shit. Oh sorry pardon my language, [lees_nickname].' Lee looks up and remembers you."
"Lee looks at you. 'You know what I mean? It was like I'd been down the street buying a loaf a bread. Did anyone know I was gone? I wanted to stop people and shake them. [']Hey, bud, did you know I was in southeast Asia trying not to get myself killed?[']'"
"'Yeah, that's not my best topic, but thanks for listening to my war stories,' Lee says with a smile. 'And hey, thanks for askin[']. Really.'"

After quizzing Lee about topic_war:
	Now player is compassionate;
	continue the action;

Response of Lee when asked-or-told about topic_indians:
	now lee_indian_rant is in-progress.

lee_indian_rant is a rant.
	The quote_table is the Table of lee_indian_rant.
	The speaker is Lee;

Table of lee_indian_rant
Quote
"'This whole area, hell, this whole country, is Indian land, Jody.', Lee says, 'I grew up here, but my mom grew up on the rez. I don't think she ever wanted to go back. She was full blood Dakota. They took her out for Indian School and erased her culture, man. I knew I was Indian, but had no connection to it, you know?' Lee takes a drag of his cigarette."
"Lee continues. 'I met more Indians in name than I ever did in the World,' Lee laughs bitterly. 'I mean they like to send poor people to war, don't they? And that means Blacks and Chicanos and Indians.'"
"'That's why we're seeing all that stuff on the news about the Indian Movement,' Lee continues, 'They're fed up, man. You watch, Jody, someday the Indians are gonna take back this whole country.'"


Chapter - Sequences

[
	Lee Invite Sequence
]

[TODO: All seq should stop if rant is in progress]

seq_lee_invite is a sequence.
	The action_handler is the seq_lee_invite_handler rule.
	The interrupt_test is seq_lee_invite_interrupt_test rule.
	The length_of_seq is 5.

This is the seq_lee_invite_handler rule:
	let index be index of seq_lee_invite;
	if Lee is visible:
		now current interlocutor is Lee;
	if index is 2:
		Report Lee saying "Lee looks you over. 'What happened to your arm?' he asks with what seems like genuine concern.[if player is injured] 'I see you're looking a little rough around the edges. You okay?' You notice you've been holding your side where you bashed it on the big pine tree.[end if]";
		now player is arm_aware1;
	else if index is 4:
		queue_report "Lee looks like he is thinking about something. Finally, he nods to himself." at priority 2;
	else if index is 5:
		Report Lee saying "'I think I have something for you. You're welcome to come in, if you want,' Lee shrugs.[first time]
		[paragraph break][Lee_Invite_Premonition].[only]";

[TODO: Add visibility rule to interrupt tests and eliminate stuff like "if player is in Room_C_Loop and lee is visible" from the individual sequence steps, making sure they only apply within Day One or Day Two as appropriate]

This is the seq_lee_invite_interrupt_test rule:
	[End seq if still in-progress but scene has ended]
	if Scene_Day_One is not happening or Scene_Hangout_With_Lee has happened:
		now seq_lee_invite is not in-progress;
		rule succeeds;
	[Pause seq if we walk away]
	if Lee is not visible or player is not in Room_C_Loop:
		rule succeeds;
	[if we are speaking to lee:
		rule succeeds;]
	if Scene_Sheriffs_Drive_By is happening:
		rule succeeds;
	rule fails.

[
	Scene_Hangout_With_Lee Sequence
]

seq_lee_hangout is a sequence.
	The action_handler is the seq_lee_hangout_handler rule.
	The interrupt_test is seq_lee_hangout_interrupt_test rule.
	The length_of_seq is 8.

This is the seq_lee_hangout_handler rule:
	let index be index of seq_lee_hangout;
	if Lee is visible:
		now current interlocutor is Lee;
	if index is 1:
		if Lee is not in Room_Lees_Trailer:
			move_lee_into_his_trailer;
		Report Lee saying "'So what's up in your world?' Lee asks. 'Anything good?' He pauses for a moment. 'I have something here for you.'
			[paragraph break]Lee is fumbling around in a drawer.";
	if index is 2:
		Report Lee saying "'Hey, make yourself comfortable,' Lee says. 'Mi casa, es su casa. That means [']My home is your home.['] Do you want anything? A drink or anything?' It makes you [nervous] to think of drinking or eating in Lee's trailer. You can smell a little alcohol on his breath like your step-dad.
		[paragraph break]Lee is fumbling around in a drawer.";
	if index is 3:
		Report Lee saying "'I got this when I got hurt in Da Nang,' Lee says. 'And now I think it's time to pass it on to you.'
		[paragraph break]Lee is still looking for something.";
	else if index is 4:
		Report Lee saying "'They gave it to me just for being in the wrong place at the wrong time,' Lee is still fumbling in a drawer.
		[paragraph break]'And I didn't even want to be there. So I always felt weird about it. Like it wasn't really mine. Like I didn't deserve it,' Lee says, 'But you're full of spirit and should have this.' Lee seems to find what he's looking for and puts it behind his back. 'This is for you.'
		[paragraph break]He holds out a purple medal. It has a purple ribbon and a gold heart-shaped medalion, purple around a gold figure in the middle. You want to hold it in your hand and feel its weight. You put out your hand and, for a moment, are scared Lee is going to snatch it back.
		[paragraph break]But Lee puts the medal in your hand with a smile. It's heavier even than it appears.";
		now player holds purple_heart;
	else if index is 5:
		Report Lee saying "You start to thank Lee, but he looks embarrassed even before you say it and cuts you off. 'I wonder what's on the tube,' He turns to the television and starts fiddling with the rabbit ears.";
	else if index is 6:
		if lee is visible:
			try Lee switching on lees_tv;
			say what_show_is_playing;
			say line break;
			Report Lee saying "'There's never anything really on. Don't know why I bother,' Lee says. 'Feel free to find something that you like.'";
	else if index is 7:
		if turns_so_far of seq_lee_hangout is less than 40:
			decrease index of seq_lee_hangout by one;
	else if index is greater than 7:
		Report Lee saying "'Okay, I'm heading out. You can stay here long as you want. Drop by any time, Jody,' Lee says. 'You take care of yourself. And don't let the assholes get you down,' he adds with a wink.";
		lee_resumes_smoking in one turn from now;

This is the seq_lee_hangout_interrupt_test rule:
	if we are speaking to Lee:
		rule succeeds;
	if player is not in Room_Lees_Trailer and player is not on lees_table:
		[a condition so if player leaves, Lee doesn't get stuck waiting]
		if turns_so_far of seq_lee_hangout is greater than 40:
			rule fails;
		else:
			rule succeeds;
	if player is not in Room_Lees_Trailer:
		rule succeeds;
	rule fails.

[
	Lee on Walk

	This is a journey that begins
		* during Scene_Found
		* when player is in Room_Willow_Trail

 	What happens on Lee's walk:
		* beginning: Lee hugs you and says some stuff and sets off to return you home
		* turn n: you arrive where lee is waiting, maybe he says something if it has been more than a turn
		* turn n+1: one turn after you arrive, lee says something to you and goes one step closer
		* turn n+m: if you take more than m turns to get to him and you are a location away, lee comes to get you and ask if you are coming
		* end: Lee returns you to your family and tells where they found you, Sharon arrives
]

[test gw with "teleport to lees trailer / teleport to grassy clearing / teleport to willow trail".]

[TODO: Create a rule that prevents us from going anywhere but toward goal during this walk]

journey_lee_walk is an npc_journey.
	The npc is Lee.
	The origin is Room_Blackberry_Tangle.
	The destination is Room_Grassy_Field.
	The wait_time is 2.
	The max_wait is 10.
	Waits_for_player is true.
	The interrupt_test is the journey_lee_walk_interrupt_test rule.
	The action_at_start is the journey_lee_walk_start rule.
	The action_at_end is the journey_lee_walk_end rule.
	The action_before_moving is the journey_lee_walk_before_moving rule.
	The action_after_waiting is the journey_lee_walk_after_waiting rule.
	The action_catching_up is the journey_lee_walk_catching_up rule.

This is the journey_lee_walk_interrupt_test rule:
	if we are speaking to Lee, rule succeeds;
	rule fails.

[
	Lee Begins Walk
]

This is the journey_lee_walk_start rule:
	if time_here of journey_lee_walk is 1:
		Report Lee saying "Lee sees you as you emerge from the blackberry brambles and looks relieved. 'Oh, man, we've been looking for you everywhere. Oh man. Oh man,' he just keeps shaking his head. 'Come here, kid, lemme look at you.'";
		rule fails;
	if time_here of journey_lee_walk is 2:
		Report Lee saying "Lee looks at your torn clothes and the leaves in your hair, 'Wow, I have to admit, I didn't think this would end well, but look,' he says gesturing at you. 'A little worse for wear, but still kickin'. Lee smiles and pats your back. 'I have a million questions. First, where did you bivvy last night?'";
		rule fails;
	else if time_here of journey_lee_walk is 3:
		Report Lee saying "'I should have known. You're a little survivor.' Lee looks at you admiringly and it makes you proud of yourself, the leaf fort, the raccoons, the long night. 'I got to get you back to your family. They'll be so worried.'[line break]'Let's head back to the trailer park,' Lee says.";
		rule succeeds;

This is the
journey_lee_walk_before_moving rule:
	queue_report "[if a random chance of 1 in 2 succeeds][lee_urging] [run paragraph on][end if]Lee [if player is in Region_Blackberry_Area]heads off toward the old bridge[else if player is in Stone Bridge]crosses the bridge to the dirt road[else if player is in Room_Railroad_Tracks]crosses the tracks and heads to the grassy field[else if player is in Region_Dirt_Road]heads off toward the railroad tracks[else]is headed back to the trailer park[end if]." at priority 1;

To say lee_urging:
	say "'[one of]We gotta hoof it, soldier'[or]Let's hustle'[or]Movin' out,'[or]Okay, let's go,'[or]We gotta double time. Your family's gonna be worried,'[or]You okay? Just a little farther,'[or]Coming up on home,'[cycling]";

This is the
journey_lee_walk_after_waiting rule:
	Report Lee saying "[one of]'Your family is going to be worried, [lees_nickname],' Lee says, 'We gotta keep moving.'[or]'I know you've been through a lot,' Lee says, 'but we can't stop here.'[or]'We gotta get going, [lees_nickname],' Lee says, 'Your family is waiting.'[or]'We gotta hustle,' Lee says.[or]Lee looks impatient, but doesn't say anything.[stopping]";

This is the
	journey_lee_walk_catching_up rule:
	queue_report "Lee catches up to you [if player is in Stone Bridge]at the stone bridge[else if player is in Region_Blackberry_Area]along the trail[else if player is in Room_Dirt_Road]as you reach the dirt road[else if player is in Room_Long_Stretch]as you walk along the dirt road[else if player is in Room_Railroad_Tracks]as you reach the railroad crossing[else if player is in Room_Grassy_Field]and crosses the grassy field[end if]. [if a random chance of 1 in 3 succeeds or player is in Room_Grassy_Clearing] '[one of]You know how to hustle'[or]Great double time, soldier,'[or]You're doing great, I can barely keep up with you,'[or]I'm right behind ya', [lees_nickname],'[in random order] Lee says seriously.[end if]" at priority 3;

This is the journey_lee_walk_end rule:
	if time_here of journey_lee_walk is 1:
		Now Honey is in Room_Grassy_Field;
		Now Grandpa is in Room_Grassy_Field;
		Report Grandpa saying "Honey and grandma come running across the field from the back gate of the trailer park. Suddenly, everyone is talking at once.[paragraph break]Lee: 'I found him out in the blackberry brambles.'[paragraph break]Grandpa: '[grandpas_nickname], I...' and falters. He tries several times to say something, but gives up and just puts his hand on your shoulder to steady himself.[paragraph break]Honey, who is not normally the sentimental one, looks stern but has tears in her eyes and sweeps you up in a big hug and says nothing.[paragraph break]To your embarrassment, you start to cry.";
		rule fails;
		[TODO: Make sure if player says something here, that everyone's responses make sense for this moment.]
	else if time_here of journey_lee_walk is 2:
		Now Sharon is in Room_Grassy_Field;
		Report Lee saying "'He was down on the other side of the creek, by the willows,' Lee says, carefully not looking at your tears.[paragraph break]'Thank you,' Honey says quietly. 'We didn't know if...' She doesn't complete the thought.[paragraph break]Grandpa picks you up and gives you a giant bear hug.[paragraph break]The Cat Lady arrives from near the tracks. She's dressed differently, like for an expedition. She starts to say, 'I went through the woods...' and sees you and clutchs her chest. She looks woozy and says 'Oh my.' You are suddenly aware that everyone was out looking for you and worried to death.";
		rule fails;
		[TODO: Make sure player cannot go anywhere at this time.]
	else if time_here of journey_lee_walk is 3:
		Report Lee saying "'I think it's time for a drink,' Lee says. 'I'm glad you made it home, Jody,' and ruffles your hair tenderly. 'You're a trouper.' [paragraph break]'I think I better head home and check on my darlings,' the Cat Lady says looking suddenly very tired. She heads back to the trailer park with Lee right behind her.[paragraph break]Grandpa is still carrying you and you're glad to be safe in his big sailor arms. He and Honey walk back to their trailer, Honey with her hand on grandpa's shoulder.";
		Now Sharon is in Room_Sharons_Trailer;
		Now Lee is in Room_Lees_Trailer;
		Now Honey is in Room_B_Loop;
		Now Grandpa is in Room_B_Loop;
		Move player to Room_B_Loop, without printing a room description;
		queue_report "[bold type][location][roman type]" at priority 1;
		rule succeeds;


Part - Aunt Mary

Aunt Mary is a _female woman in Room_Grandpas_Trailer.
	The initial appearance is "Your Aunt Mary is looming over the stove in the kitchen, stirring a huge vat of blackberry jam.".
	The description is "This is your Aunt Mary, or actually your Great Aunt Mary since she is your Grandma Honey's sister. She is a huge woman and wears an old lady dress with flowers and a checked apron. She is stirring the pot_of_blackberry_jam continuously and staring into space.".
	Understand "great-aunt", "great-aunt", "aunty" as Aunt Mary.

Chapter - Properties

Chapter - Rules and Actions

Chapter - Responses

[
	Preliminaries and greetings
]

Greeting response for Mary:
	say "'[one of]Oh hullo, dear[or]Hullo again[stopping],' says your Aunt Mary[if a random chance of 1 in 3 succeeds], [mary_stuff][end if].";

Implicit greeting response for Mary:
	do nothing;

Farewell response for Mary:
	say "'Bu-bye. You be good, dear,' Aunt Mary says.";

Implicit farewell response for Mary:
	do nothing;

To say mary_stuff:
		say "[if Mary is in Room_Grandpas_Trailer][one of]stirring the blackberry jam vigorously[or]testing the jam by letting it run off the edge of a spoon[or]stacking jam jars and lids in the dish drainer[or]plopping paraffin into a double boiler to melt[at random][else][one of]smoothing down the front of her old lady dress[or]tugging at her apron[or]looking around worriedly[at random][end if]";

[
	Defaults
]

Default give-show response for Mary:
	say "'Oh, thanks, dear, but I couldn't,' says Aunt Mary[if a random chance of 1 in 3 succeeds], [mary_stuff][end if].";

Default response for Mary:
	say "[one of]'Uh huh,' Aunt Mary says distractedly[or]'I apologize, dear, but I have to go stir the jam,' Mary says[or]'Hm, what was that?' Mary says[or]'Oh, you don't say,' Mary says vaguely[at random][if a random chance of 1 in 3 succeeds], [mary_stuff][end if].";

Default thanks response for Mary:
	say "'Okay, dear,' Aunt Mary says.";

Instead of touching Mary:
	say "'You're a darling,' she says. Now help your old Aunty here.";
	Now player is affectionate;

[
	Responses
]

Response of Mary when asked-or-told about player:
	say "'Well, Honey, you're...' she starts and then kind of trails off."

Response of Mary when asked-or-told about Mary:
	say "'I was quite a firebrand in my youth, if you can believe that. I went to every dance and could Charleston with the best of them!' She looks faraway and laughs, 'And did I love to kiss the boys...' she  seems to remember you're there and stops to straighten her apron."

Response of Mary when asked-or-told about Grandpa:
	say "'Such a dear man,' she says.".

Response of Mary when asked-or-told about Honey:
	say "'My baby sis,' she says delighted. 'She was spoiled as a baby. Always so demanding. But when I told Mama and Papa, they just laughed. Mama could have kissed the ground she walked on.'".

Response of Mary when asked-or-told about Sharon:
	say "'Sharon?' she laughs, 'She really is a dear old lady.'".

Response of Mary when asked-or-told about Lee:
	say "'Who? Oh, Lee. Well, that young man, I can tell he's had a troubled life,' she says. 'You probably want to talk to your grandmother before talking to him. Though he's always been decent to me.'"

Response of Mary when asked-or-told about Sheriff:
	say "'Oh, he's a good man. He looks in on me every once in a while,' she says."

Response of Mary when asked-or-told about Mom:
	say "[one of]'Who's that now?' she looks confused. 'Oh, sorry, honey, your mom, of course. [or]'[stopping]What a sweet child she is. She was always so beautiful.'".

Response of Mary when asked-or-told about Dad:
	say "'Well, he, I'm...' her eyes get faraway and she trails off.".

Response of Mary when asked-or-told about stepdad:
	say "Her eyes look sharp for a moment, 'I know he and your grandmother have their differences, but I can tell you that he looks like he really loves your mom. When she leaves the room, that man looks like someone just let the air out of him.'"

Response of Mary when asked-or-told about topic_berries:
	say "'Every year,' she smiles. 'Every year, we pick the berries and the jam lasts until the next summer.'"

Response of Honey when asked-or-told about bucket:
	say "Your lee [if Scene_Bringing_Lunch is happening]will be bringing[else]brought[end if] that bucket up for me to make more jam."

Response of Mary when asked-or-told about topic_jam:
	say "'That's your grandma's recipe,' she says proudly. 'No,' she looks worried, 'No. Mama is your great-grandmother. It's your great-grandma's recipe.'".

Response of Mary when asked-or-told about train tracks:
	say "'I can hear that old train,' she says. 'Reminds me before any of us had cars - if you wanted to get somewhere, you rode a train.'".

Response of Mary when asked-or-told about topic_lunch:
	if Scene_Bringing_Lunch is happening:
		say "'Oh, you go and take lunch to your Honey and lee,' she says. 'That's hungry work.'";
	else:
		say "'Later we'll make some lunch for you and your Honey and lee,' she says.";

Response of Mary when asked about topic_life:
	say "'I've had a pretty good life and a wonderful family,' she says.".

Response of Mary when asked about topic_love:
	say "'I love you,' Mary says.".

Response of Mary when asked about topic_death:
	say "'Why are you being so morose? I don't like to talk about it,' Mary says curtly.".

Response of Mary when asked about topic_war:
	say "'Those were hard times. I don't like to talk much about that,' she looks sad. 'Better to just let some thing go, I think.'".

Response of Mary when asked about topic_work:
	say "'I helped your uncle Charlie with his rock shop in Grass Valley years ago, but now he's gone,' she says sadly.".

Response of Mary when asked about topic_family:
	say "'I come from a big family,' she says. 'Not as many of them left anymore. Your uncle Charlie died a couple years ago. Ethel is still in Portland. Your uncle John died before you were even born, when I was still a girl. That just about broke Mama and Papa's hearts.".

Chapter - Rants

Chapter - Sequences

[
	Mary Suggestion Sequence

	summary: Mary suggests we go back to blackberry clearing to help grandpa bring bucket back and get lunch
	conditions: during explorations, hasn't happened already, in Room_Grandpas_Trailer for some number of turns
	trigger: the scene Mary Suggestion starts
]

seq_mary_suggestion is a sequence.
	The action_handler is the seq_mary_suggestion_handler rule.
	The interrupt_test is seq_mary_suggestion_interrupt_test rule.
	The length_of_seq is 3.

This is the seq_mary_suggestion_handler rule:
	let index be index of seq_mary_suggestion;
	if index is 1:
		Report Mary saying "Aunt Mary pauses for a moment from her jam making to talk to you, 'You know your grandpa may need some company if he's bringing that bucket up here.'";
	else if index is 2:
		Report Mary saying "'Also, when you go down to the creek, ask your Grandpa and Grandma about lunch,' Aunt Mary says. 'I can make some sandwiches to send down with you.'";
	else if index is 3:
		Report Mary saying "'Why don't you hustle down to the creek and help your grandpa,' Aunt Mary says and goes back to stirring the jam.";

This is the seq_mary_suggestion_interrupt_test rule:
	if Scene_Explorations has ended, rule fails; [if no longer applicable, run out the sequence]
	if we are speaking to Mary, rule succeeds;
	if Mary is not visible, rule succeeds;
	rule fails.

[
	Mary Sandwich Sequence

	summary: Mary makes player stay and help make sandwiches
	conditions: after Scene_Walk_With_Grandpa, player in trailer
	trigger: the scene Mary Sandwich starts
]

Some sandwich_ingredients are a fixed in place thing.
	The printed name is "sandwich makin's".
	The initial appearance is "Aunt Mary has gotten out cans of Chicken of the Sea, Miracle Whip, and Wonder Bread for making tuna sandwiches.". The description is "Several cans of Chicken of the Sea, Miracle Whip, and Wonder Bread are out for making tuna sandwiches."
	Understand "chicken of the sea", "miracle whip", "wonder bread", "bread/loaf/tuna/spread/mayonnaise/whip/can/cans/bags", "sandwich bags" as sandwich_ingredients.

A brown paper bag is a unopenable open container.
	The printed name is "a [if brown paper bag is torn]torn up [end if]brown paper bag".
	The description is "A plain brown paper bag[if brown paper bag is torn] now pretty torn up[end if]".
A brown paper bag can be torn.

[Originally I thought to simplify this model, but it came in handy during Scene_Defend_the_Fort]
A tuna sandwich is a kind of thing.
	A tuna sandwiches is edible.
	[It is singular-named "tuna sandwich".]
	Three tuna sandwiches are in brown paper bag.
	The description is "These are your favorite. Tuna sandwiches that get delightfully soggy and tasty in the middle. Chicken of the Sea with Miracle Whip on Wonder Bread, all wrapped up in sandwich bags."
	Understand "chicken of the sea", "miracle whip", "wonder bread", "bread/loaf/tuna/spead/mayonaise/whip/can/cans/bag/bags", "sandwich bags", "sandwich/sandwiches" as tuna sandwiches.

Instead of dropping tuna sandwich during Scene_Day_One:
	say "No way. That's lunch for Honey and grandpa.";

Instead of eating tuna sandwich during Scene_Day_One:
	say "Not yet. You want to eat lunch with Honey and grandpa.";

seq_mary_sandwich is a sequence.
	The action_handler is the seq_mary_sandwich_handler rule.
	The interrupt_test is seq_mary_sandwich_interrupt_test rule.
	The length_of_seq is 3.

Instead of going when seq_mary_sandwich is in-progress:
	say "'I want you to stay and help make sandwiches,' Aunt Mary says. 'It will just take a minute. Then you can go join your grandpa and bring them lunch.'";

Understand "make sandwiches/sandwich/lunch", "help with/make sandwiches/sandwich/lunch" as a mistake ("Aunt Mary already has you working on the assembly line making tuna sandwiches.").

This is the seq_mary_sandwich_handler rule:
	let index be index of seq_mary_sandwich;
	if index is 1:
		if mary is visible:
			Report Mary saying "Your Aunt Mary recruits you to help make lunch, getting out cans of Chicken of the Sea, Miracle Whip, and Wonder Bread.";
			now sandwich_ingredients are in Room_Grandpas_Trailer;
	else if index is 2:
		Report Mary saying "Your Aunt Mary has you on the assembly line constructing tuna fish sandwiches and putting them in sandwich bags.";
	else if index is 3:
		Report Mary saying "You pack all the sandwiches up in a brown paper bag, and Aunt Mary puts away the sandwich makin's. 'Okay, you take those sandwiches down to your grandparents. All those blackberries they're picking. It's hungry work.' Aunt Mary smiles.";
		now all tuna sandwiches are in brown paper bag;
		now brown paper bag is held by player;
		now sandwich_ingredients are off-stage;

This is the seq_mary_sandwich_interrupt_test rule:
	if we are speaking to Mary, rule succeeds;
	if Mary is not visible, rule succeeds;
	rule fails.


Part - the Sheriff

The Sheriff is an undescribed _male man.
	The printed name is "the Sheriff".
	The description is "The sheriff is an older guy about grampa's age maybe, but who doesn't smile. He 	has big glasses that are kind of lopsided and a hat like smokey the bear.".
	Understand "sherriff/sherrif/deputy/police/officer/pig/bill/hat/glasses" as The Sheriff.
	The scent is "fear".
	The sheriff is in the sheriffs_car.

The sheriffs_car is a undescribed unopenable closed vehicle in Limbo.

Chapter - Properties

Chapter - Rules and Actions

[
	Scene_Sheriffs_Drive_By
]

The sheriff's car is an undescribed enterable fixed in place closed locked transparent container. The sheriff's car is in Limbo. The description is "It is dark green, mostly, with white doors, and a big black and gold badge on the door that says 'Sierra County Sheriff.' It has red lights along the top. This is a big boxy car that looks kinda muscular and mean like the yellow dog."
Understand "police/sheriff/sheriffs/sheriff's/sherriff/sherriffs/sherriff's/deputys/deputy's/squad car", "policecar", "squadcar", "car" as sheriff's car.
The scent is "bacon".

[TODO: Procedural rules are deprecated...
Procedural rule when doing anything to sheriff when sheriff is visible and sheriff is in sheriff's car:
	ignore the basic accessibility rule;]



test drive-by with "Go to Railroad Tracks/g/g/g/g/g/g/g/g/g/g/g/go to c loop/g/g".

Instead of going during Scene_Sheriffs_Drive_By:
	if the time since Scene_Sheriffs_Drive_By began is 1 minutes:
		say "But you're curious what the police are here for, so you change your mind and keep listening.";
	else if the time since Scene_Sheriffs_Drive_By began is 2 minutes:
		say "You quietly back away while the Cat Lady and the Sheriff are still talking about something. A quick look back. Did the Cat Lady just point over toward you? Are they talking about you for some reason? You want to hear what they are saying, so you creep closer.";
	otherwise:
		continue the action;

[Every turn when (player is in Room_C_Loop or player is in Room_B_Loop or player is in Room_Picnic_Area) during Scene_Sheriffs_Drive_By:
	if the time since Scene_Sheriffs_Drive_By began is greater than 1 minutes:
		queue_report "The Sheriff is still talking to the Cat Lady in D Loop." with priority 3;]

Chapter - Responses

[
	Preliminaries and greetings
]

Greeting response for Sheriff:
	say "The Sheriff nods hello to you.";

Implicit greeting response for Sheriff:
	do nothing;

Farewell response for Sheriff:
	say "The Sheriff nods.";

Implicit farewell response for Sheriff:
	do nothing;

[
	Defaults
]

Default response for Sheriff:
	say "The Sheriff looks your way, but seems to ignore what you said.";

Instead of touching Sheriff:
	say "That seems like a terrible idea, and you reconsider."

Chapter - Rants

Chapter - Sequences

[
	Scene_Sheriffs_Drive_By Sequence

	summary: Sheriff and Cat Lady talk about Lee
	conditions: during explorations when player has been in trailer park region for a numer of turns
	trigger: the scene Scene_Sheriffs_Drive_By starts
]

seq_sheriffs_drive_by is a sequence.
	The action_handler is the seq_sheriffs_drive_by_handler rule.
	The interrupt_test is seq_sheriffs_drive_by_interrupt_test rule.
	The length_of_seq is 6.

This is the seq_sheriffs_drive_by_handler rule:
	let the index be the index of seq_sheriffs_drive_by;
	if (player is in Room_C_Loop or player is in Room_B_Loop or player is in Room_Picnic_Area) and index is greater than 1 and index is less than 6:
		queue_report "The Sheriff is still talking to the Cat Lady in D Loop." with priority 3;
	if index is 1:
		now sheriff's car is in Room_D_Loop;
		if player is in Room_D_Loop:
			queue_report "You get a lurching feeling as a police car pulls slowly through the trailer park. As it drives through C Loop and passes Lee, the car slows way down but doesn't stop. It's coming straight toward where you stand in D Loop." with priority 2;
		else if player is in Room_C_Loop:
			queue_report "You get a lurching feeling as a police car pulls slowly through the trailer park, headed toward D Loop. As the car passes [if Lee was visible]Lee who is out in front of his trailer smoking, you see the policeman slow down and give him a Look[else]Lee's trailer, you see the policeman looking carefully at his trailer[end if]. You are pulled along in its wake by curiosity. The police car stops in D Loop and so do you.[line break][location heading]" with priority 2;
			Move player to Room_D_Loop, without printing a room description;
		else if player is in Region_Trailer_Outdoors:
			queue_report "You get a lurching feeling as a police car pulls slowly through the trailer park. You are pulled along in its wake by curiosity. The police car stops in D Loop and so do you.[line break][location heading]" with priority 2;
			Move player to Room_D_Loop, without printing a room description;
		else if player is in Region_Trailer_Indoors:
			queue_report "You get a lurching feeling as you catch sight of a police car outside the window. It is driving slowly by. Curiosity draws you outside and along in its wake. It stops in D Loop and so do you.[line break][location heading]" with priority 2;
			Move player to Room_D_Loop, without printing a room description;
		queue_report "The Sheriff's car -- you realize it's the Sheriff since it says so right on the door -- stops in front of the Cat Lady's trailer. You take a step back. " with priority 1;
	else if index is 2:
		if sharon is not in Room_D_Loop:
			move sharon out of her trailer;
		if player is in Room_D_Loop:
			queue_report "The Sheriff leans out the window toward the Cat Lady: 'How you doing, Sharon? Things okay around here?' The Sheriff flicks his eyes over at you, and you will yourself to be invisible." with priority 1;
	else if index is 3:
		if player is in Room_D_Loop:
			queue_report "'Well, pretty good, Bill. I can't complain,' the Cat Lady tells the Sheriff. Then a frown crosses her face, 'Oh except Oliver has an abscess. I have to take him to the kitty doctor next week.'" with priority 1;
	else if index is 4:
		if player is in Room_D_Loop:
			queue_report "'Well what I came to ask,' the Sheriff says to the Cat Lady, 'Has he been bothering you any?' He looks back toward C Loop. 'When I drove up, I saw him over there. Has he been leaving you alone?'" with priority 1;
	else if index is 5:
		if player is in Room_D_Loop:
			queue_report "'Oh, he hasn't so much as looked in my direction,' the Cat Lady says to the Sheriff.
			[paragraph break]'That's good,' the Sheriff says. 'I just wanted to check in with you. Will you tell me if you have more problems?''" with priority 1;
	else if index is 6:
		if player is in Room_D_Loop:
			queue_report "'Dearie, you're a sweet man to check in on me,' the Cat Lady puts her hand on the Sheriff's arm and he almost smiles.
			[paragraph break]He pats her hand, 'You take care of yourself Sharon, and make sure you call me if you have any problems.' He talks briefly on his radio and then drives off, a little too fast for inside the trailer park. The Cat Lady unwinds the hose and continues watering her garden." with priority 2;
		else if player is in Region_Trailer_Park_Area:
			queue_report "You hear the Sheriff's car drive off, a little too fast for inside the trailer park." with priority 1;
		now Sheriff's car is in Limbo;

This is the seq_sheriffs_drive_by_interrupt_test rule:
	if we are speaking to Sharon, rule succeeds;
	if we are speaking to Sheriff, rule succeeds;
	rule fails.


Part - Mom

Mom is a _female woman.
Mom is in Room_Car_With_Mom.
The initial appearance is "[if player is in Room_Car_With_Mom]Your mom is watching the movie[first time]. Sensing you looking, she smiles at you[only][else]Your mom is here looking very worried[end if].".
The description is "Mom is, well mom. She's silly and smart and plays with you and you know she works hard at her job. [first time]Sometimes you think what would happen if something happened to her and you feel like your world would end. Once you came into the house and couldn't find her and searched every room and just as you were edging into panic, she jumped out and scared you. You dropped to the ground crying, and she held you saying 'I'm sorry' until your tears stopped. [only]She's strict and good and understanding. All you know is she loves you more than you know how to say.[if a random chance of 1 in 3 succeeds]
[paragraph break]While you are looking at her, she catches your eye and smiles sweetly.[end if]".
Understand "mommy/ma/mother/rachel/rach" as Mom.
The scent is "home".

Chapter - Properties

Chapter - Rules and Actions

Instead of touching mom:
	say "Mom gives you a huge hug and you're pretty sure she's not ever going to let you go. And then she does.";
	Now player is affectionate;

Chapter - Responses
[
		Preliminaries and greetings
]

Greeting response for mom:
	say "[mom's greeting].";

Implicit greeting response for mom:
	do nothing;

Farewell response for mom:
	say "'Okay, see you later, [moms_nickname],' mom says.";

Implicit farewell response for mom:
	do nothing;

To say mom's greeting:
	say "'[moms_salutation], [moms_nickname],' mom says[if a random chance of 1 in 2 succeeds] and [mom_stuff][end if]";

[Do we want to have Jody name in here, or is it better if the PC is a blank slate for the player to project onto?]
To say moms_nickname:
	say "[one of]Jo[or]Pumpkin[or]Sweet-pea[or]Jody[as decreasingly likely outcomes]";

To say moms_serious_name:
	say "Jody Rose";

To say moms_salutation:
	say "[one of]Hi[or]Hello[as decreasingly likely outcomes]";

To say mom_stuff:
	say "[one of]smiles[or]squeezes your shoulder[or]gives you a quick squeeze[at random]";

[ The following prefaces mom's utterances in the drive-in ]
Last after conversing when the current interlocutor is mom and player is in Room_Car_With_Mom and a random chance of 1 in 2 succeeds:
	say "[looks_away_from_movie][run paragraph on]";
	continue the action.

To say looks_away_from_movie:
	if player is in Room_Car_With_Mom and a random chance of 1 in 2 succeeds:
		say "[one of]Mom turns away from the movie[or]Mom, absorbed in the movie, takes a second to respond[or]Mom turns toward you[at random]. ";

[
	Defaults
]

Default tell response for mom:
	if the second noun is not nothing:
		say "'[The second noun]?' mom says.";
	else:
		say "'What do you mean?' mom says";

Default ask response for mom:
	say "'I don't know, [moms_nickname],' mom shrugs.";

Default give-show response for mom:
	say "'You keep that safe, [moms_nickname],' mom smiles.";

Default ask-for response for mom:
	if player holds second noun:
		say "'You already have that' mom says.";
	else:
		say "'That's not for you,' mom says.";

Default thanks response for mom:
	say "'You're welcome, [moms_nickname],' mom says.";

Default yes-no response for mom:
	if saying yes:
		say "[one of]'Good,' mom says, smiling[or]Mom nods[at random].";
	else:
		say "[one of]'No?,' mom says lookng worried[or]'I'm sorry to hear that,' mom says looking at you carefully[cycling].";

Default response for mom:
	say "'Okay, [moms_nickname],' mom says.";

[
	Responses
]

Response of mom when asked-or-told about player:
	say "Mom looks serious. 'You don't need me to tell you anything. You know who you are, and you always have from the time you were a baby,' mom says.".

Response of mom when asked-or-told about mom:
	say "'Me?' mom asks, 'You know everything about me already.' I should be asking you!'".

Response of mom when asked-or-told about Honey:
	say "'Your Honey?' mom says, 'She really loves you, even if she's strict with you. You know that, don't you?'".

Response of mom when asked-or-told about Grandpa:
	say "'When you were born I saw the look on your grandpa's face. I don't think he's ever loved someone more,' your mom says. 'He still does. As far as he's concerned, you hang the moon.'".

Response of mom when asked-or-told about Aunt Mary:
	say "'My Aunt Mary seemed like an old lady when I was kid,' mom says, 'She's your Honey's older sister.'".

Response of mom when asked-or-told about Lee:
	say "'I like Lee,' mom says, 'You know he was in the war? He's had a hard life. I know that your Honey doesn't trust him, but I think he's got a big heart.'".

Response of mom when asked-or-told about Sharon:
	say "'Sharon? The lady with all the cats?' mom says, 'She's a sweet old lady. I worry about her a little bit, but she has a good heart. She reminds me of Mrs. Dawson that I still write to in Massachusetts.'".

Response of mom when asked-or-told about dad:
	say "'Your dad loves you, in his way,' mom says looking thoughtful, 'We used to be very happy, but sometimes people grow apart. I've grown a lot since we were together.' She smiles, but you can tell she looks a little sad too.".

[Response of mom when asked-or-told about Sheriff:
	say "".]

Response of mom when asked-or-told about stepdad:
	say "'Your step-dad? He's a good guy. He really is. He tries his best even if he doesn't have an easy time showing it. And he's good to us,' mom says, looking concerned, 'Don't you think?'".

Response of mom when asked-or-told about topic_dreams:
	say "'I think dreams have meaning,' mom says, 'I choose to think they are trying to speak to us in some way, to wake up our brains, to alert us, or to confirm something we’re wondering about.'".

Response of mom when asked-or-told about topic_berries:
	say "'Were you helping your Honey and grandpa pick berries?' she asks.".

Response of mom when asked-or-told about topic_trailer:
	say "'Honey and grandpa's house? I love that trailer. Your grandpa has worked so hard to make that place beautiful for us,' mom says.".

Response of mom when asked about train tracks:
	say "[moms_train_ask_response].";

To say moms_train_ask_response:
	say "'Your grandpa used to work on the railroad and when they bought their house, he was happy that there was a train that passed nearby', mom says".

Response of mom when told about train tracks:
	if player is not train_experienced:
		say "[moms_train_ask_response].";
	else:
		say "[moms_train_tell_response].";

To say moms_train_tell_response:
	say "'[moms_serious_name], you be careful around that train,' mom says";

Response of mom when asked-or-told about flattened coin or given-or-shown flattened coin:
	say "[moms_train_tell_response], looking at the flattened coin. 'Your grandpa taught you to do that, huh?'";

Response of mom when asked-or-told about dog:
	say "'Be careful around that dog, [moms_nickname],' mom says, 'It tried to bite your grampa once.'".

Response of mom when asked-or-told about  topic_forest:
	say "'I like to walk in the woods with your grandpa, but sometimes those woods seem scary to me. But I know I'm just being silly,' mom laughs.".

Response of mom when asked-or-told about movie:
	say "'I love going to the drive-in with you. My favorite Friday date,' then mom looks more serious, 'I have my doubts about this movie though.'".

Response of mom when asked about topic_tree:
	say moms_big_tree_ask_response;

To say moms_big_tree_ask_response:
	say "'You be careful climbing trees,' mom says, 'I know a boy who broke his arm falling out of a tree.'";

Response of mom when told about topic_tree:
	say "'[if player has not been in Room_Top_of_Pine_Tree]Grandpa said you climbed that tree before. You be careful[else]You climbed all the way to the top? [moms_serious_name]! You're scaring me![end if],' mom says.".

Response of mom when asked-or-told about topic_creek:
	say "'Your grandpa used to take me fishing when I was little. All I wanted to do is play in the water and chase tadpoles. He used to get mad at me because I couldn't sit still. He never caught a fish when I was there.' mom says laughing.'".

Response of mom when asked-or-told about deep pool:
	say "[one of]'I know you are almost a grown up, but you be careful down at that old swimming hole,' mom says.[or]'If you really want to go swimming, you go with your grandpa,' mom says, 'I don't want you to go swimming by yourself.'[at random]".

Response of mom when asked about topic_life:
	say "'We have a beautiful life, don't we?' mom asks smiling.".

Response of mom when asked about topic_work:
	say "'I'm still working at Hawthorne Manor,' mom says. 'The old people are so sweet to me.'".

Response of mom when asked about topic_love:
	say "'You are my [moms_nickname] and my super-duper favorite,' mom says and [mom_stuff].".

Response of mom when asked about topic_death:
	say "'Well, someday we are all going to die, but not for a long long while,' mom says and [mom_stuff].".

Response of mom when asked-or-told about topic_family:
	say "'Your family loves you, [moms_nickname],' mom says, 'sometimes all we have is family.'".

Response of mom when asked-or-told about topic_war:
	say "'That's a question for your grandpa,' mom says, 'though he doesn't like to talk about it.'".

Chapter - Rants

Chapter - Sequences

seq_mom_watching_movie is a sequence.
	The action_handler is the seq_mom_watching_movie_handler rule.
	The interrupt_test is seq_mom_watching_movie_interrupt_test rule.
	The length_of_seq is 6.

This is the seq_mom_watching_movie_handler rule:
	let index be index of seq_mom_watching_movie;
	if index is 2:
		Report Mom saying "You and mom watch the movie for a while. The boy that the movie is about doesn't say much, but everyone seems scared of him including his mom and dad. There is something bad that happens at his birthday party but mom makes you cover your eyes. 'I'll tell you when you can look,' mom says.";
	else if index is 3:
		queue_report "In the movie, the bad kid knocks his mom over a railing, but she doesn't die." at priority 2;
	else if index is 4:
		Report Mom saying "The dad and another guy go to a cemetary and find a dog skeleton and are attacked by other dogs. Are they protecting the dead dog? This movie is really scary. [paragraph break]'Are you okay, hon?' mom asks. Something else happens to the boy's mom and your mom makes you cover your eyes. Did she die? You think about what would happen if your mom died and you almost start to cry. You quickly think about something else and sneak a glance at mom. Thankfully she didn't notice.";
	else if index is 5:
		Report Mom saying "In the movie, the dad and the other guy get some knives for some reason. The dad is angry and throws them away. And then, oh! a truck with glass cuts off the other guy's head too fast for you to cover your eyes! You watch his head bounce away. You burst out crying.[paragraph break]'Oh, honey,' your mom says, holding you, 'I'm so sorry. I'm sorry.' She rocks you as your tears subside. 'Do you want to go? We don't have to stay. I'm sorry.'[paragraph break]The movie is scary, but you feel safe. There is something important here. You want to go. But you also want to stay. What happens to the evil boy? Will the dad kill him? 'No,' you manage through sniffles.[paragraph break]'Okay,' your mom says, clearly doubtful. 'You want to get us snacks?'";
		now mom_free_to_go is true;
	else if index is 6:
		Report Mom saying "'The snack bar is right there,' mom says pointing, 'You can pick us up a snack and, I can tell by the way you are squirming, you have to use the potty.' That embarrasses you, but you don't say anything.";

This is the seq_mom_watching_movie_interrupt_test rule:
	[if mom is not visible:
		rule succeeds;
	if we are speaking to mom:
		rule succeeds;]
	rule fails.


Part - Stepdad

Stepdad is an undescribed _male man.
The printed name is "Mark".
Stepdad is in Room_Camaro_With_Stepdad.
The description is "[first time]Your stepdad's name is Mark. You call him 'dad' because your mom asked if you wanted to call him dad when she first got re-married. So you did. Who knows what the rules are here? You have an inkling that your mom married him because she thought you needed a father. He was nice to you at first, but now it seems like you just make him mad. [paragraph break]If you are honest, you're scared of him. You never know whether he will be nice or angry. He's nicer when he drinks beer, but if he has too much, your mom and stepdad get in arguments. One night there was yelling and someone broke the glass clock that used to sit on the end table in the living room.[paragraph break]You know this though: if he ever hurt your mom, you don't know how, but you would kill him.[paragraph break][only]He is intensely focusing on the road in a way that you know is seething anger."
Understand "step-dad/step-father/stepdad/stepfather/mark", "step dad/father" as stepdad.

Chapter - Properties

Chapter - Rules and Actions

Instead of touching stepdad:
	say "No way. You are not 100% sure what would happen, but you don't want to risk it.";

Chapter - Responses
[
		Preliminaries and greetings
]

Greeting response for stepdad:
	say "'Hey,' he says.";

Implicit greeting response for stepdad:
	do nothing;

Farewell response for stepdad:
	do nothing;

Implicit farewell response for stepdad:
	do nothing;

To say stepdad_stuff:
	say "[one of]flicks his eyes toward you[or]grits his teeth[or]stabs the cigarette lighter in, then seems to forget about it[at random]";

[
	Defaults
]

Default tell response for stepdad:
	say "'Okay, sure,' Mark says.";

Default ask response for stepdad:
	say stepdad_disinterested;

Default give-show response for stepdad:
	say "'Okay, I don't know what to do with that,' Mark says.";

Default ask-for response for stepdad:
	if player holds second noun:
		say "'What are you asking? You already have that' Mark says.";
	else:
		say "'That's not yours,' Mark says.";

Default thanks response for stepdad:
	say "'Don't be smart with [italic type]me[roman type],' Mark snaps.";

Default yes-no response for stepdad:
	if saying yes:
		say "[one of]'Good,' Mark says[or]Mark nods curtly[at random].";
	else:
		say "[one of]'No? Are you telling me no?' Mark says[or]'Be careful what you are saying,' Mark says and [stepdad_stuff][cycling].";

Default response for stepdad:
	say "'Sure,' Mark says.";

To say stepdad_disinterested:
	say "[one of]'That's none of my business,' Mark says, 'You better ask your mom.'[or]'I don't know, Jody,' Mark shrugs.[at random]";

To say stepdad_dont_know:
	say "'I don't know, Jody,' Mark shrugs.";

[
	Responses
]

Response of stepdad when asked-or-told about stepdad:
	say stepdad_dont_know;

Response of stepdad when asked-or-told about Honey:
	say stepdad_disinterested.

Response of stepdad when asked-or-told about Grandpa:
	say "'Your grandpa's a good guy,' Mark says. 'He helped me build our house.'".

Response of stepdad when asked-or-told about Lee:
	say "'That guy,' Mark says, 'I don't know him well, but he's a vet. I respect that.'".

[Response of stepdad when asked-or-told about Sheriff:
	say "".]

Response of stepdad when asked-or-told about virtual_mom:
	say "'We're working things out, but that's none of your business,' Mark says.".

Response of stepdad when asked-or-told about topic_forest:
	say "'Stay out of there,' Mark says.".

Response of stepdad when asked-or-told about topic_creek:
	say "'Your grandpa likes freshwater fishing,' Mark says, 'but I've never liked it much. I'd rather be deep-sea fishing.'".

Response of stepdad when asked about topic_work:
	say "'I don't want to talk about it,' Mark says, 'Things aren't going well at the shop right now.'".

Response of stepdad when asked-or-told about topic_family:
	say "'All you've got is your family, Jody,' Mark says.".

Response of stepdad when asked-or-told about topic_war:
	say "'I was never in the war,' Mark says, 'I served between wars. On a torpedo boat in the Pacific.'".

Chapter - Rants

Chapter - Sequences

seq_stepdad_in_car is a sequence.
	The action_handler is the seq_stepdad_in_car_handler rule.
	The interrupt_test is seq_stepdad_in_car_interrupt_test rule.
	The length_of_seq is 17.

This is the seq_stepdad_in_car_handler rule:
	let index be index of seq_stepdad_in_car;
	if index is 2:
		Report stepdad saying "Your step-dad reaches behind the seat and grabs a can of beer. He pulls the pop-top and tosses it out the window. He takes a long drink and puts the can between his legs. He shoots you a glance and you carefully look out the window.";
	else if index is 5:
		queue_report "Mark takes another long swig of his beer and taps on the steering wheel." at priority 2;
	else if index is 8:
		queue_report "You can tell Mark is working up to say something. Instead he drains his beer, drops the empty behind the seat, and grabs another can. He pops the top and puts the can between his legs." at priority 2;
	else if index is 9:
		queue_report "Mark taps out a cigarette but doesn't light it." at priority 2;
	else if index is 11:
		Report stepdad saying "Mark clears his throat as if he's not used to using his voice. 'When you asked to use my tools, I told you that I expected you to put them away when you were done,' Mark says and [stepdad_stuff].";
	else if index is 12:
		Report stepdad saying "'This morning, I found my screwdriver on the porch where you were playing with that old radio,' Mark says.";
	else if index is 13:
		Report stepdad saying "He waits and glances as you like he's expecting an answer. 'Did you leave it out there deliberately or are you just thoughtless?' he asks.";
	else if index is 15:
		Report stepdad saying "'What did I tell you?' Mark says glancing at you angrily, 'I told you to put away my tools.' He grabs your arm, 'Why can't you listen? Huh?' There are stopped cars ahead and Mark puts both hands on the wheel.[paragraph break]You've got to get out of here.";
	else if index is 16:
		Report stepdad saying "'I know your mom lets you do whatever you want,' Mark says, 'I told her she was spoiling you, but I'm not going to do that.' Mark slows the Camaro. Maybe this is your chance.";
		now stepdad_free_to_go is true;
	else if index is 17:
		Report stepdad saying "[one of]'Are you just trying to make me mad?' Mark asks.[or]'When I was a kid, I understood that if I didn't do what my parents told me, I would get my ass whipped,' Mark says.[or]Mark grabs your arm, 'Are you listening to me?'[or]'Are you going to answer me?' Mark demands.[in random order]";
		[We do the following, because we want this step to repeat]
		decrease index of seq_stepdad_in_car by one;
		[we make sure this ends when Scene_Dream_About_Stepdad begins]


This is the seq_stepdad_in_car_interrupt_test rule:
	[if stepdad is not visible:
		rule succeeds;]
	[if we are speaking to stepdad:
		rule succeeds;]
	rule fails.




Book - Animals

Part - Dog

The dog is a _critter animal in Room_Dirt_Road.
	The initial appearance is "[if not loose]There's a dog behind the fence, alternately digging and barking[otherwise]The dog is wandering in the road[end if].".
	The description of the dog is "Kind of a yellowish medium dog with pointy ears. You don't know what kind. [sub_pronoun_cap of dog]'s not a german shepherd or a doberman but [sub_pronoun of dog] looks mean like that. Some kind of guard dog maybe. [one of][sub_pronoun_cap of dog] reminds you of Uncle Buddy's dog that mom was taking care of and how when you tried to feed it and get the spoon, it bit you.
	[paragraph break][sub_pronoun_cap of dog] makes you [nervous]. But there's something about this dog.[or]
	[paragraph break]Looking more carefully, you notice that it has prominent teats. So it's a girl dog. Maybe she's pregnant or was. You are pleased with yourself for noticing. You know about this stuff because of Mika who had kittens.[or]The dog makes you [nervous]. [if dog is not loose]Can [sub_pronoun of dog] get out of there[else]What do you do now that [sub_pronoun of dog][']s loose[end if]?[stopping]".
	Understand "yellow/guard/-- dog/bitch/mutt/canine/pup/puppy/doge/cujo/kujo", "german shepherd", "doberman", "pitbull" as the dog.
	The indefinite article of dog is "the".
	Include (- with articles "The" "the" "a", -) when defining dog.

After examining the dog two times:
	now dog is _female;
	now dream_dog is _female;
	now dog is examined;
	now player is perceptive;
	now player is dog_experienced;
	continue the action.

The dog can be examined.
The dog can be loose.
The dog can be rock-aware.

To say dog_from_a_distance:
	if dog is loose:
		say "the fence near the dirt road but no dog";
	otherwise:
		say "the dog still trying to tunnel under the fence";

Chapter - Properties

Chapter - Rules and Actions

Instead of touching dog:
	say "As you reach out to the dog, [sub_pronoun of dog] lunges as you and you withdraw your hand quickly.";

[
	Closer Examination
]

When play begins:
	now dog is neuter.

After examining the dog two times:
	now dog is female;
	now dog is examined;
	now player is perceptive;
	now player is dog_experienced;
	continue the action.

[
	Dog Barking
]

Every turn when location is in Region_Blackberry_Area
	and (a random chance of 1 in 8 succeeds),
	queue_report "You hear a dog barking in the distance across the river." with priority 7;

Every turn when location is in Region_Trailer_Outdoors
	and a random chance of 1 in 10 succeeds:
	queue_report "You hear a dog barking in the distance on the other side of the tracks." with priority 7;

Every turn when location is in Room_Swimming_Hole
	and a random chance of 1 in 8 succeeds:
	queue_report "You hear a dog barking in the distance on this side of the river." with priority 7;

Every turn when location is Room_Crossing
	and a random chance of 1 in 8 succeeds:
	queue_report "You hear a dog barking in the distance from this side of the river." with priority 7;

Every turn when location is Room_Stone_Bridge
	and a random chance of 1 in 4 succeeds,
	queue_report "A dog barking can be plainly heard from across the river." with priority 7;

Every turn when location is Room_Long_Stretch
	and a random chance of 1 in 4 succeeds,
	queue_report "A dog barking can be heard somewhere down the road." with priority 7;

Every turn when location is Room_Railroad_Tracks
	and a random chance of 1 in 6 succeeds,
	queue_report "A dog barking can be heard a ways down the road." with priority 7;

[TODO: Implement listen like smell]

Instead of listening when location of player is in Region_Dirt_Road,
	say "You can still hear the dog barking, of course."
Instead of listening when location of player is in Region_River_Area,
	say "You hear the gentle murmuring of the creek, punctuated by the sound of a dog barking."
Instead of listening when location of player is in Region_Trailer_Outdoors,
	say "You can still hear the dog barking far off."

Chapter - Responses

[
	Defaults
]

Greeting response for the dog:
	say "[dog alert].";

Implicit greeting response for dog:
	say "The dog perks up [pos_pronoun of dog] ears as you approach. [run paragraph on]";

Farewell response for dog:
	say "[dog alert].";

Implicit farewell response for dog:
	do nothing;

To say dog alert:
	say "The dog [one of]listens and tilts [pos_pronoun of dog] head for a moment[or]looks at you, suddenly alert to your movement[or]bares [pos_pronoun of dog] teeth a little[or]hunches down and squares [pos_pronoun of dog] shoulders[or]ignores you[at random]";

Default response for dog:
	say "[dog alert].";



Part - Dream Dog

The dream_dog is a _critter animal in Room_Dream_Dirt_Road.
	The printed name is "dog".
	The initial appearance is "Oh no. The dog is wandering in the road. The dog perks up [pos_pronoun of dog] ears as you approach.".
	The description is "Kind of a yellowish medium dog with pointy ears. You don't know what kind. [sub_pronoun_cap of dog]'s not a german shepherd or a doberman but [sub_pronoun of dog] looks mean like that. Some kind of guard dog maybe. Do you [italic type]still[roman type] have to get past this damn dog?".
	Understand "dogs/bitch/mutt/canine/yellow/medium/pointy", "doberman/shepher/cujo/kujo/puppy", "german shepherd", "guard dog" as the dream_dog.
	The indefinite article of dream_dog is "the".
	Include (- with articles "The" "the" "a", -) when defining dream_dog.
	Understand "yellow/guard/-- dog/bitch/mutt/canine/pup/puppy/doge/cujo/kujo", "german shepherd", "doberman", "pitbull" as the dream_dog.

Chapter - Properties

The dream_dog can be friendly.

Chapter - Rules and Actions

Instead of touching dream_dog:
	say "[if dream_dog is not friendly]As you reach out to the dog, [sub_pronoun of dog] lunges as you and you withdraw your hand quickly.[else][first time][sub_pronoun_cap of dog] pauses as you reach out your hand as if considering whether being this friendly is a dereliction of duty, then gives in to the desire for a head scratch. [only][sub_pronoun_cap of dog] turns [pos_pronoun of dog] head sideways and lets you scratch behind [pos_pronoun of dog] ears, closing [pos_pronoun of dog] eyes.[end if]";

Every turn when location is in Room_Chryse_Planitia
	and (a random chance of 1 in 8 succeeds),
	queue_report "Inexplicably, you think you hear a dog barking in the distance.[first time] Is there a dog out here on the red planet?[only]" with priority 7;

Chapter - Responses

Greeting response for the dream_dog:
	say "[dream_dog_alert], pauses and says, [dream_dog_greeting][line break]";

Implicit greeting response for dream_dog:
	say "The dog perks up [pos_pronoun of dog] ears as you approach.";

Farewell response for dream_dog:
	say "[dream_dog_alert].";

Implicit farewell response for dream_dog:
	do nothing;

To say dream_dog_greeting:
	say "[one of]'What's up, bud?''[or]'How's it hangin[']?''[or]'How ya doin['], kid?''[or]'Howdy, bud?''[at random]";

To say dream_dog_alert:
	say "The dog [one of]listens and tilts [pos_pronoun of dog] head for a moment[or]looks at you, suddenly alert to your movement[or]hunches down and squares [pos_pronoun of dog] shoulders[at random]";

Default response for dream_dog:
	say "[dog alert].";

To say dog_doing_stuff:
		say "[one of]scratching [pos_pronoun of dog] ear with a hind paw[or]gnawing at [pos_pronoun of dog] front leg[or]perking up [pos_pronoun of dog] ears[or]glancing back at a rustle in the bushes[at random]";

To say dog_does_stuff:
		say "[one of]scratches [pos_pronoun of dog] ear with a hind paw[or]gnaws at [pos_pronoun of dog] front leg[or]perks up [pos_pronoun of dog] ears[or]glances back at a rustle in the bushes[at random]";

[
	Defaults
]

Default give response for dream_dog:
	say "'Nah, I don't need that, thanks,' says the dog[if a random chance of 1 in 3 succeeds], [dog_doing_stuff][end if].";

Default show response for dream_dog:
	say "'Okay, good for you,' the dog says[if a random chance of 1 in 3 succeeds], [dog_doing_stuff][end if].";

Default response for dream_dog:
	say "[one of]'Uh,' says the dog[or]'Okay,' the dog says[at random][if a random chance of 1 in 3 succeeds], [dog_doing_stuff][end if].";

Default ask response for dream_dog:
	say "'Well, you're on your own with that, kid,' the dog says.";

Default tell response for dream_dog:
	say "'Well, kid,' the dog says, 'That sounds great. Good for you.'";

Default thanks response for dream_dog:
	say "'Sure, kid. Sure,' the dog says.";

Response of dream_dog when saying yes:
	say "'Alright,' the dog says.";

Response of dream_dog when saying no:
	say "The dog says nothing.";

Response of dream_dog when saying sorry:
	say "[if dog is rock-aware]'For throwing rocks at me?' the dog says, 'It's alright. You aren't the first one to do that.'[else]'Don't worry about it, kid,' the dog says.[end if]";

[
	Responses
]

Response of dream_dog when asked-or-told about player:
	say "'I don't know you, kid, but you seem okay. Not the worst person I've met,' the dog says, 'At least you didn't tease me like some of these brats who make it their mission to make me miserable.'".

Response of dream_dog when asked-or-told about dream_dog:
	say "'I'm a good dog. Or I try to be,' the dog says, 'Sometimes I still make my people angry, but that's my fault.'".

[telling about my people]

Response of dream_dog when asked-or-told about honey:
	say_dog_people_response;

Response of dream_dog when asked-or-told about grandpa:
	say "'I think one time when I got out of that goddamn fence I tried to bite him,' the dog laughs.".

Response of dream_dog when asked-or-told about lee:
	say_dog_people_response;

Response of dream_dog when asked-or-told about sharon:
	say_dog_people_response;

Response of dream_dog when told about sheriff:
	say "'Now him I know,' the dog says, 'He wears a uniform, right? I hate people in uniform. Cops, postmen, the water guy, I just want to sink my teeth into them.'";

Response of dream_dog when asked-or-told about stepdad:
	say_dog_people_response;

To say_dog_people_response:
	say "'Listen, kid. There's people who are in my pack, and people who aren't. And if they aren't, they all pretty much look the same to me,' the dog says, 'Why don't you tell me about [']em?'".

Response of dream_dog when asked-or-told about topic_dreams:
	say "'They say dreams have meaning, kid,' the dog says, 'but I don't know. I dream about chasing rabbits. And getting out of that goddamn fence.'";

Response of dream_dog when asked-or-told about topic_creek:
	say "'Sometimes on hot days, if I can get out of that terrible fence,' the dog says, 'I run through the forest until I'm panting and hot, then I lie down in the cool water of the creek and watch the little swimmers.'";

Chapter - Rants

Response of dream_dog when asked-or-told about topic_work:
	now dog_self_rant is in-progress;
	now dream_dog is friendly.

Response of dream_dog when asked-or-told about dream_dog:
	now dog_self_rant is in-progress;
	now dream_dog is friendly.

dog_self_rant is a rant.
	The quote_table is the Table of dog_self_rant.
	The speaker is dream_dog.

Table of dog_self_rant
Quote
"'Thanks for asking, kid,' the dog says, 'I'm alright. I've had better days, and I've had worse. My job is to keep people out of this field and that's what I try to do. But sometimes...' [sub_pronoun of dog] trails off."
"'Sometimes,' the dog continues, 'I wish I could just run through the hills and chase squirrels and lie in the creek on hot days.'"
"'Yeah, I'm fine. I got an important job protecting my pack's territory. Don't worry about me,' the dog says.".

Response of dream_dog when asked about mom or asked about dad:
	now dog_family_rant is in-progress;
	now dream_dog is friendly.

Response of dream_dog when asked-or-told about topic_family:
	now dog_family_rant is in-progress;
	now dream_dog is friendly.

dog_family_rant is a rant.
	The quote_table is the Table of dog_family_rant.
	The speaker is dream_dog.

Table of dog_family_rant
Quote
"'I didn't know my dad,' the dog says, 'But I remember my mom. Squirming against her with the rest of my litter. I remember a feeling of warmth and, what, safety? But they took me away when I was still a pup.' The dog shakes itself as if clearing the thought."
"'I had my own litter once,' the dog continues sadly, 'but they took them away before they were weaned.'"
"The dog scratches an ear and looks thoughtful. Finally, [sub_pronoun of dog] says, 'Now I have my pack. That's my people. They're okay. I wouldn't say there's a lot of warmth, but I have a job and I get kibble. So who am I to complain?''"

Chapter - Sequences

seq_dog_convo is a sequence.
	The action_handler is the seq_dog_convo_handler rule.
	The interrupt_test is seq_dog_convo_interrupt_test rule.
	The length_of_seq is 9.

This is the seq_dog_convo_handler rule:
	let index be index of seq_dog_convo;
	if index is 2:
		Report dream_dog saying "[sub_pronoun_cap of dog] sees you, sizes you up, and to your surprise says, 'You ain't gettin['] by here, kid.'";
	else if index is 4:
		Report dream_dog saying "'Listen, kid,' the dog says, 'It's my job to protect my pack's territory.' [sub_pronoun_cap of dog] looks back at the fence uncertainly, then squats at the edge of the road and pees. 'I'm not sure where that ends, but better safe than sorry.'";
	else if index is 5:
		Report dream_dog saying "The dog looks at you and looks around. 'Shouldn't you be with your pack?' [sub_pronoun of dog] says.";
	else if index is 7:
		Report dream_dog saying "The dog [dog_does_stuff]. 'You know,' the dog says, 'You've been through a lot, but you're doing okay.' [sub_pronoun_cap of dog] wags [pos_pronoun of dog] tail.";
	else if index is 8:
		Report dream_dog saying "The dog looks thoughtful, 'If you don't mind me sayin['], it's about time you woke up,' [sub_pronoun of dog] says, [dog_doing_stuff], 'You can't spend your whole like dreaming. I'm gonna let you get going,' the dog says.";
		now dog_free_to_go is true;
	else if index is 9:
		Report dream_dog saying "[one of]'Pal, I think it's time for you to get going,' the dog says wagging [pos_pronoun of dog] tail.[or]'I've liked talking to you. You better get going,' the dog says.[or]The dog looks seriously at you, 'Time for you to go on and wake up,' [sub_pronoun of dog] says.[in random order]";
		[We do the following, because we want this step to repeat]
		decrease index of seq_dog_convo by one;
		[we make sure this ends when Scene_Dreams ends]

This is the seq_dog_convo_interrupt_test rule:
	if we are speaking to dream_dog:
		rule succeeds;
	if dream_dog is not visible:
		rule succeeds;
	rule fails.

Chapter - Dialogue


Part - Ants

Some ants are scenery.
They are in Room_Picnic_Area.
The description is "[if ants are not stirred up]The ants wander about purposefully, though you can't tell exactly what they are up to[otherwise]You stirred up the ants now[end if]. [run paragraph on][ant stuff].".
The ants can be stirred up. Ants have a number called angry timer.

Every turn when angry timer of ants is greater than 0:
	Decrease angry timer of ants by 1;
	if angry timer of ants is less than 1:
		now ants are not stirred up.

Instead of attacking ants:
	now angry timer of ants is 5;
	now ants are stirred up;
	say "[one of]You kick the ant hill with your foot and then jump back to watch[or]You crush a few of the nearby ants with your foot. Take that[or]You throw a dirt clod at the ant hill. Direct hit[or]You kick the ant hill, but now several ants are on your shoes and, oh no! on your leg! You dance around for a while swatting at yourself until you are satisfied that you are safe[at random]!
	[paragraph break][ant stuff]."
Understand "kick [something]" as attacking.
Understand "stomp [something]" as attacking.
Understand "squish [something]" as attacking.
Instead of attacking ant hill, try attacking ants.

To say ant stuff:
	if ants are not stirred up:
		say "[one of]Some of the ants have formed a line up the legs of the picnic table. Maybe they've found the remains of a picnic[or]Near the trees, a bunch of big red ants are eating the remains of a huge Jerusalem cricket. Gross[or]Some of the red ants are scouting about individually[or]Two ants are working together to carry a seed that is bigger than both of them put together[or]There is a drop of something on the pavement that the ants are very interested in[or]One red ant is at the edge of the picnic table. His feelers are waving. Is he looking at you? Weird[at random]";
	otherwise:
		say "[one of]The red ants are running around like crazy, looking for someone to attack[or]The red ants are on your shoes! You dance around until you are sure they are off you[or]The red ants are running everywhere[or]The red ants are pouring out of their hole and they look angry[or]The ants are carrying stuff away from their hole in a panic[at random]";

Part - Cats

The yellow tabby is an undescribed _critter animal in Room_D_Loop.
The printed name is "the yellow tabby".
The description is "He is striped yellow and white like a tiger. A small one."
Understand "tabby/yellow/tiger cat/cats/kitty/kitten/kitties" as yellow tabby.

Housecats are animals in Room_Sharons_Trailer.
	The printed name of housecats is "[if yellow tabby is not visible]a huge pack of cats[otherwise]her other near-feral cats".
	The initial appearance is "There are cats everywhere. The trailer is filled with cats of every size, color, and condition, many still pretty wild. Cats recline, stroll, and argue on every chair, couch, and table in her house.".
	The description is "There are cats everywhere. The trailer is filled with cats of every size, color, and condition, many still pretty wild. Cats recline, stroll, and argue on every chair, couch, and table in her house."
	Understand "black/skinny/white/gray/fluffy/tortoise-shell/calico/tomcat/chunky/patchy/yellow/dirty/bony/-- cat/cats/kitty/kitten/kitties", "sam/oliver" as housecats.

Instead of touching yellow tabby,
	say "[one of]He seems shy of you[or]He trots off indifferently, but in a few moments comes sauntering back[or]The yellow tabby cat purrs and rubs against your leg[or]The yellow tabby cat arches it's back against your hand[or]The cat looks up at you for a moment[as decreasingly likely outcomes]."

Instead of taking yellow tabby,
	say "When you try to pick it up, the yellow tabby cat squirms out of your arms[if Sharon is visible] 'He's never been much of a cuddle bug,' the [Sharon] says[end if]."

[Instead of doing anything except object-navigating or examining housecats,
	say "The Cat Lady's cats are nearly feral. That's a good way to lose an eye or a finger."]

To say random-cat:
	say "[one of]cat with one eye[or]black cat[or]skinny white and black cat[or]blue-eyed siamese[or]chunky gray cat[or]fluffy tortoise-shell[or]stripey gray tomcat[or]one-eyed chunky black cat[or]hard-eyed notch-eared patchy tom[or]huge gray and white cat that looks more like a raccoon[or]hugely pregnant calico[or]bony graying moth-eaten cat[or]dirty white cat[or]yellow kitten[in random order]"

Every turn when player is in Room_Sharons_Trailer and (a random chance of 1 in 3 succeeds):
	queue_report "[one of]A [random-cat] brushes up against your leg, but then darts off when you bend to pet it[or]A [random-cat] jumps up on the table[if Sharon is visible] before the Cat Lady sweeps it off[end if][or]A [random-cat] scratches at the corner of the sofa[or]One of a pile of kittens lazing in the sun falls off the ottoman[or]A [random-cat] takes a growling swipe at a [random-cat][or]A [random-cat] stares fixedly at the gap under the couch[or]A [random-cat] chews on your shoelace[or]A [random-cat] bats at a housefly[or]A [random-cat] chases a [random-cat] between your legs[or]A [random-cat] goes out through the cat door[or]A [random-cat] darts in through the cat door[in random order]." with priority 6;

Every turn when player is in Room_D_Loop and (a random chance of 1 in 6 succeeds):
	queue_report "[one of]A [random-cat] darts out of the Cat Lady's cat door and around the trailer[or]A [random-cat] streaks from around the corner and disappears into the bushes[or]A [random-cat] is walking on the roof of the Cat Lady's trailer and then ducks out of sight[in random order]." with priority 6;

Every turn when yellow tabby is visible and (a random chance of 1 in 4 succeeds):
	queue_report "[one of]The yellow tabby scratches its ear[or]The yellow tabby carefully licks its paws[or]The tabby grooms itself carefully[or]The tabby rubs up against your legs[or]The yellow tabby looks up at you as if it wants something[as decreasingly likely outcomes]." with priority 5;


Part - raccoons

Some raccoons are undescribed animals in Limbo.
	The description is "You can see eyes shining at the edge of the meadow. More than two. You count at least four pair[first time]. You've been thinking of them as the invaders, but thinking about it, you guess, you're really the invader on their turf[only].".
	Understand "eyes/bandit/bandits/burgler/burglers/invaders/critters/bear/bears/wolf/wolves/animal/animals" as raccoons.

Some virtual_raccoons are undescribed animals in Limbo.
	The printed name is "invaders".
	The description is "You can hear them rustling around, even if you can't see them from inside the fort.".
	Understand "eyes/bandit/bandits/burgler/burglers/invaders/critters/bear/bears/wolf/wolves/animal/animals/noise/noises" as virtual_raccoons.

Chapter - Properties

Chapter - Rules and Actions

Instead of examining raccoons when player is in Room_Protected_Hollow:
	say "You can hear them rustling around, even if you can't see them from inside the fort.";

To say racoon_description:
	say "[one of]In the twilight, you catch sight of the invaders. You can see eyes shining at the edge of the meadow and in the tall grass. More than two. You count at least four pair[or]Your invaders are waiting at the edge of the meadow. You can see their eyes shining. They appear to be waiting. Are they waiting for you to go to sleep so they can eat you? Are they hungry? Your hands are shaking[or]Watching their nervous movements, these animals aren't large. These aren't bears or wolves, but they're definitely not tiny like squirrels or mice. You can see their eyes watching you, reflecting the starlight as they crouch at the edge of the meadow. Masked eyes like bandits[or]Your invaders are waiting at the edge of the meadow. You can see their eyes shining under dark masks. They appear to be waiting[stopping]";

Instead of yelling during Scene_Defend_the_Fort:
	say "You let out a low terrifying roar from somewhere deep in your belly, and for a moment everything is completely quiet.";

test coons with "teleport to meadow / wait / wait / wait / wait / go to hollow / pile leaves / sleep";

Chapter - Responses

Chapter - Rants

Chapter - Sequences

seq_raccoon_visit is a sequence.
	The action_handler is the seq_raccoon_visit_handler rule.
	The interrupt_test is seq_raccoon_visit_interrupt_test rule.
	The length_of_seq is 2.

This is the seq_raccoon_visit_handler rule:
	let index be index of seq_raccoon_visit;
	if index is 1:
		do_raccoon_things;
		if raccoons are in Region_Woods_Area:
			[We do the following, because we want this step to repeat]
			decrease index of seq_raccoon_visit by one;

This is the seq_raccoon_visit_interrupt_test rule:
	if we are speaking to raccoons:
		rule succeeds;
	if we are yelling:
		rule succeeds;
	if the current action is room_navigating and the noun is Room_Protected_Hollow:
		rule succeeds;
	rule fails.

To do_raccoon_things:
	Let limbo_sandwich_list be the list of tuna sandwiches enclosed by Limbo;
	[This continues until all of the sandwiches are gone.]
	If the number of entries in limbo_sandwich_list is less than three:
		If player is in Room_Forest_Meadow:
			[raccoons will be in Room_Forest_Meadow waiting at the edges]
			queue_report "[racoon_description]." at priority 2;
		else if player is in Room_Protected_Hollow:
			Let meadow_sandwich_list be the list of tuna sandwiches enclosed by Room_Forest_Meadow;
			Let hollow_sandwich_list be the list of tuna sandwiches enclosed by Room_Protected_Hollow;
			[if there are sandwiches in Room_Forest_Meadow]
			If the number of entries in meadow_sandwich_list is greater than zero:
				[raccoons will be making noise in the meadow eating them.]
				queue_report "You can hear frantic rustling in the meadow[one of]. You hear a snarl like two animals fighting over something. Sandwiches? Dibs on eating you?[or]. Are they eating your sandwiches?[or]. You left Honey and grandpa's lunch out there and something appears to be eating it.[or]. Will the sandwiches satisfy them, or will it draw more animals?[at random]" at priority 2;
				[It takes one turn for the raccoons to eat one sandwich.]
				let one_sandwich be a random tuna sandwich enclosed by Room_Forest_Meadow;
				now one_sandwich is in Limbo;
				if brown paper bag is in Room_Forest_Meadow:
					now brown paper bag is torn;
			[if there are sandwiches in Room_Protected_Hollow]
			else if the number of entries in hollow_sandwich_list is greater than zero:
				[raccoons will be making noise sniffing around the fort]
				queue_report "[one of]Something is trying to get into the fort. There is a rustling thump like a ghost in the attic.[or]You hear a nearby growl that nearly stops your heart.[or]Something is trying to get in. You see a branch shift. Is something on top of the fallen trees?[or]You hear something walking around -- wolves? bears? And are they trying to get you?[or]You hear something outside the fort. What do they want?[cycling]" at priority 2;
	[If player yells or moves, it takes one turn for the raccoons to make noise again.]
	else:
		now raccoons are in Limbo;
		now virtual_raccoons are in Limbo;
		now seq_raccoon_visit is not in-progress;
		if player is in Room_Protected_Hollow:
			queue_report  "Suddenly, you hear nothing but a few crickets. They must have enjoyed the sandwiches and left. You have successfully defended the fort." at priority 2;
		else if player is in Room_Forest_Meadow:
			queue_report  "The invaders have taken their sandwiches and gone. You protected the fort."  at priority 2;

After taking tuna sandwich when raccoons are visible:
 	queue_report "The eyes of the invaders follow the tuna sandwich." at priority 1;

After dropping tuna sandwich when raccoons are visible:
 	queue_report "The glittering eyes watch the tuna sandwich hit the ground." at priority 1;

After dropping brown paper bag when raccoons are visible:
 	queue_report "Numerous pairs of eyes watch the paper bag hit the ground." at priority 1;

Volume - Debugging


Bearcreek ends here.
