-----------------------------------
--	Author: Bababooey
-- 	Urchin Sushi +1
-- 	If the urchin eggs on this sushi were any fresher, they'd hatch.
--
--	http://wiki.ffxiclopedia.org/wiki/Urchin_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +40
--	Strength +1
--	Vitality +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,40);
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_VIT,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_FOOD_ACCP,16);
	effect:addMod(MOD_FOOD_RACCP,16);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
