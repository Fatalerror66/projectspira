-----------------------------------
--	Author: Bababooey
-- 	Roasted Corn
-- 	A roasted ear of corn, lightly sweetened.
--
--	http://wiki.ffxiclopedia.org/wiki/Roasted_Corn
--	
--	30 Minutes, All Races
--	HP +6
--	Vitality +3
--	Dexterity -1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,6);
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_DEX,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
