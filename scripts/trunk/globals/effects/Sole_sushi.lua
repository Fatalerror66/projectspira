-----------------------------------
--	Author: Bababooey
-- 	Sole Sushi
--  Sliced, raw sole served on a small portion of sweet vinegar rice, a
--	popular dish in the eastern empire. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sole_Sushi
--	
--	30 Minutes, All Races
--	HP +20
--	Strength +5
--	Dexterity +6
--	Accuracy +15%
--	Ranged Accuracy +15%
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_DEX,6);
	target;addMod(MOD_FOOD_ACCP,15);
	target;addMod(MOD_FOOD_RACCP,15);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
