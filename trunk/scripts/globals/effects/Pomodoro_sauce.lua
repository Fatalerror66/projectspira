-----------------------------------
--	Author: Bababooey
--	Pomodoro Sauce
--	A simple sauce made from crushed Mithran tomatoes.
--
--	http://wiki.ffxiclopedia.org/wiki/Pomodoro_Sauce
--
--	5 Minutes, All Races
--	Mind +2
--	Intelligence +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MND,2);
	effect:addMod(MOD_INT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

