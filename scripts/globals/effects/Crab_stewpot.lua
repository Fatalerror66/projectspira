-----------------------------------
--	Author: Bababooey
-- 	Crab Stewpot
-- 	A Far Eastern dish created with land crab meat, along with vegetables and
--	a few other ingredients. Each piece of food may be removed and eaten as
--	soon as it has finished cooking.
--
--	http://wiki.ffxiclopedia.org/wiki/Crab_Stewpot
--
--	3 Hours, All Races
--	Group Food Effects
--	HP +10% (Cap: 50@500 Base HP)
--	MP +10
--	Defense +20% (Cap: 50@250 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,10);
	effect:addMod(MOD_FOOD_HP_CAP,50);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_FOOD_DEFP,20);
	effect:addMod(MOD_FOOD_DEF_CAP,50);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
