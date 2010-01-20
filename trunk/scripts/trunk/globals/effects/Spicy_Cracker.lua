-----------------------------------
--	Author: Bababooey
--	Spicy Cracker
--	A traditional rice cracker from a land far to the east.
--
--	http://wiki.ffxiclopedia.org/wiki/Spicy_Cracker
--
--	3 Minutes, All Races
--	HP Recovered while healing +7
--	Resist Sleep
--	Beast Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,7);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_BEAST_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
