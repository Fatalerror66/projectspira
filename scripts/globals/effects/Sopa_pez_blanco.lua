-----------------------------------
--	Author: Bababooey
--  Sopa Pez Blanco
-- 	The whitefish in this stew is as white as snow. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sopa_Pez_Blanco
--
--	3 Hours, All Races
--	HP +12
--	Dexterity +6
--	Mind -4
--	Accuracy +3
--	Ranged Accuracy +7% (Cap: 10)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,12);
	effect:addMod(MOD_DEX,6);
	effect:subtractMod(MOD_MND,4);
	effect:addMod(MOD_ACC,3);
	effect:addMod(MOD_FOOD_RATTP,7);
	effect:addMod(MOD_FOOD_RATT_CAP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
