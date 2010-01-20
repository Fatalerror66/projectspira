-----------------------------------
--	Author: Bababooey
-- 	Steamed Catfish
--  An entire steamed giant catfish. Makes for a hearty meal.
--
--	http://wiki.ffxiclopedia.org/wiki/Steamed_Catfish
--	
--	3 Hours, All Races
--	HP +30
--	MP +1%
--	Dexterity +3
--	Intelligence +1
--	Mind -3
--	Earth Resist +10
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_MPP,1);
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_INT,1);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_EARTHRES,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
