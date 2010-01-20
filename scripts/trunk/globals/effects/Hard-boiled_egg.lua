-----------------------------------
--	Author: Bababooey
-- 	Hard-Boiled Egg
-- 	A boiled egg. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hard-Boiled_Egg
--	
--	30 Minutes, All Races
--	HP +10
--	MP +10
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
