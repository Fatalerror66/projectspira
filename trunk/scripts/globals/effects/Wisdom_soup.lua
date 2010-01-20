-----------------------------------
--	Author: Bababooey
-- 	Wisdom Soup
-- 	A bowl of stone soup with "that little extra something" added.
--
--	http://wiki.ffxiclopedia.org/wiki/Wisdom_Soup
--
--	4 Hours, All Races
--	HP +3
--	MP +3
--	Strength +1
--	Dexterity +1
--	Agility +1
--	Vitality +1
--	Intelligence +1
--	Mind +1
--	Charisma +1
--	HP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,3);
	effect:addMod(MOD_MP,3);
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_CHR,1);
	effect:addMod(MOD_HPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
