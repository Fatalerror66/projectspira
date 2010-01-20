-----------------------------------
--	Author: Bababooey
-- 	Fish Chiefkabob
-- 	A high-quality fish mithkabob worthy to be eaten by the Mithra
--	chieftainness. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fish_Chiefkabob
--	
--	60 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Mind -1
--	Defense +25% (Cap: 95@380 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,95);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
