-----------------------------------
--	Author: Bababooey
-- 	Seafood Stewpot
-- 	A Far Eastern dish created from various ingredients. Each piece
--	of food may be removed and eaten as soon as it has finished cooking. 
--
--	http://wiki.ffxiclopedia.org/wiki/Seafood_Stewpot
--
--	3 Hours, All Races
--	Group Food Effects
--	HP +10% (Cap: 50@500 Base HP)
--	MP +10
--	Accuracy +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,10);
	effect:addMod(MOD_FOOD_HP_CAP,50);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_ACC,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
