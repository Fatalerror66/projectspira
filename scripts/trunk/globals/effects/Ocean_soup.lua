-----------------------------------
--	Author: Bababooey
--  Ocean Soup
-- 	If you love the ocean, then you'll love the mouthwatering flavor of this
--	magnificent shark fin soup. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ocean_Soup
--
--	4 Hours, All Races
--	HP +5%
--	MP +5
--	Dexterity +4
--	Mind -3
--	HP Recovered while healing +9
--	Attack +14% (Cap: 65@464 Base Attack)
--	Ranged Attack +14% (Cap: 65@Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,5);
	effect:addMod(MOD_MP,5);
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_HPHEAL,9);
	effect:addMod(MOD_FOOD_ATTP,14);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
