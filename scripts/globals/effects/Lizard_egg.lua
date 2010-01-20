-----------------------------------
--	Author: Bababooey
--	Lizard Egg
--	Lizard eggs are known for their exquisite flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Lizard_Egg
--
--	5 Minutes, All Races
--	HP +5
--	MP +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,5);
	effect:addMod(MOD_MP,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

