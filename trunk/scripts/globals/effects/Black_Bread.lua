-----------------------------------
--	Author: Bababooey
--	Black Bread
--	This bread is made from rye flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Black_Bread
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +2
--	HP +8
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_HP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
