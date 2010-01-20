-----------------------------------
--	Author: Bababooey
-- 	Rabbit Pie
-- 	No rabbits were harmed in the making of this pie.  
--
--	http://wiki.ffxiclopedia.org/wiki/Rabbit_Pie
--	
--	30 Minutes, All Races
--	Strength +5
--	Vitality +5
--	Attack +25% (Cap: 100)
--	Ranged Attack +25% (Cap: 100)
--	Defense +25 (Cap: 100)
--	Intelligence -2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_VIT,5);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,25);
	effect:addMod(MOD_FOOD_ATT_CAP,100);
	effect:addMod(MOD_FOOD_RATTP,25);
	effect:addMod(MOD_FOOD_RATT_CAP,100);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,100);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
