-----------------------------------
--	Author: Bababooey
--	Salty Bretzel
--	This ridiculously salted bretzel is frowned upon by physicians
--	everywhere.
--
--	http://wiki.ffxiclopedia.org/wiki/Salty_Bretzel
--
--	5 Minutes, All Races
--	Vitality +2
--	MP +8% (Cap: 60@750 Base MP)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_MPP,8);
	effect:addMod(MOD_FOOD_MP_CAP,60);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

