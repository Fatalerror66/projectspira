-----------------------------------
--	Author: Bababooey
--	Grauberg Lettuce
--	This leafy green is known and desired for its distinctively bitter taste.
--
--	http://wiki.ffxiclopedia.org/wiki/Grauberg_Lettuce
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_VIT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

