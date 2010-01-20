-----------------------------------
--	Author: Bababooey
--	Chai
--	A black tea popular in Aht Urhgan.
--
--	http://wiki.ffxiclopedia.org/wiki/Chai
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
