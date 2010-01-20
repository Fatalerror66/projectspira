-----------------------------------
--	Author: Bababooey
--	Pain de Neige
--	The fluffy center of this white bread is whiter than snow.
--
--	http://wiki.ffxiclopedia.org/wiki/Pain_de_Neige
--
--	60 Minutes, All Races
--	Vitality +4
--	HP +18
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_HP,18);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

