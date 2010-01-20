-----------------------------------
--	Author: Bababooey
-- 	Dorado Sushi +1
-- 	This dorado sushi will entice the palate of any sushi connoisseur.
--
--	http://wiki.ffxiclopedia.org/wiki/Dorado_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Dexterity +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16% 
--	Enmity +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_ACCP,16);
	effect:addMod(MOD_RACCP,16);
	effect:addMod(MOD_ENMITY,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
