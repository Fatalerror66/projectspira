-----------------------------------
--	Author: Bababooey
--  Witch Stew
-- 	This bowl of mushroom stew has been bewitched. 
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Stew
--
--	4 Hours, All Races
--	MP +45
--	Strength -1
--	Mind +4
--	MP Recovered while healing +4
--	Enmity -4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,45);
	effect:subtractMod(MOD_STR,1);
	effect:addMod(MOD_MND,4);
	effect:addMod(MOD_MPHEAL,4);
	effect:subtractMod(MOD_ENMITY,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
