-----------------------------------
--	Author: Bababooey
-- 	Party Egg
-- 	This colored egg is brighter and more vivid than ever. 
--
--	http://wiki.ffxiclopedia.org/wiki/Party_Egg
--	
--	60 Minutes, All Races
--	HP +25
--	MP +25
--	Attack +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_MP,25);
	effect:addMod(MOD_ATT,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
