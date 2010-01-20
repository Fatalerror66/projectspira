-----------------------------------
--	Author: Bababooey
-- 	Yellow Curry Bun
-- 	A crispy fried bun with a tangy yellow curry filling.
--
--	http://wiki.ffxiclopedia.org/wiki/Yellow_Curry_Bun
--
--	30 Minutes, All Races
--	HP +25
--	Strength +5
--	Agility +2
--	Intelligence -2
--	Attack +20% (Cap: 75@375 Base Attack) 
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack) 
--	hidden effect : attack caps at 85 when eaten in a party of 4 or more. 
--	The effect does not wear off upon disbanding.
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,75);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,75);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
