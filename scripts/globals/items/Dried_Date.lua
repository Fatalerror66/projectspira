-----------------------------------
--	Author: Psy aka psyclosis
--  Dried Date
--	This date has become even sweeter after dehydration.  
--	http://wiki.ffxiclopedia.org/wiki/Dried_Date
-- 
-- 30min, All Races
-- INT +3
-- AGI -1
-- HP +10
-- MP +20
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
		user:addStatusEffect(EFFECT_FOOD,5567,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5567,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 