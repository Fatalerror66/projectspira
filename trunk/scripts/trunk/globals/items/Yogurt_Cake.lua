-----------------------------------
--	Author: Psy aka psyclosis
--  Yogurt cake
--
--	A light and smooth yogurt-based cake. 
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Yogurt_Cake
--
--  3 hours, All Races
--
--  Intelligence +1
--  MP Recovered while healing +6
-----------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5627,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5627,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 