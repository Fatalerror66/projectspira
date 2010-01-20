-----------------------------------
--	Author: Bababooey
--  Mushroom Stew
-- 	A thick soup of stewed mushrooms. 
--
--	http://wiki.ffxiclopedia.org/wiki/Mushroom_Stew
--
--	3 Hours, All Races
--	MP +40
--	Strength -1
--	Mind +4
--	MP Recovered while healing +4
--	Enmity -4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,40);
	effect:subtractMod(MOD_STR,1);
	effect:addMod(MOD_MND,4);
	effect:addMod(MOD_MPHEAL,4);
	effect:subtractMod(MOD_ENMITY,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
