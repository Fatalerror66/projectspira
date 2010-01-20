-----------------------------------
--	Author: Bababooey
-- 	Tuna Sushi
-- 	Sliced, raw tuna served on a small portion of sweet vinegar rice,
--	a popular dish in the eastern empire.
--
--	http://wiki.ffxiclopedia.org/wiki/Tuna_Sushi
--	
--	30 Minutes, All Races
--	HP +20
--	Dexterity +3
--	Charisma +5
--	Resist Sleep
--	Accuracy +15%
--	Ranged Accuracy +15%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_CHR,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_FOOD_ACCP,15);
	effect:addMod(MOD_FOOD_RACCP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
