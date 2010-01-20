-----------------------------------
--	Author: Bababooey
-- 	Tomato Soup
-- 	A soup of sweet Mithran tomatoes. 
--
--	http://wiki.ffxiclopedia.org/wiki/Tomato_Soup
--
--	3 Hours, All Races
--	Agility +3
--	Vitality -1
--	HP Recovered while healing +5
--	Ranged Accuracy +9% (Cap: 15)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_FOOD_RACCP,9);
	effect:addMod(MOD_FOOD_RACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
