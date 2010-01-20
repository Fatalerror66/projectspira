-----------------------------------
--	Author: Bababooey
-- 	Green Quiche
-- 	A nutritious quiche made with fresh beaugreens. 
--
--	http://wiki.ffxiclopedia.org/wiki/Green_Quiche
--	
--	30 Minutes, All Races
--	MP +10
--	Vitality -1
--	Agility +1
--	Ranged Accuracy +7% (Cap: 15@214)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,10);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
