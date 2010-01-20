-----------------------------------
--	Author: Bababooey
--	Windurstian Tea
--	A green tea popular in Windurst.
--
--	http://wiki.ffxiclopedia.org/wiki/Windurstian_Tea
--
--	3 Hours, All Races
--	Vitality -2
--	Charisma +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,2);
	effect:addMod(MOD_CHR,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
