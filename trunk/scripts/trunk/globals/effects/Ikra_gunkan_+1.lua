-----------------------------------
--	Author: Bababooey
--	Ikra Gunkan +1
-- 	This plate of ikra gunkan looks so delicious, even the kids will eat it. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ikra_Gunkan_%2B1
--	
--	60 Minutes, All Races
--	HP +30
--	MP +12
--	Dexterity +3
--	Mind -1
--	Accuracy +17% (Cap: 30@176)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_MP,12);
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_ACCP,17);
	effect:addMod(MOD_FOOD_ACC_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
