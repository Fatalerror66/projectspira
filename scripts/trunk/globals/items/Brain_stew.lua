-----------------------------------
--	Author: Bababooey
-- 	Brain Stew
-- 	This traditional Goblin stew looks suspiciously like brains.
--
--	http://wiki.ffxiclopedia.org/wiki/Brain_Stew
--
--	3 Hours, All Races
--	Dexterity +5
--	Intelligence +5
--	Mind +5
--	HP Recovered while healing +3
--	MP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4542,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4542,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 