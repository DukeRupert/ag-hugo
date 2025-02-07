---
title: "How Valuable is Initiative? A Game Design Analysis"
description: "An analytical look at the value of initiative in turn-based tactical games and how character durability affects its importance"
slug: value-of-initiative-game-design
date: 2022-10-10 00:00:00+0000
image: https://cdn.sanity.io/images/si39ve47/production/689ddf7723353a59fce740dea32c231b4a275d21-2360x1640.png?w=600&fm=webp
categories:
   - Game Design
   - Game Theory
   - Strategy
tags:
   - Initiative
   - Turn-Based Games
   - Game Mechanics
   - Game Analysis
   - Combat Systems
weight: 1
---
Guide How Valuable is Initiative?
=================================

#### Definitions

“Initiative” is the system for determining turn order in turn based tactical games.

#### Answer

Winning initiative is worth one turn. Conversely, losing initiative is like giving your enemy a turn. The value of a turn varies from system to system. Fundamentally, it is affected by durability of the characters. Durability mitigates the potency of a single turn, and thus mitigates the value of initiative.

Analysis
--------

In the context of a typical fight there are a lot of factors which make initiative difficult to understand, so let’s begin by looking at a very simple fight. First, we remove multiple opponents, and look only at a 1v1 fight. So, you “P” are fighting a single enemy “N.” Then let's remove any variation between P and N and say that both have an equal chance of winning the encounter, let's say a 50% chance to hit, and an 100% chance to kill on a hit. How does initiative impact this very simple fight?

If X wins the initiative they, of course, have a 50% chance of winning, because a single hit will win the encounter, and they have a 50% chance of hitting. But what if they lose initiative? If they lose they (1) hit an attack (as before), and (2) Y has to miss an attack. Both have a 50% chance of occurring, so overall they have 25% chance of winning the encounter if they lost. In summary

1 hit to kill:

*   Win initiative: 50% of P winning
*   Lose initiative: 25% of P winning

There is a problem though; this doesn’t add up to 100%, and it must, since both combatants are equally powerful. The reason it doesn’t is because what it really calculates is the odds of winning an encounter as soon as possible, without wasting any turns by missing. You’ll notice though that missing an attack is the same in our model as losing initiative; you can model it as restarting the fight, but now the enemy attacks first. For that reason, we will just focus on the odds of winning as quickly as possible.

Now let's gradually increase the complexity and see if we can notice any patterns. We’ll start by making the encounter require 2 hits to kill on both sides, with the same chance to hit. In a 2 hit to kill fight, if we win initiative the fight will look like this:

P1(hit) – 50%

N1 – it doesn’t matter if they miss or hit, because we survive either way. So the outcome of this is irrelevant.

P2(hit) – 50% and we win.

0.5\*0.5 = 0.25 or 25% chance of victory. But if N loses initiative in the 2 hit to kill fight the chance of survival is the following:

N1 – just put this turn aside for now.

P1(hit) – 50%

N2(miss’) – I am using miss’ to designate all outcomes where N misses a least one attack between N1 and N2.

P2(hit) – 50%

In simplified terms, it’s the chance of two hits (25%) multiplied by the chance of N(miss’). The odds of miss’ prime are:

1 – 0.5 \* 0.5 = 0.75 = 75%

Therefore:

0.75 \* 0.25 = 0.1875 = 18.75%

Which completes our 2 hit to kill calculations:

2 hit to kill:

*   Win initiative: 25% of P winning
*   Lose initiative: 18.75% of P winning

3 hit to kill will be:

3 hit to kill:

*   Win initiative: 0.53 = 0.125 = 12.5%
*   Lose initiative: 0.125 \* (1 – 0.125) = 0.1093 = 10.93%

And hopefully now we can see the pattern in the math.

x to kill = chance-for-P-to-hitx\*(1 - chance-for-N-to-hitx)

Cool! So with that, let's complicate it a little more and see what happens if we win initiative but miss on one of our turns. This is for a 2 hit to kill fight:

P1 – this is where we miss

N1 –

P2(hit)– 50%

N2 (miss’)– 75%

P3(hit)– 50%

Seem familiar? It’s the exact same as if we lost initiative on a 2 hit to kill. This means that missing an attack, i.e. losing a turn, is the same outcome as losing initiative.

