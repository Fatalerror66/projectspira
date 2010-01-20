-----------------------------------
--	Author: Bababooey
-- 	Bream Sushi +1
-- 	The kind of sushi that breams are made of. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bream_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Dexterity +6
--	Vitality +5
--	Resist Sleep
--	Accuracy +17%
--	Ranged Accuracy +17%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,6);
	effect:addMod(MOD_VIT,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_ACCP,17);
	effect:addMod(MOD_RACCP,17);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
