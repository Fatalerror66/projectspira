-----------------------------------
--	Author: Bababooey
-- 	Pepperoni
-- 	A hard, spicy sausage made of giant sheep meat. Mass produced
--	and rationed to the Royal Army during the Crystal War.  
--
--	http://wiki.ffxiclopedia.org/wiki/Pepperoni
--	
--	30 Minutes, All Races
--	HP +3% 
--	Strength +3
--	Intelligence -1
--	Attack +??% (Cap: ???)
--  UNCONFRIMED
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,3);
	effect:addMod(MOD_STR,3);
	effect:subtractMod(MOD_INT,1);
	--effect:addMod(MOD_FOOD_ATTP,1);
	--effect:addMod(MOD_FOOD_ATT_CAP,1);
	--effect:addMod(MOD_FOOD_ATT_LIMIT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
