-----------------------------------
--	Author: Bababooey
-- 	Brain Stew
-- 	This traditional Goblin stew looks suspiciously like brains.
--
--	http://wiki.ffxiclopedia.org/wiki/Brain_Stew
--
--	3 Hours, All Races
--	Dexterity +5
--	Intelligence +5
--	Mind +5
--	HP Recovered while healing +3
--	MP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,5);
	effect:addMod(MOD_INT,5);
	effect:addMod(MOD_MND,5);
	effect:addMod(MOD_HPHEAL,3);
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
