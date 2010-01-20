-----------------------------------
--	Author: Bababooey
-- 	Smoked Salmon
--  A smoked delicacy made from Cheval salmon. 
--
--	http://wiki.ffxiclopedia.org/wiki/Smoked_Salmon
--	
--	30 Minutes, All Races
--	Dexterity +2
--	Mind -3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_MND,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
