-----------------------------------
--	Author: Bababooey
-- 	Wild Stew
-- 	This dhalmel stew has an exceptionally gamy flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Stew
--
--	4 Hours, All Races
--	Strength +4
--	Vitality +2
--	Agility +1
--	Intelligence -2
--	Attack +25% (Cap: 50@200 Base Attack)
--	Ranged Attack +25% (Cap: 50@200 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,25);
	effect:addMod(MOD_FOOD_ATT_CAP,50);
	effect:addMod(MOD_FOOD_RATTP,25);
	effect:addMod(MOD_FOOD_RATT_CAP,50);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
