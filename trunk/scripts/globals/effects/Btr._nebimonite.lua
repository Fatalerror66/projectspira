-----------------------------------
--	Author: Bababooey
-- 	Buttered Nebimonite
-- 	This blissful nebimonite bake has been buttered and basted to perfection.  
--
--	http://wiki.ffxiclopedia.org/wiki/Buttered_Nebimonite
--	
--	60 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Defense +25% (Cap: 75@300 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,75);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
