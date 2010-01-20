-----------------------------------
--	Author: Psy aka psyclosis
--  Silken Spirit
--
--	This chocolate cake is as smooth as silk.    
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Silken_Spirit
--
--  4 hours, All Races
--  Group Effects
--  MP Recovered while healing +7
--  MP +3%
-------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5634,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5634,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 