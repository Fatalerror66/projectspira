-----------------------------------
--	Author: Bababooey
-- 	Black Curry
-- 	A delicious curry with tuna. 
--
--	http://wiki.ffxiclopedia.org/wiki/Black_Curry
--
--	3 Hours All Races
--	Dexterity +2
--	Vitality +4
--	Intelligence +1
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Defense +15%
--	Accuracy +5
--	Ranged Accuracy +5
--	Evasion +5
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_DEFP,15);
	effect:addMod(MOD_ACC,5);
	effect:addMod(MOD_RACC,5);
	effect:addMod(MOD_EVA,5);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
