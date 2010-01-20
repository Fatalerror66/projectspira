-----------------------------------
--	Author: Bababooey
-- 	Ikra Gunkan
-- 	A Far Eastern dish made by shaping steamed rice into a ball, placing
--	salmon roe on top, and wrapping the sides in tall seaweed. The finished
--	product is said to resemble a warship. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ikra_Gunkan
--	
--	30 Minutes, All Races
--	HP +13
--	MP +10
--	Dexterity +3
--	Mind -2
--	Accuracy +17% (Cap: 28@165)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,13);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_ACCP,17);
	effect:addMod(MOD_FOOD_ACC_CAP,28);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
