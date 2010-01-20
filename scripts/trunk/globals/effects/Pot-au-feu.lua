-----------------------------------
--	Author: Bababooey
-- 	Pot-au-feu
-- 	A stew of rabbit meat and assorted vegetables in a lightly seasoned 
--	broth. A popular ration in the Kingdom during the Great War. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pot-au-feu
--
--	30 Minutes, All Races
--	Strength +3
--	Agility +3
--	Ranged Attack +15-25%
--	Ranged Accuracy +10-25%
--	Intelligence -3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:addMod(MOD_AGI,3);
	effect:addMod(MOD_FOOD_RATTP,15);
	effect:addMod(MOD_FOOD_RATT_CAP,60);
	effect:addMod(MOD_FOOD_RACCP,10);
	effect:addMod(MOD_FOOD_RACC_CAP,60);
	effect:subtractMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
