-----------------------------------
--	Author: Bababooey
--	Simit +1
--	This simit has been baked to mouthwatering perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Simit_%2B1
--
--	60 Minutes, All Races
--	Vitality +4
--	HP +18
--	Defense +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_HP,18);
	effect:addMod(MOD_DEF,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
