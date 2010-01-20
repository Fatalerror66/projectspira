-----------------------------------
--	Author: Psy aka psyclosis
--  Dried Berry
--	A sweet rolanberry, dried in the sun. 
--	http://wiki.ffxiclopedia.org/wiki/Cupid_Chocolate
-- 
-- 3 min, All Races
-- INT +1
-- AGI -1
---------------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5672,0,180); --Adds the "has food" effect.
		user:addStatusEffect(5672,1,0,180); --Adds effects specific to this food.
	end
end; 
 
 
 