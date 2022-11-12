# Bear Creek
*Version 2.0.1*

Bear Creek is interactive fiction, a coming-of-age story from a unique point-of-view.

> *Bear Creek, August 1975.*
>
> *Looking back, it was that summer, or maybe just that one day that changed everything. KC and the Sunshine Band was on the radio and you were eight years old. A curious daydreamer, on the verge of learning what lay beyond the boundaries of your own little world, and nothing was certain about whether you’d survive the journey.*

## The Game

Here you can play the story online, super convenient, but not my recommendation.

[Click here to experience part 1 of Bear Creek online.](https://modes.io/bear-creek/)

**Version 2.0, the complete story in three parts, is a work in progress, expected to be released within the next several months.**

While playing in a browser is certainly convenient, it can be typographically painful to this author.  A better alternative is to download software that presents interactive fiction on your desktop.  I highly recommend the typographically beautiful Lectrote which can play a whole host of different format IF games. This is a bit more complicated, but in this author's opinion, well worth it.

1. Download and install [Lectrote](https://github.com/erkyrath/lectrote/releases), available for Linux, Mac, and PC.
2. Download the [Bear Creek story file](https://modes.io/html/bearcreek/Bear%20Creek.gblorb)
3. Run the story file with Lectote.

## Soundtrack

Honey's little AM radio is playing pop hits from the era. Here's what that tiny AM radio might be playing, a decent soundtrack for Bear Creek.

[![Screenshot of Spotify soundtrack playlist](https://github.com/wmodes/bearcreek/blob/main/Extras/spotify-playlist.png?raw=true)](https://open.spotify.com/playlist/6aYofBvKeIRwJUNq7CiJVG?si=b75792acb6f04ef0)

## A Word for Newbies

If you are new to parser-based interactive fiction, you may be challenged in interesting ways. I’d suggest you take a look at the [“A Beginner's Guide to Interactive Fiction,”](http://www.brasslantern.org/beginners/beginnersguide.html) a brief tutorial on playing interactive fiction. You can find it easily from the game screen by clicking on the Home Page link on the left. That might help some. From there, you’ll also see I’ve made the source code available if you care to geek out over that.

Also, here's a handy cheat sheet:

![IF Cheat Card](https://github.com/wmodes/bearcreek/blob/main/Extras/play-if-card.png?raw=true)

Traditionally, in parser-based fiction there are puzzles that occasionally challenge your progress through the narrative. Many IF authors (including this one) think puzzles can get in the way of the narrative.  That said, Bear Creek has some features that may be considered very very light puzzles. My best suggestion is this: Try your best to inhabit the world and the player character, forgetting best you can that this is a “game.”

## Behind-the-Scenes

The Bear Creek source code, over 14,000 lines and 71,000 words, is written in Inform7, a programming language and design system for interactive fiction. Inform7 uses natural language syntax and draws on ideas from linguistics and from literate programming. This example of Inform7 code from the Bear Creek source defines the first "room" of the game.

> Room_Lost_in_the_Brambles is a room.
>   The printed name is "Lost in the Brambles".
>   The description is "[one of]You were sure that this was a better spot than where you've been picking all morning. But here too, the biggest ripest berries seem just out of reach. You pick a few ripe berries and drop them in your pail[or]This spot, a little ways from where Honey and Grandpa are picking, has some good berries[stopping]. Under the pine trees, the air smells good.[paragraph break]Looking around: [available_exits][paragraph break][description of backdrop_sunlight]".
>   Understand "lost/-- in/-- the/-- brambles" as Room_Lost_in_the_Brambles.
>   The scent is "sunshine and that dusty fragrance of pine trees that you remember from hiking with Grandpa in the mountains".
>   The casual_name is "lost in the brambles".
> 
> The available_exits of Room_Lost_in_the_Brambles is "The grassy clearing where Honey and Grandpa have been picking is just down the hill from here."
> 
> Some pine trees are backdrop in Room_Lost_in_the_Brambles.
>   The description is "Pine trees fringe the tangle of berry brambles.". Understand "tree/pines/pine" as pine trees.
>   The scent is "sharp pine pitch".
> 
> Some backdrop_sunlight is backdrop in Region_Blackberry_Area.
>   The printed name is "sunlight".
>   The description is "The sunlight comes slanting through the trees in the [if current_time_period is morning]morning light. The air is still crisp here in the shade with the early promise of a hot midsummer day[otherwise]afternoon light. Under the trees, the air is cooler[end if]."
>   Understand "light/sun/sunlight/sunshine/sky/clouds", "sun shine/light", "shade" as backdrop_sunlight.
