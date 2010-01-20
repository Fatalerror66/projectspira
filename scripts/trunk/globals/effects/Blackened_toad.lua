-----------------------------------
--	Author: Bababooey
-- 	Blackened Toad
-- 	This rare toad has been roasted until it has turned black.
--
--	http://wiki.ffxiclopedia.org/wiki/Blackened_Toad
--	3 hours, All Races
--  Dexterity +2
--	Agility +2
--  Mind -1
--	Resist Poison
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_POISONRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
