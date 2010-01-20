-----------------------------------
--	Author: Bababooey
-- 	Friture Misareaux
-- 	Named after the "Tragedy of Misareaux" where five died of
--	bliss after eating a terribly scrumptious basket of fish and chips.
--
--	http://wiki.ffxiclopedia.org/wiki/Friture_Misareaux
--	
--	4 Hours, All Races
--	Dexterity +3
--	Vitality +3
--	Mind -3
--	Defense +5% 
--	Ranged Attack +7% (Cap: 15@214 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_DEFP,5);
	effect:addMod(MOD_FOOD_RATTP,7);
	effect:addMod(MOD_FOOD_RATT_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
