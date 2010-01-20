-----------------------------------
--	Author: Bababooey
-- 	Sole Sushi +1
--  Sliced, raw squid served on a small portion of sweet 
--	vinegar rice, a popular dish in the eastern empire.
--
--	http://wiki.ffxiclopedia.org/wiki/Squid_Sushi
--	
--	30 Minutes, All Races
--	HP +30
--	Dexterity +6
--	Agility +5
--	Mind -1
--	Accuracy +15%
--	Ranged Accuracy +15%
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_AGI,5);
	effect:addMod(MOD_DEX,6);
	effect:subtractMod(MOD_MND,1);
	target;addMod(MOD_FOOD_ACCP,15);
	target;addMod(MOD_FOOD_RACCP,15);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
