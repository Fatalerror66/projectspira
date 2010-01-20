-----------------------------------
--	Author: Bababooey
--	Wild Onion
--	A wild variety of onion.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Onion
--
--	5 Minutes, All Races
--	Agility +4
--	Vitality -6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,4);
	effect:subtractMod(MOD_VIT,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

