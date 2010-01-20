-----------------------------------
--	Author: Bababooey
--	Ortolana_+1
--	A sumptuous alternative for the voracious vegans of Vana'diel.
--
--	http://wiki.ffxiclopedia.org/wiki/Ortolana_%2B1
--
--	60 Minutes, All Races
--	Agility +2
--	Vitality +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_VIT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

