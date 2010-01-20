-----------------------------------
--	Author: Bababooey
-- 	Emerald Quiche
-- 	Only the finest of chefs can bake a quiche of this quality.
--
--	http://wiki.ffxiclopedia.org/wiki/Emerald_Quiche
--	
--	60 Minutes, All Races
--	MP +15
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