But what about if we miss on a 2 hit to kill fight when we lost initiative?

N1 –

P1 – This is where we miss

N2 –

P2(hit)– 50%

N3(miss’’) – I am using miss’’ to designate all outcomes where N misses a least two attacks between N1 and N3. This is kind of complicated math, and I’m not sure how to express it simply. Its (1 – chance-to-hit^2 – chance-to-miss^2) \* chance-to-miss + chance-to-miss^2. Which in this case = 50%

P3(hit) – 50%

It’s the same, except you are giving P one more shot at hitting you. In effect, you give them +1 turn by losing initiative and +1 turn from missing. See the pattern? Winning initiative is always equal to losing 1 turn. In a 1v1 scenario, losing a turn is the same as giving your enemy a turn.

This stays the same regardless of what your % chance to hit is. Why? Because chance to hit, like hits to kill, is effectively defining the value of your turn. So, as we saw in the math, winning initiative is worth more when your turn is worth more, because winning initiative = 1 turn. Its also worth more when your enemy’s turn is worth more, because losing initiative is like giving them an extra turn.

Finally, let's reintroduce one more level of complexity: multiple opponents. Imagine P is now fighting two enemies, N and M. In regards to initiative order, there are four possible outcomes:

1.  P moves before both N and M
2.  P moves after N but before M
3.  P moves after M but before N
4.  P moves after both N and M

We don’t need to go through all the math to understand how each outcome will affect the overall chance of success. All we need to do is remember that losing initiative is like giving your enemy a turn, then think of each outcome in turns of losing initiative rather than winning it. In outcome (1), we didn’t give them any extra turns, in outcome (2) and (3) we are giving only one enemy a turn, and in outcome (4) we gave both a turn.

The same goes for all the varied combinations of enemies and allies. It gets screwy, but it helps me model it if I compare an outcome to the best possible outcome. The best possible is that all of your guys move before all of their guys. Each enemy that gets to move before one of your units is stealing a little bit of turn back for themselves.

Conclusion
----------

What all of this means is that initiative will be extremely important in systems where turns are very volatile. For a perhaps familiar example, think of the Pokémon system. In Pokémon, its not uncommon to one-shot your enemies, so it’s no surprise that the speed stat (which determines initiative order) is so crucial. On the other extreme, picture chess, where a single encounter can last 50 turns or more. Even in chess it's an advantage to move first, but not nearly as significant an advantage as in Pokémon.

Of course, likely no one who is reading this cares about the importance of initiative in Pokémon or chess. My audience is interested in BG3 and D&D 5e more generally, so let's finish this article by looking at those specifically.

In BG3 and 5e, the value of a turn will vary by your build and what kind of enemy you face. A minotaur’s turn is more valuable than a goblin's turn. Likewise, an optimized level 4 build has more valuable turns than an unoptimized level 1 character. But a relatively easy way to estimate its value is to ask “how many turns will it take to kill my enemies?” and “how many turns will it take my enemies to kill me?” The simplest way to estimate that is to compare your average damage per round (DPR) to their hit point totals. It follows then that initiative will be less valuable in battles against more durable enemies or in more durable team builds.

Another really important question is what can we do in a system to ensure that we consistently win initiative? In BG3 and 5e, initiative is determined through a dexterity skill check, i.e. a 1d20 roll + your dexterity modifier. There aren’t many consistent ways to boost initiative beyond this. The fact that it’s a 1d20 roll means that each +1 bonus we add is equivalent to a 5 %point boost. The highest possible dexterity modifier is a +5 (which comes at a high opportunity cost), and nets us a 25 %point increase in winning initiative. That is NOT very consistent at all, not for its opportunity cost.

This means that in BG3 and 5e more durability is more important compared to other tactical RPG systems. Initiative order is going to be unpredictable, there is no way around it, so the best way to make fights predictable is to minimize turn volatility, which means build tankier party compositions.

However, there are other features of BG3 and 5e which do favor turn volatility, for example, the possibility of surprise. With investment in stealth, you can reliably surprise your enemies, which gives your whole party a free turn at the start of combat. In BG3 you are overwhelmingly more likely to surprise your enemies then they are to surprise you. In tabletop 5e, that will depend on your DM. So keep that in mind.

[Return home](/articles)