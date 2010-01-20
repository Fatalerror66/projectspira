-----------------------------------
--	Author: Bababooey
--	Eggplant
--	This cute aubergine is egg-shaped.
--
--	http://wiki.ffxiclopedia.org/wiki/Eggplant
--
--	5 Minutes, All Races
--	Agility +3
--	Vitality -5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_VIT,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
