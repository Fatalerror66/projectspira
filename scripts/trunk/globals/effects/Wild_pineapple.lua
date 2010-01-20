-----------------------------------
--	Author: Bababooey
--	Wild Pineapple
--	These pineapples grow wild on the island of Elshimo.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Pineapple
--
--	5 Minutes, All Races
--	Agility -5
--	Intelligence +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,5);
	effect:addMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
