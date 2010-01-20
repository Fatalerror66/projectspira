-----------------------------------
--	Author: Psy aka psyclosis
--  Silken smile
--
--	This yogurt cake is as smooth as silk. 
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Yogurt_Cake
--
--  4 hours, All Races
--
--  Intelligence +2
--  MP Recovered while healing +7
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
		user:addStatusEffect(EFFECT_FOOD,5628,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5628,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 