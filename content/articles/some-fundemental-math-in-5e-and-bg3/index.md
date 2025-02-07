---
title: "Fundamental Math in D&D 5e and Baldur's Gate 3"
description: "A deep dive into the mathematical foundations of D&D 5e and BG3, exploring build calculations, power scaling, and comparative systems analysis"
slug: 5e-bg3-fundamental-math
date: 2022-04-09 00:00:00+0000
image: https://cdn.sanity.io/images/si39ve47/production/689ddf7723353a59fce740dea32c231b4a275d21-2360x1640.png?w=600&fm=webp
categories:
   - Game Design
   - D&D
   - Baldur's Gate 3
   - Mathematics
tags:
   - DnD 5e
   - BG3
   - Game Mechanics
   - Build Guides
   - Power Scaling
   - Game Math
   - Theory Crafting
series:
   - Niche Articles for Hardcore Fans
weight: 1
---

# Guide Some Fundemental Math in 5e and BG3

This is a resource outlining what I consider the most important math for understanding D&D 5e and BG3. In it I detail important formulas you can use to calculate the power of your own builds, but I also explain as clearly as I can how we arrive at those formulas so that you can understand how it works, not just that it works. At the end I explore the math of power scaling – the so-called “flattened math” of 5e – with concrete examples and discuss how all of it should impact how we evaluate the relative strength of build choices.

