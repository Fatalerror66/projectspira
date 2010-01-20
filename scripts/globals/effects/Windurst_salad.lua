-----------------------------------
--	Author: Bababooey
-- 	Windurst Salad
-- 	This traditional Tarutaru salad is made with a variety of vegetables.
--
--	http://wiki.ffxiclopedia.org/wiki/Windurst_Salad
--	
--	3 Hours, All Races
--	MP +20
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +8% (Cap: 10@125)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,20);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,5);
	effect:addMod(MOD_FOOD_RACCP,8);
	effect:addMod(MOD_FOOD_RACC_CAP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
