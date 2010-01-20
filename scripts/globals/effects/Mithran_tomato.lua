-----------------------------------
--	Author: Bababooey
--	Mithran Tomato
--	These nutritious tomatoes are tougher than they look.
--
--	http://wiki.ffxiclopedia.org/wiki/Mithran_Tomato
--
--	5 Minutes, All Races
--	Agility -3
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,3);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

