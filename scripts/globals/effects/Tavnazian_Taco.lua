-----------------------------------
--	Author: Bababooey
--	Tavnazian Taco
-- 	A simple snack consisting of Tavnazian salad wrapped in a warm tortilla.
--
--	http://wiki.ffxiclopedia.org/wiki/Tavnazian_Taco
--	
--	30 Minutes, All Races
--	HP +20
--	MP +20
--	Dexterity +4
--	Vitality +6
--	Charisma +4
--	Agility +4
--	HP Recovered while healing +1
--	MP Recovered while healing +1
--	Defense +25% (Cap: 150@600 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_MP,20);
	effect:addMod(MOD_DEX,4);
	effect:addMod(MOD_VIT,6);
	effect:addMod(MOD_CHR,4);
	effect:addMod(MOD_AGI,4);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,150);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
