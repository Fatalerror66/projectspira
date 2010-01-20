-----------------------------------
--	Author: Bababooey
--	Scream Fungus
--	These odd fungi sprout up suddenly and begin screaming.
--	No one is really sure why.
--
--	http://wiki.ffxiclopedia.org/wiki/Scream_Fungus
--
--	5 Minutes, All Races
--	Strength -4
--	Mind +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,4);
	effect:addMod(MOD_MND,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
