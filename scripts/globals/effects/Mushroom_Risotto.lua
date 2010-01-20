-----------------------------------
--	Author: Bababooey
--	Mushroom Risotto
--	A dish of rice and various mushrooms.
--
--	http://wiki.ffxiclopedia.org/wiki/Mushroom_Risotto
--
--	3 Hours, All Races
--	Strength -1
--	Vitality +3
--	Mind +3
--	HP Recovered while healing +2
--	MP +30
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,1);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_MND,3);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
