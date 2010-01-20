-----------------------------------
--	Author: Bababooey
-- 	Pumpkin Soup
-- 	A fine soup made from ogre pumpkins. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pumpkin_Soup
--
--	3 Hours, All Races
--	HP +1%
--	Vitality -1
--	Agility +3
--	HP Recovered while healing +5
--	Ranged Accuracy +8% (Cap: 20)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,1);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,3);
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_FOOD_RACCP,8);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
