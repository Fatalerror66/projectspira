-----------------------------------
--	Author: Bababooey
--	King Truffle
--	These rare fungi are known for their unique scent. Packed with nutrients,
--	eating these is said to speed healing.
--
--	http://wiki.ffxiclopedia.org/wiki/King_Truffle
--
--	5 Minutes, All Races
--	Strength -6
--	Mind +4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,6);
	effect:addMod(MOD_MND,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

