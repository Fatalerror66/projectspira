----------------------------------
--	Author: Psy aka psyclosis
--  Maple Cake
--
--	A light and smooth maple-flavored cake.   
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Maple_Cake
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +1
--  MP Recovered while healing +4
--------------------------------------
-

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5625,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5625,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 