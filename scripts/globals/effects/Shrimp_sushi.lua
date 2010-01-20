-----------------------------------
--	Author: Bababooey
-- 	Shrimp Sushi
--  A delicacy hailing from the eastern lands consisting of a sweeper laid
--	across subtly flavored rice.
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Sushi
--	
--	30 Minutes, All Races (duration unknown)
--	Vitality +1
--	Defense +5
--	Accuracy +11%
--	Store TP +2
--	Triple Attack +1%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_DEF,5);
	effect:addMod(MOD_FOOD_ACCP,11);
	effect:addMod(MOD_STORE_TP,2);
	effect:addMod(MOD_TRIPLE_ATTACK,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
