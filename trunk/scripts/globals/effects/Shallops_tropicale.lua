-----------------------------------
--	Author: Bababooey
-- 	Shallops Tropicale
--  A dish of shallops, steamed in Khazam pineapple juice.
--
--	http://wiki.ffxiclopedia.org/wiki/Shallops_Tropicale
--	
--	3 Hours, All Races
--	MP +20
--	Dexterity +1
--	Vitality +4
--	Intelligence +1
--	Defense +25% (Cap 100@400 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,20);
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,100);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
