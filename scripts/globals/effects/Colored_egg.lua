-----------------------------------
--	Author: Bababooey
-- 	Colored Egg
-- 	A beautifully painted egg. Given as a present. 
--
--	http://wiki.ffxiclopedia.org/wiki/Colored_Egg
--	
--	30 Minutes, All Races
--	HP +20
--	MP +20
--	Attack +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_MP,20);
	effect:addMod(MOD_ATT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
