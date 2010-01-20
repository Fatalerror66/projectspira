-----------------------------------
--	Author: Bababooey
-- 	Roast Mushroom
-- 	Lightly roasted mushrooms on a stick.
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Mushroom
--	
--	30 Minutes, All Races
--	MP +10
--	Strength -1
--	Mind +3
--	MP Recovered while healing +2
--	Enmity -1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,10);
	effect:subtractMod(MOD_STR,1);
	effect:addMod(MOD_MND,3);
	effect:addMod(MOD_MPHEAL,2);
	effect:subtractMod(MOD_ENMITY,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
