-----------------------------------
--	Author: Tenjou
--  Cheese Sandwich (effect)
--
--	http://wiki.ffxiclopedia.org/wiki/Cheese_Sandwich
--	HP+10, AGI+1
--	30 minutes
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