My plan is to eventually write a similar one of these for Pathfinder, Pillars of Eternity, and the original Baldur’s Gate games as well so we can compare the fundamental math between all of the systems and see how they change what is strong in each system. They will be part of my "niche articles for hardcore fans" series for my patrons. If you like this article, consider subscribing to my [Patreon](https://www.patreon.com/user?u=52365991&fan_landing=true) for more! I already have one article in the series that mathematically models the value of winning initiative.

Check-Bonus Math
----------------

The core method of arbitrating success in D&D 5e and BG3 is the D20 roll. All the really important D20 roles follow the same pattern, which I call the “Check-Bonus” pattern. The “check” is the threshold that a creature has to roll above on their D20. The “bonus” is everything that is added to the roll to try and get over that threshold.

The most common example of this pattern is the basic attack role. In attack roles, the check is called Armor Class (AC) and your bonus is appropriately called your Attack Bonus (which will be the sum of several individual bonuses, proficiency bonus, attribute modifier, weapon enchantment, etc). But note that the same Check-Bonus pattern applies to spell saving throws, where the check is called DC, and the bonus is your appropriate saving throw bonuses. Same goes for skill checks too.

For the Check-Bonus pattern we must first determine what number we have to roll above on the D20, then from there we need to express that as probability.

Hopefully the process of figuring out what number you need to roll above on the D20 is intuitive to you. Nevertheless, it will be useful for us to formalize it. I always refer to this value as “n,” where:

#### n = (Check – Bonus)

Let’s try a quick example. Suppose Niles the rogue has a +5 Attack Bonus and is rolling to hit against an orc with a 16 AC, then “n = 16 – 5” or “n = 11” which just means that Niles must roll an 11 or above to hit the attack.

That is all well and good, but “11” isn’t a value that expresses a probability. In probability, values are expressed in percent (i.e. 15% chance to hit), which is more fundamentally expressed as a decimal (i.e. 0.15). Probability is always the number of desired outcomes divided by the number of total outcomes. We can find the number of desired outcomes by subtracting n from 20, then we divide that by 20 (which is the number of possible outcomes on a 20 sided dice). This new number (n expressed as a probability) I call “p”, thus:

#### p = (20 – n)/20

But there is actually a problem with this, which we will see if we try out the formula. Let’s return to the example of Niles attacking the orc and see how it works. In that scenario n = 11, so p = 9/20, or 0.45 (45%). This cannot be correct, because we know intuitively that rolling an 11 or above on a D20 should be a 50% chance of success (11 through 20 actually represents 10 possible outcomes out of 20, not 9. Try counting them out on your fingers and you will see). Where did the missing 0.05 go?

Remember that if n = 11 then a roll equal to or above 11 is what we need to succeed. It’s the “equal to” that we didn’t calculate in our formula. To account for this I just cheat and add 0.05 on at the end. So the corrected formula expressing n as probability is:

#### p = (20 – n)/20 + 0.05

In the majority of situations p is all we will need to determine our chance to hit. The minority of situations where p does not equal our chance to hit is in situations where there is advantage or disadvantage, so we will turn to calculating those next.

Advantage and Disadvantage
--------------------------

In 5e, attacking with advantage means you roll your D20 twice and take the highest result. Conversely, disadvantage means you roll twice and take the lowest result. The math behind this seems daunting, at least it did for me, until I discovered this helpful way to think about it and model it. We’ll start with attack roles. First, some basic principles:

1.  When you are attacking with advantage, you must miss twice in a row to actually miss.
2.  When you are attacking with disadvantage, you must HIT twice in a row to actually hit.

We can model this with a very simple graph:  

![Adv_DsAdv_Chart](https://cdn.sanity.io/images/si39ve47/production/85004da22c9406459458e015235194c1f200abf7-200x65.png?fm=webp&max-w=448)

  
Each box represents a possible outcome and we can easily picture what our hit percentage will be by shading in the outcomes which will translate to a hit (since what we want is our percentage chance to hit). Note, all four boxes together will equal the value “1” because they represent all possible outcomes.

It's easiest to start with disadvantage. When attacking with disadvantage we need to find the probability of the “Hit-Hit” outcome (see point 2 above), so we graph that by shading it in:  

![DsAdv_Chart](https://cdn.sanity.io/images/si39ve47/production/d4c6eaf1ed97145df4ae897ce32ac134673ae474-201x65.png?fm=webp&max-w=448)

  
This is actually very easy to calculate because we already know how to calculate our base chance to hit. To determine the chance of two outcomes you must multiply those outcomes together, in our case its two hits, so, “hit% x hit%” or “p x p” or “p2”. Let's make a note of that for our list of formulas:

#### Formula for disadvantage: p^2

Now what about when we are attacking with advantage? This is much more complicated to solve, but once we model it on our graph we can see what we need to do. Remember, when attacking with advantage you must miss twice to actually miss, so:

![Adv_Chart](https://cdn.sanity.io/images/si39ve47/production/1c882eaa6ee55316d059a7d628afc6fbe968afc4-199x65.png?fm=webp&max-w=448)

  
The easiest way to zero in on those three boxes is to find the value of the “Miss-Miss” box than subtract that number from 1. Why? Because, as we noted above, all four boxes together equal the value of 1 (or 100% chance, because when calculating odds 100%, expressed as 1, is the upper bound). If we find the exact value of the “Miss-Miss” box and subtract that from 1 we will have the value of the three shaded boxes.

So what is the value of the “Miss-Miss'' box? Well, it will be miss% squared (just like the “Hit-Hit box was hit% squared). The difficulty is we haven’t calculated for the miss equivalent of “p.” But it's really not much of a difficulty, because we can just subtract p from 1 to get miss% (because if you aren’t hitting you are missing, there is no middle term). Thus,

#### Miss% = 1 – p

Then we need to square that to isolate the value of the “Miss-Miss” box:

#### Miss-Miss Box = (1 – p)^2

Then we need to subtract that from 1 to isolate the value of the three shaded boxes:

#### 1 – (1 – p)^2

And that is our formula for calculating our chance to hit when attacking with advantage!

#### Formula for Advantage: 1 – (1 – p)^2

Just for the sake of being thorough, what would the formula be in a “double-advantage” scenario, where you roll three dice and take the highest? This is possible in 5e with the Elven Accuracy feat. In these cases, nothing changes about the math except now you need three hits and three misses, so the formula stays the same except that everytime something is squared, we change it to the power of three, so:

#### Formula for Double Advantage: 1 – (1 – p)^3

Attack Roles (DPR)
------------------

That is all the basics covered. Now we can apply it. One of these easiest and most useful things to calculate in any tactical combat game is damage per round (DPR) on attack roles. 5e uses a standard 3-outcome system for attack roles – Hit, Miss, and Crit. Misses, of course, do no damage at all, so to calculate DPR we need to focus on hitting and critting. The core of the calculation is to multiply your chance for an outcome with the average damage on that outcome, then add that number for all outcomes together. When we do this we get the following formula:

#### DPR = (Hit% - Crit%) x dmg/hit + Crit% x dmg/crit

Here our Hit% will be equal to p (modified accordingly for advantage and disadvantage). The reason we subtract Crit% from it at the beginning is because when we were calculating p above we did not differentiate hitting from critting, so p actually includes both probabilities together until we subtract Crit% out of it.

Still, there is something missing from this formula, and it is number of attacks in a round. What the above formula really represents is damage per attack, so we can just multiply the whole thing by attacks per round (APR) to get to a full DPR formula:

#### DPR = ((Hit% - Crit%) x dmg/hit + Crit% x dmg/crit) APR

And, of course, if your build makes separate attacks on a bonus action, you will need to run the same formula for bonus actions and add that to the whole.

As a final note to finish this section off, I want to discuss the mathematics of critting. First off, what does a crit actually do? In D&D 5e a critical hit allows you to double all your damage dice when you roll damage. It does not double any flat bonuses that you have, for example, from your strength attribute or barbarian rage or even the Great Weapon Master (GWM) feat. That means your dmg/crit value will be a little less than double your dmg/hit, depending on your build and how much of your damage is coming from dice rolls. For a typical level 4 GWM fighter a crit will hover around a 35% boost to damage, for a typical level 4 rogue a crit will be around a 73% increase to damage, and for a level 4 wizard casting Chromatic Orb a crit will actually double your damage (100% increase).

It's also important to remember that advantage/disadvantage modifies your crit percent as well. If you are rolling twice and taking the highest you will be critting more often as well as hitting more often! The contrary is true if you are attacking with disadvantage. Run the same formula on your base odds to crit to get your modified Crit% when attacking with advantage/disadvantage.

Spell Saves (DPTr)
------------------

Enough about attacks, what about spells? Spells by and large have many potent effects that are hard to mathematically model, so we won’t try to do that here. All you can really calculate on a spell like Hold Person is how likely you will be to land the spell on a target and how much it boosts the DPR of an ally to attack a paralyzed target. How valuable it is to lock down a target in a fight is more nebulous. Nonetheless, there are some spells that are just damage spells and understanding and comparing these is very straightforward.

In 5e, most damage spells will fit into two kinds, which I call attack spells and save spells. An attack spell is just like attacking with a weapon, so the math is identical to what we outlined above. We won’t say anything more about them.

Save spells are different. In a save spell you don’t roll to hit, instead, you impose your check (DC) against your target who rolls against it to avoid the effect. Because of this, it would feel contrived for save spells to crit (do you crit if they roll as 1? Its weird…). To compensate for not being able to crit, save spells do half damage on a miss.

As in the case of calculating attack roles, the formula will be multiplying your chance for an outcome with the average damage on that outcome, then add those numbers for all outcomes together. In this case we have two possible outcomes: hit and miss. Thus, our base formula will be:

#### Save Spell Damage = Hit% x dmg/hit + Miss% x dmg/miss

That is the damage it will do to a single target though. Many spells, like Fireball for example, can hit more than one target. Thus:

#### Save Spell Damage = (Hit% x dmg/hit + Miss% x dmg/miss) Targets

The thing is, its impossible to predict what the average targets hit will be. It will vary drastically by your group strategy and the amount of combatants you face in an encounter. For this reason, I prefer to compare damage spells by their damage per target stat (DPTr) and make a note of how effective their targeting method is. This is as far as out very simple calculations will get us, the rest is up to your own best judgement, and that is the really fun part!

Progression and Flattened Math
------------------------------

The last area of math that is fundamental to understanding 5e and BG3 has to do with character progression. That is, how much stronger does a character get from level 1 to level 20? To model this, let’s look at the very basic stats of Elanna the Fighter. At level 1 Elanna has 16 strength and constitution, is wearing chainmail armor, and wields a longsword and shield with the Dueling Fighting Style. Here are her basic combat stats:

**Elanna (Lvl 1)**

**Attack Bonus:** +5  
**Damage:** 9.5, 14 on a crit  
**APR:** 1  
**AC:** 18  
**HP:** 13

Fast forward 20 levels, and now Elanna has a 20 strength and constitution. In her adventures she acquired +3 plate armor, and a +3 longsword and shield (the highest level of enchantment). Here are the same stats at max level:

**Elanna (Lvl 20)**

**Attack Bonus:** +14  
**Damage:** 14.5, 19 on a crit  
**APR**: 4  
**AC:** 26  
**HP:** 224

You can probably already see that the gains to attack bonus, damage, and armor class are not very high. The more important and impactful progression is in hit points and attacks per round. But let’s make the point clearer by comparing them to an enemy. Here are the basic stats of a Pit Fiend, an enemy Elanna might face at level 20:

**Pit Fiend (CR 20)**

**Attack Bonus:** +14  
**Damage:** 19.5, 31 on a crit  
**APR:** 4  
**AC:** 19  
**HP:** 300

Level 20 Elanna has an 80% chance to hit the Pit Fiend with an attack. But if Elanna fought the Pit Fiend at level 1, she would still have a 35% chance to hit it! 35% chance is not high, but it's much higher than the 5% chance that we would expect from a level 1 character fighting a CR 20 monster.

Still though, it would take Lvl 20 Elanna 7 rounds on average to kill the Pit Fiend, whereas it would take Lvl 1 Elanna 85 rounds on average, a big difference! But what is the cause of it? Let’s try and isolate the variables. What if Lvl 20 Elanna only had 1 APR, in this situation it would take her 26 rounds on average to kill the Pit Fiend. However, Lvl 1 Elanna with 4 APR would kill it in 22. So, we can see that APR is BY FAR the most important factor in Elanna’s offensive progression.

What about her defensive progression? The Pit Fiend would kill Lvl 20 Elanna in 6 rounds on average and would kill Lvl 1 Elanna in 1. If level 1 Elanna had her level 20 armor and shield (26 AC) she would still die in 1 round. However, if she kept her 18 AC and instead had her level 20 HP she would survive 4 rounds on average. Tanking hits with HP is thus a more important part of Elanna’s defensive progression than avoiding them through AC. This is very different from other RPG systems like Pathfinder or 3e D&D where avoiding attacks is more potent.

The takeaway is this: that the potency of your attacks has a very stunted progression in 5e. Most progression comes from (1) making more attacks and (2) being able to tank more attacks. Elanna achieves this through stacking APR and HP, but a similar effect can be achieved by overwhelming enemies with sheer numbers. An army of goblins in 5e is a formidable encounter. Sure their attacks are weak, but they have so many of them, and that is what matters in 5e. This is why even weak summons are strong in 5e. The same principle is why it's practically always better to find consistent uses for underused action types than it is to boost your standard action. Finding ways to make attacks with your bonus action and reaction every round is similar to boosting your APR.

Progression for spell casters is an entirely different story, that I don’t have the time to go into yet. The principles for it are not so different from what is standard in RPG’s, that progression is primarily found in the potency of the spells found at higher levels. Accuracy on your spells is very difficult to improve in 5e.

List of Formulas
----------------

**n = (Check – Bonus)** \[this is the number you have to roll at or above on D20\]

**p = (n – 20)/20 + 0.05** \[this expresses n as a probability\]

**Formula for disadvantage: p^2**

**Formula for Advantage: 1 – (1 – p)^2**

**Formula for Double Advantage: 1 – (1 – p)^3**

**DPR = ((Hit% - Crit%) x dmg/hit + Crit% x dmg/crit) APR**

**DPTr = (Hit% x dmg/hit + Miss% x dmg/miss) Targets**

[Return home](/articles)