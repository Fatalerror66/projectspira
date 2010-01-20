-----------------------------------
--	Author: Bababooey
--	Red Hot Cracker
--	Before eating one of these spicy crackers, be sure to find a bottle
--	of distilled water to put out the fire in your mouth.
--
--	http://wiki.ffxiclopedia.org/wiki/Red_Hot_Cracker
--
--	3 Minutes, All Races
--	HP Recovered while healing +9
--	Resist Sleep
--	Beast Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,9);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_BEAST_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

