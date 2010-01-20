-----------------------------------
--	Author: Bababooey
-- 	Meat Mithkabob
-- 	Mithra love this tasty meat-on-a-stick meal. 
--
--	http://wiki.ffxiclopedia.org/wiki/Meat_Mithkabob
--
--	30 Minutes, All Races
--	Strength +5
--  Agility +1
--	Intelligence -2
--  Attack +22% (Cap: 60@272 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,22)
	effect:addMod(MOD_FOOD_ATT_CAP,60);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
