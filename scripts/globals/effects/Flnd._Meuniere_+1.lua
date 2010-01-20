-----------------------------------
--	Author: Bababooey
-- 	Flounder Meuniere +1
-- 	This flounder meuniere will make your mouth water.
--
--	http://wiki.ffxiclopedia.org/wiki/Flounder_Meuniere%2B1
--	
--	4 Hours, All Races
--	Dexterity +6
--	Mind -1
--	Vitality +1
--	Ranged Accuracy +15
--	Ranged Attack +14% (Cap: 30@214 Base Ranged Attack)
--	Enmity -3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,6);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_FOOD_RACCP,15);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,30);
	effect:subtractMod(MOD_ENMITY,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
