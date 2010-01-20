-----------------------------------
--	Author: Psy aka psyclosis
--  TrueLove Chocolate
--
--	An elegantly wrapped heart-shaped chocolate. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Truelove_Chocolate
--  4 hrs, All Races
--  MP Recovered while healing +4
--  MP +10
-------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5231,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5231,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 