-----------------------------------
--	Author: Bababooey
--	Garlic Cracker
--	A traditional rice cracker from a land far to the east.
--
--	http://wiki.ffxiclopedia.org/wiki/Garlic_Cracker
--
--	3 Minutes, All Races
--	HP Recovered while healing +6
--	Resist Blind
--	Undead Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,6);
	effect:addMod(MOD_BLINDRES,5);
	effect:addMod(MOD_UNDEAD_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
