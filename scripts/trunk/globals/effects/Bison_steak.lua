-----------------------------------
--	Author: Bababooey
-- 	Bison Steak
-- 	A juicy slab of medium rare bison meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bison_Steak
--	3 hours, All Races
--	Strength +6
--  Agility +1
--	Intelligence -3
--	Lizard Killer
--  Attack +18% (Cap: 90@500 Base Attack)
--	Ranged Attack +18% (Cap: 90@500 Base Raneged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,6);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_LIZARD_KILLER,5);		--TODO: %Intimidation needs research
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,90);
	effect:addMod(MOD_FOOD_RATTP,18);
	effect:addMod(MOD_FOOD_RATT_CAP,90);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
