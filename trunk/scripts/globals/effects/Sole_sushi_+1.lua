-----------------------------------
--	Author: Bababooey
-- 	Sole Sushi +1
--  Only a master chef could have produced such a fine display of Eastern cuisine.
--
--	http://wiki.ffxiclopedia.org/wiki/Sole_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +20
--	Strength +5
--	Dexterity +6
--	Accuracy +16%
--	Ranged Accuracy +16%
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_DEX,6);
	target;addMod(MOD_FOOD_ACCP,16);
	target;addMod(MOD_FOOD_RACCP,16);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
