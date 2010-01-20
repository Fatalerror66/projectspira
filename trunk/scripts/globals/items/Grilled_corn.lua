-----------------------------------
--	Author: Bababooey
-- 	Grilled Corn
-- 	This roasted corn has been grilled to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Grilled_Corn
--	
--	60 Minutes, All Races
--	HP +10
--	Vitality +4
--	HP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4334,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4334,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 