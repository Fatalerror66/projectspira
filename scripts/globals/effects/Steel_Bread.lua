-----------------------------------
--	Author: Bababooey
--	Steel Bread
--	Deliciously baked iron bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Steel_Bread
--
--	60 Minutes, All Races
--	Vitality +1
--	HP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_HP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

