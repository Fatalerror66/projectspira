-----------------------------------
--	Author: Bababooey
-- 	Monastic Sautee
-- 	The beaugreens in this sautee have been cooked in the manner 
--	followed by the monks of San d'Oria.
--
--	http://wiki.ffxiclopedia.org/wiki/Monastic_Sautee
--	
--	4 Hours, All Races
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
