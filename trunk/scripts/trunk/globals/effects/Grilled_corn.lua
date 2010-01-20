-----------------------------------
--	Author: Bababooey
-- 	Grilled Corn
-- 	This roasted corn has been grilled to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Grilled_Corn
--	
--	60 Minutes, All Races
--	HP +10
--	Vitality +4
--	HP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_HPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
