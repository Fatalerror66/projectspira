-----------------------------------
--	Author: Bababooey
-- 	Squid Sushi +1
--  This divine squid sushi would bring tears to any mother's eyes.
--
--	http://wiki.ffxiclopedia.org/wiki/Squid_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +30
--	Dexterity +6
--	Agility +5
--	Accuracy +16%
--	Ranged Accuracy +16%
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_AGI,5);
	effect:addMod(MOD_DEX,6);
	target;addMod(MOD_FOOD_ACCP,16);
	target;addMod(MOD_FOOD_RACCP,16);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_HP,30);
	effect:subtractMod(MOD_AGI,5);
	effect:subtractMod(MOD_DEX,6);
	target;removeMod(MOD_ACCP,16);
	target;removeMod(MOD_RACCP,16);
	effect:subtractMod(MOD_SLEEPRES,5);
end;]]--