-----------------------------------
--	Author: Bababooey
-- 	Fatty Tuna Sushi
-- 	Sliced, raw fatty tuna served on a small portion of sweet vinegar rice.
--	Fatty tuna is twice as expensive as regular tuna. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fatty_Tuna_Sushi
--	
--	60 Minutes, All Races
--	HP +20
--	Dexterity +3
--	Charisma +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_CHR,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_FOOD_ACCP,16);
	effect:addMod(MOD_FOOD_RACCP,16);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
