-----------------------------------
--	Author: Bababooey
-- 	Green Curry Bun +1
-- 	With a generous portion of savory green curry nearly bursting from its
--	flaky crust, this piping hot bun is truly a treat to all five senses.  
--
--	http://wiki.ffxiclopedia.org/wiki/Green_Curry_Bun_%2B1
--
--	60 Minutes, All Races
--	Vitality +1
--	Agility +2
--	Defense +12%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_FOOD_DEFP,12);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
