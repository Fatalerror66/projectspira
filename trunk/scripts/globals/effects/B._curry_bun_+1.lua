-----------------------------------
--	Author: Bababooey
-- 	Black Curry Bun +1
-- 	With a generous portion of savory black curry nearly bursting 
--	from its flaky crust, this piping hot bun is truly a treat to all five senses. 
--
--	http://wiki.ffxiclopedia.org/wiki/Black_Curry_Bun_%2B1
--
--	60 Minutes, All Races
--	Intelligence +1
--	Vitality +4
--	Dexterity +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
