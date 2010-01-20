-----------------------------------
--	Author: Ahze
--  Gulldago
--  Tutorial NPC - UNCOMPLETE!!!
--		Description From http://wiki.ffxiclopedia.org/wiki/Tutorial_NPC :
--	 The tutorial NPCs will help new players on their first steps in the world of Vana'diel.
--	 This is done through a series of assignments, in which people will become familiar with
--	 battling, Signet, crafting, and some other basic actions.
--	
--	 If you created your character before the September 2008 Version Update,
--	 or if you have already completed the last assignment given by the tutorial NPC,
--	 they will simply provide information about Skillchains, Magic Bursts, and search commands. 
--	
--	Before each quest is given, the NPC will provide tutorial information about various aspects
--	 of the game which is worth reading if you've never played before. 
--
-----------------------------------
-- Includes
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
zoneT = npc:getZone();

--print("Tutorial NPC Name:",npcname);
--print("NPC ID:",npcid);
--print("Zone:",zoneT); 

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------


-- DialogTableEntries by zone from POLUtils
-- [ Legend ]
-- ##a) = Southern San d'Oria (G-10)
-- ##b) = Bastok Markets (D-11)
-- ##c) = Windurst Woods (K-10) 

-- Event IDs from http://projectxi.org/wiki/index.php/Bastok_Markets

-- player:startEvent(Event(0x218)); -- steps 1b, 2-4		[* 1st time Direct Conversation /w NPC]
-- player:startEvent(Event(0x205)); -- Event(0x218) in CS	[* if player leaves for the 1st time]
-- player:startEvent(Event(0x206)); -- steps  5 & 6			[NEEDED: "Signet" cast on the player]
-- player:startEvent(Event(0x207)); -- step   6 only		[MISSING: "Signet" cast on player]
-- player:startEvent(Event(0x208)); -- steps  7 - 20 		[RECIVE: 6x "strips of Meat Jerky" b/n step 10 & 11]
-- player:startEvent(Event(0x209)); -- steps 20 only 		[MISSING: "food" eaten by player]
-- player:startEvent(Event(0x20A)); -- steps 21 - 33 		[NEEDED: Any Weaponskill 5 or above]
-- player:startEvent(Event(0x20B)); -- steps 27 - 33 		[MISSING: Weaponskill 5 or above]
-- player:startEvent(Event(0x20C)); -- steps 34 - 51		[NEEDED: Check the "Auction Counters"] CRAFTing NOT NEEDED
-- player:startEvent(Event(0x20D)); -- steps 50 & 51		[MISSING: Check the "Auction Counters"]
-- player:startEvent(Event(0x20E)); -- steps 52 - 61		[RECIVE: voucher for a Chariot Band.  b/n step 59 & 60]
-- player:startEvent(Event(0x20F)); -- steps ?? - ??		[MISSING: Use of voucher for a Chariot Band]
player:startEvent(0x210,,0x02);
-- player:startEvent(Event(0x210)); -- steps ?? - 76		[RECIVE: Raising Earring [b/n step 66&67] give next zone info shows La Theine Plateau/west Ronfaure ?VAR?
-- player:startEvent(Event(0x211)); -- steps 
-- player:startEvent(Event(0x212)); -- steps 
-- player:startEvent(Event(0x213)); -- steps 
-- player:startEvent(Event(0x214)); -- steps 
-- player:startEvent(Event(0x215)); -- steps 
-- player:startEvent(Event(0x216)); -- steps 
-- player:startEvent(Event(0x217)); -- steps 

-- Event IDs from http://projectxi.org/wiki/index.php/Windurst_Woods
-- 032C,032D,032E,032F,0330,0331,0332,0333,0334,0335,0336,0337,0338,0339,033A,033B,033C,033D,033E,033F

-- Event IDs from http://projectxi.org/wiki/index.php/Southern_San_d%27Oria
-- 03A6,0393,0394,0395,0396,0397,0398,0399,039A,039B,039C,039D,039E,039F,03A0,03A1,03A2,03A3,03A4,03A5 


--  1a) 5684	Greetings and well met! Guardian of the Kingdom, Alaune, at your most humble service.?Prompt?
--  1b) 5685	Greetings and well met! Defender of the Republic, Gulldago, at your most humble service.?Prompt?
--  1c) 5686	Greetings and well met! Protector of the Federation, Selele, at your most humble service.?Prompt?

