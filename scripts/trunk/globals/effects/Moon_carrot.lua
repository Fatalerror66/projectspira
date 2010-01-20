-----------------------------------
--	Author: Bababooey
--	Moon Carrot
--	These rare carrots are believed to come from the moon.
--
--	http://wiki.ffxiclopedia.org/wiki/Moon_Carrot
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_VIT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

