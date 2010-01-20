-----------------------------------
--	Author: Bababooey
-- 	Goblin Pie
-- 	A traditional pie of the Goblins.
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Pie
--	
--	30 Minutes, All Races
--	HP +12
--	MP +12
--	Dexterity -1
--	Vitality -1
--	Agility +3
--	Charisma -5
--	Defense +9%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,12);
	effect:addMod(MOD_MP,12);
	effect:subtractMod(MOD_DEX,1);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_CHR,5);
	effect:addMod(MOD_FOOD_DEFP,9);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
