-----------------------------------
--	Author: Bababooey
-- 	Salmon Croute
--  A cheval salmon in a flaky pie wrapping.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Croute
--	
--	30 Minutes, All Races
--	HP +8
--	MP +8
--	Dexterity +2
--	MP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,8);
	effect:addMod(MOD_MP,8);
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
