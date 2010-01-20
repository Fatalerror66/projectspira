-----------------------------------
--	Author: Bababooey
-- 	Salmon Eggs
--  These eggs of the freshwater Cheval salmon
--	are said to be a rare delicacy.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Eggs
--	
--	5 Minutes, All Races
--	HP +6
--	MP +6
--	Dexterity +2
--	Mind -3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,6);
	effect:addMod(MOD_MP,6);
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_MND,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
