-----------------------------------
--	Author: Psy aka psyclosis
--  Dish of crimson jelly
--	The detoxified gelatinous remains of a
--  clot, whipped up into a tasty dessert. 
--
--	http://wiki.ffxiclopedia.org/wiki/Crimson_Jelly
-- 
--  3 Hours, All Races
--  MP +12%(Cap: 85@708 Base MP)
--  Intelligence +6
--  MP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5144,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5144,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 