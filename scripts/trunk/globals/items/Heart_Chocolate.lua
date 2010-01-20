-----------------------------------
--	Author: Psy aka psyclosis
--  Heart Chocolate
--
--	A heart-shaped chocolate.
--
--	http://wiki.ffxiclopedia.org/wiki/Heart_Chocolate
-- 
--  60 min, All Races
--  	
--  MP Recovered While Healing +4
--------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4497,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4497,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 