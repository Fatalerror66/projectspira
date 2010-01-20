-----------------------------------
--	Author: Psy aka psyclosis
--  Marron Glace
--	This marron glace has the luster of a rare gem.
--
--	http://wiki.ffxiclopedia.org/wiki/Marron_Glace
-- 
-- 3 hours, All Races
-- MP +13% (Cap: 85@653 Base MP)	
-- MP Recovered While Healing +1
-- Agility -1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,13);
	effect:addMod(MOD_FOOD_MP_CAP,85);
	effect:addMod(MOD_MPHEAL,1);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
