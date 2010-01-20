-----------------------------------
--	Author: Bababooey
-- 	Karni Yarik
-- 	An eggplant stuffed with meat and topped with tomatoes.
--
--	http://wiki.ffxiclopedia.org/wiki/Karni_Yarik
--	
--	30 Minutes, All Races
--	Vitality -1
--	Agility +3
--	Attack +20% (Cap: 65@325 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,3);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
