-----------------------------------
--	Author: Bababooey
-- 	Soft-Boiled Egg
-- 	A soft-boiled egg. 
--
--	http://wiki.ffxiclopedia.org/wiki/Soft-Boiled_Egg
--	
--	60 Minutes, All Races
--	HP +20
--	MP +20
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_MP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
