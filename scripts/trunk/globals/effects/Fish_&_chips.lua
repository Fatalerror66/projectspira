-----------------------------------
--	Author: Bababooey
-- 	Fish & Chips
-- 	Whitefish and popotoes fried to a golden brown and served with creamy
--	Tarutaru sauce. A traditional Tavnazian dish.
--
--	http://wiki.ffxiclopedia.org/wiki/Fish_and_Chips
--	
--	3 Hours, All Races
--	Dexterity +3
--	Vitality +3
--	Mind -3
--	Defense +5% 
--	Ranged Attack +7% (Cap: 10@142 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_FOOD_DEFP,5);
	effect:addMod(MOD_FOOD_RATTP,7);
	effect:addMod(MOD_FOOD_RATT_CAP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
