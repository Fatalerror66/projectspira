-----------------------------------
--	Author: Bababooey
--	Yagudo Cherry
--	The Yagudo love this tree-growing fruit.
--
--	http://wiki.ffxiclopedia.org/wiki/Yagudo_Cherry
--
--	5 Minutes, All Races
--	Agility -1
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,1);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
