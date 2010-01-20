-----------------------------------
--	Author: Bababooey
-- 	Sophic Stew
-- 	This savory brain stew will make you wonder how you would settle
--	for anything less.
--
--	http://wiki.ffxiclopedia.org/wiki/Sophic_Stew
--
--	4 Hours, All Races
--	Dexterity +6
--	Intelligence +6
--	Mind +6
--	HP Recovered while healing +3
--	MP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,6);
	effect:addMod(MOD_INT,6);
	effect:addMod(MOD_MND,6);
	effect:addMod(MOD_HPHEAL,3);
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
