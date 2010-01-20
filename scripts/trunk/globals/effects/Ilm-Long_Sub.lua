-----------------------------------
--	Author: Bababooey
--	Ilm-Long Salmon Sub
--	The toppings on this delicious salmon sub are piled a malm high.
--
--	http://wiki.ffxiclopedia.org/wiki/Ilm-long_Salmon_Sub
--
--	60 Minutes, All Races
--	Dexterity +2
--	Agility +1
--	Vitality +1
--	Mind -2
--	Intelligence +2
--	Ranged Accuracy +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_VIT,1);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_RACC,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

