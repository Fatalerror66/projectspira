-----------------------------------
--	Author: Bababooey
-- 	Wild Steak
-- 	This choice cut of dhalmel meat has been grilled to near perfection. 
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Steak
--	
--	4 Hours, All Races
--	Strength +4
--	Intelligence -2
--	Attack +25% (Cap: 50@200 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,25);
	effect:addMod(MOD_FOOD_ATT_CAP,50);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
