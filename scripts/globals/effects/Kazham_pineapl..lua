-----------------------------------
--	Author: Bababooey
--	Kazham Pineapple
--	This large, tartly sweet fruit is covered in scaly skin.
--
--	http://wiki.ffxiclopedia.org/wiki/Kazham_Pineapple
--
--	5 Minutes, All Races
--	Agility -5
--	Intelligence +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,5);
	effect:addMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

