-----------------------------------
--	Author: Bababooey
-- 	Vegan Sautee
-- 	Vegetarians all over Vana'diel adore this specially 
--	prepared batagreen sautee.
--
--	http://wiki.ffxiclopedia.org/wiki/Vegan_Sautee
--	
--	4 Hours, All Races
--	Vitailty -1
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
