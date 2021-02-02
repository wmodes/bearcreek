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
Understand "teleport to/-- [any room]" as teleporting.

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

Part 1 - Screen Effects

Include Basic Screen Effects by Emily Short.

Include Glulx Text Effects by Emily Short.

Table of User Styles (continued)
style name 	justification 	italic 	indentation 	first line indentation 	font weight 	fixed width 	relative size 	color
special-style-1 	center-justified 	false 	0 	0 	bold-weight 	false 	0 	--
special-style-2 	center-justified 	true 	0 	0 	regular-weight 	false 	0 	--


Part 2 - Conversation Frameworks

Include Conversation Framework by Eric Eve.

Include Conversational Defaults by Eric Eve.

Include Conversation Responses by Eric Eve.

Part 3 - Smarter Parser

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
		now reborn command is "look";
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
unnecessary movement rule		"[as the parser]If you can see an object, you can usually just interact with it directly without worrying about your position[if player is enclosed by something] (although since you're in or on something, you may need to type EXIT first)[end if]. Try a command like EXAMINE [get noun example] for a closer look at something[if the number of sp_viable directions is at least 1], LOOK to get a new description of this location, or a direction like [get direction example] to move to a different location.[otherwise], or LOOK to show the description of this location again.[as normal][line break]"

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


Volume - Mechanics

Book - Commands

Part - Modifications to standard commands

The room description heading rule does nothing when turn count is 1 and player is in Room_Lost_in_the_Brambles for the first time.

Rule for printing room description details: do nothing.

Rule for implicitly taking something (called target):
	try silently taking the target;
Rule for clarifying the parser's choice of something:
	do nothing.

To say location heading:
	say "[line break][bold type][location][roman type]".

To move player to (new-location - a room) with little fuss:
	Move player to new-location, without printing a room description;
	say "[line break][bold type][location][roman type][line break]".

Use no scoring, the serial comma and American dialect. Use MAX_SYMBOLS of 8000. Use full-length room descriptions.

The standard report waiting rule response (A) is "You wait for a bit and time passes."

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "You don't see that anywhere around here." instead;

Part - New commands

Chapter - Out of world commands

Chapter - Credits

Understand "credits" as asking for credits.
Asking for credits is an action out of world.
Carry out asking for credits:
	say "[story title] was created by [story author]. Inform 7, in which it was written, is the work of Graham Nelson. The IF authors Emily Short, Eric Eve, and Aaron Reed provided helpful extensions to Inform. The author is grateful for the testing feedback offered by many good folks since the first version in 2012. The cover are was generously provided by Darrin Barry."

Chapter - Instructions

Chapter - Pouring

Understand the command "dump/pour" as something new.
Understand "dump [something] into/in [something]", "pour [something] into/in [something]" as pouring_in.
pouring_in is an action applying to two visible things.

Carry out pouring_in:
	try inserting the noun into the second noun.

Chapter - Swimming

[We want swimming to be a deliberate act, so when the player asks to swim at the swimming hole, we will give her a warning and hint at her trying again, then we will do it the second time she asks.]

Understand the command "swim/wade/dive" as something new.
Understand "swim", "wade", "dive", "swim in/into", "wade in", "dive in", "jump in", "swim in/into creek/river/water/stream/pool/hole", "wade in/into creek/river/water/stream/pool/hole", "dive in/into creek/river/water/stream/pool/hole", "jump in/into creek/river/water/stream/pool/hole", "go in/into creek/river/water/stream/pool/hole", "swim in/into deep/swimming pool/hole", "wade in/into deep/swimming pool/hole", "dive in/into deep/swimming pool/hole", "jump in/into deep/swimming pool/hole", "go in/into deep/swimming pool/hole" as doing_some_swimming.
doing_some_swimming is an action applying to nothing.

Instead of doing_some_swimming when player is not in Region_River_Area:
	say "Good idea. You might want to go down to the creek.";

Chapter - Sitting/Lying

Understand the command "lie", "sit" as something new.
Understand "lie on/in [something]", "sit on/in/at [something]", "lie down on/in [something]", "sit down on/in/at [something]" as lying_down.
lying_down is an action applying to one thing.

Carry out lying_down:
	if noun is a lie-able supporter:
		silently try entering noun;
		if rule succeeded:
			say "You make yourself comfortable on [the noun].";
		stop the action;
	else if noun is a sit-at-able supporter:
		silently try entering noun;
		if rule succeeded:
			say "You make yourself comfortable at [the noun].";
		stop the action;
	otherwise:
		try entering the noun;

Understand "lie", "lie down", "sit", "sit down" as lying_default.
lying_default is an action applying to nothing.

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
Understand "stand", "stand up", "get up", "get off" as standing_up.
standing_up is an action applying to nothing.

Carry out standing_up:
	if player is on a lie-able supporter (called the loungy_thing):
		silently try exiting [loungy_thing];
		if rule succeeded:
			say "You push yourself up from [the loungy_thing].";
		stop the action;
	else if player is on a supporter (called the loungy_thing):
		silently try exiting [loungy_thing];
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

Does the player mean climbing an unclimbable thing: it is unlikely.
Does the player mean climbing up an unclimbable thing: it is unlikely.
Does the player mean climbing down an unclimbable thing: it is unlikely.
Does the player mean climbing in an unclimbable thing: it is unlikely.
Does the player mean climbing on an unclimbable thing: it is unlikely.
Does the player mean climbing out an unclimbable thing: it is unlikely.
Does the player mean climbing over an unclimbable thing: it is unlikely.
Does the player mean climbing under an unclimbable thing: it is unlikely.

understand the command "climb" as something new.
Understand "go over", "hop", "vault", "scale", "jump", and "cross" as climbing.

climbing-up-nada is an action applying to nothing.
Understand "climb up" as climbing-up-nada.
Carry out climbing-up-nada:
	try going up.

climbing-down-nada is an action applying to nothing.
Understand "climb down" as climbing-down-nada.
Carry out climbing-down-nada:
	try going down.

climbing in is an action applying to one thing.
climbing on is an action applying to one thing.
climbing out is an action applying to one thing.
climbing up is an action applying to one thing.
climbing down is an action applying to one thing.
climbing over is an action applying to one thing.
climbing through is an action applying to one thing.
climbing under is an action applying to one thing.

understand "climb [something]" as climbing.
understand "climb up [something]" as climbing.
understand "climb down [something]" as climbing down.
understand "climb in/into [something]" as climbing in.

understand "climb on/onto [something]" as climbing on.
understand "climb through [something]" as climbing through.
understand "climb thru [something]" as climbing through.
understand "climb out [something]" as climbing out.
understand "climb out of [something]" as climbing out.
understand "get out of [something]" as climbing out.

understand "climb over [something]" as climbing over.
understand "climb under [something]" as climbing under.

report climbing
(this is the climbing rule):
	if the noun is climbable:
		say "You climb [the noun].";
	else:
		say "You can't climb [the noun]." instead.

instead of climbing down:
	try going down.

report climbing in
(this is the climbing in rule):
	if the noun is climbable:
		say "You climb [the noun].";
	else if the noun is an enterable container:
		say "You climb into [the noun].";
		now the player is in the noun;
	else:
		say "You can't climb in [the noun]." instead.

report climbing on
(this is the climbing on rule):
	if the noun is climbable:
		say "You climb [the noun].";
	else if the noun is an enterable supporter:
		say "You climb onto [the noun].";
		now the player is on the noun;
	else:
		say "You can't climb onto [the noun]." instead.

report climbing through:
say "You can't climb through [the noun].".

report climbing out
(this is the climbing out rule):
	if the noun is climbable:
		say "You climb out of [the noun].";
		now the player is in the location;
	else if the noun is an enterable supporter:
		say "You climb off of [the noun].";
		now the player is in the location;
	else if the noun is an enterable container:
		say "You climb out of [the noun].";
		now the player is in the location;
	else:
		say "You can't climb out of [the noun]." instead.

report climbing over
(this is the climbing over rule):
	if the noun is climbable:
		say "You climb over [the noun].";
	else:
		say "You can't climb over [the noun]." instead.

report climbing under
(this is the climbing under rule):
	say "You can't climb under [the noun]." instead.

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
		repeat with item running through stuff you brought here:
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
		change stuff you brought here to have 0 entries;
	else:
		say "You are already dressed!";

Chapter - Laughing

Understand "laugh", "lol", "laugh out loud", "giggle", "smirk", "chuckle" as laughing.
Laughing is an action applying to nothing.

Carry out laughing:
	say "You [one of]laugh out loud[or]chuckle heartily[or]giggle loudly[at random][run paragraph on]";
	if people who are not the player are visible and a random chance of 1 in 4 succeeds:
		let reactor be a random visible person who is not the player;
		say " and [Reactor] [one of]looks at[or]glances over at[or]smiles at[at random] you";
	say ".[line break]";

Understand "laugh at [something]" as laughing at.
Laughing at is an action applying to one thing.

Carry out laughing at:
	if the noun is not a person:
		try laughing;
	otherwise:
		say "[Noun] looks first confused and then hurt. You feel bad for laughing.";
		now player is not compassionate.


Chapter - Yelling

Understand "yell", "holler", "scream", "shriek", "monkey yell", "yell like a monkey" as yelling.
Yelling is an action applying to nothing.

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

Understand "pet [something]", "pat [something]", "hug [something]", "kiss [something]" as touching.

Instead of kissing someone:
	Try touching the noun.


Chapter - Attacking

Instead of attacking a thing that is not a person:
	say "You consider giving it a vicious kick, but think better or it."

Instead of attacking someone (called the subject):
	say "[one of]Sometimes you get so mad you wish you had a laser ray that could just zap somebody dead. No, better, a disappearance ray that made someone disappear like they'd never ever existed.
	[paragraph break]But then you think about it a bit, and wonder: What if you disappeared [subject] and [sub_pronoun of subject] was meant to help you or save your life or something later and you'd never know it because [sub_pronoun of subject] never existed? Or if you had a Disappear Ray, why couldn't someone else have one? And what would keep them from disappearing you?[or]If you knew Kung Fu you'd chop [obj_pronoun of subject] to pieces. But then what if [subject] didn't die right away and [sub_pronoun of subject] just laid there suffering? Could you finish [obj_pronoun of subject] off while [sub_pronoun of subject] laid there helpless?[or]What is you hurt [obj_pronoun of subject] and you got put in jail and you never saw your mom again?[cycling][line break]The thought makes you [nervous]. Maybe violence isn't the answer."

Chapter - Sing

Understand the command "sing", "hum" as something new.
Understand "sing", "hum" as singing.
Singing is an action applying to nothing.

Understand "sing [text]" or "hum [text]" as a mistake ("[sing-action][run paragraph on]").

Instead of singing:
	say "[sing-action]".

To say sing-action:
	if a random chance of 1 in 3 succeeds:
		say "You make up a song about [one of]killer red ants that eat everyone[or]picking blackberries until your fingers are bloody[or]riding the train out of town and living like a hobo[at random] [one of][or]to the tune of  'When You Need a Friend'[or]to the tune of 'Baby I'm a Want You'[or]to the tune of 'American Pie'[at random].[run paragraph on]";
	else if player is in Region_Blackberry_Area:
		say "You sing along to [current_song], but you [one of]only know the chorus[or]only know some of the words[or]have to make up most of it[or]don't know most of the words, but you don't really care[at random].[run paragraph on]";
	else:
		say "You sing a little bit of one of your favorite songs, [one of]'Knock Three Times on the Ceiling If You Want Me'[or]'Before the Next Teardrop Falls'[or]'Thank God I'm a Country Boy'[or]'He Don't Love You Like I Love You'[or]'How Sweet It Is To Be Loved By You'[or]'Kung Fu Fighting'[at random], but you [one of]only know the chorus[or]don't really know the words[or]have to make up most of it[or]but you don't know most of the words, but you don't really care[at random].[run paragraph on]";
	if people who are not the player are visible and a random chance of 1 in 3 succeeds:
		let reactor be a random visible person who is not the player;
		say " [Reactor] [one of]looks at[or]glances over at[or]smiles at[at random] you.[run paragraph on]";
	say "[line break]";

Chapter - Jump

Instead of jumping:
	say "You jump around like a monkey."

Chapter - Smell

An object has some text called scent. The scent of a thing is usually "nothing".

Definition: a thing is scented if the scent of it is not "nothing".

The report smelling rule is not listed in any rulebook.

The last carry out smelling rule:
	if the scent of the noun is "nothing":
		say "[The noun] [if noun is singular-named]doesn't[otherwise]don't[end if] smell like much of anything.";
	otherwise:
		say "[The noun] smell[if noun is singular-named]s[end if] like [the scent of the noun].".

Instead of smelling a room:
	[say "(location: [location of the player], scent: [the scent of the location of the player])";
	say "(region: [map region of the location of the player], scent: [the scent of the map region of the location of the player])";]
	if the scent of the location of the player is not empty:
		say "You smell [the scent of the location of the player].";
	else if the scent of the map region of the location of the player is not empty:
		say "You smell [the scent of the map region of the location of the player].";
	else:
		say "You smell nothing in particular.".

Chapter - Supporters

Understand "go on [supporter]", "walk on [supporter]", "balance on [supporter]" as entering

Chapter - Tracks

Follow_tracks is an action applying to nothing.
Understand "follow train/green/-- tracks/tunnel" as follow_tracks.
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

Carry out taking inventory (this is the print non-standard inventory
rule):
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
Understand "which way", "go to where", "where do I go" as exit_listing. exit_listing is an action applying to nothing.
Carry out exit_listing:
	if available_exits of location is empty:
		say "Sorry, you're on your own here.";
	otherwise:
		say looking_for_available_exits;

To hint_at_navigation:
	say "[one of ]You could never remember which way was which, and without your Explorer Scout compass it's more useful to use landmarks to navigate anyway[or]Which direction is that? You might want to use landmarks to navigate[or]Try using landmarks. For example: GO TO CLEARING[line break]Or even try: GO BACK or GO ON[line break]If you need a reminder, try: WHICH WAY[stopping].";

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
Every turn, now player is discouraged_from_compass_navigating.
[TODO: We need to make an allowance for compass-navigating in Act 3]

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

Part - Room-Navigation

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
Understand "go back/- to/around/near/by [any reachable room]", "go [any reachable room]", "return to [any reachable room]", "walk --/to [any reachable room]", "run --/to [any reachable room]" as room_navigating.

Check room_navigating:
	[say "(go from [location of player] to [the noun])[line break]";]
	if the noun is the location, say "Well, happily you're already here." instead;

Carry out room_navigating:
	let initial location be the location;
	let the destination be the noun;
	if the initial location is the destination,
		say "." instead;
	let heading be the best route from the initial location to the destination;
	[say "(heading toward [noun] is [heading])[line break]";]
	if heading is nothing:
		say cant_find_that instead;
	else:
		now player is not discouraged_from_compass_navigating;
		try going heading.

To say cant_find_that:
	say "You're not sure exactly how to get there. [looking_for_available_exits]";

Fail_navigating is an action applying to one thing.
Understand "go back/- to/around/near/by [any not reachable room]", "go [any not reachable room]", "return to [any not reachable room]", "walk --/to [any not reachable room]", "run --/to [any not reachable room]" as fail_navigating.

Carry out fail_navigating:
	say cant_find_that;


Part - Navpoints


Part - Object-Navigating


Part - Landmarks and Navpoints


Part - Specific Actions (GO ON and GO BACK)

Going_back is an action applying to nothing.
Understand "go back", "return" as going_back.
Carry out going_back:
	long_range_navigate to return_dest of the map region of the location of the player.

Going_on is an action applying to nothing.
Understand "go on/forward", "walk on/forward/--", "keep going/walking/on", "continue going/walking/forward/on", "continue", "forward", "walk", "get going" as going_on.
Carry out going_on:
	long_range_navigate to forward_dest of the map region of the location of the player.

Going_upstream is an action applying to nothing.
Understand "go up the/-- creek/river/stream", "go upriver/upstream", "follow the/-- creek/river/stream up/upstream" as going_upstream.
Carry out going_upstream:
	Let destination be upstream_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is as far upstream as I can get here.";
	else if destination is Limbo:
		say "I'm not sure how to go upstream from from here.";
	else:
		try room_navigating destination.

Going_downstream is an action applying to nothing.
Understand "go down the/-- creek/river/stream", "go downstream/downriver", "follow the/-- creek/river/stream" as going_downstream.
Carry out going_downstream:
	Let destination be downstream_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is as far downstream as I can get from here.";
	else if destination is Limbo:
		say "I'm not sure how to go downstream from here.";
	else:
		try room_navigating destination.

Going_uppath is an action applying to nothing.
Understand "go up the/-- road/path/trail" as going_uppath.
Carry out going_uppath:
	Let destination be uppath_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is the end of the road, pardner.";
	else if destination is Limbo:
		say "I'm not sure how to get there from here.";
	else:
		try room_navigating destination.

Going_downpath is an action applying to nothing.
Understand "go down the/-- path/trail/road", "follow the/-- path/trail/road" as going_downpath.
Carry out going_downpath:
	Let destination be downpath_dest of the map region of the location of the player;
	if destination is the location of the player:
		say "This is the end of the road, pardner.";
	else if destination is Limbo:
		say "I'm not sure how to get there from here.";
	else:
		try room_navigating destination.

To long_range_navigate to (destination - a room):
	[say "(Long range nav: [destination])[line break]";]
	if destination is the location of the player:
		say "This is about as far as I can go.";
	else if destination is Limbo:
		say "I'm not sure how to get there from here.";
	else:
		try room_navigating destination.

Part - Elusive Landmarks

The_distance is a container.

An elusive_landmark is a kind of thing.
[Elusive_landmarks are navigable scenery.]

[Does the player mean object-navigating an elusive_landmark when in Dark Woods:
it is very likely.]


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
	[paragraph break]Eventually, your tears turn to sniffles and your wipe your eyes with your dirty hands." with priority 2.

At 9 PM:
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
A turnevent can be important or trivial.

Definition: A turnevent is trivial if it has a priority that is greater than 4.
Definition: A turnevent is momentous if it has a priority that is less than 3.
[note that there are events between the two that are neither trivial nor momentous]

Coming_Events is a container.
Coming_Events has a truth state called some things said.

To queue_report (event text - text) with/at priority (event priority - a number):
	Let new event be a random turnevent in Limbo;
	Now the description of new event is event text;
	Now the priority of new event is event priority;
	Now new event is in Coming_Events;

