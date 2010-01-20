-----------------------------------
--	Author: Bababooey
-- 	Vegetable Gruel
-- 	A boiled porridge made from a variety of vegetables mixed with flour or rice. 
--
--	http://wiki.ffxiclopedia.org/wiki/Vegetable_Gruel
--
--	3 Hours, All Races
--	Vitality -1
--	Agility +2
--	Ranged Accuracy +15% (Cap: 10)
--	HP Recovered while healing +4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_FOOD_RACCP,15);
	effect:addMod(MOD_FOOD_RACC_CAP,10);
	effect:addMod(MOD_HPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
