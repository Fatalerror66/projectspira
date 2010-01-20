-----------------------------------
--	Author: Bababooey
-- 	Goblin Stew
-- 	 
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Stew
--
--	3 Hours All Races
--	Dexterity -4
--	Attack +15.5%
--	Ranged Attack +15.5%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,4);
	effect:addMod(MOD_FOOD_ATTP,16);
	effect:addMod(MOD_FOOD_RATTP,16);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
