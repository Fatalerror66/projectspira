-----------------------------------
--	Author: Bababooey
--  Nebimonite Bake
-- 	A nebimonite baked right in its shell. 
--
--	http://wiki.ffxiclopedia.org/wiki/Nebimonite_Bake
--	
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Defense +25% (Cap: 70@280 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,70);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
