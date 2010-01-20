-----------------------------------
--	Author: Bababooey
-- 	Shrimp Sushi +1
--  The rice is packed to just the right consistency and the shrimp 
--	is still twitching. It is perfect. 
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Sushi_%2B1
--	
--	60 Minutes, All Races (duration unknown)
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
