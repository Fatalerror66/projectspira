-----------------------------------
--	Author: Bababooey
-- 	Sunset Soup
-- 	The flavor of this tomato soup is sublime. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sunset_Soup
--
--	4 Hours, All Races
--	Agility +3
--	Vitality -1
--	HP Recovered while healing +5
--	Ranged Accuracy +9% (Cap: 20)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_FOOD_RACCP,9);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
