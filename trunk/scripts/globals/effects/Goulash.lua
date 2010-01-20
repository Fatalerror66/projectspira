-----------------------------------
--	Author: Bababooey
-- 	Goulash
-- 	A rich and spicy stew made with chunks of coeurl meat and an 
--	assortment of vegetables. A popular ration in the Republic during the Great War.  
--
--	http://wiki.ffxiclopedia.org/wiki/Goulash
--
--	3 Hours All Races
--	Vitality +3
--	Intelligence -2
--	Defense +10% (Cap: 30?@??? Base Defense)
--	Accuracy +10% (Cap: ??@??? Base Accuracy)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_DEFP,10);
	effect:addMod(MOD_FOOD_DEF_CAP,30);
	effect:addMod(MOD_FOOD_ACCP,10);
	effect:addMod(MOD_FOOD_ACC_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
