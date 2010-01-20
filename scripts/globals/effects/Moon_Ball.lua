-----------------------------------
--	Author: Bababooey
--	Moon Ball
--	In far-eastern countries, these rice dumplings are made as offerings
--	to the moon.
--
--	http://wiki.ffxiclopedia.org/wiki/Moon_Ball
--
--	30 Minutes, All Races
--	HP +3
--	MP +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,3);
	effect:addMod(MOD_MP,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

