-----------------------------------
--	Author: Bababooey
--	Burdock
--	An edible root grown in the Far East.
--
--	http://wiki.ffxiclopedia.org/wiki/Burdock
--
--	5 Minutes, All Races
--	Agility +2
--	Vitality -4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_VIT,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

