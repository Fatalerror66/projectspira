-----------------------------------
--	Author: Bababooey
--	San d'Orian Tea
--	A black tea popular in San d'Oria.
--
--	http://wiki.ffxiclopedia.org/wiki/San_d%27Orian_Tea
--
--	3 Hours, All Races
--	Vitality -2
--	Charisma +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,2);
	effect:addMod(MOD_CHR,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
