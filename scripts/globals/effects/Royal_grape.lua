-----------------------------------
--	Author: Bababooey
--	Royal Grape
--	The flavor of these grapes is so exquisite that they were
--	once available only to royalty.
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Grape
--
--	5 Minutes, All Races
--	Agility -6
--	Intelligence +4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,6);
	effect:addMod(MOD_INT,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
