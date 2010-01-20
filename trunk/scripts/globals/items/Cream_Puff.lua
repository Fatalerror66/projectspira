-----------------------------------
--	Author: Psy aka psyclosis
--  Cream Puff
--	A popular dessert the world round, this treat is comprised of 
--  sweet, fluffy cream injected into a thin, crispy crust.
--
--	http://wiki.ffxiclopedia.org/wiki/Cream_Puff
-- 
-- 30 min, All Races
-- Intelligence +7
-- HP -10
-----------------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5718,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5718,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 