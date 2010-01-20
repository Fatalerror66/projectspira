-----------------------------------
--	Author: Bababooey
-- 	Red Curry Bun
-- 	A crispy fried bun with an aromatic red curry filling.
--
--	http://wiki.ffxiclopedia.org/wiki/Red_Curry_Bun
--
--	30 Minutes, All Races
--	HP +25
--	Strength +7
--	Agility +1
--	Intelligence -2
--	Attack +24.7% (Cap: 150@652 Base Attack) 
--	Ranged Attack +24.7% (Cap: 75@375 Base Ranged Attack) 
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_STR,7);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,25);
	effect:addMod(MOD_FOOD_ATT_CAP,150);
	effect:addMod(MOD_FOOD_RATTP,25);
	effect:addMod(MOD_FOOD_RATT_CAP,75);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
