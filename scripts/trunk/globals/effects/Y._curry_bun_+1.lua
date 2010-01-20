-----------------------------------
--	Author: Bababooey
-- 	Yellow Curry Bun +1
-- 	With a generous portion of savory yellow curry nearly bursting from its
--	flaky crust, this piping hot bun is truly a treat to all five senses. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yellow_Curry_Bun_%2B1
--
--	30 Minutes, All Races
--	HP +30
--	Strength +5
--	Agility +2
--	Vitality +2
--	Intelligence -2
--	Attack +23% (Cap: 80@375 Base Attack) 
--	Ranged Attack +23% (Cap: 80@375 Base Ranged Attack) 
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,23);
	effect:addMod(MOD_FOOD_ATT_CAP,80);
	effect:addMod(MOD_FOOD_RATTP,23);
	effect:addMod(MOD_FOOD_RATT_CAP,80);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
