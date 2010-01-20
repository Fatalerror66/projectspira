-----------------------------------
--	Author: Bababooey
--	Tortilla Bueno
--	About as tasty as you can make flour and water.
--
--	http://wiki.ffxiclopedia.org/wiki/Tortilla_Bueno
--
--	60 Minutes, All Races
--	Vitality +4
--	HP +8
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_HP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
