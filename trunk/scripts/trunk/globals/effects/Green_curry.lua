-----------------------------------
--	Author: Bababooey
-- 	Green Curry
-- 	A delicious curry with crayfish.
--
--	http://wiki.ffxiclopedia.org/wiki/Green_Curry
--
--	3 Hours, All Races
--	Agility +2
--	Vitality +1
--	Defense +8.5%
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Ranged Accuracy +5% (Cap: 25)
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_FOOD_DEFP,9);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_RACCP,5);
	effect:addMod(MOD_FOOD_RACC_CAP,25);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
