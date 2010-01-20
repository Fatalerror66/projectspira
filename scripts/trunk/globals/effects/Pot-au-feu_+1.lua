-----------------------------------
--	Author: Bababooey
-- 	Pot-au-feu +1
-- 	This hearty pot-au-feu is overflowing with succulent chunks of meat 
--	and the freshest vegetables. A particularly favored dish among the 
--	Kingdom's archers. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pot-au-feu_%2B1
--
--	60 Minutes, All Races
--	Strength +4
--	Agility +4
--	Ranged Attack +???%
--	Ranged Accuracy +???%
--	Intelligence -3
--	Defense +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:addMod(MOD_AGI,4);
	effect:addMod(MOD_FOOD_RATTP,15);
	effect:addMod(MOD_FOOD_RATT_CAP,60);
	effect:addMod(MOD_FOOD_RACCP,10);
	effect:addMod(MOD_FOOD_RACC_CAP,60);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_DEF,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
