-----------------------------------
--	Author: Bababooey
-- 	Hydra Kofte +1
-- 	This hydra kofte has been baked to absolute perfection. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hydra_Kofte_%2B1
--	
--	4 Hours, All Races
--	Strength +7
--	Intelligence -3
--	Attack +21% (Cap: ???)
--  Ranged Attack +20% (Cap: ???)
--	Defense +25% (Cap: ???)
--	Resist Poison
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,7);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_FOOD_ATTP,21);
	effect:addMod(MOD_FOOD_ATT_CAP,157);
	effect:addMod(MOD_FOOD_RATTP,21);
	effect:addMod(MOD_FOOD_RATT_CAP,157);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,70);
	effect:addMod(MOD_POISONRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
