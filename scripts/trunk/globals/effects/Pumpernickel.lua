-----------------------------------
--	Author: Bababooey
--	Pumpernickel
--	Deliciously baked black bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Pumpernickel
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +10
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

