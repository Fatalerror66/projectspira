-----------------------------------
--	Author: Bababooey
-- 	Vegetable Soup
-- 	A soup made with a variety of vegetables. 
--
--	http://wiki.ffxiclopedia.org/wiki/Vegetable_Soup
--
--	3 Hours, All Races
--	Vitality -1
--	Agility +4
--	Ranged Accuracy +5
--	HP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,4560,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4560,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 