-----------------------------------
--	Author: Psy aka psyclosis
--  Orange kuchen
--
--	A cake made with Saruta oranges 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Orange_Kuchen
--  3 hrs, All Races
--  MP +13% (Cap: 75@576 Base MP)
--------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4393,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4393,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 