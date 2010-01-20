-----------------------------------
--	Author: Bababooey
-- 	Crab Sushi
-- 	Sliced, raw crab served on a small portion of sweet vinegar rice, a
--	popular dish in Far Eastern nations. 
--
--	http://wiki.ffxiclopedia.org/wiki/Crab_Sushi
--	
--	30 Minutes, All Races
--	Vitality +1
--	Defense +10
--	Accuracy +13%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_DEF,10);
	effect:addMod(MOD_FOOD_ACCP,13);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
