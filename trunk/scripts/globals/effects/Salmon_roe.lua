-----------------------------------
--	Author: Bababooey
-- 	Salmon Roe
--  Salmon eggs pickled in salt, this delicacy is sometimes referred to as "red gold."
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Roe
--	
--	30 Minutes, All Races
--	HP +8
--	MP +8
--	Dexterity +2
--	Mind -1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,8);
	effect:addMod(MOD_MP,8);
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_MND,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
