-----------------------------------
--	Author: Bababooey
-- 	Vegetable Soup
-- 	A soup made with a variety of vegetables. 
--
--	http://wiki.ffxiclopedia.org/wiki/Vegetable_Soup
--
--	3 Hours, All Races
--	Vitality -1
--	Agility +4
--	Ranged Accuracy +5
--	HP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,4);
	effect:addMod(MOD_RACC,5);
	effect:addMod(MOD_HPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
