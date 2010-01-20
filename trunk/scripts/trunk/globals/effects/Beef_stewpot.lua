-----------------------------------
--	Author: Bababooey
-- 	Beef Stewpot
-- 	A Far Eastern dish created with buffalo meat, along with vegetables
--	and a few other ingredients. Each piece of food may be removed and
--	eaten as soon as it has finished cooking. 
--
--	http://wiki.ffxiclopedia.org/wiki/Beef_Stewpot
--	3 Hours All Races
--	HP +10% (Cap: 50@500 Base HP)
--  MP +10
--  Attack +18% (Cap: 40@222 Base Attack
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,10);
	effect:addMod(MOD_FOOD_HP_CAP,50);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,40);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
