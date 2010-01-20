-----------------------------------
--	Author: Bababooey
-- 	Prime Beef Stewpot
-- 	The cooking of this beef stewpot was strictly supervised to ensure that
--	the ingredients were added in the proper manner.
--
--	http://wiki.ffxiclopedia.org/wiki/Prime_Beef_Stewpot
--
--	4 Hours All Races
--	Group Food Effects
--	HP +15% (Cap: 75@500 Base HP)
--  MP +15
--	Strength +2
--	Agility +1
--	Mind +1
--  Attack +20% (Cap: ???@222 Base Attack
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,75);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_STR,2);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,11);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
