-----------------------------------
--	Author: Bababooey
--	Tentacle Sushi +1
-- 	Raw squid tentacles don't get any better than this!
--
--	http://wiki.ffxiclopedia.org/wiki/Tentacle_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +20
--	Dexterity +3
--	Mind -1
--	Agility +3
--	Accuracy +19% (Cap: 23@121)
--	Ranged Accuracy +19% (Cap: 23@121)
--	Double Attack +1%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_AGI,3);
	effect:addMod(MOD_FOOD_ACCP,19);
	effect:addMod(MOD_FOOD_ACC_CAP,23);
	effect:addMod(MOD_FOOD_RACCP,19);
	effect:addMod(MOD_FOOD_RACC_CAP,23);
	effect:addMod(MOD_DOUBLE_ATTACK,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