--   2) 5687	My station is to help along those new to the life of an adventurer in Vana'diel.
--				I specialize in the types of fundamental knowledge necessary for success in such endeavors, as well as related methods of pedagogy.
--				With my aid, you can rest assured that your first steps down the adventurer's path will not go astray.?Prompt?
--   3) 5688	Should you still consider yourself a newcomer, I would highly recommend that you make full use of my services.?Prompt?
--   4) 5689	This is my permanent post, and I never leave it. Remember it well.
--				Whenever you need a hand with anything, anything at all, don't hesitate to come calling.?Prompt?
--   5) 5690	So, are you interested in some entry-level duties to put you well on your way to greatness?
--				Not to worry, I've got just the thing for you!?Prompt?
--  6a) 5691	Go talk to the guard Aravoge just over yonder and have him cast “Signet” on you. Then come back and see me.?Prompt?
--  6b) 5692	Go talk to the guard Rabid Wolf over yonder and have him cast “Signet” on you. Then come back and see me.?Prompt?
--  6c) 5693	Go talk to the guard Harara over yonder and have her cast “Signet” on you. Then come back and see me.?Prompt?
---- Complete 1st mini Quest ----
--   7) 5694	Well, it looks like you were able to get your Signet. Easy enough, yes??Prompt?
--   8) 5695	As long as Signet is in effect, there is always a possibility that you will obtain crystals from any enemies that you defeat.
-- 				There are also other more concrete benefits, such as increased defense and evasion.?Prompt?
--   9) 5696	Signet even helps you when not engaged in combat with an enemy. For example, it boosts the rate at which healing occurs while at rest.
--				For all of these reasons and more, you should consider it essential to have Signet cast on you at all times.?Prompt?
--  10) 5697	Very well, then! As a reward for successful completion of your first assignment I would like to present you with these [[ffxiclopedia Six]] <color="green"> strips of Meat Jerky. <\color> .?Prompt?
--  11) 5698	There is more here than “meats” the eye! That was a joke...
--  	 		Anyway, this is a type of item known amongst adventurers as a “meal.”
--				This meal in particular will temporarily enhance your attack power when eaten.?Prompt?
--  12) 5699	Whenever any type of meal is consumed, you will receive some such temporary status bonus.
--				Naturally, different meals grant different types of bonuses.?Prompt?
--  13) 5700	For the most part, meat dishes will affect attack power.
--				Conversely, seafood dishes generally enhance defense, and so on and so forth.
--				Take care to select dishes best suited to your purpose.?Prompt?
--  14) 5701	One thing you should make note of, however, is that you cannot eat a meal while another meal's status bonus is still in effect.
--				Your stomach would simply burst!?Prompt?
--  15) 5702	Hmmm, that's quite a lot to cover...
--				Are you with me so far??Prompt?
---- step 16: a menu pops up here /w DialogTableEntries from POLUtils of : 5703
--			So far so good?
--			?Selection Dialog?Explain Signet again.
--			Explain meals again.
--			This is a breeze.?Prompt?
--  17) 5704	Great! Well, talking can only prepare you so much. Let's get right down to it.
--				Go ahead and pop one of those <color="green"> strips of meat Jerky <\color>!
--  18) 5705	After eating a meal, a status icon designated as “Food” will appear in the upper-left portion of your screen.
--				Come back and talk to me again once you've confirmed that it's there.?Prompt?
---- Complete 2nd mini Quest ----
--  19) 5706	Check out the full belly on you! Well done!
--				Signet and meals can both play crucial roles whenever you take on any type of enemy.
--				This is a key lesson that you would do well not to forget!?Prompt?
--  20) 5707	Next, let's get those pristine hands of yours nice and dirty!
--				No sense in letting that food go to waste now, is there? Let's send you out to fight a monster on a full stomach!?Prompt?
--  21) 5708	Exiting through that gate over there will lead you into an area with hostile enemies.?Prompt?
--  22) 5709	Try to target one of the monsters and then select the “Check” option from your menu.
--				This will help you ascertain an enemy's level of difficulty and make sure they are not too strong. A smart adventurer picks ?Multiple Choice (Player Gender)?[his/her] fights.?Prompt?
--  23) 5710	Be warned. Engaging any enemy that checks as “very tough” or above will result in your Signet not granting you the defense and evasion bonuses you would otherwise receive.?Prompt?
--  24) 5711	And that brings us to your next assignment!?Prompt?
--  25) 5712	It's high time you learned how to use a “weapon skill”!?Prompt?
--  26) 5713	Perhaps you've already noticed, but sometimes while fighting an enemy, your “skills” will rise little by little.?Prompt?
--  27) 5714	When your skill with the weapon you are wielding reaches a predetermined value, weapon skills will become available for use.?Prompt?
--  28) 5715	“Combo” for those adept with hand-to-hand weapons. “Wasp Sting” for those who fight with daggers.
--				“Fast Blade” for those who prefer the sword.?Prompt?
--  29) 5716	“Shining Strike” for wielders of the club. “Heavy Swing” for those who take up the staff.
--				And on, and on, and on...?Prompt?
--  30) 5717	Selecting “Status” from the main menu will bring up the “Combat Skl.” option.
--				This will display all of the current skill values in all weapon categories.?Prompt?
--  31) 5718	The first weapon skill for each weapon type can be learned at a skill value of 5.
--				So make that your first goal, and we'll take it from there!?Prompt?
---- Complete 3rd mini Quest ----
--  32) 5719	Ohhh! Somebody went and learned a new weapon skill, didn't ?Multiple Choice (Player Gender)?[he/she]?
--				Very good!?Prompt?
--  33) 5720	I can see by that twinkle in your eyes that you've already used it on some poor, unfortunate creature, but I'll explain just a bit more.
--				Whenever your “Tactical Points” (TP) reach 100% or more, selecting “Abilities” and then “Weapon Skl.” from the menu will display a list of usable weapon skills.?Prompt?
--  34) 5721	These are deadly techniques capable of rendering massive damage on enemies.
--				It is well worth an adventurer's time to learn and master them.?Prompt?
--  35) 5722	Ah, by the way, were you fortunate enough to receive some items from the monsters you fought??Prompt?
--  36) 5723	If you were lucky enough to come across any ?Possible Special Code: 01??Possible Special Code: 05?%?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, make sure you hang onto them.
--				They may pay dividends later on...?Prompt?
--  37) 5724	Also, that reminds me. There is another lesson better learned sooner than later.
--				The items you will no doubt come across known as “crystals,” such as ?Possible Special Code: 01??Possible Special Code: 05?%a?BAD CHAR: 80??BAD CHAR: 80? and ?Possible Special Code: 01??Possible Special Code: 05?%b?BAD CHAR: 80??BAD CHAR: 80?, are extremely significant.?Prompt?
--  38) 5725	They are truly versatile items that can be used for a number of purposes.
--				These include trading them to guards for certain rewards, and selling them to earn money, just to name a few.?Prompt?
--  39) 5726	For now, I'd like to explain more about another of their uses. Namely, the role they play in “synthesis.”?Prompt?
--  40) 5727	But first things first. Your reward for completing your last assignment! Here you are, then.
--				?Unknown Parameter (Type: 80) 1??Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$a?BAD CHAR: 80??BAD CHAR: 80?, ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$b?BAD CHAR: 80??BAD CHAR: 80?, and last but not least, ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$c?BAD CHAR: 80??BAD CHAR: 80?.?Prompt?
--  41) 5728	Now, using ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$c?BAD CHAR: 80??BAD CHAR: 80? will bring up the synthesis interface.
--				Once there, select the ?Possible Special Code: 01??Possible Special Code: 05?#a?BAD CHAR: 80??BAD CHAR: 80? and ?Possible Special Code: 01??Possible Special Code: 05?#b?BAD CHAR: 80??BAD CHAR: 80? as the ingredients to be added.?Prompt?
--  42) 5729	All that remains is to select the “OK” option, and the synthesis will commence!?Prompt?
--  43) 5730	You'll find that the crafting process will never begin, should the ingredients you've selected not form a viable synthesis recipe.
--				Also, even when your materials are correct, there is always a chance that your synthesis will fail, so please be wary.?Prompt?
--  44) 5731	The majority of items which you create via synthesis, as well as most of those dropped by enemies you defeat, can be placed on the “Auction House” for sale.?Prompt?
--  47) 5732	The auction house is an ultra-consumer venue where you can attempt to purchase the wares of other players by placing bids, as well as have other players bid on items you have put up for sale.?Prompt?
--  48) 5733	My words alone can do no justice to the vast cornucopia of goods that is the auction house.
--				One simply must see it with one's own eyes.?Prompt?
---- step 49: a menu pops up here /w DialogTableEntries from POLUtils of : 5734
--			Are you still with me?
--			?Selection Dialog?Explain synthesis again.
--			Explain the auction house again.
--			Sure am.?Prompt?
--  50) 5735	Somewhere in this great city lies our nation's auction house. Seek it out, and report back to me when you have found it.?Prompt?
--  51) 5736	You needn't worry about going through with an actual purchase.
--				Simply examining any of the “Auction Counters” will more than suffice.?Prompt?
---- Complete 4th mini Quest ----
--  52) 5737	So, you were able to locate the auction house!
--				Pretty hard to miss, isn't it??Prompt?
--  53) 5738	What do you think? It is as I said, yes? Few organizations in this world exceed the auction house in scale.
--				It will never cease to be of use to you throughout your adventures. It would be wise to become adept at using it.?Prompt?
--  54) 5739	And now down to brass tacks!
--				Let's see if we can't get you to up some levels!?Prompt?
--  55) 5740	There are several items in existence which serve to enhance the number of experience points you receive for defeating enemies.?Prompt?
--  56) 5741	For example, there are ?Possible Special Code: 01??Possible Special Code: 05?%?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, ?Possible Special Code: 01??Possible Special Code: 05?%a?BAD CHAR: 80??BAD CHAR: 80?, and ?Possible Special Code: 01??Possible Special Code: 05?%b?BAD CHAR: 80??BAD CHAR: 80?, just to name a few.?Prompt?
--  57) 5742	These are a bit unique in that you must wait a certain amount of time after equipping them before you may use them.?Prompt?
--  58) 5743	There is also a predetermined amount of time, usually quite long, that must pass before these items can be used again.
--				The total number of times you may use any single item is also limited, so be mindful of that as well.?Prompt?
--  59) 5744	Many of these items may be obtained from the same guards that provide you with Signet.
--				You need only exchange “Conquest Points” in order to acquire them.?Prompt?
--  60) 5745	As a matter of fact, for finishing that last assignment, I'm going to give you this ?Possible Special Code: 01??Possible Special Code: 05?3c?BAD CHAR: 80??BAD CHAR: 80?.
--				With this, you'll be able to obtain ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80? without having to use any of your Conquest Points.?Prompt?
--  61) 5746	Head over to any guard and have a go at exchanging them for something.
--				And after that, see if you can't make it all the way up to level four.
--				I'll be right here waiting for you when you get back.?Prompt?
--  62) 5747	With an experience bonus in place, it should take you practically no time at all.
--				Good luck, and be careful! It can get quite hairy out there!?Prompt?

