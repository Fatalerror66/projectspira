-----------------------------------
--	Author: Bababooey
--	White Bread
--	This bread is made from San d'Orian wheat.
--
--	http://wiki.ffxiclopedia.org/wiki/White_Bread
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +3
--	HP +16
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_HP,16);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

