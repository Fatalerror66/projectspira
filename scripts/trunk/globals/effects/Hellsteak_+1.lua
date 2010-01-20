-----------------------------------
--	Author: Bababooey
-- 	Hellsteak
-- 	This thick steak of cerberus meat remains hot and juicy even if left
--	alone for a long period of time.
--
--	http://wiki.ffxiclopedia.org/wiki/Hellsteak_%2B1
--	
--	4 Hours, All Races
--	HP +25
--	Strength +7
--	Intelligence -3
--	Attack +20.5% (Cap: ???)
--	Ranged Attack +20.5% (Cap: ???)
--	HP Recovered while healing +2
-- 	Demon Killer
--	Dragon Killer
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_STR,7);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,55);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,55);
	effect:addMod(MOD_DEMON_KILLER,5);
	effect:addMod(MOD_DRAGON_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