--  63) 5748	Well, well, well! We might make an adventurer out of you just yet!
--				Looks like we've almost washed all that green off of you.?Prompt?
--  64) 5749	A bit of bad news now, though.
--				Starting from level four, anytime you are knocked unconscious your experience points will suffer a deduction.?Prompt?
--  65) 5750	As a general rule, the amount penalized will be about 10% of the total amount required to reach the next level.
--				You have to be more careful than ever from here on out!?Prompt?
--  66) 5751	However, there are ways to minimize this loss of experience points.?Prompt?
--  67) 5752	Like this, for example. Go on, take it. Your reward for reaching level four.
--				It's called ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?.?Prompt?
--  68) 5753	Using this will grant you a status known as “Reraise.”
--				Whenever you are rendered unconscious while this effect is in place, you will have the option to revive yourself.?Prompt?
--  69) 5754	Choosing to do so will cause you to be resuscitated in the very spot where you have fallen.
--				In addition, as I stated previously, the amount of experience points you lose will be somewhat lessened.?Prompt?
--  70) 5755	?Unknown Parameter (Type: 80) 1??Possible Special Code: 01??Possible Special Code: 05?%?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80? and similar items work in the same manner as the ?Possible Special Code: 01??Possible Special Code: 05?%a?BAD CHAR: 80??BAD CHAR: 80? and the other experience bonus items I mentioned earlier.
--				That is, once equipped, you must wait a certain period of time before they can be used, and there are both cooldown timers and limited charges as well.?Prompt?
--  71) 5756	All of these items as a whole are collectively referred to as “enchanted items.”
--				There is a vast array of other enchanted items with myriad other effects that will prove useful on your adventures.
--				It may be worth the time and effort to better acquaint yourself with them at some point.?Prompt?
--  72) 5757	It seems you're starting to get the hang of things.
--				Next, I'd like for you to go and fight some enemies in ?Multiple Choice (Parameter 2)?[La Theine Plateau/the Konschtat Highlands/Tahrongi Canyon].?Prompt?
--  73) 5758	?Multiple Choice (Parameter 2)?[La Theine Plateau/The Konschtat Highlands/Tahrongi Canyon] is located beyond the ?Multiple Choice (Parameter 2)?[southern/northern/northern] reaches of ?Multiple Choice (Parameter 2)?[West Ronfaure/North Gustaberg/East Sarutabaruta].?Prompt?
--  74) 5759	You're sure to encounter some new monsters there that you won't find prowling around the outskirts of the city.
--				It may be a bit daunting, so I'll only require that you slay one such beast, and then head on back.?Prompt?
--  75) 5760	Just keep in mind, the farther you stray from the city, the more ferocious monsters tend to be.
--				Don't say I didn't warn you.?Prompt?
--  76) 5761	Make sure to use the “Check” command to determine the strength of your enemy.
--				If you find that you are surrounded by enemies too difficult for you, try heading back to a previous area closer to the city and leveling up a bit more first.?Prompt?
--  77) 5762	I know those smells...
--				You smell of victory! And of ?Multiple Choice (Parameter 2)?[La Theine Plateau/the Konschtat Highlands/Tahrongi Canyon]! Good on you, ?Player Name?.?Prompt?
--  78) 5763	But by now you must be getting sick and tired of fighting the same old monsters so close to the city walls, aren't you??Prompt?
--  79) 5764	If you are several levels beyond a monster and totally outclass them in every respect, checking them will yield a “too weak to be worthwhile” result.?Prompt?
--  80) 5765	Killing monsters so far beneath you is borderline cowardice, and will net you no experience points.?Prompt?
--  81) 5766	If you start to notice more and more of these “too weak” monsters around you, consider moving farther from the city to a more difficult area.?Prompt?
--  82) 5767	Congratulations on another milestone! Reward tiiime!
--				You've just earned yourself ?Numeric Parameter 0? experience points, hotshot.?Prompt?
--  83) 5768	Let's dive right into your next assignment while that blood is still pumping!?Prompt?
--  84) 5769	I'm going to up the stakes here a little bit, ?Player Name?. But it's for your own good.
--				I want you to go out and get all the way to level ten.?Prompt?
--  85) 5770	Considering your current level and the knowledge you have, you shouldn't confine yourself to the immediate vicinity of the city.
--				You're more than capable of besting monsters in ?Multiple Choice (Parameter 2)?[La Theine Plateau/the Konschtat Highlands/Tahrongi Canyon] at this point.?Prompt?
--  86) 5771	I knew you wouldn't disappoint me. So how's it feel? You're moving on up in the world.
--				Time to put some money in those pockets. A ?Numeric Parameter 1?-gil reward, just for you. Don't spend it all in one place.?Prompt?
--  87) 5772	By now you should be relatively familiar with the basics of battle. Am I right or am I right??Prompt?
--  88) 5773	But don't go getting too cocky!
--				This world is chock-full of monsters just waiting for the opportune moment to pounce and knock you out cold!?Prompt?
--  89) 5774	Depending on the type of monster, there are several factors that could cause them to attack you without provocation.
--				I'll enumerate some of the more common types of this blatantly aggressive behavior for you.?Prompt?
--  90) 5775	For starters, and most obviously, there are monsters which detect by sight. They will attack you whenever you enter their field of vision. This is the most prevalent type. They simply cannot stand the sight of adventurers.?Prompt?
--  91) 5776	Next, there are those monsters which detect by sound. They can be a bit more dangerous than visually-dependent monsters, in that they will attack the source of any sound within a certain prescribed radius.
--				You may not think it, but there are a great many monsters whose aural senses are far more developed than their sense of sight.?Prompt?
--  92) 5777	There are also monsters which detect their enemies' spellcasting. Much like the sound-detecting types, these monsters will attack the source of any magic casting within a certain radius of their being.
--				Not surprisingly, many monsters in the arcana family rely heavily on this method of detection, which covers a comparatively larger range than the aforementioned sense of hearing.?Prompt?
--  93) 5778	And finally, there are opportunistic monsters which prey upon the weak and near-dead, pinpointing their prey by detecting low hit points.
--				The family of undead creatures abound in monsters of this type. Even more distressing, the fewer the hit points you have, the farther the distance from which you can be detected.?Prompt?
--  94) 5779	Your next assignment will attempt to familiarize you with these detection methods, and train you to become adept at avoiding them.?Prompt?
--  95) 5780	I want you to travel once again to ?Multiple Choice (Parameter 2)?[La Theine Plateau/the Konschtat Highlands/Tahrongi Canyon], and retrieve an item known as a “Gate Crystal.”?Prompt?
--  96) 5781	Near the center of ?Multiple Choice (Parameter 2)?[La Theine Plateau/the Konschtat Highlands/Tahrongi Canyon], you will find a large, white, almost otherworldly structure. On the area map, it is labeled as the ?Multiple Choice (Parameter 2)?[Crag of Holla/Crag of Dem/Crag of Mea].?Prompt?
--  97) 5782	There you will find one of an enormous series of crystals known as “Telepoints.”
--				Simply examine the telepoint you find there, and bring back your findings.?Prompt?
--  98) 5783	Only when you present your ?Possible Special Code: 01??Possible Special Code: 05?3?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80? to me shall your assignment be complete.?Prompt?
--  99) 5784	Exercise the utmost caution. There are many extremely dangerous monsters in the area you will be visiting.
--				And take extra care not to draw the attention of any beastmen.?Prompt?
-- 100) 5785	This shall be your final assignment.
--				Go now, and may the Goddess watch over you.?Prompt?
-- 101) 5786	Ahhh, the ?Possible Special Code: 01??Possible Special Code: 05?3?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, just as I requested.
--				Excellent work, ?Player Name?.?Prompt?
-- 102) 5787	And now for some information regarding this little beauty.
--				As long as you have this ?Possible Special Code: 01??Possible Special Code: 05?3?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, you will be able to be transported by the appropriate spell of teleportation directly to the telepoint from which you retrieved it.?Prompt?
-- 103) 5788	I doubt that you will have many opportunities to use it for the time being, but you would do well to remember what I have said.?Prompt?
-- 104) 5789	Several such telepoints exist, scattered throughout Vana'diel.
--				Each has its own specific gate crystal, which you will receive the first time that you examine any of them.?Prompt?
-- 105) 5790	Let me take this time to offer you a most heartfelt congratulations, ?Player Name?!
--				You have successfully completed all of the assignments I have laid before you.?Prompt?
-- 106) 5791	And here I have a most fitting reward for you. A gift of ?Numeric Parameter 1? experience points, and ?Numeric Parameter 3? ?Possible Special Code: 01??Possible Special Code: 05?%b?BAD CHAR: 80??BAD CHAR: 80?.?Prompt?
-- 107) 5792	I fear that I have nothing more to teach you.
--				From now on, your lessons will best be learned by giving a mindful ear to others and being ever observant on your travels.?Prompt?
-- 108) 5793	Do remember, though, that the paths open before you will multiply greatly should you cooperate with other adventurers.?Prompt?
-- 109) 5794	Leveling, for example, is an endeavor made immeasurably more efficient and enjoyable in the company of others.
--				It helps to not only guarantee you some modicum of safety in numbers, but also rewards you with considerably more experience points than adventuring alone.?Prompt?
-- 110) 5795	I suppose it does require a good deal of courage to approach an adventurer you do not know, but I strongly encourage you to do so.
--				It may prove to be the beginning of an extremely rewarding and long-lasting friendship.?Prompt?
-- 111) 5796	There may still be some small facets of adventuring that I can continue to offer you advice on.
--				Should you ever have any questions or anxieties, please do not hesitate to come and see me again.
--				I will do my best to be of service and set your heart at ease.?Prompt?
-- 112) 5797	Go now, and go well. The world awaits its next great adventurer, ?Player Name?.?Prompt?
---- Completion of  ALL mini Quest
---- or Create char before "September 2008 Version Update"[possible VER_Date here]
---- or already completed the last assignment given by a/the tutorial NPC


end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)


end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;