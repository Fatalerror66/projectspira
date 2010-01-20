-----------------------------------
--	Author: Bababooey
--	Coral Fungus
--	This beautiful fungus grows in the shape of sea coral.
--	Well-loved for its firm tenderness.
--
--	http://wiki.ffxiclopedia.org/wiki/Coral_Fungus
--
--	5 Minutes, All Races
--	Strength -4
--	Intelligence +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,4);
	effect:addMod(MOD_INT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

