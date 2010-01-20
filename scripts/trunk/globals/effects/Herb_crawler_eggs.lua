-----------------------------------
--	Author: Bababooey
-- 	Herb Crawler Eggs
-- 	This cuisine is made with a flavorful sauce over fried crawler eggs. 
--
--	http://wiki.ffxiclopedia.org/wiki/Herb_Crawler_Eggs
--	
--	3 Hours, All Races
--	HP +6% (Cap: 80@1333 Base HP)
--	MP +10
--	Vitality -1
--	Agility +3
--	Evasion +8
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,80);
	effect:addMod(MOD_MP,10);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,3);
	effect:addMod(MOD_EVA,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
