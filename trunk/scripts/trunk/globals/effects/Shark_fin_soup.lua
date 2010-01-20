-----------------------------------
--	Author: Bababooey
--  Shark Fin Soup
-- 	This soup is flavored with shark fin. 
--
--	http://wiki.ffxiclopedia.org/wiki/Shark_Fin_Soup
--
--	3 Hours, All Races
--	HP +5%
--	MP +5
--	Dexterity +4
--	Mind -4
--	HP Recovered while healing +9
--	Attack +14% (Cap: 60@428 Base Attack)
--	Ranged Attack +14% (Cap: 60@428 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,5);
	effect:addMod(MOD_MP,5);
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,4);
	effect:addMod(MOD_HPHEAL,9);
	effect:addMod(MOD_FOOD_ATTP,14);
	effect:addMod(MOD_FOOD_ATT_CAP,60);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,60);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
