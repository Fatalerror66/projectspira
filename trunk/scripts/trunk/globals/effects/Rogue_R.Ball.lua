-----------------------------------
--	Author: Bababooey
--	Rogue Rice Ball
--	This rice ball has been made to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Rogue_Rice_Ball
--
--	60 Minutes, All Races
--	Vitality +3
--	HP Recovered while healing +2
--	HP +12
--	Defense +50
--	Beast Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_HP,12);
	effect:addMod(MOD_DEF,50);
	effect:addMod(MOD_BEAST_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

