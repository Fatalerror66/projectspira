-----------------------------------
--	Author: Bababooey
-- 	Bison Jerky
-- 	Made from the happiest bovines in Vana'diel.
--
--	http://wiki.ffxiclopedia.org/wiki/Bison_Jerky
--	60 minutes, All Races
--	Strength +5
--  Mind -2
--  Attack +18% (Cap: 70@388 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,70);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
