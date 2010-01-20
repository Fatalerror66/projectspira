-----------------------------------
--	Author: Bababooey
-- 	Bass Meuniere
-- 	This bass has been covered in flour and fried with butter.
--
--	http://wiki.ffxiclopedia.org/wiki/Bass_Meuniere
--	
--
--	3 Hours, All Races
--	HP +3%
--	Dexterity +3
--	Agility +3
--	Mind -3
--	Ranged Accuracy +6% (Cap: 15)
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
		user:addStatusEffect(EFFECT_FOOD,4582,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4852,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 