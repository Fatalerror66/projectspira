-----------------------------------
--	Author: Bababooey
-- 	Green Curry Bun
-- 	A crispy fried bun with a spicy green curry filling. 
--
--	http://wiki.ffxiclopedia.org/wiki/Green_Curry_Bun
--
--	30 Minutes, All Races
--	Vitality +1
--	Agility +2
--	Defense +12%
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
		user:addStatusEffect(EFFECT_FOOD,5756,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5756,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 