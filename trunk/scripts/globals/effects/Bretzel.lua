-----------------------------------
--	Author: Bababooey
--	Bretzel
--	A kind of salted bread made in Bastok.
--
--	http://wiki.ffxiclopedia.org/wiki/Bretzel
--
--	3 Minutes, All Races
--	Vitality +2
--	MP +8% (Cap: 55@687 Base MP)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_MPP,8);
	effect:addMod(MOD_FOOD_MP_CAP,55);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
