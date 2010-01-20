-----------------------------------
--	Author: Bababooey
--	Paprika
--	A spice coveted more for its sweetness than its spiciness.
--
--	http://wiki.ffxiclopedia.org/wiki/Paprika
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
--	Defense -1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_VIT,3);
	effect:subtractMod(MOD_DEF,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

