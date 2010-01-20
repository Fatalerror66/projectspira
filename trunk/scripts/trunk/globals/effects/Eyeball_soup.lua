-----------------------------------
--	Author: Bababooey
-- 	Eyeball Soup
-- 	The eyeballs that give this soup its name are taken from the hecteyes. 
--
--	http://wiki.ffxiclopedia.org/wiki/Eyeball_Soup
--
--	3 Hours All Races
--	HP +6% (Cap: 70@116 Base HP)
--  Charisma -10
--  HP Recovered while healing +4
--  Accuracy +12
--  Ranged Accuracy +12
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,70);
	effect:subtractMod(MOD_CHR,10);
	effect:addMod(MOD_HPHEAL,4);
	effect:addMod(MOD_ACC,12);
	effect:addMod(MOD_RACC,12);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
