-----------------------------------
--	Author: Bababooey
--	Iron Bread
--	A traditional hard-baked Galkan bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Iron_Bread
--
--	30 Minutes, All Races
--	Vitality +1
--	HP +4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_HP,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

