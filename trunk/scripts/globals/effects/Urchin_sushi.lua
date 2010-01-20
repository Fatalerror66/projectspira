-----------------------------------
--	Author: Bababooey
-- 	Urchin Sushi
-- 	The raw eggs of a Bibiki urchin served on a small portion of 
--	sweet vinegar rice wrapped in seaweed.
--
--	http://wiki.ffxiclopedia.org/wiki/Urchin_Sushi
--	
--	30 Minutes, All Races
--	HP +40
--	Strength +1
--	Vitality +5
--	Resist Sleep
--	Accuracy +15%
--	Ranged Accuracy +15%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,40);
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_VIT,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_FOOD_ACCP,15);
	effect:addMod(MOD_FOOD_RACCP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
