-----------------------------------
--	Author: Bababooey
--	Bream Risotto
--	A dish made from Bastore bream and rice.
--
--	http://wiki.ffxiclopedia.org/wiki/Bream_Risotto
--
--	3 Hours, All Races
--	Dexterity +6
--	Agility +3
--	Mind -4
--	HP Recovered while healing +1
--	HP +40
--	Accuracy +6% (Cap: 15)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,6);
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_MND,4);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_HP,40);
	effect:addMod(MOD_FOOD_ACCP,6);
	effect:addMod(MOD_FOOD_ACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
