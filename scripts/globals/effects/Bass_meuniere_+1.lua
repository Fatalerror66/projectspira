-----------------------------------
--	Author: Bababooey
-- 	Bass Meuniere +1
-- 	This bass meuniere rivals those made by Vana'diel's finest chefs. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bass_Meuniere_%2B1
--	
--
--	4 Hours, All Races
--	HP +3%
--	Dexterity +3
--	Agility +3
--	Mind -3
--	Ranged Accuracy +6% (Cap: 20)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,3);
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_FOOD_RACCP,6);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
