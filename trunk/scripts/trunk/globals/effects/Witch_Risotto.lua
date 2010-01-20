-----------------------------------
--	Author: Bababooey
--	Witch Risotto
--	This mushroom risotto has been bewitched.
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Risotto
--
--	4 Hours, All Races
--	Strength -1
--	Vitality +3
--	Mind +3
--	MP Recovered while healing +2
--	MP +35
--	Enmity-1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtracMod(MOD_STR,1);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_MND,3);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_MP,35);
	effect:subtracMod(MOD_ENMITY,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

