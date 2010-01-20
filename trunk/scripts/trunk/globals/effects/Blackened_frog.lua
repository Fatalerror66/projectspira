-----------------------------------
--	Author: Bababooey
-- 	Blackened Frog
-- 	A copper frog, roasted black.
--
--	http://wiki.ffxiclopedia.org/wiki/Blackened_Frog
--	30 minutes, All Races
--	Dexterity +2
--  Agility +2
--	Mind -2
--  Attack +14% (Cap: 60@428 Base Attack)
--	Ranged Attack +20% (Cap: ???)
-- 	Evasion +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_EVA,5);
	effect:addMod(MOD_FOOD_ATTP,14);
	effect:addMod(MOD_FOOD_ATT_CAP,60);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,60);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
