-----------------------------------
--	Author: Bababooey
--	Raisin Bread
--	A sweet bread made from sun-dried San d'Orian grapes.
--
--	http://wiki.ffxiclopedia.org/wiki/Raisin_Bread
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +4
--	HP +20
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_HP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

