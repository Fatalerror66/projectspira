-----------------------------------
--	Author: Bababooey
-- 	Prize Crab Stewpot
-- 	The cooking of this crab stewpot was directed so that the ingredients were
--	masterfully utilized. Guaranteed to make your mouth water. 
--
--	http://wiki.ffxiclopedia.org/wiki/Prized_Crab_Stewpot
--
--	4 Hours, All Races
--	Group Food Effects
--	HP +15% (Cap: 50@500 Base HP)
--	MP +15
--	Vitality +1
--	Agility +1
--	Mind +2
--	Defense +20% (Cap: 60@250 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,50);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_DEFP,20);
	effect:addMod(MOD_FOOD_DEF_CAP,60);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
