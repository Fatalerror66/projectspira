-----------------------------------
--	Author: Bababooey
-- 	Zoni
-- 	A tasty soup served on special occasions. Its origins are in the
--	Far East. 
--
--	http://wiki.ffxiclopedia.org/wiki/Zoni
--
--	3 Hours All Races
--	HP +10
--	MP +10
--	Strength +1
--	Dexterity +1
--	Vitality +1
--	Agility +1
--	HP Recovered while healing +1
--	MP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