The show reports rule is listed last in the every turn rulebook.
This is the show reports rule:
	if number of turnevents in Coming_Events is not 0:
		Let turnevent list be the list of turnevents in Coming_Events;
		Sort turnevent list in reverse priority order;
		let momentous count be the number of momentous turnevents in Coming_Events;
		[say "Turnevent list: [line break]";
		repeat with item running through turnevent list:
			say " [priority of item] - [description of item].";]
		Repeat with this event running through turnevent list:
			let trivial_count be the number of trivial turnevents in Coming_Events;
			let momentous_count be the number of momentous turnevents in Coming_Events;
			let total_count be the number of turnevents in Coming_Events;
			[say "Total events: [total_count] / Trivial events: [trivial_count] / Momentous events: [momentous_count].";]
			if this event is trivial and momentous_count is zero: [we don't say trivial events if we have momentous things to report]
				if momentous_count is 0:
					if (trivial_count is 1) and (some things said of Coming_Events is true):
						let new text be indexed text;
						let new text be the description of this event;
						replace character number 1 in new text with character number 1 in new text in lower case;
						say "And [new text] [run paragraph on]";
					otherwise:
						say "[description of this event] [run paragraph on]";
					now some things said of Coming_Events is true;
			else if this event is not trivial:
				if some things said of Coming_Events is true:
					say "[line break][line break]";
				say "[description of this event][run paragraph on]";
				now some things said of Coming_Events is true;
			move this event to Limbo;
		if some things said of Coming_Events is true:
			say "[line break]";
		[clear events]
		now all turnevents in Coming_Events are in Limbo;
		now some things said of Coming_Events is false;

[TODO: Find a new rulebook for the above rule that triggers every turn. As it is, some every turn rules that queue_reports get shown one after another.]


Book - Scenes

A scene can be dramatic. A scene is usually not dramatic.

Part - Scene_Day_One

There is a scene called Scene_Day_One.
Scene_Day_One begins when play begins.
Scene_Day_One ends when Scene_Night_In_The_Woods begins.

When Scene_Day_One begins:
	start_transcript;
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
[Scene_Walk_With_Grandpa begins when player has been in Region_Trailer_Indoors and player is in Region_Blackberry_Area.]
Scene_Walk_With_Grandpa begins when player has been in Region_Long_Road for four turns.
Scene_Walk_With_Grandpa ends when Grandpa has been in Room_Grandpas_Trailer and Grandpa is not in Room_Grandpas_Trailer.

When Scene_Walk_With_Grandpa begins:
		now big_bucket is full;
		now seq_grandparents_chat is not in-progress;

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
	now bridge_log1 is in Room_Crossing;
	now pool_log is in Limbo

Chapter - Scene_Across_the_Creek

There is a scene called Scene_Across_the_Creek.
Scene_Across_the_Creek begins when player has been in Room_Wooded_Trail.
Scene_Across_the_Creek ends when Scene_Night_In_The_Woods begins.

When Scene_Across_the_Creek begins:
	Now the time of day is 4:10 AM.

Part - Scene_Night_In_The_Woods

There is a scene called Scene_Night_In_The_Woods.
Scene_Night_In_The_Woods begins when player has been in Region_Woods_Area for 6 turns.
Scene_Night_In_The_Woods ends when Scene_Dreams ends.

When Scene_Night_In_The_Woods begins:
	say "[lost_in_the_woods_payoff]";
	pause the game;
	say Title_Card_Part_2;
	Now the right hand status line is "Evening";

Chapter - Scene_STOP

There is a scene called Scene_STOP.
Scene_STOP begins when player has been in Room_Forest_Meadow for 2 turns.
Scene_STOP ends when Scene_Sleep begins.

[S.T.O.P.
S stands for SIT DOWN.
T is for THINK.
O is for OBSERVE.
P stands for PLAN.

Survival priorites: In extreme conditions…

1. You can live 3 hours without shelter.
2. You can live 3 days without water.
3. You can live 3 weeks without food.
]

Chapter - Scene_Make_Shelter

There is a scene called Scene_Make_Shelter.
Scene_Make_Shelter begins when Scene_STOP begins.
[scene ends when player has stacked sticks and moved leaves into fort]

Chapter - Scene_Find_Water

There is a scene called Scene_Find_Water.

Chapter - Scene_Sleep

There is a scene called Scene_Sleep.
Scene_Sleep begins when Scene_Make_Shelter has ended and player is in Room_Protected_Hollow.

When Scene_Sleep begins:
	Now the right hand status line is "Night";

Chapter - Scene_Defend_the_Fort

There is a scene called Scene_Defend_the_Fort.
Scene_Defend_the_Fort begins when Scene_Sleep begins.
Scene_Defend_the_Fort ends when racoons are not in Region_Woods_Area.

Chapter - Scene_Dreams

There is a scene called Scene_Dreams.
Scene_Dreams begins when Scene_Defend_the_Fort ends.
Scene_Dreams begins when player is in Room_Car_With_Mom.
Scene_Dreams ends when player is in Room_Dream_Stone_Bridge.

When Scene_Dreams begins:
	Now the time of day is 9:01 PM;
	Now the right hand status line is "";
	Now Honey is in Room_Dream_Railroad_Tracks;
	Now grandpa is in Room_Dream_Railroad_Tracks;
	store_all_your_stuff;
	Now flattened coin is in Room_Dream_Railroad_Tracks;

When Scene_Dreams ends:
	now seq_dog_convo is not in-progress;
	unstore_all_your_stuff;
	now player is in Room_Protected_Hollow.

[During Scene_Dreams player cannot move to next location until the scene for that location is finished]

Chapter - Scene_Dream_about_Mom

There is a scene called Scene_Dream_about_Mom.
Scene_Dream_about_Mom begins when Scene_Dreams begins.
[Scene_Dream_about_Mom ends when player is in Room_Camaro_With_Stepdad.]

Chapter - Scene_Dream_Have_To_Pee

There is a scene called Scene_Dream_Have_To_Pee.
Scene_Dream_Have_To_Pee begins when Scene_Dream_about_Mom begins [TODO: ends].
Scene_Dream_Have_To_Pee ends when player has been in Room_Restroom.

[TODO: Reminder that you have to pee every few turns]
Every turn during Scene_Dream_Have_To_Pee:
	if the remainder after dividing the turn count by two is zero:
		queue_report "[one of]You suddenly realize that you've been holding it, and you really have to pee[or][one of]You really have to go[or]You do a little dance, your body reminding you that you really have to go[or]Your really really really don't want to wet yourself[cycling][stopping]." with priority 1.

Peeing is an action applying to nothing.
Understand "pee", "urinate", "poop", "piss" as peeing.
Carry out peeing:
	If Scene_Dream_Have_To_Pee is happening:
		say "Probably best to hustle to the restroom in the snack bar.";
	else:
		say "You don't have to go."

Chapter - Scene_Dream_About_Drive_In

There is a scene called Scene_Dream_About_Drive_In.
Scene_Dream_About_Drive_In begins when player is in Room_Drive_In.
Scene_Dream_About_Drive_In ends when player has been in Room_Drive_In
	and (player holds popcorn or player holds Milk Duds).

Chapter - Scene_Dream_About_Stepdad

There is a scene called Scene_Dream_About_Stepdad.
Scene_Dream_About_Stepdad begins when player is in Room_Camaro_With_Stepdad.
Scene_Dream_About_Stepdad ends when player is in Room_Dream_Grassy_Field.

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
	queue_report "Suddenly, the sheriff rolls up in his car. Neither the Cat Lady nor Lee look at him. The sheriff pops out of his car with an accordion and begins playing music. It's a funny tune and somehow you know it's an Argentine tango. The Cat Lady and Lee begin to dance." with priority 2;
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
[Scene_Mars_Dream ends when .]

Chapter - Scene_Dog_Dream

Scene_Dog_Dream is a dramatic scene.
Scene_Dog_Dream begins when player is in Room_Dream_Dirt_Road.
Scene_Dog_Dream ends when dog_free_to_go is true.

dog_free_to_go is truth state that varies. dog_free_to_go is false.

When Scene_Dog_Dream begins:
	now seq_dog_convo is in-progress;

Part - Scene_Day_Two

There is a scene called Scene_Day_Two.
Scene_Day_Two begins when Scene_Dreams ends.

Chapter - Scene_Morning_After

There is a scene called Scene_Morning_After.
Scene_Morning_After begins when Scene_Day_Two begins.

When Scene_Morning_After ends:
	Now player is in Room_Protected_Hollow;
	Change up exit of Room_Forest_Meadow to Room_Sentinel_Tree.

Chapter - Scene_Orienteering

There is a scene called Scene_Orienteering.
Scene_Orienteering begins when Scene_Day_Two begins.
Scene_Orienteering ends when player is in Room_Sentinel_Tree.

When Scene_Orienteering ends:
	Change south exit of Room_Forest_Meadow to Room_Dark_Woods_North;
	Change west exit of Room_Forest_Meadow to Room_Dappled_Forest_Path.

Chapter - Scene_Foraging_for_Breakfast

There is a scene called Scene_Foraging_for_Breakfast.
Scene_Foraging_for_Breakfast begins when Scene_Day_Two begins.
Scene_Foraging_for_Breakfast ends when Scene_Found begins.

Chapter - Scene_Out_of_the_Woods

There is a scene called Scene_Out_of_the_Woods.


Chapter - Scene_Found

There is a scene called Scene_Found.
Scene_Found begins when Scene_Day_Two is happening and (player is in Room_Blackberry_Tangle or player is in Room_Other_Shore).
Scene_Found ends when player is in Room_D_Loop.


Chapter - Scene_Reunions

There is a scene called Scene_Reunions.
Scene_Reunions begins when Scene_Found ends.

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
	say "[second custom style]What's too painful to remember[line break]
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
	say "[second custom style]And butterflies are free to fly [line break]
	[second custom style]Fly away, high away, bye bye [line break]
	[second custom style]-- 'Someone Saved My Life Tonight,' Elton John, 1975";
	say roman type;
	say paragraph break;
	pause the game;

To pause the/-- game:
say "[paragraph break]Please press ANY KEY to continue.";
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

To do sharon teatime premonition:
	queue_report "[italic type]A sudden thought: What if you are here talking to the Cat Lady and something happens to your Grandpa or Honey? Or worse, your mom? You struggle to think about something else.[roman type]" at priority 1.

To say lee invite premonition:
	say "[italic type]You remember your grandma's warning and suddenly feel [nervous][roman type]".

When Scene_Bringing_Lunch begins:
	Premonition About Something Wrong in 30 turns from now;
	continue the action.

At the time when Premonition About Something Wrong:
	queue_report "[italic type]You get a feeling something is wrong. What if something happened to your grandpa?[roman type]" with priority 1;

A person can be dog_warned.
	A person is not dog_warned.

After going to Room_Long_Stretch during Scene_Bringing_Lunch:
	if player is not dog_warned:
		queue_report "[italic type]Something is different. The hairs on your arm and the back of your neck stand up.[roman type]" at priority 1;
		now player is dog_warned;
	continue the action.

After going to Room_Crossing for the first time:
	queue_report "[italic type]Something about the crossing makes you [nervous] like watching a glass fall off of a countertop in slow motion.[roman type]" at priority 1;
	continue the action.

After going to Room_Dirt_Road during Scene_Bringing_Lunch:
	Premonition About Another Way in three turns from now;
	continue the action.

At the time when Premonition About Another Way:
	queue_report "[italic type]You've got to get back to the clearing. There must be another way.[roman type]" at priority 1;

After going to Room_Other_Shore during Scene_Across_the_Creek:
	queue_report "[italic type]Oh no. The log has come unstuck and floated downstream.[roman type]" at priority 1;
	continue the action.

To say sharon-stepdad premonition:
	say "[italic type]For a moment, you share her vision -- a rocky shore stretching for miles and miles -- a child picking among the rocks completely and hopelessly alone. [roman type]".

To say forest premonition:
	say "[italic type]You get a funny feeling like the forest is looking back and you shiver[roman type]".

Part - Payoffs

To say blackberry_payoff:
	say "That should be enough to satisfy Honey.
	[paragraph break]Even though you love picking blackberries -- and you certainly love blackberry jam, blackberry pie, blackberry and cream, or just eating fresh blackberries -- you've been picking berries all morning. You must have picked a [italic type]million[roman type] pails already. And you want to see if the red ants ate the dead cricket you put near their hole. Oh, and you want to see if you can find a lucky penny. And you may even want to swim.".

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
	say "The afternoon shadows are lengthening and it is slowly getting on toward evening. You should be home by now. Honey and Grandpa will be worried. You fight back a brief wave of misery and trudge on.
	[paragraph break]But it's no use. Part of the time you are pretty sure you are going in circles. The rest of the time you are scared you are getting lost deeper in the forest.
	[paragraph break]For a while there, you felt you were close to finding your way back, but now everything looks completely unfamiliar -- and to be honest, a bit sinister. Like the forest is trying to [italic type]keep[roman type] you here, to lead you astray, lead you deeper into the woods. The trees lean in toward you. The underbrush grabs as your clothing.
	[paragraph break]But no, that's stupid. You fight back panic. It's nobody's fault but your own. You should have been more careful, more observant. A good explorer scout would never get lost like this. Stupid stupid stupid, you berate yourself.
	[paragraph break]Again, you think about your Honey and Grandpa at home. The smell of blackberry jam cooking. Watching TV on the floor with your grandpa. And your mom.  It's all too much.
	[paragraph break]You have to admit it: You are hopelessly lost.
	[paragraph break]You sit down right where you are and sob miserably.";



Book - Conversation system

A sequence is a kind of thing.
A rant is a kind of thing.

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

Part - Howdy?

[TODO: implement howdy? how are you doing? as asking about self]

Understand "howdy", "how do", "how are/-- you/ya doing/feeling/--", "how is your day/morning/afternoon/evening", "what is/-- up/going on/--", "what's up/going on/--" as asking_howdy.
asking_howdy is an action applying to nothing.

Carry out asking_howdy:
	let person be the current interlocutor;
	try quizzing person about person.

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
	if speaker of this_rant is visible:
		queue_report quote in row index of the quote_table of this_rant with priority 1;
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

Grandpa, Honey, Aunt Mary, Sharon, Lee, Sheriff, Step-dad, Mom, Joseph are familiar.

Chapter - Places

topic_forest is a subject.
	The printed name is "woods".
	Understand "woods" as topic_forest.

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
	Understand "pine/fir/tall/-- doug/-- fir/tree/branches" as topic_tree.

Chapter - Big Topics

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

Chapter - Various Objects

Cigarettes are familiar.

The dog is familiar.

The radio is familiar.

topic_cat is a subject.
	The printed name is "cats".
	Understand "tabby", "tabby cat", "cat", "yellow", "tiger", "feline", "kitty", "kitten", "cat", "cats", "feline", "kitties", "kitty", "kitten", "pack", "one eye", "black", "skinny", "white", "gray", "fluffy", "tortoise-shell", "calico", "tomcat", "chunky", "patchy", "yellow", "dirty", "bony" as topic_cat.

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

A thing can be familiar or unfamiliar. A thing is usually unfamiliar.
A subject is a kind of thing. A subject is usually familiar.

A sequence is a kind of thing.
A rant is a kind of thing.

Definition: a container is empty if the number of things in it is zero.
Definition: a supporter is empty if the number of things on it is zero.
[Definition: a thing is empty if the number of things encased by it is zero.]
Definition: a thing is non-empty if it is not empty.

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
	say "[one of]You stretch and manage to pick a few[or]By working on tiptoes, you are just able to pick a few [or]You gather up the easy ones right in front until you have a handful of[or]You notice some ripe ones down near your knees and grab a bunch of[at random] ripe blackberries";

Instead of eating backdrop_berries:
	say "[pick_berries] [eat_berries]";

[Nix. This works without it.
Procedural rule while eating the backdrop_berries:
	ignore the carrying requirements rule.
Procedural rule while eating the backdrop_berries:
	ignore the can't eat unless edible rule.]

Instead of inserting backdrop_berries into something:
	try inserting pail into second noun.

Section - Berries in the pail

[that is, the berries in the pail (or the big_bucket) ]

A berries_in_pail is a undescribed, sinking, edible thing.
	The printed name is "bunch of ripe berries".
	A berries_in_pail are in pail.
	The description of berries_in_pail is "You've picked a big bunch of blackberries. [looking_closely_at_berries].".
	The scent is "mmm, blackberry jam, blackberry pie, yum".
	Understand "bunch/handful/lots/-- of/-- ripe/big/-- black/-- blackberries/blackberry/berries/berry", "blackberries/blackberry/berries/berry in pail" as berries_in_pail.

To say looking_closely_at_berries:
	say "Looking at them, you notice that the color goes from deep red to deepest black. [one of]The sweetest ones are the ones that aren't shiny. You know that from experience[or]Your hands are stained red all the way to your wrist[or] You notice a tiny weeny white spider crawling on one of the berries[or] One of these berries is still green[or] A couple of these berries are kind of too ripe and look like little raisins[at random]".

Instead of eating berries_in_pail:
	eat_berries_from_pail;
Instead of drinking berries_in_pail:
	eat_berries_from_pail;

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
	say "You eat a few of the berries[one of]. Yum[or]. Oh yum[or]. Delicious[or]. Sour. Some of these weren't quite ripe[or]. Oh those were really sweet[or]. Yum[or]. You can feel the little seeds between your teeth[in random order].";

[TODO: When you try to get or eat berries outside of the Region_Blackberry_Area and there is none, you get "You can't see any such thing." This could be improved]

Section - Berries in Hand

[the handful of ripe berries, that is, the berries we can hold ]

A handful_of_berries is a sinking edible thing.
	The printed name is "handful of ripe berries".
	handful_of_berries are in Limbo.
	The description of handful_of_berries is "You've picked a big handful of blackberries. [looking_closely_at_berries].".
	The scent is "mmm, blackberry jam, blackberry pie, yum".
	Understand "bunch/handful/lots/-- of/-- ripe/big/-- black/-- blackberries/blackberry/berries/berry" as handful_of_berries.

[Nix. The pouring-in action takes care of this.
Instead of pouring_in handful_of_berries into big_bucket:
	try inserting handful berries into big_bucket.
Instead of pouring_in handful_of_berries into something:
	try inserting berries into second noun.]

Instead of eating handful_of_berries:
	say eat_berries;
	now noun is in Limbo.

Section - The Pail
[TODO:
	>put berries in pail
	You can't put something inside itself
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
	say eat_berries;

Before going when pail is full and pail is held by player:
	say "[one of]With your heaping full pail, you imagine tripping and blackberries going everywhere and getting in trouble[or]Your full pail is making you nervous[or]You are concentrating so hard on your full pail, your hands start to shake and a ripe berry tumbles off into the dirt[or]You have to stop for a minute to catch your breath and steady your hands holding your full pail[or]You walk slow steading your pail full of blackberries[stopping].";

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
			say "Your bucket is empty. You may want to pick some more.";
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
	if player is not in Room_Top_of_the_Pine_Tree:
		say "You throw the rock and it disappears into the bushes.";
	else:
		say "The rock sails out into space before dropping with a crash among the bushes far below.";
	move the noun to Room_Railroad_Tracks.

Part - Devices and Things With A Mind of Their Own

Chapter - Tuning

Understand "watch [something]", "play [something]", "turn on [something]" as switching on.

Understand "tune [something]", "tune station/channel/dial on [something]", "adjust [something]", "change station/channel/dial on [something]", "turn station/channel/dial on [something]" as tuning-this.
Tuning-this is an action applying to one thing.

Check tuning-this:
	if noun is not a device:
		say "Hm, I don't know how to tune that." instead;

Carry out tuning-this:
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
	if Cat Lady's TV is visible:
		if Cat Lady's TV is not switched on:
			say "You'll have to turn the set on first." instead;
	else if Honeys_tv is visible:
		if Honeys_tv is not switched on:
			say "You'll have to turn the set on first." instead;
	else if Lee's TV is visible:
		if Lee's TV is not switched on:
			say "You'll have to turn the set on first." instead;
	else if portable transistor radio is not visible:
		say "Hmm. There's nothing to tune here." instead;

Carry out tuning:
	if portable transistor radio is visible:
		try taking portable transistor radio;
	else if Lee's TV is visible:
		change_TV_channel;

Chapter - The Radio

[Instead of doing anything except object-navigating or examining or listening or smelling or quizzing or informing or implicit-quizzing or implicit-informing radio, say "[one of]Better leave it alone or Honey will kill you.[or]Seriously, you know not to touch Honey's stuff.[or]Not a good idea.[stopping]"]

Every turn when location of player is in Region_Blackberry_Area or player is in Room_Stone_Bridge:
	if time_for_a_new_song,
		report_new_song_begins;

Instead of listening when location of player is in Region_Blackberry_Area,
	say "[what_song_is_playing][if Grandpa is in Room_Grassy_Clearing]. And Honey and Grandpa are talking nearby.[end if]"

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
		say "'[current title][one of]' by [current artist],[or],'[at random] [one of]a good one[or]one of your favorites[or]another song you really like[or]one you like to sing to[or]one you remember singing with your mom in the Camero[as decreasingly likely outcomes]";
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

Every turn when player is in Room_Lees_Trailer and Lee's TV is switched on:
	if current action is not tuning or examining Lee's TV or switching on Lee's TV:
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

After switching on Lee's TV:
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
Does the player mean doing anything to distant-train when player is not in Room_Top_of_the_Pine_Tree:
	It is very unlikely.

At the time when morning train enters area:
	queue_report "You think you hear the morning train blowing its whistle way off in the hills." with priority 3.

At the time when morning train is nearby:
	queue_report "You hear a train whistle in the distance." with priority 3;
	if player is in Room_Top_of_the_Pine_Tree:
		queue_report "Looking toward the sound of the train, you can actually see it rounding the hill outside of town." with priority 2;
	move distant-train to Room_Top_of_the_Pine_Tree.

At the time when morning train hits the crossing:
	queue_report "You hear the morning train whistle, loud and close, as it hits the crossing." with priority 3;

At the time when afternoon train enters area:
	queue_report "You hear the train, pretty far off still." with priority 3.

At the time when afternoon train is nearby:
	queue_report "You hear the train whistle blowing as it goes through town." with priority 3;
	if player is in Room_Top_of_the_Pine_Tree:
		queue_report "Looking toward the sound of the train, you can actually see it rounding the hill outside of town." with priority 2;
	move distant-train to Room_Top_of_the_Pine_Tree.

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
		if player is not train-experienced:
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
		now player is train-experienced;
	else if location of player is Room_Top_of_the_Pine_Tree:
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
A sequence can be in-progress. It is usually not in-progress.
A sequence can be run. It is usually not run.

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
Room_Lost_in_the_Brambles, Room_Grassy_Clearing, Room_Blackberry_Tangle, Room_WIllow_Trail, Room_Lost_Trail, Room_Dappled_Forest_Path, and Room_Stone_Bridge are in Region_Blackberry_Area.
The scent of Region_Blackberry_Area is "sunshine and dust and the tang of ripe blackberries".

Section - Navigation

The return_dest of Region_Blackberry_Area is Room_Grassy_Clearing.
The forward_dest of Region_Blackberry_Area is Room_Grandpas_Trailer.
The upstream_dest of Region_Blackberry_Area is Room_Grassy_Clearing.
The downstream_dest of Region_Blackberry_Area is Room_Stone_Bridge.
The uppath_dest of Region_Blackberry_Area is Room_Grassy_Clearing.
The downpath_dest of Region_Blackberry_Area is Room_Stone_Bridge.

Section - Backdrops

A backdrop_blackberry_brambles is backdrop in Region_Blackberry_Area.
	The printed name is "berry brambles".
	The description is "[if player is in Room_Willow_Trail]The blackberry brambles are thinner here, forming prickly walls on either side of the trail[otherwise]The brambles are as high as you are, higher actually[end if]. They are heavy with berries, the very ripest ones always seem to be just out of reach."
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
	The description is "The [sunlight] comes slanting through the trees in the [if current_time_period is morning]morning light. The air is still crisp here in the shade with the early promise of a hot midsummer day[otherwise]afternoon light. Under the trees, the air is cooler[end if]."
	Understand "light/sun/sunlight/sunshine/sky/clouds", "sun shine/light", "shade/shady/cool/crisp", "shady tree/trees/vines/bush/brambles" as backdrop_sunlight.

Section - Rules and Actions


Chapter - Room_Lost_in_the_Brambles

Section - Description

Room_Lost_in_the_Brambles is a room.
The printed name is "Lost in the Brambles".
The description is "[one of]You were sure that this was a better spot than where you've been picking all morning. But here too, the biggest ripest berries seem to be just out of reach. You pick a few ripe berries and drop them in your pail[or]This spot, a little ways from where Honey and Grandpa are picking, has some good berries[stopping]. Under the pine trees, the air smells good.
[paragraph break]Looking around: [available_exits]
[paragraph break]The sunlight comes slanting through the trees in the [if current_time_period is morning]morning light. The air is still crisp in the shade with the early promise of a hot midsummer day[otherwise]afternoon light. Under the trees, the air is cooler[end if]."
Understand "lost/-- in/-- the/-- brambles" as Room_Lost_in_the_Brambles.
The scent is "sunshine and that dusty fragrance of pine trees that you remember from hiking with Grandpa in the mountains".

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

Room_Grassy_Clearing is a room.
The printed name is "Grassy Clearing".
The description is "[if turn count is 1][bold type][location][roman type][line break][end if][one of]The water churgles in the nearby creek but you can't see it through the forest of blackberry brambles all around you. Every summer since you were little, you pick blackberries with your Honey and Grandpa down along Bear Creak[or]You are near the creek, but it can't be seen through the blackberry brambles[stopping]. This is a pleasant clearing carpeted with stubbly grass under a sycamore tree. There are paths and clearings beaten down among the brambles that allow you to squeeze in to get the ripest berries. [if big_bucket is visible]There is a big bucket in the middle of the clearing. [end if][if grandpas_shirt is in location]Grandpa's shirt and Honey's portable transistor radio are[else]Honey's portable transistor radio is[end if] on the bank under the tree playing music.
[paragraph break][first time]Looking around, you see places you can go: [only][available_exits]".
Understand "grassy/-- clearing" as Room_Grassy_Clearing.

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
	It is a [[familiar]] device.
	The printed name is "Honey's portable transistor radio".
	The description of the radio is "[one of]Honey's little portable transistor radio is sitting on the bank [if grandpas_shirt is in location]beside grandpa's shirt [end if]under the tree. You've always been fascinated by it, as much by its perfect cube shape and woodgrain finish as anything. The tiny volume knob is missing, but there is a piece of something that looks like wax or plastic jammed in its place. The[or]Honey's transistor[stopping] radio is on and is tuned to a station playing pop music."
	Understand "knob", "cube", "woodgrain", "plastic", "wax", "music", "finish" as the portable transistor radio.
	The scent is "ozone".

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

The creek is scenery in Room_Grassy_Clearing.
	The description is "You can't see the creek through the tall brambles, but you can hear it.".

A sycamore tree is [climbable] scenery in Room_Grassy_Clearing.
	The description is "You know this is a sycamore tree from YWCA Nature Camp. White flaky bark, big broad furry leaves.".

Some stubbly grass is scenery in Room_Grassy_Clearing.
	It is an enterable [lie-able] supporter.
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

Chapter - Room_Willow_Trail

Section - Description

Room_Willow_Trail is a room.
The printed name is "Willow Trail".
The description is "This is a trail running roughly parallel the creek with tall blackberry brambles on either side. In one place, there are [willows] hanging down over the trail that tickle the back of your neck as you duck under them.
[paragraph break][available_exits]".
Understand "willow/willows trail/--" as Room_Willow_Trail.

Section - Navigation

Room_Willow_Trail is south of Room_Blackberry_Tangle and down from Room_Blackberry_Tangle.

The available_exits of Room_Willow_Trail are "The trail turns to cross the overgrown stone bridge across Bear Creek. [if Scene_Day_One has not ended]You came this way with Honey and Grandpa this morning. [end if]Or you can go back toward the grassy clearing upstream. It also looks like this trail used to continue on this side downstream, but is now hidden by underbrush. You could try to follow the lost trail."

Section - Objects

Section - Backdrops and Scenery

Willows are scenery. It is in  Room_Willow_Trail. "Weeping willows dangle over the trail. These are smaller trees than the ones that line the banks of Bear Creek.".
Understand "tree/trees/willow/lush/green", "willow trees" as willows.

Section - Rules and Actions


Chapter - Room_Lost_Trail

Room_Lost_Trail is a room.
The printed name is "Lost Trail".
The description is "You follow the trail on this side of the creek until it is lost, then bushwhack for a little bit, before returning discouraged. Perhaps it is a trail, but there are definitely easier ways to go for now. Still you wonder where it goes.
[paragraph break][available_exits]".
Understand "lost/-- trail", "underbrush" as Room_Lost_Trail.

Section - Navigation

Room_Lost_Trail is south of Room_Willow_Trail.

The available_exits of Room_Lost_Trail are "Try as you might, looks like you don't have much choice but to head back to the wIllow trail."


Chapter - Room_Dappled_Forest_Path

Section - Description

Room_Dappled_Forest_Path is a room.
The printed name is "Dappled Forest Path".
The description is "This is a wide path, more of a long meadow really, that cuts through the forest toward the creek. Clumps of occasional trees making forrays from the denser woods create patches of pleasant dappled light. There are scattered thickets of blackberry here.
[paragraph break][available_exits]".
The scent is "tangy pine".
Understand "dappled/-- forest/-- path" as Room_Dappled_Forest_Path.

Section - Navigation

East of Room_Dappled_Forest_Path is Room_Forest_Meadow.
West of Room_Dappled_Forest_Path is Room_Blackberry_Tangle.
South of Room_Dappled_Forest_Path is Room_Dark_Woods_North.

The available_exits of Room_Dappled_Forest_Path are "You can make your way back to your forest meadow and your fort, or you can continue west toward the creek. A break in the woods to the south goes somewhere."

Section - Objects

Section - Backdrops & Scenery

Chapter - Room_Stone_Bridge

Section - Description

Room_Stone_Bridge is a room.
The printed name is "Stone Bridge".
The description is "[one of]The trail crosses an old stone bridge -- an excellent place to sit on a sunny day -- from which you can look down into Bear Creek[or]The road may have crossed the creek over an old stone bridge at one time but is now just a narrow trail. From here you can peer down into Bear Creek[stopping]. Movement in the sparkling water and the old mossy bridge catch your eye. [stuff_about_the_creek].
[paragraph break][available_exits]".
The scent is "cool creek water and mossy stone".
Understand "old/-- stone/-- bridge", "river/creek" as Room_Stone_Bridge.

Section - Navigation

Room_Stone_Bridge is west from Room_Willow_Trail and down from Room_Willow_Trail.

The available_exits of Room_Stone_Bridge are "On one side of the bridge, the path turns out into a dirt road that runs parallel to the creek. On the other side, the blackberry trail goes up the creek back toward the berry picking spot. You can also get in the creek or go to a grassy bank from here."

Section - Objects

Section - Backdrops and Scenery

The old stone bridge is scenery in Room_Stone_Bridge.
It is a enterable supporter.
The description is "The trail goes over the old bridge that was probably part of some old road. The stones of the old bridge are covered with moss. Horsetails and ferns are growing at the shady base of the bridge.".
Understand "base/bridge/trail/narrow/under" as old stone bridge.

Bear Creek is scenery in Room_Stone_Bridge.
It is an unopenable enterable open container.
The description is "In places, the creek seems like just a trickle, then other places it is as wide as a river. Here, it is broad and shallow as it [if player is in Room_Stone_Bridge]goes under the bridge[otherwise]flows over and around the rocky creek bed[end if]. There are bright stars twinkling on the water with pebbles and tiny minnows below. It smells like wet rocks.
[paragraph break][stuff_about_the_creek]."
Understand "river/crick/water/stream/bed" as Bear Creek.
The scent is "cool creek water. It tingles your nose sort of".

Some floating_stuff is scenery in Bear Creek.
Understand "leaf/leaves/skeeters/shimmering/flash/little/minnow/minnows/branch/branches/stick/sticks/stars/star/reflection/reflections/pebble/pebbles" as floating_stuff.

A boulder is scenery in Room_Stone_Bridge.
It is a lie-able enterable supporter.
The printed name is "boulder in the creek".
The description is "Near the grassy bank, there is a rounded boulder in the creek. It looks like a turtle emerging from the water." Understand "boulders/rounded/turtle/rock/rocks" or "big rock" as boulder.

The grassy bank is scenery in Room_Stone_Bridge.
It is a lie-able enterable supporter.
Understand "grass/shore" as grassy bank.

Some moss is scenery in  Room_Stone_Bridge.
The description of moss is "Thanks to science camp, you're able to identify plants in the Riparian Zone. That means the area around the banks of a river."
Understand "horsetail/horsetails/fern/ferns/moss/mosses", "horse tails" as moss.

Section - Rules and Actions

To say stuff_about_the_creek:
	say "[one of]You watch two leaves swirl by on the current[or]You follow water skeeters darting about[or]You catch a glimmering flash in the depths near a boulder[or]Little minnows are swimming about in the shallows[or]A branch floats by, catching for a moment on the bottom, and then continues on[in random order]";

Instead of entering Bear Creek, try doing_some_swimming.

Instead of doing_some_swimming in Room_Stone_Bridge:
	say "The water is too shallow to swim, so you roll up your pant legs and wade in, soaking your tennies. Uh oh, will you get in trouble for that? But the water is chill and refreshing.";
	make tennis_shoes wet	;
	now dry_time of tennis_shoes is 10;


Part - Region_River_Area

Section - Description

Region_River_Area is a region.
Room_Swimming_Hole, Room_Crossing, and Room_Other_Shore are in Region_River_Area.

Section - Navigation

The return_dest of Region_River_Area is Room_Grassy_Clearing.
The forward_dest of Region_River_Area is Room_Grandpas_Trailer.
The upstream_dest of Region_River_Area is Room_Swimming_Hole.
The downstream_dest of Region_River_Area is Room_Crossing.
The uppath_dest of Region_River_Area is Room_Long_Stretch.
The downpath_dest of Region_River_Area is Room_Crossing.

Section - Objects

Section - Backdrops

Some backdrop_thick_trees are backdrop in Region_River_Area.
The description of backdrop_thick_trees is "The thick trees overhead make deep shade below, a welcome relief from the summer heat. The [if current_time_period is morning]morning light[otherwise]afternoon light[end if] filters through the leaves."
Understand "trees", "tree", "branches", "leaves", "overhead" as backdrop_thick_trees.

Some backdrop_sunlight is backdrop in Region_River_Area.

Section - Rules and Actions

[Instead of examining sunlight when in Region_River_Area, try examining thick trees.
Instead of examining shade when in Region_River_Area, try examining thick trees.]


Chapter - Room_Swimming_Hole

Section - Description

Room_Swimming_Hole is a room.
The printed name is "Swimming hole".
The description is "[if player was in Room_Long_Stretch]Down a long wooded trail that zigs down the bank, you emerge from the thick woods, and the trees open up to the sky. [end if]The swimming hole lies before you, a deep pool carved out of and surrounded by smooth granite rocks. It is big enough that you can swim like they taught you at the YWCA from one end to the other, and deep enough to dive off the rocks.
[paragraph break][available_exits]".
The scent is "cool creek water and mossy rocks".
Understand "swimming/-- hole/pool", "hole/pool", "zigzag/steep trail" as Room_Swimming_Hole.

Section - Navigation

Room_Swimming_Hole is east of Room_Long_Stretch, and down from Room_Long_Stretch.

The available_exits of Room_Swimming_Hole is "It is possible to walk along the rocky shore downstream to another spot along the creek. Back up the trail leads through the woods back to the dirt road."

Section - Objects

A pool_log is a thing in Room_Swimming_Hole.
The printed name is "floating length of log".
The description is "There is a floating length of log here, bobbing around at the edges of the swimming hole."
Understand "floating length of log" and "log/wood/driftwood/floating/length" as pool_log.

Section - Backdrops and Scenery

The deep pool is scenery in Room_Swimming_Hole.
It is a enterable unopenable open container.
The description is "The creek tumbles down some big granite rocks here and forms a deep pool. You can't see the bottom. And that makes you [nervous]."
Understand "river/creek/Bear/crick/water/stream/bed/swimming/hole" as deep pool.

Some smooth granite rocks are [lie-able] undescribed supporters in Room_Swimming_Hole.

Section - Rules and Actions

Instead of going to Room_Swimming_Hole when player is in Room_Long_Stretch:
	say "As you step out of the oppressive heat, the cool shade is a welcome relief. You work your way down the steep trail.";
	continue the action.

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

Before going from Room_Swimming_Hole, put clothes back on.

Instead of entering deep pool, try doing_some_swimming.

Instead of jumping in Room_Swimming_Hole, try doing_some_swimming.

Deep pool has a number called swim attempts. Swim attempts is 0.

Instead of doing_some_swimming in Room_Swimming_Hole:
	increase swim attempts of deep pool by 1;
	if swim attempts of deep pool is greater than 1:
		say "[if clothes are worn]You look around again to see if you are alone[one of]. The path from the dirt road is deep forest and there is no one else at the swimming hole[or] and there is no one in sight[stopping]. So you carefully strip down to your skivvies, folding your clothes on the rocks. [run paragraph on][end if][one of][swimming_payoff][or]You leap in! Cold! But you get used to it, and it feels good. Actually, it feels great, as you swim around for a bit[or]You try diving like they taught you at the YWCA, but you're scared of conking your head. So your uncommitted dive turns into a belly flop[or]You make a huge splash[or]The water feels refreshing on this hot day[or]You dip in the cool water and swim about[stopping]. When you get out of the water, [one of]the warm air feels good on your skin[or]you dry quickly in the warm air[or]you stand in the cool shade, and you get a sudden chill[in random order].[paragraph break]";
		now player is courageous;
		now player is swim-experienced;
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
Understand "crossing", "rocky/-- shore" as Room_Crossing.

Section - Navigation

North of Room_Crossing is Room_Swimming_Hole.
East of Room_Crossing is Room_Other_Shore.

The available_exits of Room_Crossing are "The shoreline ends at a steep bank further downstream, though it looks like you might be able to cross the creek to the other shore on the boulders in midstream. You can also go back along the rocks to the swimming hole upstream."

Section - Objects

A bridge_log1 is a fixed in place enterable supporter in Limbo.
	"A log has floated down the creek and is wedged in the boulders in the middle of the creek."
	The printed name is "a floating length of log".
	The description is "A log has floated downstream in the swift current. It is wedged between two boulders forming a kind of bridge."
	Understand "bridge", "wood", "driftwood", "drift wood", "driftlog", "drift log", "scary" as bridge_log1.

Section - Backdrops and Scenery

Some boulders are scenery in Room_Crossing.
The description is "There are scattered boulders in the creek bed on which you might be able to cross."
Understand "boulder", "stones", "stepping", "rocks" as boulders.

The swift current is scenery in Room_Crossing.
It is a enterable unopenable open container.
The description is "The river here narrows to a swift current, too broad to jump across and too swift to wade or swim -- or in any case, you're not willing to risk drowning here."
Understand "river/creek/Bear/crick/water/stream/bed/gap/chasm" as swift current.

A steep bank is scenery in Room_Crossing.
The description of steep bank is "It's pretty steep. And covered in poison oak."
Instead of climbing steep bank, say "You try to climb the bank, but slide back down. Too steep. Maybe you can cross the creek to the other side."

A steep bank is scenery. It is in Room_Crossing. The description of steep bank is "It's pretty steep. And covered in poison oak."

Section - Rules and Actions

Test crossing with "s.s.s.w.w.s.e.s.".

Instead of going to Room_Crossing when player was in Room_Swimming_Hole:
		say "You carefully navigate the rocky bank, making your way downstream.";
		Continue the action.

Instead of taking bridge_log1, say "Too heavy."

Instead of climbing steep bank, say "You try to climb the bank, but slide back down. Too steep. Maybe you can cross the creek to the other side."

Instead of going east when player is in Room_Crossing and bridge_log1 is not visible:
	say "You [one of]get part way across on the boulders[or]hop from boulder to boulder out into the broad river[in random order], but there is an open spot in the middle and a really swift current."

Instead of jumping when player is in Room_Crossing and bridge_log1 is not visible:
	say "You consider jumping across the sizeable gap across the creek, but the slippery rocks make you reconsider."
Understand "jump across" as jumping when player is in Room_Crossing.

Instead of entering swift current, try doing_some_swimming.

Instead of doing_some_swimming in Room_Crossing:
	say "The current here is too strong and it scares you. You saw a TV show once with your grandpa about people in rafts and one man who fell off and got caught under a rock and drowned. You think better of the idea.";


Chapter - Room_Other_Shore

Section - Description

Room_Other_Shore is a room.
The printed name is "Other Shore".
The description is "[if Scene_Day_Two has not happened]You are on the far side of the creek where trees come right down to the water. [else]You are back at Bear Creek on the other shore from the swimming hole and the road.  Trees come right down to the water. [end if]A wooded trail goes into the forest.
[paragraph break][available_exits]".
The scent is "cool creek water and mossy rocks".
Understand "other/-- shore" as Room_Other_Shore.

Section - Navigation

West of Room_Other_Shore is Room_Crossing.
East of Room_Other_Shore is Room_Wooded_Trail.

The available_exits of Room_Other_Shore are "[if Scene_Day_Two has not happened]The creek here curves around in a funny way, but you're pretty sure that this trail must connect with the willow trail on this side of the creek. That was this way, right? This trail is darker and more wooded, but it looks like it gets lighter up ahead. Back the way you came, you can get most of the way across the creek by hopping from boulder to boulder.[else]You can get back across the creek by hopping from boulder to boulder and crossing on the log. Or you can go back the way you came on the wooded trail.[end if]"

Section - Objects

A bridge_log2 is a fixed in place enterable supporter in Room_Other_Shore.
	"A log has floated down the creek and is wedged in the boulders in the middle of the creek."
	The printed name is "a floating length of log".
	The description is "A log has floated downstream in the swift current. It is wedged between two boulders forming a kind of bridge."
	Understand "bridge", "wood", "driftwood", "drift wood", "driftlog", "drift log", "scary" as bridge_log2.

Section - Backdrops and Scenery

[TODO: Should the river be scenery?]
The broad river is scenery. It is in Room_Other_Shore. It is a enterable unopenable open container.
Understand "river/creek/Bear/crick/water/stream/bed/gap/chasm" as broad river.

[Some stones are undescribed fixed in place enterable supporters in Room_Other_Shore. The printed name is "boulders". The description is "There are scattered boulders in the creek bed on which you might be able to cross."
Understand "boulders", "boulder", "stones", "stepping", "rocks" as some stones.]

Section - Rules and Actions



Part - Region_Long_Road

Region_Long_Road is a region.
Room_Dirt_Road, Room_Long_Stretch, Room_Railroad_Tracks, Room_Grassy_Field are in Region_Long_Road.

Section - Backdrops & Scenery

Some sunlight is backdrop in Region_Long_Road.

The rutted_road is backdrop in Region_Long_Road.
	The description is "The old creekside road is seldom used now and in poor condition with deep ruts and sandy areas. Nowadays it is only used by people walking down to Bear Creek from the highway, fishermen and berry pickers mostly. There is tall grass growing right down the middle of the road.".
	Understand "road/trail/path/ruts/sand", "deep ruts", "tall grass" as rutted_road.

Section - Navigation

The return_dest of Region_Long_Road is Room_Grassy_Clearing.
The forward_dest of Region_Long_Road is Room_Grandpas_Trailer.
The upstream_dest of Region_Long_Road is Room_Stone_Bridge.
The downstream_dest of Region_Long_Road is Room_Picnic_Area.
The uppath_dest of Region_Long_Road is Room_B_Loop.
The downpath_dest of Region_Long_Road is Room_Dirt_Road.


Chapter - Room_Dirt_Road

Section - Description

Room_Dirt_Road is a room.
The printed name is "Dirt Road".
The description is "[one of]The trail over the stone bridge turns into a dirt road here which slopes gently upward running along the creek.[or]The dirt road slopes down as it runs along the creek before turning into a trail over the stone bridge[stopping]. The old creekside road is seldom used now and in poor condition with deep ruts and sandy areas. Nowadays it is only used by people walking down to Bear Creek from the highway, fishermen and berry pickers mostly. Here, someone's field backs up to the road and is separated by a chain link fence. The field is a mass of tall weeds and old junk cars.
[paragraph break][available_exits]".
The scent is "sunshine and dust".
Understand "dirt/-- road" as Room_Dirt_Road.

Section - Navigation

Room_Dirt_Road is west of Room_Stone_Bridge.

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

Instead of going to Room_Long_Stretch when player is in Room_Swimming_Hole:
	say "You clamber up the steep trail. As you step out of the shaded trail, the heat is like a physical force that pushes against you.";
	continue the action.

Instead of jumping in Room_Long_Stretch, try going up.


Chapter - Room_Railroad_Tracks

Section - Description

Room_Railroad_Tracks is a room.
The printed name of Room_Railroad_Tracks is "Southern Pacific Tracks".
The description of Room_Railroad_Tracks is "Railroad tracks cross the old dirt road here in a small rise. The tracks run alongside the trailer park fence in one direction and into a tunnel of green in the other. As you cross the tracks, you see a sign that says 'Property of Southern Pacific.'[first time] Your grandpa sometimes takes you down here to watch the train go by. He taught you the name of all the cars and used to work on the railroad.[only]
[paragraph break][available_exits][penny_status]".
The scent is "dust and grease".
Understand "railroad/train/-- tracks/crossing", "southern pacific tracks" as Room_Railroad_Tracks.

Section - Navigation

Room_Railroad_Tracks is south of Room_Long_Stretch.

The available_exits of Room_Railroad_Tracks is "Across the tracks is a grassy field and the trailer park beyond. Back the other way is the long dirt road gently sloping down along the creek. Or you could follow the railroad tracks which disappear into a green tunnel of trees."

Section - Objects

Some train tracks are an undescribed fixed in place enterable supporter in Room_Railroad_Tracks.
	The description is "The steel rails are shiny on top and rusty on the sides. the wooden ties are supported by a mound of dark gray rock.".
	Understand "tracks", "track", "rails", "rail", "traintracks", "railroad", "rail road", "ties", "rusty", "shiny" as train tracks.

A penny is in Room_Railroad_Tracks.
	"Hey, there's the penny you lost when you came here with Grandpa to make train pennies!"
	The description of penny is "Ah, this is a wheat penny. Its tiny numbers say 1956.".

A flattened coin is a described thing in Limbo.
	The initial appearance is "[if player is not in Room_Dream_Railroad_Tracks]Hey, the train flattened the wheat penny! You made a lucky coin![else]Your lucky penny is here.[end if]".
	The description is "The train rolled over your penny and turned it into a flattened oval. You can't read it anymore, but you can see a very faint image of Lincoln with a stretched head.".
	The printed name of the flattened coin is "flattened train penny."
	Understand "penny/lucky/flattened/flat/coin", "train penny" as flattened coin.

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

Section - Rules and Actions

Understand "catch crickets/grasshoppers", "hunt crickets/grasshoppers", "get crickets/grasshoppers" as a mistake
	("You sit for a minute in the grass watching carefully, but apparently they are not home. You get up a little disappointed.").

Instead of climbing back fence, say "Perhaps it is easier to just go around through the gate."

Instead of doing anything except examining to back gate:
	say "You better leave that alone. You don't want to get in trouble."

Gate-going is an action applying to nothing.
Understand "go to/through/in/-- back/-- gate", "enter back/-- gate", "exit back/-- gate" as gate-going.

Carry out gate-going:
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
Room_Halfway_Up, Room_Top_of_the_Pine_Tree are in Region_Up_In_Tall_Fir.

Section - Backdrops & Scenery

Some sunlight is backdrop in Region_Up_In_Tall_Fir.

Section - Navigation

The return_dest of Region_Up_In_Tall_Fir is Room_Long_Stretch.
The forward_dest of Region_Up_In_Tall_Fir is Room_Top_of_the_Pine_Tree.
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
		Now player is tree-experienced;
		continue the action;

Instead of climbing Doug_Fir2:
	try going up.

Instead of climbing up when player is in Room_Halfway_Up:
	try going up.

Does the player mean climbing the Doug_Fir2 when player is in Room_Halfway_Up:
	It is very likely.
Does the player mean climbing up the Doug_Fir2 when player is in Room_Halfway_Up:
	It is very likely.

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


Chapter - Room_Top_of_the_Pine_Tree

Section - Description

Room_Top_of_the_Pine_Tree is a room.
The printed name is "Room_Top_of_the_Pine_Tree".
The description is "This is very close to the very top. You are holding on to the narrow trunk of the tree. You can feel it sway in the faint breeze. It is slightly cooler up here. [treetop_payoff]".
The scent is "pine sap".

Section - Navigation

Room_Top_of_the_Pine_Tree is up from Room_Halfway_Up.

The available_exits of Room_Top_of_the_Pine_Tree is "Only one way to go from here and that's down."

Section - Objects

Section - Backdrops & Scenery

A Doug_Fir2 is backdrop in Room_Top_of_the_Pine_Tree.

The distant-creek is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "Bear Creek". The description is "Except for near the stone bridge and the swimming hole, you can only see tiny snatches of Bear Creek. Mostly, it is a dense line of trees that crosses under you.".
Understand "creek/water/stream", "Bear Creek" as distant-creek.

The distant-river is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "faraway river". The description is "You can barely see it in the summer haze. Looking beyond the faraway highway where the foothills flatten out, you can see a ribbon of green that you think is the river.".
Understand "faraway river", "river/valley/ribbon/highway/foothills" as distant-river.

The distant-town is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "distant town". The description is "You can't really see town, but you can see a few buildings, a church steeple, a water tower peeking through the trees beyond the hill.".
Understand "distant town", "town/steeple/church/tower/buildings", "church steeple", "water tower" as distant-town.

The distant-road is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "dirt road". The description is "You can see the long stretch of the dirt road under you from the train tracks to the stone bridge. [if dog is not loose]You can't quite see the dog and the fence[else]You see [italic type]something[roman type] moving around in the road[end if].".
Understand "road/trail/path/stretch/dog", "dirt road", "long stretch" as distant-road.

The distant-bridge is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "stone bridge". The description is "You can just make out the stone bridge, the grassy bank, part of the creek through the trees. Even from here, it looks shady and nice.".
Understand "bridge/stone/grassy/bank/shady", "grassy bank", "stone bridge" as distant-bridge.

The distant-pool is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "swimming hole". The description is "It is hard to see through the trees, but you can see sunlight glinting off the water in the swimming hole.".
Understand "swimming/hole/pool/glint/reflection", "swimming hole" as distant-pool.

The distant-forest is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "distant forest". The description is "The forest rolls out dark and endless over the hills that surround you."
Understand "distant forest", "forest/woods/trees/hills/around/mountains" as distant-forest.

The distant-tracks is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "railroad tracks". The description is "The tracks wind below you from beyond town out past the trailer park and the highway."
Understand "track/tracks/railroad/train", "train/railroad tracks" as distant-tracks.

The distant-trailers is scenery. It is in Room_Top_of_the_Pine_Tree. The printed name is "trailer park". The description is "You can see a bunch of trailers in neat rows and the picnic bench and the gate and some people moving around. You can't see your bike or tell which one is Honey and Grandpa's trailer though."
Understand "trailer/trailers/park" as distant-trailers.

Section - Rules and Actions

Test treetop with "s.s.s.w.w.s.u.u.u.u.u.u.".

Instead of going to Room_Top_of_the_Pine_Tree when player is in Room_Halfway_Up:
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
		Now player is treetop-experienced;
	otherwise:
		say "You slowly climb to the top of the tree, carefully avoiding weak or thin branches.";
	continue the action.

Instead of going to Room_Halfway_Up when player is in Room_Top_of_the_Pine_Tree:
	say "You carefully work your way down from the top, avoiding the thinner branches.";
	continue the action.

Instead of jumping in Room_Top_of_the_Pine_Tree,
	say "Looking down, you get a sudden crazy urge to leap into space. You resist the urge.";

Instead of yelling in Room_Top_of_the_Pine_Tree,
	say "Your [one of]scream echoes off the surrounding hills[or]yell is heard far and wide[or]shriek causes a nearby flock of birds to take flight and it is known by all the monkeys of the forest that you are the undisputed leader of the monkeys now and forever[at random].";

Instead of throwing when player is in Room_Top_of_the_Pine_Tree:
	try dropping the noun.

Instead of dropping when player is in Room_Top_of_the_Pine_Tree:
	say "You're not likely to find that again if you throw that from here. You change your mind."

[Does the player mean examining distant-train:
	it is very likely.
Does the player mean examining distant-tracks:
	it is possible.]

Does the player mean room_navigating Room_Railroad_Tracks when player is in Room_Grassy_Field or player is in Room_Long_Stretch:
	it is very likely.


Part - Region_Trailer_Park_Area

Region_Trailer_Park_Area is a region.
Region_Trailer_Outdoors is a region.
Region_Trailer_Indoors is a region.

Region_Trailer_Outdoors and Region_Trailer_Indoors are in Region_Trailer_Park_Area.

Room_Picnic_Area, Room_B_Loop, Room_C_Loop, Room_D_Loop are in Region_Trailer_Outdoors.

Room_Sharons_Trailer, Room_Lees_Trailer, Room_Grandpas_Trailer are in Region_Trailer_Indoors.

Section - Backdrops & Scenery

Some sunlight is backdrop in Region_Trailer_Outdoors.

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


Chapter 2 Room_Picnic_Area

Section - Description

Room_Picnic_Area is a room.
The printed name is "Picnic Area".
The description of Room_Picnic_Area is "At the back of the trailer park, there is a scraggly little Room_Picnic_Area with a patchy lawn that smells like mowed grass. A little cluster of tall trees is against the back fence.
[paragraph break][available_exits]".
The scent is "dust and mowed grass".
Understand "picnic area" as Room_Picnic_Area.

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
	"There is an impressive red ant hill near the picnic table[first time]. Red ants are your sworn enemies. They're the ones who started the war, not you. A bunch of them ganged up and bit you, and all you were doing was trying to put them in a bottle for your ant colony[only]. [ant stuff].".
	The description is "This ant hill rises up higher than the top of your sneakers. [ant stuff].".
	Understand "anthill/anthole", "ant hill/colony/mound/burrow/hole", "hill/colony/mound/burrow/hole", "red ant/ants" as ant hill

Some remains, a seed, and a drop of something on the pavement are scenery in Room_Picnic_Area.

A huge Jerusalem cricket is scenery in Room_Picnic_Area.
The description is "This huge translucent brown bug is totally gross when it is alive, so now that it is half smashed, half decayed and swarming with red ants, it is indescribably disgusting. You are totally fascinated.";

Section - Rules and Actions



Chapter 3 Room_D_Loop

Section - Description

The Room_D_Loop is a room.
The printed name is "D Loop".
The description is "The D Loop of the trailer park is pretty much like the B and C Loops. Rows of trailers on either side, many fringed with teeny tiny gardens of flowers and shrubs. The most noteworthy thing on this loop is the Cat Lady's trailer, painted bright pink and white with an outrageously overflowing flower garden out in front.
[paragraph break][available_exits]".
The scent is "that smell when water falls on hot asphalt".
Understand "D Loop" as Room_D_Loop.

Section - Navigation

The Room_D_Loop is west of Room_Picnic_Area.

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

Instead of going inside when player is in Room_B_Loop:
	try room_navigating Room_Grandpas_Trailer.

Instead of entering grampas_virtual_trailer:
	try room_navigating Room_Grandpas_Trailer.

[Instead of object_navigating grampas_virtual_trailer when player is in Room_B_Loop:
	try room_navigating Room_Grandpas_Trailer.]

Instead of inserting something into grampas_virtual_trailer:
	say "You might want to just go in there."


Chapter 4 Room_Sharons_Trailer

Section - Description

Room_Sharons_Trailer is a room.
The printed name is "Cat Lady's Trailer".
The description is "[one of]The first thing you notice is the smell of cat pee and rotten fish[or]You are starting to get used to the smell[stopping]. Rose-tinted light comes slanting through the dingy ruffled curtains. The Cat Lady's Trailer is full of lace doilies, porcelain figurines, and most of all cats -- sitting, lying, prowling, and meowing. The little figures catch your eye."
The scent is "Yucky fish and cat pee".
Understand "catlady's/catladys/sharon's/sharons/shannon's/shannons/pink/-- trailer/house/place/home", "cat lady's/ladys trailer/house/place/home" as Room_Sharons_Trailer.

Section - Navigation

Room_Sharons_Trailer is south of Room_D_Loop.

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

Cat Lady's couch is scenery in Room_Sharons_Trailer.
	Cat Lady's couch is an undescribed fixed in place enterable lie-able supporter.
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

The Cat Lady's TV is scenery in Room_Sharons_Trailer.
	The Cat Lady's TV is a device. The printed name is "TV".
	The indefinite article is "the Cat Lady's".
	The description is "This is a standard color set, but not as big and fancy as Honey's.".
	Understand "television/tele/tely/telly/boob/tube/set" as Cat Lady's TV.

Knickknacks are scenery.
	They are in Room_Sharons_Trailer.
	The description of knickknacks is "The house is full of this stuff. Especially little porcelain figurines of cats. On little shelves, in glass cabinets, everywhere[if player does not hold Mika figure][one of]. You notice[or]. You are especially taken with[stopping] one that looks exactly like Mika[end if].".
	Understand "Porcelain", "figurines", "figures", "sculpture", "lace", "doilies", "shelves", "shelf", "glass", "cabinets", "cabinet" as knickknacks.

Mika figure is an undescribed sinking thing in Room_Sharons_Trailer.
	The description of Mika is "It looks just like your cat Mika. It's white and black with all the spots in the right place. It even has Mika's one droopy ear.".
	Understand "figurine", "statue", "sculpture", or "toy" as Mika.
The Mika figure can be palmed.

Section - Rules and Actions

Instead of exiting when player is in Room_Sharons_Trailer:
	try room_navigating Room_D_Loop.
Instead of going outside when player is in Room_Sharons_Trailer:
	try room_navigating Room_D_Loop.

Instead of drinking teacup:
	if player does not hold teacup:
		silently try taking teacup;
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

Instead of switching on the Cat Lady's TV:
	if Cat Lady's TV is not switched on:
		say "[first time][description of Cat Lady's TV]
		[paragraph break][only]The moment you start to turn it on, the Cat Lady comes in and says, 'Let's keep that off for now. My shows are on soon. You can watch with me then.'";

Instead of taking Mika:
	if player is in Room_Sharons_Trailer:
		say "[one of]You quickly palm the figurine, but the Cat Lady[if Sharon is in Room_D_Loop] comes in at just that moment and [end if] immediately notices it missing. 'Oh be careful with that, Dear,' she says, plucking the Mika figure out of your hand. 'That was made all the way in Ohio.' She places it back on the shelf in the exact same place. [if Sharon is in Room_D_Loop]
		[paragraph break]She looks back at you one more time before going back out to her garden[end if][or]You're not sure you want to risk it again[stopping].";
		now Mika figure is palmed;
		now Mika is familiar;
	otherwise:
		continue the action;

Before going north when player is in Room_Sharons_Trailer and (Mika has been palmed):
	say "You look at the Cat Lady[if Sharon is in Room_D_Loop] outside watering her plants[otherwise] who's not paying attention for one moment[end if] and[paragraph break]with your heart pounding in your throat, you pocket the little Mika figurine.";
	Now player holds Mika;
	Now player is courageous;

[Instead of doing anything except object_navigating or examining or taking or quizzing or informing or implicit-quizzing or implicit-informing Mika, say "Best to just keep that in your pocket for now."]

Instead of touching Mika,
	try examining Mika.

Instead of showing Mika to Sharon,
	try giving Mika to Sharon.

Instead of giving Mika to Sharon:
	Say "[one of]'Well, I'll be. You are an honest, sweet little child.' she says. 'That little black and white cat was given me by my Joseph, God rest his soul. But, dearie, I want you to have it now. It belongs with you.' There are tears in her eyes. She closes your fist around the figurine and pats your hand, 'And you keep that little kitty safe now, you hear?' A shiver seems to pass though the Cat Lady, and she says seriously, 'And yourself too.'[or]She shakes her head, no.[stopping]";
	Now player is compassionate;
	Now player is mika-experienced;




Chapter 5 Room_C_Loop

Section - Description

The Room_C_Loop is a room.
The printed name is "C Loop".
The description is "C Loop is pretty much like B and D Loops. Rows of trailers on either side, all different colors[one of], though the one's across from Lee's trailer go red, brown, green, red, brown, green, which is weird. Did they do that on purpose?[run paragraph on][or].[run paragraph on][stopping] The most noteworthy thing on this loop for you is Lee's trailer, though it looks pretty much like every other one. [line break]
[paragraph break][available_exits]".
The scent is "Lee's cigarette smoke lingering in the air".
Understand "C Loop" as Room_C_Loop.

Section - Navigation

The Room_C_Loop is west of Room_D_Loop.

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
	Understand "stinky/cigarette/butts" as coffee can.

Trailers are backdrop in Room_C_Loop.
Gardens are backdrop in Room_C_Loop.
Big old cars are backdrop in Room_C_Loop.

Section - Rules and Actions

Instead of going inside when player is in Room_C_Loop:
	try room_navigating Room_Lees_Trailer.

Instead of entering lees_virtual_trailer:
	try room_navigating Room_Lees_Trailer.

[Instead of object_navigating grampas_virtual_trailer when player is in Room_B_Loop:
	try room_navigating Room_Grandpas_Trailer.]

Instead of inserting something into lees_virtual_trailer:
	say "You might want to just go in there."


Chapter 6 Room_Lees_Trailer

Section - Description

Room_Lees_Trailer is a room.
The printed name is "Lee's Trailer".
The description is "Lee's trailer is empty. Or nearly so. [first time]It looks like he moved in yesterday, but you know he's been here for a long time. Where is his furniture?[only] There is a small table with some stuff on it and a single chair. A tiny black and white TV on a crate. And that's about it.".
The scent is "Lee's cigarette smoke lingering in the air".
Understand "Lee's/lees Trailer" as Room_Lees_Trailer.

Section - Navigation

Room_Lees_Trailer is south of Room_C_Loop and inside from Room_C_Loop.

Section - Objects

The Lee's table is a undescribed fixed in place enterable sit-at-able supporter in Room_Lees_Trailer.
	The printed name is "table".
	The indefinite article is "Lee's".
	The description is "Like the rest of Lee's trailer, the table is mostly empty[if there is something on Lee's table]. On the table, there's [a list of things on Lee's table][end if].".
	Understand "chairs", "chair" as Lee's table.

A newspaper is floating undescribed thing on Lee's table.
	The description is "[if newspaper is wet]The newspaper has gotten wet and is now unreadable[else if newspaper is stained]The newspaper is stained and is now unreadable[else]This is the local newspaper. Usually when grandpa reads the newspaper or Honey does the crossword, you ask for the comics[one of]. An article on the front page catches your eye[or]. Among the usual disasters, bombings, and boring politics, there is an article about the Viking lander to Mars[stopping][end if]."
	Understand "news/newspaper/paper/journal" as newspaper.
	The dry_time is 20.
	The newspaper can be stained.

An article is an undescribed part of the newspaper.
	The description is "[if newspaper is wet]The soggy newspaper is pretty much unreadable until it dries out.[else]Among the articles about a disaster in China (some dam broke and killed a lot of people), bombings in England, some stuff about Vietnam, and lots and lots of boring politics, there is a cool article about the Viking space probe! The first space ship to the surface of Mars! Will they find water? Martian people? (Unlikely. The orbital probes didn't see any sign of a Martian civilization.) There is a photo and a diagram of the Viking lander on page 3 and you memorize all the parts.
	[paragraph break]You spend a few minutes thinking about being an explorer on the Martian surface, where you'd weigh less than half of what you do on Earth and would be able to jump high in the air like a superhero. If you could do that here, you would leap out of the trailer park, up into the top of the big pine tree.[end if]".
	Understand "article/story/viking/lander/mars/comics/comic" as article.

A coffee mug is an undescribed unopenable open container on Lee's table.
	The indefinite article is "Lee's".
	The description is "The mug has some kind of blue and yellow coat of arms on it, and says underneath in fancy letters 'Brave and True.'[run paragraph on] [if coffee mug is empty]There is nothing in Lee's coffee mug except gross.[end if][line break]".
	Understand "mug/cup/glass", "coffee mug/cup" as coffee mug.
	The scent is "stale bitter coffee".

Lee's TV is an undescribed fixed in place device in Room_Lees_Trailer.
	The printed name is "TV".
	The indefinite article is "Lee's".
	The description is "This is a tiny portable black and white set with a giant channel changer and bent rabbit ears propped on a crate[if Lee's TV is switched on] [what_show_is_playing][else].[end if]".
	Understand "television/tele/tely/telly/boob/tube/set", "boob tube", "crate/box", "rabbit ears", "antenna/antennas/antena" as Lee's TV.

Section - Backdrops & Scenery

Section - Rules and Actions

Instead of exiting when player is in Room_Lees_Trailer:
	try room_navigating Room_C_Loop.
Instead of going outside when player is in Room_Lees_Trailer:
	try room_navigating Room_C_Loop.

After inserting newspaper into pail:
	now newspaper is stained;
	now article is off-stage;
	continue the action;

Instead of taking coffee mug:
	say "Your manners suggest that it is better to leave Lee's coffee cup alone.";

Instead of switching on Lee's TV:
	if Lee's TV is not switched on:
		say "Lee is the only one who lets you watch TV whenever you want and even change the channels. You switch on Lee's little black and white set.";
	continue the action;




Chapter 7 Room_B_Loop

Section - Description

The Room_B_Loop is a room.
The printed name is "B Loop".
The description is "B Loop is just like C and D Loops, except Honey and Grandpa's trailer is right here[first time], and if you say it really really fast -- B Loop B Loop B Loop B Loop Bloop Bloop Bloop -- it sounds funny[only]. Rows of trailers on either side, some with big old cars, some not. Other than your grandparent's trailer, there's nothing really interesting here[if bicycle is visible]. Well, except for your bike[end if].
[paragraph break][available_exits]".
Understand "loop b" as Room_B_Loop.
The scent is "the scent of blackberries drifting out of Honey and Grandpa's trailer".
Understand "B Loop" as Room_B_Loop.

Section - Navigation

The Room_B_Loop is west of Room_C_Loop.

The available_exits are "You can go in to Honey and Grandpa's trailer of course. Or you can go back to C Loop and the train tracks behind the trailer park."

Section - Objects

The grampas_virtual_trailer is a fixed in place undescribed enterable container in Room_B_Loop.
	The printed name is "Honey and Grandpa's trailer".
	The description is "Honey and Grandpa's trailer is white with dark brown trim, and has hanging ferns from the porch.".
	Understand "Grandpa's/grandpas/honey's/honeys/grandma's/grandmas/-- trailer/house/place/home" as grampas_virtual_trailer.

Your bicycle is a fixed in place thing in Room_B_Loop.
	The description is "This is your trusty red Schwinn with a white banana seat. Unfortunately, the tires are so flat it barely rolls. Poo."
	Understand "bike/bicycle/red/tires/flat" as your bicycle.

Section - Backdrops & Scenery

Trailers are backdrop in Room_B_Loop.
Gardens are backdrop in Room_B_Loop.
Big old cars are backdrop in Room_B_Loop.

Section - Rules and Actions

Instead of going inside when player is in Room_B_Loop:
	try room_navigating Room_Grandpas_Trailer.

Instead of entering grampas_virtual_trailer:
	try room_navigating Room_Grandpas_Trailer.

[Instead of object_navigating grampas_virtual_trailer when player is in Room_B_Loop:
	try room_navigating Room_Grandpas_Trailer.]

Instead of inserting something into grampas_virtual_trailer:
	say "You might want to just go in there."

Instead of taking bicycle, say "Unfortunately, the tires of your bicycle are so flat it barely rolls.".

Understand "ride bike/bicycle" as a mistake ("Unfortunately, the tires of your bicycle are so flat it barely rolls.").

Understand "fix bike" as a mistake ("if only you knew how to do that, you'd ride like the wind.");


Chapter 8 Room_Grandpas_Trailer

Section - Description

Room_Grandpas_Trailer is a room.
The printed name is "Honey and Grandpa's Trailer".
The description is "This trailer feels comfy to you, as much home as your real home with your mom. Honey and Grandpa have lived here as long as you remember[one of]. All these things are touchstones of familiarity, the floral-patterned couch on which you and Grandpa cuddle and watch Bowling for Dollars, the big TV, even the brown carpeting with its mottled pattern that looks like lichen on rocks[or]. All of the familiar stuff, the couch and the TV are here[stopping].
[paragraph break]Today all the windows are steamed up. Fragrant steam wafts from the kitchen. Occasionally, you hear the rattle of jars and lids being washed and set out.".
Understand "Grandpa's/grandpas/honey's/honeys/grandma's/grandmas trailer" as Room_Grandpas_Trailer.
The scent is "what it would smell like if you lived inside a blackberry pie".


Section - Navigation

Room_Grandpas_Trailer is south of Room_B_Loop.

Section - Objects

Section - Backdrops & Scenery

The pot_of_blackberry_jam is scenery in Room_Grandpas_Trailer.
	The description of the pot_of_blackberry_jam is "The pot of blackberry jam is bubbling blackly on low heat like the La Brea Tar Pits -- but better smelling. Aunt Mary is staring off into space and stirring the pot continuously. There are jam_jars and lids set out ready to receive the jam when it is ready. Generally, Aunt Mary shoos you  away when she is making jam.".
	Understand "pot of blackberry/-- jam", "pot/pan", "blackberry/-- goo/jelly/jam/preserves", "stove/kitchen/burner" as pot_of_blackberry_jam.
	The scent is "the most intense blackberry smell ever. Like when blackberries dream of being the best blackberries they can be, this is what they dream".

Some jam_jars are scenery in Room_Grandpas_Trailer.
	The description of the jam_jars is "Jars and lids and pots and pans and paraffin and tongs and boiling water are laid out strategically all over the kitchen. Who knew making jam was so complicated?".
	Understand "jar", "lid/lids", "parafin/paraffin/wax", "tongs", "water", "boiling" as jam_jars.

Honeys_tv is undescribed fixed in place device in Room_Grandpas_Trailer.
	The printed name is "TV".
	The indefinite article is "Honey's".
	The description is "This is Honey's big color TV in its wooden case, pretty much like the one you have at home with mom, but with lighter wood. On weekend nights you lie on the floor with Grandpa and watch Bowling for Dollars, Wild World of Animals, and sometimes, if you and mom aren't going home early, Wonderful World of Disney on Sunday night.".
	Understand "honeys/honey's/-- big/color/-- television/tv/tele/tely/telly/boob/tube/set" as Honeys_tv.

The floral print couch is scenery in Room_Grandpas_Trailer.
	The floral print couch is enterable [lie-able] supporter.
		The description is "Sometimes you curl up on Honey's floral print couches with a crocheted afghan and a book and spend the afternoon.".
	Understand "sofa", "couches", "divan", "floral-print" as floral print couch.

The carpet is scenery in Room_Grandpas_Trailer.
	The carpet is an enterable [lie-able] supporter.
		The description of the carpet is "The carpet is this strange mottled gold-brown that looks a little bit like fallen Autumn leaves gone indistinct after the first winter rain. In any case, it is nice to lie on with grandpa and watch TV.".
	Understand "rug", "floor" as carpet.

Section - Rules and Actions

Instead of exiting when player is in Room_Grandpas_Trailer:
	try room_navigating Room_B_Loop.
Instead of going outside when player is in Room_Grandpas_Trailer:
	try room_navigating Room_B_Loop.

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
Room_Wooded_Trail, Room_Dark_Woods_South, Room_Dark_Woods_North, Room_Forest_Meadow, Room_Protected_Hollow, and Room_Sentinel_Tree are in Region_Woods_Area.

Section - Backdrops and Scenery

Thick trees are backdrop in Region_Woods_Area.
Some sunlight is backdrop in Region_Woods_Area.
Some shade is backdrop in Region_Woods_Area.
Instead of examining sunlight when player is in Region_Woods_Area,
	try examining thick trees.
Instead of examining shade when player is in Region_Woods_Area,
	try examining thick trees.

Section - Navigation

The return_dest of Region_Woods_Area is Limbo.
The forward_dest of Region_Woods_Area is Room_Forest_Meadow.
The upstream_dest of Region_Woods_Area is Limbo.
The downstream_dest of Region_Woods_Area is Limbo.
The uppath_dest of Region_Woods_Area is Limbo.
The downpath_dest of Region_Woods_Area is Limbo.

Section - Rules and Actions


Chapter - Room_Wooded_Trail

Section - Description

Room_Wooded_Trail is a room.
The printed name is "Wooded Trail".
The description is "[if Scene_Day_Two has not happened]You are on a wooded trail going back toward Honey and Grandpa's blackberry picking spot. You think. You're pretty sure. You hear the creek over there on your left. Or is that another little stream?[else]You are on a wooded trail that you hope leads from the dark woods to the crossing. It looks kinda familiar.[end if]
[paragraph break][available_exits]".
The scent is "musty forest smell".
Understand "wooded trail" as Room_Wooded_Trail.

Section - Navigation

North of Room_Wooded_Trail is Room_Dark_Woods_South.
West of Room_Wooded_Trail is Room_Other_Shore.

The available_exits of Room_Wooded_Trail are "[if Scene_Day_Two has not happened]Best to keep going to the wIllow trail. It should connect up here in a bit. You look back the way you came. You could always go back to the shore and cross the creek. But then there's the dog.[else]You could go back into the dark wood and try another route or you can follow this trail and see if it goes to the crossing.[end if]"

Section - Objects

Section - Backdrops

Section - Rules and Actions


Chapter - Room_Dark_Woods_South

Section - Description

Room_Dark_Woods_South is a room.
The printed name is "Dark Woods".
The description is "[if Scene_Day_Two has not happened]You are [one of]no longer sure where you are[or]not completely certain which way to go[or]confused[or]feeling lost[cycling]. The woods look familiar and altogether strange. It's difficult to get your bearings.[else]These dark woods are considerably easier to navigate by daylight. You recognize some of the landmarks you spotted last night.[end if]
[paragraph break][available_exits]".
The scent is "musty forest smell".

Section - Navigation

North of Room_Dark_Woods_South is Room_Dark_Woods_North.
South of Room_Dark_Woods_South is nowhere.
[Later when Scene_Day_Two is happening:
	South of Room_Dark_Woods is Room_Wooded_Trail.]

The available_exits of Room_Dark_Woods_South are "[if Scene_Day_Two has not happened][one of]In the distance, there is[or]Finally, a ways off, there is[or]Wait, in the distance, you can just make out[or]Not too far off is[or]Whew, in the distance you can just make out[or]Okay, that looks familiar, just over there[in random order] [a list of elusive_landmarks in the_distance][first time]. You can see trails leading into the woods, but you are no longer sure which one takes you back to either the creek or to the blackberry trail[only].[else]There isn't exactly a path, but you are moving in a consistent direction. You're pretty sure you are walking parallel to the creek. You can go back toward the forest meadow to the north, or you can continue south where you think you see a wooded trail.[end if]"

Section - Objects

Section - Backdrops & Scenery

A huge madrone tree is an elusive_landmark in Limbo.
	The description is "This is a particularly huge madrone tree whose branches twist far above your head."
	Understand "tree/madrone/huge" as huge madrone tree

A burned out tree is an elusive_landmark in Limbo.
	The description is "This tree went through a fire at some point, but still lived."
	Understand "tree/burned", "burned tree" as burned out tree.

A bright patch in the woods is an elusive_landmark in Limbo.
	The description is "This is a bright patch in the woods with darker woods all around."
	Understand "bright/light/patch/woods", "light/bright patch/woods", "light/bright of/in patch/woods" as bright patch in the woods.

The far off sound of the creek is an elusive_landmark in Limbo.
	The description is "Well, you can't see it, but you thought you heard the sound of the distant creek. Now you are not so sure."
	Understand "faraway/far/sound/creek", "faraway/far/sound --/of creek" as far off sound of the  creek.

A broad trail is an elusive_landmark in Limbo.
	The description is "This trail is a little bit broader than the others, though now that you are here it seems to peter out in the nearby woods."
	Understand "broad/trail/path/road/fireroad", "broad trail/path/road" as broad trail.

A white tree is an elusive_landmark in Limbo.
	The description is "Looking closer you see the tree is a dogwood growing in a place where the woods are thinner."
	Understand "white/light/tree/trees", "white/light tree/trees" as white tree.

A giant fern is an elusive_landmark in Limbo.
	The description is "This is a fern growing taller than you, its fronds spraying outward like a green fountain."
	Understand "giant/huge/big/fern", "giant/huge/big fern" as giant fern.

Section - Rules and Actions



Chapter - Room_Dark_Woods_North

Section - Description

Room_Dark_Woods_North is a room.
The printed name is "Dark Woods".
The description is "[if Scene_Day_Two has not happened]You are [one of]no longer sure where you are[or]not completely certain which way to go[or]confused[or]feeling lost[cycling]. The woods look familiar and altogether strange. It's difficult to get your bearings.[else]These dark woods are considerably easier to navigate by daylight. You recognize some of the landmarks you spotted last night.[end if]
[paragraph break][available_exits]".
The scent is "musty forest smell".
Understand "dark woods" as Room_Dark_Woods_North.

Section - Navigation

North of Room_Dark_Woods_North is Room_Forest_Meadow.
Northwest of Room_Dark_Woods_North is Room_Dappled_Forest_Path.
South of Room_Dark_Woods_North is nowhere.
[Later when Scene_Day_Two is happening:
	South of Room_Dark_Woods_North is Room_Dark_Woods_South.]

The available_exits of Room_Dark_Woods_North are "[if Scene_Day_Two has not happened][one of]In the distance, there is[or]Finally, a ways off, there is[or]Wait, in the distance, you can just make out[or]Not too far off is[or]Whew, in the distance you can just make out[in random order] what looks like a forest meadow[first time]. You can see trails leading into the woods, but you are no longer sure which one takes you back to either the other shore or to the wIllow trail[only].[else]There isn't exactly a path, but it is easier to keep going in a consistent direction. You believe you are steering rougly parallel to the creek and the road you saw from the sentinel tree. You can go back to the forest meadow which you figure is north, or you can continue south in the woods to see if you can reach the crossing.[end if]"

Section - Objects

Section - Backdrops & Scenery

Section - Rules and Actions


Chapter - Room_Forest_Meadow

Section - Description

Room_Forest_Meadow is a room.
The printed name is "Forest Meadow".
The description is "[if Scene_Day_Two has not happened]You have found a dark shaded forest meadow with tall grass up to your waist[first time]. You can't help thinking about ticks. You got a tick once in your neck and Honey had to burn it out with a cigarette[only]. Seeing the twilight sky overhead makes you a little less [nervous]. [else]This is the dark forest meadow you found last night, except in the morning light, it is bright and crispy cold. The meadow still makes you think of ticks, but you try not to as you push through the tall grass. You can see paths in a few different directions. You might be able to get your bearrings from the tall pine at the edge of the meadow.[end if]
[paragraph break][available_exits]".
The scent is "musty forest smell".
Understand "forest meadow" as Room_Forest_Meadow.

Section - Navigation

East from Room_Forest_Meadow is Room_Protected_Hollow.
South from Room_Forest_Meadow is nowhere.
West from Room_Forest_Meadow is nowhere.
Up from Room_Forest_Meadow is nowhere.
[Later when Scene_Day_Two is happening:
	Up from Room_Forest_Meadow is Room_Sentinel_Tree.]
[After player has visited Sentinel_Tree:
	West of Room_Forest_Meadow is Room_Dappled_Forest_Path;
	South of Room_Forest_Meadow is Room_Dark_Woods_North.]

The available_exits of Room_Forest_Meadow are "[if Scene_Day_Two has not happened]The forest is impenetrably thick in most directions and you aren't excited about re-entering the dark woods anyway. There is a place where a fallen tree has taken out the underbrush.[else if Scene_Orienteering has not ended]Your fort is at the edge of the meadow nestled under a few fallen trees. And there is a tall pine tree with low branches asking to be climbed at the other side of the meadow.[else]You can now make out a dapled forest path going west that must head toward the backberry tangle. Another break in the trees heads south through the dark woods, the direction you came from last night. Your fort is at the edge of the meadow nestled under a few fallen trees. And there is the sentinel tree at the other edge of the meadow.[end if]"

Section - Objects

Section - Backdrops & Scenery

A fallen tree is scenery in Room_Forest_Meadow.
The description is "This is a tree that has fallen over several smaller ones and forms a sort of protected hollow."

Section - Rules and Actions


Chapter - Room_Protected_Hollow

Section - Description

Room_Protected_Hollow is a room.
The printed name is "Protected Hollow".
The description is "[if Scene_Day_Two has not happened]This is a protected hollow formed where a big tree has fallen over several smaller ones making a perfect fort. It is dark and would normally be kind of scary, but the dark woods are scarier[first time]. It helps to have some shelter. The Explorer Scouts taught you that shelter is the first thing you are supposed to find in a survival situation[only].[else]You woke up in a protected hollow formed where a big tree has fallen over several smaller ones making a perfect fort. [first time]All things considered, it was rather cozy. Your mom wasn't crazy about you going to Explorer Scouts, but your stepdad said you had to. And even though you hated it at first, you learned stuff. [only] Under the protection of the fallen logs, you've made a nest of dried leaves which keeps you insulated from the cold. [end if]
[paragraph break][available_exits]".
The scent is "musty forest smell, like dirt or mushrooms".
Understand "protected/-- hollow", "fallen tree", "my/-- fort" as Room_Protected_Hollow.

Section - Navigation

Room_Protected_Hollow is east of Room_Forest_Meadow.

The available_exits of Room_Protected_Hollow are "You can climb back out and go back to the forest meadow."

Section - Objects

Some fallen_leaves are in Room_Protected_Hollow.
	The printed name is "fallen leaves".
	"There is a thick carpet of fallen leaves, dried now in the summer heat. They crunch beneath your feet."
	The description is "These are probably the leaves from last autumn that have blown beneath the fallen trees. They are crispy and dry and might make a soft bed and even a warm covering."
	Understand "dried/fallen leaves" as fallen_leaves.

Section - Backdrops & Scenery



Section - Rules and Actions


Chapter - Room_Sentinel_Tree

Section - Description

Room_Sentinel_Tree is a room.
The printed name is "Top of the Sentinel Tree".
The description is "This is a tall pine tree, though not as tall as the massive tree near the trailer park. From here you can see the surrounding forest, and hey! There's Bear Creek! And you can see the stone bridge a ways off and can just make out the line of the long dirt road. There are trees blocking your view of where you think the trailer park is, and your heart gives a little lurch thinking about home.
[paragraph break][available_exits]".
The scent is "tangy pine".
Understand "tall/-- pine/-- tree", "sentinel tree" as Room_Sentinel_Tree.

Section - Navigation

Down from Room_Sentinel_Tree is Room_Forest_Meadow.

The available_exits of Room_Sentinel_Tree are "Looking at the morning sun above your protected hollow, you know that's east. Bear Creek and the dirt road are to the west, and it looks like there might be a path in that direction from the forest meadow to the blackberry tangle. That makes the dark woods you came through last night south. From here, the only way is down, but at least now you have a better idea which way to go."

Section - Objects

Section - Backdrops & Scenery

Section - Navigation

Section - Rules and Actions



Part - Region_Dreams

Section - Description

Region_Dreams is a region.
Room_Car_With_Mom, Room_Drive_In, Room_Snack_Bar, Room_Restroom,
Room_Camaro_With_Stepdad, Room_Dream_Grassy_Field, Room_Dream_Railroad_Tracks, Room_Mars, Room_Chryse_Planitia, Room_Dream_Dirt_Road, Room_Dream_Stone_Bridge are in Region_Dreams.

Section - Backdrops and Scenery

[TODO: Replace default examine uninteresting object with fuzzy dream response.]

[TODO: Create an ambiguous sky backdrop. Is it day? Is it night? ]

Section - Navigation

The return_dest of Region_Dreams is Room_Car_With_Mom.
The forward_dest of Region_Dreams is Room_Dream_Stone_Bridge.
The upstream_dest of Region_Dreams is Limbo.
The downstream_dest of Region_Dreams is Limbo.
The uppath_dest of Region_Dreams is Limbo.
The downpath_dest of Region_Dreams is Limbo.

Section - Rules and Actions


Chapter - Room_Car_With_Mom

Section - Description

Room_Car_With_Mom is a room.
The printed name is "In The Car at the Drive-In".
The description is "[one of]It's Friday and your mom picked you up from school to take you to the drive-in. You can still smell your take out dinner from Del Taco. You love these times with mom, though some part of your mind notes that they stopped when she met your stepdad. The movie is The Omen, which probably isn't a kids movie[or]You are watching a movie with mom at the drive-in[stopping]."
The scent is "bean burritos and taco sauce".
Understand "Car With Mom" as Room_Car_With_Mom.

Section - Navigation

Room_Drive_In is east of Room_Car_With_Mom

Section - Objects

Some Del Taco Wrappers on the floor are in Room_Car_With_Mom.
The description is "Some Fridays your mom picks you up from after school care and takes you out to Del Taco. Then you go to the drive-in if there is a good movie playing."
The scent is "bean burritos and taco sauce".

Money is held by mom.
The printed name is "a dollar bill".
The description is "Mom gave you a dollar. George Washington is on this bill. You look at it carefully. What does Annuit Coeptis Novus Ordo Seclorum mean?"
Understand "dollar/cash/bill" as money.

Section - Backdrops and Scenery

The movie is backdrop in Room_Car_With_Mom.
The description is "Mom always tries to take you to the drive-in when there's a good movie playing. [first time]Your favorite was Escape From Witch Mountain, though it was a little scary. No wait, your favorite was Bengi. Mom loved that one too. [only]This one, The Omen, is scary and probably not made for kids."
	Understand "film/drive-in/omen" as movie.

The Camaro is backdrop in Room_Car_With_Mom.
The description is "This is mom's Camaro that she's had since you were a baby. It's green and has black bucket seats. You and mom go everywhere in it, especially to Honey and Grandpa's almost every weekend."
Understand "Camaro/car/seats/dash/dashboard" as Camaro.

Section - Rules and Actions

Instead of exiting when player is in Room_Car_With_Mom and player is not on supporter:
	Try room_navigating Room_Drive_In.
Instead of going outside when player is in Room_Car_With_Mom:
	try room_navigating Room_Drive_In.
Instead of climbing out when player is in Room_Car_With_Mom,
	try room_navigating Room_Drive_In.


Chapter - Room_Drive_In

Section - Description

Room_Drive_In is a room.
The printed name is "At the Drive-In".
The description is "The movie is playing on the big screen. The drive-in is like a big parking lot but with bumps that cars can drive up on. There are a million cars here on a Friday night and each one is parked beside a pole that has the speakers you can put in your car. There is trash and spilled popcorn on the ground.
[paragraph break][available_exits]".
The scent is "popcorn".
Understand "drive-in/lot", "drive in", "parking lot" as Room_Drive_In.

Section - Navigation

East of Room_Drive_In is Room_Snack_Bar.
West of Room_Drive_In is Room_Camaro_With_Stepdad.

The available_exits of Room_Drive_In are "You can get back in the car or head to the snack bar from which waves of popcorn smell are emerging."

Section - Objects

Virtual_camaro is fixed in place climbable enterable container in Room_Drive_In.
"Mom's Camaro is here parked among the other cars."
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
Understand "berms" as bumps.

Spilled_popcorn is scenery in Room_Drive_In.
The printed name is "spilled popcorn".
The description is "There is popcorn scattered about like snow on the ground. The popcorn squeeks when you step on it."
Understand "spilled popcorn", "popcorn" as spilled_popcorn.

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

Instead of entering virtual_camaro,
	say "You really have to go. Better visit the restroom first."

Instead of room_navigating Room_Camaro_With_Stepdad when Room_Restroom is unvisited,
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
Understand "snack bar", "snackbar", "snack-bar", "snack shack" as Room_Snack_Bar.

Section - Navigation

Room_Snack_Bar is east of Room_Drive_In.

The available_exits of Room_Snack_Bar are "The door to the restroom is down at the end, or you can go back to the car."

Section - Objects and People

The counter lady is a undescribed _female woman in Room_Snack_Bar.
The description of the counter lady is "She looks like the Cat Lady from the trailer park, but younger somehow, and prettier. She's wearing a uniform. She looks bored as she helps the customers."
Understand "cat lady", "sharon" as counter lady.

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

Instead of exiting when player is in Room_Snack_Bar,
	try room_navigating Room_Drive_In.

[Popcorn]

Does the player mean doing anything other than buying to popcorn_maker:
	if player carries popcorn, it is unlikely.

Instead of taking or eating popcorn_maker:
	try buying popcorn_maker.

Instead of buying popcorn_maker when player is in Room_Snack_Bar:
	if the player has money:
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
	if the player has money:
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
Understand "restroom/bathroom/toilet", "bath/rest room" as Room_Restroom.

Section - Navigation

Room_Restroom is east of Room_Snack_Bar.

The available_exits of Room_Restroom are "The only door out goes back to the snack bar."

Section - Objects

Section - Backdrops and Scenery

Section - Rules and Actions

Instead of exiting when player is in Room_Restroom,
	try room_navigating Room_Snack_Bar.


Chapter - Room_Camaro_With_Stepdad

Section - Description

Room_Camaro_With_Stepdad is a room.
The printed name is "The Camaro".
The description is "You are in the car. Your stepdad is driving mom's Camaro."
The scent is "".
Understand "Camaro/car" as Room_Camaro_With_Stepdad.

Section - Navigation

East of Room_Camaro_With_Stepdad is Room_Dream_Grassy_Field.
West of Room_Camaro_With_Stepdad is nowhere.

Section - Objects

Section - Backdrops and Scenery

The Camaro is backdrop in Room_Camaro_With_Stepdad.

Virtual_Mom is scenery in Room_Camaro_With_Stepdad.
	The printed name is "Mom".
	The description is "Mom is no longer here."
	Understand "mom" as Virtual_Mom.

Section - Rules and Actions

Instead of exiting when player is in Room_Camaro_With_Stepdad and player is not on supporter:
	Try room_navigating Room_Dream_Grassy_Field.
Instead of going outside when player is in Room_Camaro_With_Stepdad:
	try room_navigating Room_Dream_Grassy_Field.
Instead of climbing out when player is in Room_Camaro_With_Stepdad,
	try room_navigating Room_Dream_Grassy_Field.

Instead of going to Room_Dream_Grassy_Field when player is in Room_Camaro_With_Stepdad:
	if Scene_Dream_About_Stepdad is happening:
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

Section - Navigation

Room_Dream_Grassy_Field is east of Room_Camaro_With_Stepdad.

The available_exits of Room_Dream_Grassy_Field are "The gate to the trailer park seems fuzzy and out of focus. The railroad crossing is a little clearer. The only way from here is to go on";

Does the player mean room_navigating Room_Dream_Railroad_Tracks when player is in Room_Dream_Grassy_Field:
it is very likely.

Does the player mean room_navigating Room_Railroad_Tracks when player is in Room_Dream_Grassy_Field:
it is very unlikely.

Section - Objects and People

Dream_sharon is a undescribed _female woman in Room_Dream_Grassy_Field.
The description of the dream_sharon is "This is the Cat Lady alright, though none of her cats are here at the moment. She's definitely not wearing a bathrobe now, but a fancy dress that swishes around her legs and high heels. Her hair is in tight curls and her makeup is elegant. She looks beautiful. She stares in to Lee's eyes[if dream_sheriff is not visible]. What's going to happen?[else] as they dance.[end if]".
Understand "cat lady", "sharon/curls/makeup", "high heels", "evening/-- dress" as dream_sharon.

Dream_lee is a undescribed _male man in Room_Dream_Grassy_Field.
The description of the dream_lee is "Lee has his long blond hair pulled back in a neat ponytail. He's not wearing his army pants, but a fancy tuxedo and a bowtie. He looks quite handsome. He's staring intensely at the Cat Lady[if dream_sheriff is not visible]. What is happening?[else] as they Tango.[end if]".
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
	say "You open the car door and look at the surface of the road speeding by. You gather your courage and prepare to jump. Your stepdad's hand shoots out to try to stop you. You duck the hand, glancing back at your stepdad's startled face, and jump.
	[paragraph break]You land surprisingly softly, with no more force than if you had fallen down from a standstill. You pick yourself up to familiar surroundings.";
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
Understand "dream/-- railroad/train/-- tracks/crossing" as Room_Dream_Railroad_Tracks.

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

After entering dream_train_tracks:
	say "Was that a train? Mom tells you not to play anywhere near the railroad tracks. You nervously step between the tracks, experimentally trying to balance on one rail. Be careful."

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
The description is "This is the surface of Mars, the red planet, at least 100 million miles from Earth. [if grandpa is visible]You recognize it instantly from the Viking photos. Thick red dust scattered with various-sized dark rocks all under an orange-pink sky. You also know that it should be -80 degrees Fahrenheit, but you aren't feeling the cold. And though there is a very light unbreathable atmosphere, you aren't wearing a suit. You stumble, trying to get the hang of walking in the light gravity, only about a third of Earth's gravity.   How high could you jump here?[else]Now you just feel lonely and alone. You are no longer excited at the prospect of this alien world.
[paragraph break][available_exits][end if]".
The scent is "billion year old dust".
Understand "Mars" as Room_Mars.

Section - Navigation

Room_Mars is east of Room_Dream_Railroad_Tracks.

The available_exits of Room_Mars is "Here on this flat plain, you can go in any direction. At this point, what is there left to do but go on?"

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

Instead of going to Room_Mars when player is in Room_Dream_Railroad_Tracks:
	say "For some reason, you are not worried about a train coming. You follow the railroad tracks walking silently with Honey and Grandpa, briefly balancing on the rails while you hold Honey's hand. You walk for a while humming a little tune. You look down and realize you've lost the train tracks and see only red dust.";
	Now honey is in Room_Mars;
	Now grandpa is in Room_Mars;
	Continue the action.

Instead of jumping when player is in Room_Mars:
	if grandpa is visible:
		say "[one of]You give a little experimental jump in the light gravity and sail up at least half your height. Grandpa and Honey watch you.[or]You try another experimental jump, this time a little harder, leaping at least your height. Grandpa smiles and Honey says, 'Be careful, Hon.'[or]This time, you really give it a good effort, jumping as high as you can, sailing to a startling height. For a moment, you are afraid you won't come down and will sail off into the sky, and Grandpa dives forward to catch you. But you reach the top of your flight and touch down lightly.[or]This time, you jump more cautiously.[stopping]";
	else:
		say "You make a halfhearted little jump, your heart not really into it.";

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
	The description is "The is the first Viking lander. It is shaped like a flying saucer, short and squat, with three tripod legs. Its about your height, not counting the communication dish on top. It has all kinds of complicated devices, wires, and tubes. It has a light dusting of Martian dust. It will be here for centuries, sending back pictures until it malfunctions."
	Understand "viking/-- 1/-- lander", "viking/saucer/tripod/legs/dish/communications/devices/wires/tubes" as Viking 1 lander.

Section - Rules and Actions

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
The description is "The dirt road slopes down as it runs along the creek before turning into a trail over the stone bridge. There is a field full of tall weeds and junk cars separated by a chainlink fence. There is a sizablee hole dug under the fence.".
The scent is "sunshine and dust".
Understand "Dream Dirt Road" as Room_Dream_Dirt_Road

Section - Navigation

Room_Dream_Dirt_Road is east of Room_Chryse_Planitia.

The available_exits of Room_Dream_Dirt_Road are "The old dirt road that runs uphill is vague. Back toward the old stone bridge, the road narrows to a ragged trail but after that it gets fuzzy."

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

Instead of going to Room_Dream_Dirt_Road when player is in Room_Chryse_Planitia:
	say "You look at your feet and notice that the dust has changed to a more familiar color.";
	continue the action.

Instead of going to Room_Dream_Stone_Bridge when dog_free_to_go is not true:
	say "You're pretty sure, the dog will not let you."


Chapter - Room_Dream_Stone_Bridge

Section - Description

Room_Dream_Stone_Bridge is a room.
The printed name is "Stone Bridge".
The description is "".
Understand "old/-- stone/-- bridge", "river/creek" as Room_Dream_Stone_Bridge.

Section - Navigation

Room_Dream_Stone_Bridge is east of Room_Dream_Dirt_Road.

Section - Objects

Section - Backdrops and Scenery

Section - Rules and Actions



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
The player is not injured, not sappy, not dirty, not clothing_ripped, not covered_in_leaves, not arm_aware1, not arm_aware2.

Yourself can be perceptive.
Yourself can be courageous.
Yourself can be confident.
Yourself can be resourceful.
Yourself can be affectionate.
Yourself can be persistent.
Yourself can be compassionate.
Yourself can be violent.
The player is not perceptive, not courageous, not confident, not resourceful, not affectionate, not persistent, not compassionate, not violent.

Yourself can be train-experienced. Player is not train-experienced.
Yourself can be dog-experienced. Player is not dog-experienced.
Yourself can be swim-experienced. Player is not swim-experienced.
Yourself can be tree-experienced. Player is not tree-experienced.
Yourself can be treetop-experienced. Player is not treetop-experienced.
Yourself can be mika-experienced. Player is not mika-experienced.
Yourself can be lee-experienced. Player is not lee-experienced.
Yourself can be Sharon-experienced. Player is not Sharon-experienced.

The player has a number called persistence count. Persistence count is 0.
The player has a number called Pine Tree Tries. Pine Tree Tries is 0.
The player has a number called Treetop Tries. Treetop Tries is 0.

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

A pail is an unopenable floating open container.
	The printed name is "your pail".
	It is held by the player.
	The description of the pail is "[one of]A purple pail with a yellow handle. You recognize this pail from your trip to the beach with mom. She had to run out and get it when the waves tried to steal it. You thought she'd be mad, but you both laughed and laughed. That was a long time ago[or]Your purple beach pail[stopping][if pail is empty]. The pail is empty, but it is still stained from juice at the bottom[else if pail is quarter-full]. It has a good number of ripe berries in it and a puddle of purple juice[else if pail is half-full]. It is about half full of berries[else if pail is three-quarter-full]. It is getting pretty full of blackberries[otherwise]. ripe blackberries heap over the rim of the pail. You are careful not to spill them[end if]."
	Understand "purple/-- pail/juice" as pail.
	Instead of searching pail, try examining pail.
	A pail can be empty, quarter-full, half-full, three-quarter-full, or full.
	It is quarter-full.
	The dry_time of pail is 1.
	Include (- with articles "Your" "your" "a", -) when defining pail.

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
		add "you are covered in leaves" to list_of_attributes;
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

Instead of dropping pail:
	say "You might need that later. You hold on to it for now."

To drop_all_your_stuff:
	[say "stuff: [list of every held thing].";]
	repeat with item running through every held thing:
		add item to stuff you brought here;
	now everything carried by player is in location;
	move clothes to location;
	move tennis_shoes to location;
	if player holds grandpas_shirt:
		move grandpas_shirt to location;

Stuff you brought here is a list of objects that varies.

Stuff_storage is a container in Limbo.

To store_all_your_stuff:
	now everything carried by player is in stuff_storage;

To unstore_all_your_stuff:
	now everything carried by player is in Limbo;
	now everything carried by player is in stuff_storage;

Instead of taking off clothes, say "Better keep those on for now. If you were going swimming, maybe."
Instead of taking off tennis_shoes, say "Better keep those on for now."
Instead of taking off underwear, say "No way! You're not taking those off!"

[Instead of doing anything except examining clothes, say "Better keep that on for now."
Instead of doing anything except examining tennis_shoes, say "Better keep those on for now."
Instead of doing anything except examining underwear, say "Better keep those on."]


Part - Honey

Honey is a _female woman.
The initial appearance  is "[honey_initial_description]".
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
		else:
			say "Honey and Grandpa are here waiting for you.[run paragraph on]";

[
	Honey picking berries
]

Player has a number called attempts_to_leave.
	Attempts_to_leave is zero.

Before going down when player is in Room_Grassy_Clearing during Scene_Picking_Berries:
	say "[one of]Honey looks up, as you go by[or]Honey notices as you go past[or]Honey catches your eye and give you a Meaningful Look as you pass[or]Honey looks up as you go by and you catch a flicker of annoyance[as decreasingly likely outcomes].".

Instead of going down when player is in Room_Blackberry_Tangle during Scene_Picking_Berries:
	Increase attempts_to_leave of Player by 1;
	say "[one of]Ever vigilant[or]Again[or]Once again[or]Of course[stopping], Honey looks down the trail and sees you [one of]wandering[or]leaving[or]exploring[at random]. [one of]'Hey, why don't you stay here with us? Don't you want to help your Honey and grandpa? One more pail, okay?'[run paragraph on][or]'Hey Ants-In-The-Pants, are you getting bored? Why don't you come pick some more berries?'[run paragraph on][or]'I want you to pick one more pail before you go exploring.'[run paragraph on][or]'Uh. What did I tell you?'[run paragraph on][or]She gives you A Look.[run paragraph on][stopping] You reluctantly head back to the clearing.";
	Move player to Room_Grassy_Clearing with little fuss;
	now player is warned_by_grandma;

Before going down when player is in Room_Grassy_Clearing during Scene_Explorations:
	say "Honey looks up and says, '[one of]Have fun, but don't wander too far[or]Stay where you can hear me call[or]Don't go too far[cycling].'"

Chapter - Responses

[
	Preliminaries and greetings
]

Greeting response for Honey:
	say "'Hello, [Honey's nickname],' Honey says[Honey stuff].";

Implicit greeting response for Honey:
	do nothing;

Farewell response for Honey:
	say "'Bye, [Honey's nickname]. Stay close,' Honey says.";

Implicit farewell response for Honey:
	say "'Oh, [one of]don't let me keep you from your busy schedule[or]don't let me keep you[or]goodbye, I guess[at random],' says Honey who goes back to her berry picking.";

To say Honey's nickname:
	say "[one of]kiddo[or]hon[or]sweetie[or]buster[as decreasingly likely outcomes]";

To say Honey stuff:
	if a random chance of 1 in 3 succeeds:
		say " and [one of]gives you a tight little smile[or]pats her head to see if her hair is still up[or]rubs her lips firmly[at random]";

[
	Defaults
]

Default tell response for Honey:
	if the second noun is not nothing:
		say "'That's great, [Honey's nickname]. [Honey's berry urging]' Honey goes back to picking.[line break][line break]";
	else:
		say "She looks a little irritated. 'Okay. [Honey's berry urging]'[line break][line break]";

To say Honey's berry urging:
	say "[one of]You gonna pick any more berries[or]You done picking blackberries[or]Are you going to help your Honey and Grandpa[at random]?[run paragraph on]";

Default ask response for Honey:
	say "'I[one of]'m not sure[or] don't know[or] really don't know[at random]. Ask your grandpa,' Honey says.";

Default give-show response for Honey:
	say "'I'm not sure what you want me to do with it. Ask your grandpa,' Honey goes back to her task.";

Default ask-for response for Honey:
	if player holds second noun:
		say "'Looks like you already got it, [Honey's nickname],' Honey says.";
	else:
		say "'That's not going to happen, [Honey's nickname],' Honey says.";

Default yes-no response for Honey:
	if saying yes:
		say "'Okay, then get to it,' Honey says.";
	else:
		say "'I'm not going to argue with you about it,' Honey says.".

Default response for Honey:
	say "'Go talk to your grandpa,' Honey says.";

Instead of touching Honey:
	say "'Aw, thanks [Honey's nickname],' she says.";
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
	if player is not train-experienced:
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
	say "'I love you, [Honey's nickname],' Honey says.".

Response of Honey when asked about topic_death:
	say "'Why are you being so morose? I don't like to talk about it,' Honey says curtly.".

Response of Honey when asked about topic_war:
	say "Honey looks thoughtful, 'In the war, I worked in an ammunition factory in Long Beach with thousands of women. The building where I worked was far far away from any other buildings in case it exploded.'".

Response of Honey when asked about topic_work:
	say "'I used to manage the Button Box, but when your grandpa retired so did I,' Honey says. 'In the war, I worked in a munitions factory.'".

Response of Honey when asked about topic_family:
	say "'That's a big subject, [Honey's nickname]. Maybe we can sit down later and look at some of the pictures of our family,' Honey says. 'I'll bet you don't even remember [one of]your Aunt Ethel who we visited in Portland[or]your Great Uncle Charley who has the rock shop[or]your grandpa's brother Marvin out in the desert[in random order].'".

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
"'I think it takes more than being at the right place at the right time to be a father,' Honey says, and after a moment, 'Sorry, [Honey's nickname], I'm not mad at you. I'm mad about grown up stuff.'"
"'I'm done waiting for him to step up and be your father,' Honey says."

Response of Honey when asked-or-told about Step-Dad:
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
				queue_report "Honey and Grandpa continue their conversation: 'Have you heard from Nick about this summer? Is he planning a visit or are we just left guessing?' Grandpa asks Honey.[paragraph break]'Nothing. Not a word,' Honey says." at priority 1;
			else if index is 2:
				queue_report "[grandparent_random]" at priority 1;
			else if index is 3:
				queue_report "'Did you call Rachel?' Honey asks Grandpa. 'Sounded like she wanted to talk to her dad.'" at priority 1;
			else if index is 4:
				queue_report "'I'll call her tonight, see how she is,' Grandpa says to Honey." at priority 1;
			else if index is 5:
				queue_report "'You're not worried about her?' Honey asks Grandpa in a low voice glancing your way, 'With Mark?' You keep your head down and try to look like you are concentrating on picking berries." at priority 1;
			else if index is 6:
				queue_report "'Well, you know Rach, she can take care of herself,' Grandpa says to Honey, 'She's a big girl.' And after a moment, 'But I'll tell ya...'" at priority 1;
			else if index is 7:
				queue_report "You wander a little distance away, but close enough that you can still hear. 'I do not like the way he treats, ah, the little one. At all.' Grampa says." at priority 1;
			else if index is 8:
				queue_report "[grandparent_random]" at priority 1;
			else if index is 9:
				queue_report "'I don't know,' Honey says quietly. 'I trust Rachel too, but still. I'm not happy how it's turning out with this guy. Maybe it happened too quickly." at priority 1;
			else if index is 10:
				queue_report "'Did you ask about the arm?' Honey asks Grandpa, glancing in your direction." at priority 1;
				now player is arm_aware1;
			else if index is 11:
				queue_report "'I did ask about the arm, but I didn't find out anything,' Grandpa says, looking over at you. 'To think that asshole, pardon my French, might have...' Grandpa just shakes his head." at priority 1;
			else if index is 12:
				queue_report "''I don't put anything past him when he's been drinking,' Honey says to Grandpa. 'Yeah, he's a charmer. What were you thinking, Rachel?'" at priority 1;
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
	say "[one of]'Oh, Mary went to the doctor last week and found out about that thing on her neck,' Honey says to Grandpa. 'Turns out it's nothing, but they took it off anyway.' Grandpa just nods silently.[or]'Is that fellow Mark coming here when Rachel comes to pick up Jody?' Grandpa asks Honey, 'I'm not sure I can keep from giving him a piece of my mind.'[or]'It burns my britches that Mark wants that kid to call him [']dad,['] Grandpa says quietly to Honey.[or]'Remind me when we get into town, I need to pick up my new pair of eyes,' Honey says to Grandpa.[or]'That sheriff came by again asking about Lee,' Grandpa says.[paragraph break]'I'm not sure why you trust him,' Honey says. 'I'd be happy if I never saw that guy again.'[paragraph break]'The sheriff or Lee?' Grandpa asks.[paragraph break]'Both!' Honey laughs.[or]'You're tuneless whistling again,' Honey says to Grandpa. You hadn't even noticed any whistling.[or]'How close is the bucket to being full?' Grandpa asks Honey who ignores him. 'Never mind,' he says, looking in it himself, 'We have more berries to pick.'[or]'How you doing over there, [grandpas_nickname]?' Grandpa asks you.[or]Honey says to Grandpa, 'Did I tell you that I caught Sharon being crazy in the middle of the night?' Grandpa seems to ignore her and she doesn't repeat it.[or]'Hey, [Honey's nickname],' Honey calls to you. 'When you go with grandpa to take the bucket to the trailer, can you ask Mary about lunch?'[or]Honey asks Grandpa, 'Are you going swimming later with the kiddo?'[paragraph break]'If we have time,' Grandpa says.[or]'I heard Lee had another one of his freak outs, screaming about the war, last week,' Honey says to Grandpa.[paragraph break]'Give him a break. He doesn't have it easy,' Grandpa says.[in random order]".

[TODO in a long list of random utterances, make it so new interlocutor is set

Table of grandparents_random
Speaker	Dialogue
Grandpa	'Oh, Mary went to the doctor last week and found out about that thing on her neck,' Honey says to Grandpa. 'Turns out it's nothing, but they took it off anyway.' Grandpa just nods silently.
Grandpa	'Is that fellow Mark coming here when Rachel comes to pick up Jody?' Grandpa asks Honey, 'I'm not sure I can keep from giving him a piece of my mind.'
Grandpa	'It burns my britches that Mark wants that kid to call him [']dad,['] Grandpa says quietly to Honey.
Honey	'Have you heard from Nick about this summer? Is he planning a visit or are we just left guessing?' Grandpa asks Honey.[paragraph break]'Nothing. Not a word,' Honey says.
Honey	'Remind me when we get into town, I need to pick up my new pair of eyes,' Honey says to Grandpa.
Honey	'That sheriff came by again asking about Lee,' Grandpa says.[paragraph break]'I'm not sure why you trust him,' Honey says. 'I'd be happy if I never saw that guy again.'[paragraph break]'The sheriff or Lee?' Grandpa asks.[paragraph break]'Both!' Honey laughs.
Honey	'You're tuneless whistling again,' Honey says to Grandpa. You hadn't even noticed any whistling.
Grandpa	'How close is the bucket to being full?' Grandpa asks Honey who ignores him. 'Never mind,' he says, looking in it himself, 'it's [if bucket is empty]pretty much empty[else if bucket is quarter full]about quarter full[else if bucket is half full]about half full[else if full]just about full[end if].'
Grandpa	'How you doing over there, [grandpas_nickname]?' Grandpa asks you.
Honey	Honey says to Grandpa, 'Did I tell you that I caught Sharon being crazy in the middle of the night?' Grandpa seems to ignore her and she doesn't repeat it.
Honey	'Hey, [Honey's nickname],' Honey calls to you. 'When you go with grandpa to take the bucket to the trailer, can you ask Mary about lunch?'
Grandpa	Honey asks Grandpa, 'Are you going swimming later with the kiddo?'[paragraph break]'If we have time,' Grandpa says.[or]'I heard Lee had another one of his freak outs, screaming about the war, last week,' Honey says to Grandpa.[paragraph break]'Give him a break. He doesn't have it easy,' Grandpa says.]

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
			queue_report "'Hey, [grandpas_nickname]. We've been waiting for you,' Grandpa says gently. Honey smiles at you." at priority 1;
		else if index is 2:
			queue_report "Grandpa puts his hand on your shoulder, 'You've had quite a time, haven't you? Don't you worry about it, about him.' Who is grandpa talking about?" at priority 1;
		else if index is 3:
			queue_report "'Sometimes we worry about you,  [grandpas_nickname],' grandpa says, 'But it'll be okay, I promise.'" at priority 1;
		else if index is 4:
			queue_report "Honey leans over and whispers, 'Try as we might, we may not always be able to keep you safe, little one.' She takes a deep breath, 'But I know you can take care of yourself when you need to.'" at priority 1;
		else if index is 5:
			queue_report "'Let's see where this journey takes us', Grandpa says, inviting you with his hand to follow the tracks." at priority 1;
			now grandparents_track_done is true;
		else if index is 5:
			queue_report "Grandpa says, 'Let's get going. I think we're meant to follow these,' he says gesturing at the tracks. [paragraph break]'It's like a metaphor,'Honey says." at priority 1;
		else if index is 6:
			queue_report "[one of]'Time to go,' says grandpa.[or]Honey says, 'Let's see what's next,' pointing at the tracks.[or]'Time to become hobos', says grandpa looking at the tracks.[at random]" at priority 1;
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
			queue_report "Honey and Grandpa both stumble in the light gravity. Honey looks concerned, but Grandpa looks thrilled. 'Hmm,' he says smiling broadly taking several experimental hops." at priority 1;
		else if index is 4:
			queue_report "Honey smiles as she gives a little jump and sails high. Grandpa gives a bigger jump and flies almost as high as he is tall. They are both laughing." at priority 1;
		else if index is 6:
			queue_report "'Watch this!' Grandpa says like a little kid and leaps high into the air yelling 'Woo!' while Honey laughs." at priority 1;
		else if index is 7:
			queue_report "Grandpa gathers up his strength, squating down and taking a tremendous leap. He sails into the air and his smile turns to sudden concern. He's floating away. 'John!' Honey yells leaping after him too high to stop. Honey and Grandpa lift high in the air.[paragraph break]'Ellie!' Grandpa yells from far above. 'Help!' they both yell while you watch helplessly. You jump as high as you can, but can't reach them.[paragraph break]You call to them and watch as they both float away into the Martian sky, becoming smaller and smaller dots until you can no longer see them.[paragraph break]There is nothing to do but flop down on the ground sobbing in misery. [paragraph break]After a long while you dry your tears and haul yourself up out of the red dust." at priority 1;
			now seq_grandparents_bounce is not in-progress;
			now mars_free_to_go is true;
			now Honey is in Limbo;
			now Grandpa is in Limbo;

This is the seq_grandparents_bounce_interrupt_test rule:
	rule fails.


Part - Grandpa

Grandpa is an undescribed _male man.
"Your Grandpa is here[if Grandpa holds big_bucket and big_bucket is full] with the big bucket full of berries[else if Grandpa holds big_bucket and big_bucket is empty] with the empty bucket[end if]."
The description of Grandpa is "Grandpa is, well, Grandpa. He's not tall. He's not fat. He has a bald spot right on top of his head like a little hat. He's like a bull, kind of, but skinnier and wears a warm plaid shirt. Today he's in a t-shirt, but usually. He smells good, like cigarettes and that stuff he puts on his face when he shaves.[if a random chance of 1 in 3 succeeds]
[paragraph break]While you are looking, he sees you and smiles.[end if]".
Understand "grampa/granpa/grandfather/gramp/pa/gramps/John" as grandpa.
The scent is "familiar, like cigarettes and the stuff he uses when he shaves".
Grandpa is in Room_Grassy_Clearing.

Chapter - Properties

Chapter - Rules and Actions

Instead of touching Grandpa:
	say "Grandpa gives you a big hug.";
	Now player is affectionate;

Chapter - Responses

[
		Preliminaries and greetings
]

Greeting response for Grandpa:
	say "[grandpa's greeting].";

Implicit greeting response for Grandpa:
	do nothing;

Farewell response for Grandpa:
	say "'Okay, see you later, [grandpas_nickname],' Grandpa says.";

Implicit farewell response for Grandpa:
	do nothing;

To say grandpa's greeting:
	say "'[one of]Well[or]Hey[or]Hm[as decreasingly likely outcomes] [grandpas_salutation], [grandpas_nickname],' Grandpa says[if a random chance of 1 in 2 succeeds] and [grandpa_stuff][end if]";

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
	say "'I don't know much about him, [grandpas_nickname],' Grandpa says. 'He's pretty quiet and keeps mostly to himself. I heard from your Aunt Mary that he was in Vietnam.'".

[Response of Grandpa when asked-or-told about Sheriff:
	say "".]

Response of Grandpa when asked-or-told about Step-Dad:
	say "[one of]'Mark? He seemed like a nice enough guy when I met him, but...' Grandpa looks like he's going to get mad at you, 'he better start being a whole heck of a lot nicer to you and your[if player is in Room_Grassy_Clearing]--'[paragraph break]Honey cuts him off, 'John, that's enough. Remember, little pitchers have big ears.'[paragraph break]Grandpa leans down and says a little quieter, 'Well, you just know that your mom, your Honey, and your grandpa love you,' and he [grandpa_stuff].[else] mom or he's going to have to answer to me. That's all I have to say.'[end if][or]Grandpa face goes tight. 'I don't think I can rightly say anything more about that without saying anything I don't want to.'[stopping]".

Response of Grandpa when asked-or-told about topic_berries:
[Response of Grandpa when asked about backdrop_berries or told about backdrop_berries:]
	say "'How you doing, [grandpas_nickname]?' Grandpa [grandpa_stuff]. 'You helping your Honey and grandpa make blackberry jam?'".

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
	say "[one of]'Yeah? The one that runs by the trailer park? You can hear it going by if you listen,' Grandpa says. 'Maybe later we can put pennies on the track again.'[or]'You be careful around those train tracks, a train could roll right over you and not even blink,' Grandpa says.[stopping]".
Response of Grandpa when told about train tracks:
	if player is not train-experienced:
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
	say "'The big tree up by the road? [if player has not been in Room_Top_of_the_Pine_Tree]I heard you climbed that tree before. You be careful[else]You climbed all the way to the top? When did you get so big and strong[end if],' Grandpa says, smiling.".

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
	Grandpa Begins Walk Sequence

	summary: Grandpa tells you he's headed back to the house with the bucket
	conditions: after explorations, player is back in Room_Grassy_Clearing
	trigger: started at beginning of Scene_Walk_With_Grandpa
]

seq_grandpa_begins_walk is a sequence.
	The action_handler is the seq_grandpa_begins_walk_handler rule.
	The interrupt_test is seq_grandpa_begins_walk_interrupt_test rule.
	The length_of_seq is 2.

This is the seq_grandpa_begins_walk_handler rule:
	let index be index of seq_grandpa_begins_walk;
	if index is 1:
		if grandpa is visible:
			queue_report "'Hey, [grandpas_nickname],' Grandpa says looking at you, 'I'm gonna take this bucket of berries up to your Aunt Mary. You gonna help your old grandpa?'" at priority 1;
			now current interlocutor is Grandpa;
	else if index is 2:
		if grandpa is visible:
			queue_report "'Okay, I'm headed back to the house, [grandpas_nickname]. Why don't ya come with me?' Grandpa says. He picks up the big bucket with one hand that you probably couldn't even budge, and heads off down the trail toward the bridge." at priority 1;
			now Grandpa is described;
			now Grandpa holds bucket;
			move Grandpa to Room_Blackberry_Tangle;
			now time_until_leaving of Grandpa is 2;
			now time_left_waiting of Grandpa is zero;

This is the seq_grandpa_begins_walk_interrupt_test rule:
	if grandpa is not visible, rule succeeds;
	if we are speaking to Grandpa, rule succeeds;
	rule fails.

[
	Grandpa in Trailer Sequence

	summary: Grandpa and you get back to trailer, talk to Mary
	conditions: in Room_Grandpas_Trailer, Grandpa visible, during Scene_Walk_With_Grandpa
	trigger: started at end of Scene_Walk_With_Grandpa
]

seq_grandpa_in_trailer is a sequence.
	The action_handler is the seq_grandpa_in_trailer_handler rule.
	The interrupt_test is seq_grandpa_in_trailer_interrupt_test rule.
	The length_of_seq is 4.

This is the seq_grandpa_in_trailer_handler rule:
	let index be index of seq_grandpa_in_trailer;
	if index is 1:
		if grandpa is visible:
			queue_report "'Mornin', Mary,' Grandpa says as he comes in.[paragraph break]'How's the berry picking?' Mary asks." at priority 1;
	else if index is 2:
		if grandpa is visible:
			queue_report "'Pretty good,' Grandpa says, gesturing at the bucket, 'We got a whole bucketfull for you. Old Whistle Britches here, picked most of these and ate twice as many more.' Grandpa winks at you.[paragraph break]Grandpa helps your Aunt Mary pour the bucket of berries slowly into several giant pots with a series of juicy plops." at priority 2;
			now bucket is empty;
	else if index is 3:
		if grandpa is visible:
			queue_report "Your grandpa gets a big glass of water from the sink and drinks it.
			[paragraph break]Aunt Mary turns to you, 'Sweetheart, Can I get your help making lunch?'" at priority 2;
			now current interlocutor is Mary;
			now seq_mary_sandwich is in-progress;
	else if index is 4:
		queue_report "'I better hustle back,' Grandpa says, 'before Ellie needs the bucket.' Grandpa turns to you on his way out, 'See you down there, [grandpas_nickname].' Grandpa squeezes your shoulder and heads out the door." at priority 2;
		now grandpa is in Room_Grassy_Clearing;
		increase the time of day by ten minutes;

This is the seq_grandpa_in_trailer_interrupt_test rule:
	if index of seq_grandpa_in_trailer is 0 and turns_so_far of seq_grandpa_in_trailer is 1 and grandpa is not visible, rule succeeds;
	if we are speaking to Grandpa, rule succeeds;
	if we are speaking to Mary, rule succeeds;
	if index of seq_grandpa_in_trailer is 3 and grandpa is not visible, rule succeeds;
	rule fails.

[
	Grandpa on Walk
]

[ This is a scene that begins
	* after Scene_Explorations
	* after player has been to trailer park indoors
	* when player is in blackberry clearing]

Every turn during Scene_Walk_With_Grandpa:
	Take action on Grandpa's walk.

Grandpa has a number called time_until_leaving.
Grandpa has a number called time_left_waiting.
Grandpa has a number called time_in_trailer.
Grandpa has a number called bb_index.

When Scene_Walk_With_Grandpa begins:
	now time_until_leaving of Grandpa is two;

[ What happens on Grandpa's walk:
	* turn 1: 1 turn warning, grandpa tells you he wants your help
	* turn 2: grandpa gets bucket, asks you to come along, and goes one step closer to goal
	* turn n: you arrive where grandpa is waiting, maybe he says something if it has been more than a turn
	* turn n+1: one turn after you arrive, grandpa says something to you and goes one step closer
	* turn n+m: if you take more than m turns to get to him and you are a location away, grandpa comes to get you and ask if you are coming ]

test grandpa-walk with "go to bridge/g/g/pick berries/g/g/eat berries/go to grandpa's trailer/g/g/g/g/g/g/g/g/g/g/go to blackberry clearing/g/g/g/g/g/g/g/g".

To take action on Grandpa's walk:
	[ START: grandpa tells you he's leaving and wants your help ]
	[if time since Scene_Walk_With_Grandpa began is 0 minutes:]
	if the bb_index of grandpa is zero:
		if player is in Room_Grassy_Clearing:
			now seq_grandpa_begins_walk is in-progress;
			increase bb_index of Grandpa by one;
		else if player is in Region_Blackberry_Area:
			queue_report "[one of]You hear grandpa calling you from the blackberry clearing.[or]Grandpa's calling you from the clearing[or]Grandpa's calling you[at random]" at priority 1;
		else if player is in Region_River_Area or player is in Region_Long_Road:
			if a random chance of 1 in 2 succeeds:
				queue_report "[one of]You think you hear your Grandpa calling you[or]Is that grandpa calling you?[or]That sounds like Grandpa calling you.[or]From over by the blackberry clearing, you think grandpa's calling.[at random]" at priority 1;
	[ MIDDLE: grandpa is walking ]
	if grandpa is not in Room_Grandpas_Trailer and grandpa is not in Room_Grassy_Clearing:
		if grandpa is not visible: [ if grandpa is elsewhere ]
			increase time_left_waiting of Grandpa by one;
			[If you are a location _ahead_ of grandpa, he will just join you immediately.]
			let heading be the best route from location of Grandpa to Room_Grandpas_Trailer;
			let next_room be the room heading from location of Grandpa;
			if player is in next_room:
				now time_until_leaving of Grandpa is zero;
		else: [ if grandpa is here ]
			[ if you kept grandpa waiting, he says something about it ]
			if time_left_waiting of Grandpa is greater than two:
				queue_report "[one of]Grandpa looks amused, 'Wanna keep me waiting, huh?'[or]Grandpa looks impatient, 'You want to come with me, or not?'[or]Grandpa looks irritated, '[grandpas_nickname], I'm glad you came with me, but don't make me wait for you.'[or]Grandpa looks mad, 'Now, [grandpas_nickname], I've been waiting here for you while you're doing I don't know what. I think you can show a little more respect for your old grandpa and hurry along.'[or]Grandpa looks mad at you for making him wait.[stopping]" at priority 3;
				[If you kept grandpa waiting, he leaves immediately?]
				now time_until_leaving of Grandpa is one; [if made to wait, leaves immediately]
			now time_left_waiting of Grandpa is zero;
			[ countdown for grandpa's departure begins ]
			decrease time_until_leaving of Grandpa by one;
			if we are speaking to Grandpa:
				increase time_until_leaving of Grandpa by one;
			if time_until_leaving of Grandpa is greater than zero and a random chance of 1 in 8 succeeds and grandpa is not in Room_Grandpas_Trailer:
				queue_report "Grandpa sets down the bucket [one of]for a moment and rubs his hands[or]and mops his forehead with his [']kerchief[or]and lights a cigarette and smokes for a bit[in random order]." at priority 3;
		[ ADVANCE: one turn after you arrive, grandpa says something to you and goes one step closer to goal ]
		if time_until_leaving of Grandpa is zero: [time to move]
			if grandpa is visible:
				queue_report "[if a random chance of 1 in 2 succeeds]'[one of]Okay, I'm heading out. You coming?'[run paragraph on][or]You coming?'[run paragraph on][or]Let's get a move on,'[run paragraph on][or]Okay, let's go,'[run paragraph on][or]You coming with your grandpa?'[run paragraph on][or]Almost there,'[run paragraph on][or]Come on, lazybones,'[run paragraph on][cycling] [end if]Grandpa [if player is in Region_Blackberry_Area]heads off toward the old bridge[else if player is in Stone Bridge]crosses the bridge to the dirt road[else if player is in Room_Railroad_Tracks]goes through the back gate into the trailer park[else if player is in Region_Long_Road]heads off toward the railroad tracks[else if player is in Region_Long_Road]heads off toward the railroad tracks[else if player is in Room_B_Loop]goes into his and Honey's trailer[else]is headed for B Loop[end if]." at priority 2;
			else: [if grandpa is one location back]
				queue_report "Grandpa catches up to you [if player is in Stone Bridge]at the stone bridge[else if player is in Region_Blackberry_Area]along the trail[else if player is in Room_Dirt_Road]as you reach the dirt road[else if player is in the Room_Picnic_Area]as you go through the back gate into the trailer park[else if player is in Room_Long_Stretch]as you walk along the dirt road[else if player is in Room_Railroad_Tracks]as you reach the railroad crossing[else if player is in Room_Grandpas_Trailer]and comes into the trailer hauling the big bucket[else]as you head toward B Loop[end if].[run paragraph on] [if a random chance of 1 in 3 succeeds or player is in Room_Grassy_Clearing] '[one of]You gonna wait for your old grandpa, [grandpas_nickname]?'[or]Ah, to be young again,'[or]Alright, Speedy Gonzolas,'[or]Your old grandpa can barely keep up with you,'[or]I got ya, [grandpas_nickname],'[at random] Grandpa says, smiling.[end if]" at priority 2;
			move Grandpa toward trailer;
			[ END: grandpa is in trailer and dumps berries and some other things ]
			if grandpa is in Room_Grandpas_Trailer:
				now seq_grandpa_in_trailer is in-progress;
			now time_until_leaving of Grandpa is 2;
			now time_left_waiting of Grandpa is zero;

To decide if we are talking/speaking to/at (char1 - a person):
	if char1 is current interlocutor:
		if conversing, decide yes;
		if speaking, decide yes;
		if implicit-conversing, decide yes;
	decide no.

To move Grandpa toward trailer:
	let heading be the best route from location of Grandpa to Room_Grandpas_Trailer;
	try silently Grandpa going heading.


Part - The Cat Lady

Sharon is a _female woman.
The printed name is "Cat Lady".
["The Cat Lady is [if Scene_Sheriffs_Drive_By is happening]talking to the Sheriff[else if Sharon is tending-garden]out in front of her trailer watering her tiny, overflowing garden[else if Sharon is feeding-cats]in the kitchen cooking fish for her cats[else if Sharon is watching-tv]sitting in front of a soap opera on her old black and white TV[otherwise]here[end if]. [one of]Her hair is kinda crazy[or]She is still wearing her bathrobe or a dress that looks like a bathrobe[or]She is absently humming to herself[or]She is staring briefly into space[in random order][if a random chance of 1 in 2 succeeds], and that makes you a little [nervous][end if][first time]. She's always been nice to you, even if your grandma doesn't like her[only]. There is a yellow tabby cat rubbing against her legs." ]
The description is "[first time]She has a name, but you never can remember it, especially since both your mom and Honey call her the crazy cat lady behind her back. Is it Sharon? Shannon? And that's not all they call her. Honey says she is a crazy old B-I-T-C-H. But she's always been nice to you. [only]Her makeup is a little bit too thick and she seems to wear a bathrobe at all hours, but you can see how she used to be pretty when she was young."
Understand "cat lady", "Sharon", "lady", "crazy", "Sharon", or "Shannon" as Sharon.
Sharon is in Room_D_Loop.

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
		if Sharon is visible:
			queue_report "The Cat Lady, glances [if player is in Room_Sharons_Trailer]out the window[otherwise]at her trailer[end if] and says, 'I was going to water the garden, but we're having so much fun, I'll do it later.'" at priority 3;
		Sharon tends garden in 15 minutes from now;
	Otherwise:
		if Sharon is visible:
			queue_report "The Cat Lady, glances [if player is in Room_Sharons_Trailer]out the window[otherwise]at her trailer[end if] and says, 'Well, [Cat Lady's nickname], I have to go water the garden.' [run paragraph on]" at priority 3;
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
		if Sharon is visible:
			queue_report "The Cat Lady glances [if player is in Room_Sharons_Trailer]at the TV[otherwise]at her trailer[end if] and says, 'One of my shows is on, but it is so much fun talking to you, I'll skip it.'" at priority 3;
		Sharon watches TV in 15 minutes from now;
	Otherwise:
		if Sharon is visible:
			queue_report "The Cat Lady glances [if player is in Room_Sharons_Trailer]at the TV[otherwise]at her trailer[end if] and says, 'Well, [Cat Lady's nickname], my favorite show is on. You can join me if you want.' [run paragraph on]" at priority 3;
		Move Sharon into her trailer;
		Now Sharon is watching-tv;
		if Sharon is visible:
			queue_report "She sits down in front of her old black and white TV and turns on a soap opera." at priority 2;

At the time when Sharon feeds cats:
	if dramatic scene is happening:
		Sharon feeds cats in 10 minutes from now;
		stop;
	if Sharon is ready-for-tea-time:
		if Sharon is visible:
			queue_report "The Cat Lady [Cat Lady stuff] and says, 'The little dearies are hungry, but we're having so much fun, aren't we?'" at priority 3;
		Sharon feeds cats in 15 minutes from now;
	Otherwise:
		if Sharon is visible:
			queue_report "The Cat Lady [Cat Lady stuff] and says, 'Well, [Cat Lady's nickname], I have to go feed the kitties.' [run paragraph on]" at priority 3;
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
		queue_report "The Cat Lady comes into the trailer and sees you, 'Hi, [Cat Lady's nickname].' The tabby cat follows through the cat door." at priority 3;
	Now Sharon is in Room_Sharons_Trailer;
	Now yellow tabby is in Room_Sharons_Trailer;

Chapter - Responses

[
	Preliminaries and greetings
]

Greeting response for Sharon:
	say "'Oh [one of]hello[or]hello again[stopping], [Cat Lady's nickname],' the Cat Lady says[if a random chance of 1 in 3 succeeds] who [Cat Lady stuff][end if].";

Implicit greeting response for Sharon:
	do nothing;

Farewell response for Sharon:
	say "'Goodbye now, [Cat Lady's nickname],' the Cat Lady says.";

Implicit farewell response for Sharon:
	do nothing.

To say Cat Lady's nickname:
	say "[one of]dear[or]dearie[or]sweetheart[or]honey[at random]";

To say Cat Lady stuff:
		say "[one of]carelessly ruffles the fur of a cat you'd be scared to get near[or]pats the yellow tabby on the head so heavily you can see it squash down like a shock absorber[or]gently removes a kitten trying to climb her like a tree[or]picks off clumps of cat hair that have settled on you[at random]";

[
	Defaults
]

Default give-show response for Sharon:
	say "'Thanks, dearie, not sure I'd know what to do with it,' says the Cat Lady[if a random chance of 1 in 3 succeeds] as she [Cat Lady stuff][end if].";

Default response for Sharon:
	say "'Oh yes, [Cat Lady's nickname], of course,' the Cat Lady says[if a random chance of 1 in 3 succeeds] as she [Cat Lady stuff][end if].";

Default ask response for Sharon:
	say "'Well, I don't know, [Cat Lady's nickname],' the Cat Lady says.";

Default tell response for Sharon:
	say "'[one of]Oh yes, [Cat Lady's nickname], I can see it now![run paragraph on][or]How delightful![run paragraph on][or]Oh please tell me more, [Cat Lady's nickname],[or]You don't say? That's great![run paragraph on][or]Have you talked to your grandpa about that?[run paragraph on][or]You must be thrilled, [Cat Lady's nickname],[at random]' the Cat Lady says[if a random chance of 1 in 3 succeeds] as she [Cat Lady stuff][end if].";

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
	say "'Well [Cat Lady's nickname], you are the sweetest child and my very favorite neighbor,' the Cat Lady says patting you on the head affectionately.".

Response of Sharon when asked-or-told about Grandpa:
	say "'Your grandfather is such a nice man,' the Cat Lady says. 'Just the other day, he helped me get Zoey out of the neighbor's tree[if grandpa is visible].' She smiles at your Grandpa and puts her hand on his arm.[else].'[end if]".

Response of Sharon when asked-or-told about Honey:
	say "The Cat Lady looks a little uncomfortable, 'Your grandmother is very beautiful,' she says after a moment.".

Response of Sharon when asked-or-told about Aunt Mary:
	say "'Oh, Mary,' she claps her hands together, 'such a dear heart. I love her cooking and her preserves.'".

Response of Sharon when asked-or-told about Sharon:
	say "'Oh, [Cat Lady's nickname], I've nothing really to say about myself,' the Cat Lady says.".

Response of Sharon when asked-or-told about Sheriff:
	say "'Oh, Bill's a nice man. He checks on me at least once a week,' the Cat Lady says[if sheriff is visible] smiling at the Sheriff[end if].".

Response of Sharon when asked-or-told about Mom:
	say "'Your mom, [Cat Lady's nickname], you better treat her like an angel, because she is. You know she came and brought me soup when I had pneumonia? And went to the store and got me medicines.".

Response of Sharon when asked-or-told about Dad:
	say "'I didn't know your dad, [Cat Lady's nickname], but I heard he was a very charming man,' the Cat Lady says.".

Response of Sharon when asked-or-told about topic_jam:
	say "'I love your grandmother's preserves,' says the Cat Lady.";

Response of Sharon when asked-or-told about topic_trailer:
	say "'I've lived here for 20 years, [Cat Lady's Nickname]. I've seen people come and go,' says the Cat Lady.";

Response of Sharon when asked-or-told about dog:
	say "Oh dogs, they absolutely terrorize my babies. Just the other day, several of my kitties had to defend their very lives from a ferocious doggy that someone brought in to the park on a leash. It served that bad dog right and he had to be taken to the vet.";

Response of Sharon when asked-or-told about topic_tea:
	say "'Oh, I dearly love tea time, don't you, [Cat Lady's Nickname]?' the Cat Lady asks.";

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
	say "'My job, [Cat Lady's Nickname], is taking care of all my babies,' the Cat Lady says.";

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

Response of Sharon when asked-or-told about Step-Dad:
	now sharon_stepdad_rant is in-progress.
sharon_stepdad_rant is a rant.
	The quote_table is the Table of sharon_stepdad_rant.
	The speaker is Sharon.

Table of sharon_stepdad_rant
Quote
"'Well, your mom just got married and we all wished her the best of luck,' the Cat Lady says, 'It hasn't always been easy for her.' And in spite of himself, that man really does love your mom.[paragraph break]She looks off into the distance and gets a funny look on her face, 'I see it will be very tough for a while as well.'[paragraph break][sharon-stepdad premonition][paragraph break]You almost start to cry, but hold it in."
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
	if index is 1:
		if player is in Room_D_Loop and Sharon is visible:
			queue_report "[one of]'Oh, hello, [Cat Lady's Nickname],' the Cat Lady says, 'So good to see you. Out for an adventure today?'[or]'Oh, hi again, [Cat Lady's Nickname]. Will you spend a few minutes talking to your old neighbor?' the Cat Lady says.[stopping]" at priority 2;
	else if index is 2:
		if player is in Room_D_Loop and Sharon is visible:
			queue_report "'Won't you come in for a moment?' the Cat Lady gestures at her trailer, 'I just love guests. And I do so enjoy talking to you.'" at priority 2;

This is the seq_sharon_invite_interrupt_test rule:
	if we are speaking to sharon, rule succeeds;
	if Scene_Sheriffs_Drive_By is happening, rule succeeds;
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
		queue_report "'Oh, how I love visitors. And you are such a dear heart,' the Cat Lady says, looking at you in a way that makes you nervous. 'I know! I know! Tea time! Let's have a little tea party.' She clasps her hands to her chest." at priority 2;
	else if index is 2:
		if sharon is visible:
			queue_report "'[if player is not on Cat Lady's kitchen table]Oh, [Cat Lady's Nickname], won't you sit down?' the Cat Lady says, pointing at the half-buried kitchen table[else]Oh good, you are already at the table,' the Cat Lady bubbles[end if]. 'I'll get the tea ready.' She bustles around at the sink, in her cupboards, and with the tea things." at priority 2;
			do sharon teatime premonition;
	else if index is 3:
		if sharon is visible:
			queue_report "'[if player is not on Cat Lady's kitchen table]Please, [Cat Lady's Nickname], sit down[else]Oh goodie[end if].' The Cat Lady fills the teapot from a kettle that she didn't bother to heat.[paragraph break]'I love a tea party, don't you?' the Cat Lady asks, but leaves you no time to answer. 'Tell me about your life, [Cat Lady's Nickname]. What adventures have you had since we talked last?'" at priority 2;
	else if index is 4:
		if sharon is visible:
			if player is not on Cat Lady's kitchen table:
				queue_report "You make yourself comfortable at the Cat Lady's kitchen table." at priority 3;
				silently try entering the Cat Lady's kitchen table;
			queue_report "The Cat Lady fills your cup and her own from the teapot. 'I'm terribly sorry, [Cat Lady's Nickname], I don't have tea biscuits. I'm out right now,' she looks accusingly at a particularly fat cat lying on a chair. 'Sam got into the cupboard and ate every last one.' You wonder that the cat can jump up on anything, let alone get into the cupboard." at priority 2;
			now your teacup is filled;
			Now player is confident;
			Now player is sharon-experienced;
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
		if sharon is visible:
			queue_report "'Oh [Cat Lady's Nickname], it's been so nice talking to you. I can see you have to go,' the Cat Lady hugs you and pinches your cheek gently which makes you squirm. 'You are growing so big. And so... such a lovely child,' she says looking you up and down, embarrassing you." at priority 2;
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


Part - Lee

Lee is a _male man in Room_C_Loop.
"Lee is [if Lee is in Room_C_Loop]sitting on a lawn chair in his empty carport, chain smoking[else if Lee is in Room_Lees_Trailer and Lee's TV is switched on]watching TV[else]here[end if]. [first time][description of lee][only]".
The description is  "You think maybe Lee is your mom's age, but looks much older, like he's already lived a lot. He has long dirty blond hair pulled back in an untidy ponytail. He's wearing a tanktop and green army pants. Honey tells you to stay clear of him, but he always says hi to you politely and might be the only person you know who calls you by your name."
Understand "lee/veteran/vet" as Lee.
The scent is "cigarettes and alcohol".

Chapter - Properties

Chapter - Rules and Actions

To say Lee's Nickname:
	say "Jody";

To say Lee stuff:
	say "[one of]looking awkward[or]watching you[or]hanging out[at random]";

Chapter - Responses

[
	Lee's Preliminaries and greetings
]

Greeting response for Lee:
	say "'[one of]Hello[or]Hello again[stopping], [Lee's Nickname],' Lee says.";

Implicit greeting response for Lee:
	do nothing;

Farewell response for Lee:
	say "'See ya, [Lee's nickname],' Lee says.";

Implicit farewell response for Lee:
	do nothing.

[
	Defaults
]

Default give response for Lee:
	say "'Hey, man, thanks. You keep it though,' says Lee[if a random chance of 1 in 3 succeeds] [Lee stuff][end if].";

Default show response for Lee:
	say "'Hey, that's cool,' Lee says.";

Default response for Lee:
	say "'Hmm, yeah cool.";

Default ask response for Lee:
	say "'Well, like a lot of things, I don't know the answer to that[one of][or] either[stopping], [Lee's nickname],' Lee says.";

Response of Lee when saying yes:
	say "Lee smiles.";

Response of Lee when saying no:
	say "Lee frowns but says nothing.";

Response of Lee when saying sorry:
	say "'Ah no, don't be sorry,' Lee says, 'I'm sorry. I'm the one who should be sorry.'";

Instead of touching Lee:
	say "You're not sure at all if it's the right thing to do or whether you're sure you even want to, but you do, and Lee gives you a pat on the back and you can see his eyes have kind of teared up and he turns away to wipe them.";
	Now player is affectionate.

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
	say "'Ah, man, don't even get me started on that fat pig,' Lee says. 'I don't have beef with every cop like some guys, but this sheriff is always trying to bust my chops. Reminds me of some of the Em-Fics we had in Nam. Some of them, good guys. Some of them, a-holes trying to make a point.".

Response of Lee when asked-or-told about Mom:
	say "[one of]'I know your mom. Rachel,' Lee says seriously. 'She's good people. I get people up in my face all the time. People avoiding me. Your mom, she smiles nicely at me and tells me hello.
	[paragraph break]After a moment, he says, 'I think you're pretty lucky. To have a mom like that.'[or]'Yep,' Lee says 'I think you're lucky to have a mom who loves you like that.'[stopping]".

Response of Lee when asked-or-told about Dad:
	say "'Yeah, I definitely don't know your dad,' Lee says. 'Is he around much? Do you see him ever?'".

Response of Lee when asked-or-told about Step-Dad:
	say "'I don't know your step-dad, man,' Lee says, 'I heard him yelling at your mom once, but I'm in no position to criticize.'".

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
	say "'Ah, my family. Yeah, I don't talk to [']em much anymore. My mom. My dad. My brother,' Lee says. 'Did you know I was married? Might even still be. When I came back, she couldn't take it and split.' Lee lights another cigarette. 'I guess good for her. Get out while the gettin's good.'".

Response of Lee when asked-or-told about metal cube:
	if player has held metal cube:
		say "'It was nothing,' Lee says, 'Don't even mention it.' Though you can tell he's pleased to be able to give you the gift.";
	else:
		continue the action;
Before going from Room_Lees_Trailer during Scene_Hangout_With_Lee:
	if index of seq_lee_hangout is greater than 4:
		say "You give a wave to Lee as you go.
		[paragraph break]'Alright, drop by any time, Jody,' Lee says. 'You take care of yourself. And don't let the assholes get you down,' he adds with a wink.";
		now seq_lee_hangout is not in-progress;
		Lee resumes smoking in four turns from now;

At the time when Lee resumes smoking:
	if lee is not in Room_C_Loop:
		move Lee out of his trailer;

The metal cube is a thing. The description is "This is a solid metal cube about the size of your hand. It has very slightly rounded edges. Not as shiny as a ball bearing, but it's really pretty. It's considerably heavier than it appears[first time].
[paragraph break][if lee is visible]Lee watches you with evident enjoyment as you check out the gift.[run paragraph on][end if] Suddenly you remember that you got in trouble for the ball bearing and your mom told you to give it back. And you didn't. Because you thought it would hurt Lee's feelings.[line break]
[paragraph break][italic type]What will happen if your mom discovers this? You determine to hide the cube and not let her find out.[roman type][only].";

After examining the metal cube:
	Now player is compassionate;
	Continue the action.

To move Lee into his trailer:
	now Lee is in Room_Lees_Trailer;
	if player is in Room_Lees_Trailer:
		queue_report "Lee comes in stubbing out his cigarette in an ashtray and says, 'Hey, Jody.'" at priority 3;
	else:
		queue_report "Lee gives you a wave and heads inside his trailer." at priority 3;

To move Lee out of his trailer:
	now Lee is on the lawn chair;
	if player is in Room_Lees_Trailer:
		queue_report "Lee gives you a wave and heads out the door, grabbing a pack of smokes on the way outside." at priority 3;
	else:
		if Lee is visible:
			queue_report "Lee comes out of his trailer, gives you a nod, sits down in his chair, and lights up a smoke." at priority 3;

[TODO: Every turn when Lee is not talking, do Lee stuff, smoke cigarette, etc ]

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

[ TODO: Fix why this is throwing errors
After quizzing Lee about topic_war:
	Now player is compassionate;
	continue the action;]

Table of lee_war_rant
Quote
"'I don't want to talk about it,' Lee snaps and turns away. You're suddenly regretful and embarrassed that you brought it up."
"Lee turns to you and softens, 'I know you didn't mean anything by it, man. It's just hard, you know?' You don't really know, but you hold Lee's gaze. 'It was hard being there and it was hard coming home. I feel like I don't really fit anywhere anymore.'"
"'I heard about a few people who came home and protesters were in their face and so on, but I never got any of that,' Lee continues. 'Hell, I don't blame them. If I'da stayed home, I mighta been right there with [']em. Protesting.'
[paragraph break]After a moment, he continues, 'No, I didn't get any of that, man. What I got was nothing.'"
"'I'm still so angry and hurt, I don't even know what to do with myself.' Lee looks at you. 'I don't even know why I'm telling you all this.'
[paragraph break]He takes a long drag of his cigarette and the smoke blows around your head. Lee waves the smoke away from you and stubs his cigarette out in a coffee can. 'I got people making nice, people tiptoeing around me, nobody -- and I mean nobody -- asking about the war.'"
"'No one asked me, [']Hey, dude, did you kill anyone?['] Or [']Hey, what were you most scared of?[']' Lee seems really angry, but for some reason you're not scared. 'Nah, nobody asked me nothin[']. Nobody asked me shit. Oh sorry pardon my language, [Lee's nickname].' Lee looks up and remembers you."
"Lee looks at you. 'You know what I mean? It was like I'd been down the street buying a loaf a bread. Did anyone know I was gone? I wanted to stop people and shake them. [']Hey, bud, did you know I was in southeast Asia trying not to get myself killed?[']'"
"'Yeah, that's not my best topic, but thanks for listening to my war stories,' Lee says with a smile. 'And hey, thanks for askin[']. Really.'"

Chapter - Sequences

[
	Lee Invite Sequence
]

seq_lee_invite is a sequence.
	The action_handler is the seq_lee_invite_handler rule.
	The interrupt_test is seq_lee_invite_interrupt_test rule.
	The length_of_seq is 2.

This is the seq_lee_invite_handler rule:
	let index be index of seq_lee_invite;
	if Lee is visible:
		now current interlocutor is Lee;
	if index is 1:
		if player is in Room_C_Loop and lee is visible:
			queue_report "[one of]'Hey, Jody,' Lee says, 'How you doin[']?'.[or]'Hi again, Jody,' Lee says.[stopping]" at priority 2;
	else if index is 2:
		if player is in Room_C_Loop and lee is visible:
			queue_report "'I have something for you,' Lee says. 'Last time we were talking about my work, so I picked something up for you. You're welcome to come in, if you want.'[first time]
			[paragraph break][lee invite premonition].[only]" at priority 2;

This is the seq_lee_invite_interrupt_test rule:
	if we are speaking to lee, rule succeeds;
	if Scene_Sheriffs_Drive_By is happening, rule succeeds;
	rule fails.

[
	Scene_Hangout_With_Lee Sequence
]

test lee-hangout with "go to bridge/g/g/pick berries/g/g/eat berries/go to lee's trailer/g/g/g/g/g/g/g/g/g";

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
			move Lee into his trailer;
		if lee is visible:
			queue_report "'So what's up in your world?' Lee asks. 'Anything good? Oh, I have something for you.'
			[paragraph break]Lee is fumbling around in a drawer." at priority 1;
	if index is 2:
		if lee is visible:
			queue_report "'Hey, make yourself comfortable,' Lee says. 'Mi casa, es su casa. That means [']My home is your home.['] Do you want anything? A drink or anything?'
			[paragraph break]It makes you [nervous] to think of drinking or eating in Lee's trailer. You can smell a little alcohol on his breath like your step-dad.
			[paragraph break]Lee is fumbling around in a drawer." at priority 1;
	if index is 3:
		if lee is visible:
			queue_report "'Okay, so last time we were talking about my job. The one at the machine shop,' Lee says. 'I don't work there anymore, but I still have a friend who does, a guy who was in my unit.'
			[paragraph break]Lee is still looking for something." at priority 1;
	else if index is 4:
		if lee is visible:
			queue_report "'I told my friend that you really liked the ball bearing I gave you,' Lee is still fumbling in a drawer.
			[paragraph break]'I told him you liked how shiny and heavy it was. And so,'  Lee seems to find what he's looking for and puts it behind his back. 'He gave me this.'
			[paragraph break]He holds out a solid cube about the size of your hand. Not as shiny as the ball bearing, but with a beautiful metal sheen.  You want to hold it in your hand and feel its weight. You put out your hand and, for a moment, are scared Lee is going to snatch it back.
			[paragraph break]But Lee puts the cube in your hand with a smile. It's heavier even than it appears." at priority 1;
			now player holds cube;
	else if index is 5:
		if lee is visible:
			queue_report "You start to thank Lee, but he looks embarrassed even before you say it and cuts you off. 'I wonder what's on the tube,' He turns to the television and starts fiddling with the rabbit ears." at priority 1;
	else if index is 6:
		if lee is visible:
			try Lee switching on Lee's TV;
			say what_show_is_playing;
			say line break;
			queue_report "'There's never anything really on. Don't know why I bother,' Lee says. 'Feel free to find something that you like.'" at priority 1;
	else if index is 7:
		if turns_so_far of seq_lee_hangout is less than 40:
			decrease index of seq_lee_hangout by one;
	else if index is greater than 7:
		if lee is visible:
			queue_report "'Okay, I'm heading out. You can stay here long as you want. Drop by any time, Jody,' Lee says. 'You take care of yourself. And don't let the assholes get you down,' he adds with a wink." at priority 1;
		Lee resumes smoking in one turn from now;

This is the seq_lee_hangout_interrupt_test rule:
	if we are speaking to Lee, rule succeeds;
	if player is not in Room_Lees_Trailer and player is not on Lee's table:
		[a condition so if player leaves, Lee doesn't get stuck waiting]
		if turns_so_far of seq_lee_hangout is greater than 40:
			rule fails;
		else:
			rule succeeds;
	if player is not in Room_Lees_Trailer, rule succeeds;
	rule fails.


Part - Aunt Mary

Aunt Mary is a _female woman. Aunt Mary is in Room_Grandpas_Trailer.
"Your Aunt Mary is looming over the stove in the kitchen, stirring a huge vat of blackberry jam.".
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

Response of Mary when asked-or-told about Step-Dad:
	say "Her eyes look sharp for a moment, 'I know he and your grandmother have their differences, but I can tell you that he looks like he really loves your mom. When she leaves the room, that man looks like someone just let the air out of him.'"

Response of Mary when asked-or-told about topic_berries:
	say "'Every year,' she smiles. 'Every year, we pick the berries and the jam lasts until the next summer.'"

Response of Honey when asked-or-told about bucket:
	say "Your grandpa [if Scene_Bringing_Lunch is happening]will be bringing[else]brought[end if] that bucket up for me to make more jam."

Response of Mary when asked-or-told about topic_jam:
	say "'That's your grandma's recipe,' she says proudly. 'No,' she looks worried, 'No. Mama is your great-grandmother. It's your great-grandma's recipe.'".

Response of Mary when asked-or-told about train tracks:
	say "'I can hear that old train,' she says. 'Reminds me before any of us had cars - if you wanted to get somewhere, you rode a train.'".

Response of Mary when asked-or-told about topic_lunch:
	if Scene_Bringing_Lunch is happening:
		say "'Oh, you go and take lunch to your Honey and grandpa,' she says. 'That's hungry work.'";
	else:
		say "'Later we'll make some lunch for you and your Honey and grandpa,' she says.";

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
		if mary is visible:
			queue_report "Aunt Mary pauses for a moment from her jam making to talk to you, 'You know your grandpa may need some company if he's bringing that bucket up here.'" at priority 3;
	else if index is 2:
		if mary is visible:
			queue_report "'Also, when you go down to the creek, ask your Grandpa and Grandma about lunch,' Aunt Mary says. 'I can make some sandwiches to send down with you.'" at priority 3;
	else if index is 3:
		if mary is visible:
			queue_report "'Why don't you hustle down to the creek and help your grandpa,' Aunt Mary says and goes back to stirring the jam." at priority 3;

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

Some sandwich makin's are a fixed in place thing. "Aunt Mary has gotten out cans of Chicken of the Sea, Miracle Whip, and Wonder Bread for making tuna sandwiches." The description is "Several cans of Chicken of the Sea, Miracle Whip, and Wonder Bread are out for making tuna sandwiches."
Understand "chicken of the sea", "miracle whip", "wonder bread", "bread/loaf/tuna/spread/mayonnaise/whip/can/cans/bags", "sandwich bags" as sandwich makin's.

A brown paper bag is a unopenable open container. The description is "A plain brown paper bag".

A tuna sandwich is a kind of thing. A tuna sandwiches is edible. [It is singular-named "tuna sandwich".] The description is "These are your favorite. Tuna sandwiches that get delightfully soggy and tasty in the middle. Chicken of the Sea with Miracle Whip on Wonder Bread, all wrapped up in sandwich bags."
Three tuna sandwiches are in brown paper bag.
Understand "chicken of the sea", "miracle whip", "wonder bread", "bread/loaf/tuna/spead/mayonaise/whip/can/cans/bag/bags", "sandwich bags", "sandwich/sandwiches" as tuna sandwiches.

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
			queue_report "Your Aunt Mary recruits you to help make lunch, getting out cans of Chicken of the Sea, Miracle Whip, and Wonder Bread." at priority 1;
			now sandwich makin's are in Room_Grandpas_Trailer;
	else if index is 2:
		if mary is visible:
			queue_report "Your Aunt Mary has you on the assembly line constructing tuna fish sandwiches and putting them in sandwich bags." at priority 1;
	else if index is 3:
		if mary is visible:
			queue_report "You pack all the sandwiches up in a brown paper bag, and Aunt Mary puts away the sandwich makin's. 'Okay, you take those sandwiches down to your grandparents. All those blackberries they're picking. It's hungry work.' Aunt Mary smiles." at priority 1;
		now all tuna sandwiches are in brown paper bag;
		now brown paper bag is held by player;
		now sandwich makin's are off-stage;

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
			queue_report "The Sheriff leans out the window toward the Cat Lady: 'How you doing Sharon? Things okay around here?' The Sheriff flicks his eyes over at you, and you will yourself to be invisible." with priority 1;
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
The initial appearance is "Your mom is watching the movie. Sensing you looking, she looks back at you smiling."
The description is "Mom is, well mom. She's silly and smart and plays with you. Sometimes you think what would happen if something happened to her and you feel like your world would end. Once you came into the house and couldn't find her and searched every room and just as you were edging into panic, she jumped out and scared you. You dropped to the ground crying, and she held you until your tears stopped."
Understand "mommy/ma/mother/rachel/rach" as Mom.

Chapter - Properties

Chapter - Rules and Actions

Chapter - Responses

Chapter - Rants

Chapter - Sequences


Part - Step-Dad

Step-dad is a _male man.
Step-dad is in Room_Camaro_With_Stepdad.
The initial appearance is "Your stepdad is driving. He focuses on the road and you can sense an edge of anger just beneath the surface."
The description is "Your stepdad's name is Mark. You call him 'dad' because your mom asked if you wanted to call him dad when she first got re-married. You shrugged, 'Okay.' So you did. Who knows what the rules are here? You have an inkling that your mom married him because she thought you needed a father. But if you are honest, you're scared of him. You never know whether he will be nice or angry. He's nicer when he drinks beer, but if he has too much, your mom and stepdad get in arguments. One night there was yelling and someone broke the glass clock that used to sit on the endtable in the living room. You know this though, if he ever hurt your mom, you don't know how, but you would kill him."
Understand "dad/step-dad/step-father/stepdad/stepfather/mark", "step dad/father" as Step-dad.

Chapter - Properties

Chapter - Rules and Actions

Chapter - Responses

Chapter - Rants

Chapter - Sequences



Book - Animals

Part - Dog

The dog is a _critter animal in Room_Dirt_Road.
	"[if not loose]There's a dog behind the fence, alternately digging and barking[otherwise]The dog is wandering in the road[end if].".
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
	now player is dog-experienced;
	continue the action.

To say dog_sub_pronoun:
	say "[sub_pronoun of dog]";

To say dog_pos_pronoun:
	say "[pos_pronoun of dog]";

To say dog_obj_pronoun:
	say "[obj_pronoun of dog]";

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
	now player is dog-experienced;
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

Instead of listening when location of player is in Region_Long_Road,
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
	The initial appearance is "Oh no. The dog is wandering in the road. The dog perks up [pos_pronoun of dog] ears as you approach."
	The description is "Kind of a yellowish medium dog with pointy ears. You don't know what kind. [sub_pronoun_cap of dog]'s not a german shepherd or a doberman but [sub_pronoun of dog] looks mean like that. Some kind of guard dog maybe. Do you [italic type]still[roman type] have to get past this dog?".
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

[telling about my people]

Response of dream_dog when told about honey:
	say_dog_people_response;

Response of dream_dog when told about grandpa:
	say_dog_people_response;

Response of dream_dog when told about lee:
	say_dog_people_response;

Response of dream_dog when told about sharon:
	say_dog_people_response;

Response of dream_dog when told about sheriff:
	say_dog_people_response;

Response of dream_dog when told about step-dad:
	say_dog_people_response;

[asking about my people]

Response of dream_dog when asked about honey:
	say_dog_people_response;

Response of dream_dog when asked about grandpa:
	say_dog_people_response;

Response of dream_dog when asked about lee:
	say_dog_people_response;

Response of dream_dog when asked about sharon:
	say_dog_people_response;

Response of dream_dog when asked about sheriff:
	say_dog_people_response;

Response of dream_dog when asked about step-dad:
	say_dog_people_response;

To say_dog_people_response:
	say "'Listen, kid. There's people who are in my pack, and people who aren't. And if they aren't, they all pretty much look the same to me,' the dog says, 'Why don't you tell me about [']em?'".

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
		if dream_dog is visible:
			queue_report "[sub_pronoun_cap of dog] sees you, sizes you up, and to your surprise says, 'You ain't gettin['] by here, kid.'" at priority 3;
	else if index is 4:
		if dream_dog is visible:
			queue_report "Listen, kid,' the dog says, 'It's my job to protect my pack's territory.' [sub_pronoun_cap of dog] looks back at the fence uncertainly, then squats at the edge of the road and pees. 'I'm not sure where that ends, but better safe than sorry.'" at priority 3;
	else if index is 5:
		if dream_dog is visible:
			queue_report "The dog looks at you and looks around. 'Shouldn't you be with your pack?' [sub_pronoun of dog] says." at priority 3;
	else if index is 7:
		if dream_dog is visible:
			queue_report "The dog [dog_does_stuff]. 'You know,' the dog says, 'You've been through a lot, but you're doing okay.' [sub_pronoun_cap of dog] wags [pos_pronoun of dog] tail." at priority 3;
	else if index is 8:
		if dream_dog is visible:
			queue_report "The dog looks thoughtful, 'If you don't mind me sayin['], it's about time you woke up,' [sub_pronoun of dog] says, [dog_doing_stuff], 'You can't spend your whole like dreaming. I'm gonna let you get going,' the dog says, glancing toward the Stone Bridge." at priority 3;
			now dog_free_to_go is true;
	else if index is 9:
		if dream_dog is visible:
			queue_report "[one of]'Pal, I think it's time for you to get going,' the dog says wagging [pos_pronoun of dog] tail.[or]'I've liked talking to you. You better get going,' the dog says.'[or]The dog looks at the stone bridge, 'Time for you to go on and wake up,' [sub_pronoun of dog] says.[in random order]" at priority 3;
			[We do the following, because we want this step to repeat]
			decrease index of seq_dog_convo by one;
			[we make sure this ends when Scene_Dreams ends]

This is the seq_dog_convo_interrupt_test rule:
	if we are speaking to dream_dog,
		rule succeeds;
	if dream_dog is not visible, rule succeeds;
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
	The initial appearance is "There are cats everywhere. The trailer is filled with cats of every size, color, and condition, many still pretty wild. Cats recline, stroll, and argue on every chair, couch, and table in her house."
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

Part - Racoons

Racoons are animals in Limbo.
	The initial appearance is "You can see eyes glowing in the dark. More than two. You count at least four pair."
	The description is "".
	Understand "bandits/invaders/critters" as racoons.


Volume - Debugging


Bearcreek ends here.