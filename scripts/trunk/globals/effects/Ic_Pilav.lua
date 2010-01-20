-----------------------------------
--	Author: Bababooey
--	Ic Pilav
--	A stir-fry dish made from rice, meat, and pine nuts.
--
--	http://wiki.ffxiclopedia.org/wiki/Ic_Pilav
--
--	3 Hours, All Races
--	Strength +4
--	Vitality -1
--	Intelligence -1
--	HP Recovered while healing +1
--	HP +15% (Cap: 65@464 Base HP)
--	Attack +22% (Cap: 65@295 Base Attack)
--	Ranged Attack +22% (Cap: 65@295 Base Ranged Attack)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:subtractMod(MOD_VIT,1);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,65);
	effect:addMod(MOD_FOOD_ATTP,22);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
	effect:addMod(MOD_FOOD_RATTP,22);
	effect:addMod(MOD_FOOD_RATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

