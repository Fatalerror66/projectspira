-----------------------------------
--	Author: Bababooey
-- 	Blackened Newt
-- 	This newt has been blackened over charcoal.
--
--	http://wiki.ffxiclopedia.org/wiki/Blackened_Newt
--	3 hours, All Races
--	Dexterity +4
--  Mind -3
--  Attack +18% (Cap: 60@333 Base Attack)
--	Resist Virus
-- 	Resist Curse
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,60);
	effect:addMod(MOD_VIRUSRES,5);
	effect:addMod(MOD_CURSERES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
