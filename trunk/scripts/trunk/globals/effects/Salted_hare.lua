-----------------------------------
--	Author: Bababooey
-- 	Salted Hare
-- 	An incredibly simple dish made by roasting hare meat seasoned with salt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salted_Hare
--	
--	30 Minutes, All Races
--	HP +10
--	Strength +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_STR,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
