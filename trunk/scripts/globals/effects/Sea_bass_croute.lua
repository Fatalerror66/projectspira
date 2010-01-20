-----------------------------------
--	Author: Bababooey
-- 	Sea Bass Croute
--  A Zafmlug bass wrapped in a light pie crust. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sea_Bass_Croute
--	
--	30 Minutes, All Races
--	MP +5%
--	Dexterity +4
--	Mind +5
--	Accuracy +3
--	Ranged Accuracy +6% (Cap: 20@333)
--	HP Recovered while healing +9
--	MP Recovered while healing +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPP,5);
	effect:addMod(MOD_DEX,4);
	effect:addMod(MOD_MND,5);
	effect:addMod(MOD_ACC,3);
	effect:addMod(MOD_FOOD_RACCP,6);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
	effect:addMod(MOD_HPHEAL,9);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
