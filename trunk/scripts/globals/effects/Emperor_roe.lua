-----------------------------------
--	Author: Bababooey
-- 	Emperor Roe
-- 	The eggs of the legendary emperor fish are prized for their flavor. 
--
--	http://wiki.ffxiclopedia.org/wiki/Emperor_Roe
--	
--	30 Minutes, All Races
--	HP +8
--	MP +8
--	Dexterity +4
--	Mind -4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,8);
	effect:addMod(MOD_MP,8);
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
