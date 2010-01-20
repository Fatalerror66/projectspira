-----------------------------------
--	Author: Bababooey
--	Elshimo Coconut
--	A hard shell protects the juicy meat found inside this tropical delicacy.
--
--	http://wiki.ffxiclopedia.org/wiki/Elshimo_Coconut
--
--	5 Minutes, All Races
--	Agility -1
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,1);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

