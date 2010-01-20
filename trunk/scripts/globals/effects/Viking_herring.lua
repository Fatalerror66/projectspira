-----------------------------------
--	Author: Bababooey
--  Viking Herring
--  The scurviest pirates of the north seas have given this 
--	pickled herring their seal of approval.
--
--	http://wiki.ffxiclopedia.org/wiki/Viking_Herring
--	
--	60 Minutes, All Races
--	Dexterity +4
--	Mind -3
--	Attack +12%
--	Ranged Attack +12%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_FOOD_ATTP,12);
	effect:addMod(MOD_FOOD_RATTP,12);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
