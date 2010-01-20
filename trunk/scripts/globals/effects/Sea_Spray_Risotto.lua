-----------------------------------
--	Author: Bababooey
--	Sea Spray Risotto
--	The pleasant aroma of the seven seas graces this bream risotto.
--
--	http://wiki.ffxiclopedia.org/wiki/Sea_Spray_Risotto
--
--	4 Hours, All Races
--	Dexterity +6
--	Agility +3
--	Mind -4
--	HP Recovered while healing +1
--	HP +45
--	Accuracy +6% (Cap: 20)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,6);
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_MND,4);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_HP,45);
	effect:addMod(MOD_FOOD_ACCP,6);
	effect:addMod(MOD_FOOD_ACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

