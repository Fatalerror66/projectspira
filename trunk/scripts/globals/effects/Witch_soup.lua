-----------------------------------
--	Author: Bababooey
--  Witch Soup
-- 	This mushroom soup has been bewitched. 
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Soup
--
--	4 Hours, All Races
--	MP +25
--	Strength -1
--	Mind +2
--	HP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,25);
	effect:subtractMod(MOD_STR,1);
	effect:addMod(MOD_MND,2);
	effect:addMod(MOD_HPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
