-----------------------------------
--	Author: Bababooey
-- 	Hellsteak
-- 	A thick steak of cerberus meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Hellsteak
--	
--	3 Hours, All Races
--	HP +20
--	Strength +6
--	Intelligence -2
--	Attack +19.5% (Cap: ???)
--	Ranged Attack +19.5% (Cap: ???)
-- 	Demon Killer
--	Dragon Killer
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_STR,6);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,50);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,50);
	effect:addMod(MOD_DEMON_KILLER,5);
	effect:addMod(MOD_DRAGON_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
