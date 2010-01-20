-----------------------------------
--	Author: Bababooey
--	Rolanberry
--	This tart berry is very popular in Quon.
--
--	http://wiki.ffxiclopedia.org/wiki/Rolanberry
--
--	5 Minutes, All Races
--	Agility -4
--	Intelligence +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,4);
	effect:addMod(MOD_INT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
