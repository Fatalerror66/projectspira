-----------------------------------
--	Author: Bababooey
-- 	Seafood Stew
-- 	This rich stew is made with a variety of seafood.  
--
--	http://wiki.ffxiclopedia.org/wiki/Seafood_Stew
--
--	3 Hours, All Races
--	HP +20
--	Dexterity +1
--	Vitality +5
--	Defense +25% (Cap: 120@480 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,5);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,120);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
