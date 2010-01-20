-----------------------------------
--	Author: Bababooey
-- 	Leremieu Salad
-- 	Tavnazian salad with a twist!
--
--	http://wiki.ffxiclopedia.org/wiki/Leremieu_Salad
--	
--	4 Hours, All Races
--	HP +20
--	MP +20
--	Dexterity +4
--	Vitality +6
--	Agility +4
--	Charisma +4
--	Defense +25% (Cap: 160@640 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_MP,20);
	effect:addMod(MOD_DEX,4);
	effect:addMod(MOD_VIT,6);
	effect:addMod(MOD_AGI,4);
	effect:addMod(MOD_CHR,4);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,160);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
