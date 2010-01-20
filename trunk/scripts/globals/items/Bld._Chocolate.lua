-----------------------------------
--	Author: Psy aka psyclosis
--  Bloody Chocolate
--	Sweet, bitter, and spicy all at once,
--  this blood-red bite-sized chocolate
--  melts in your mouth as well as your
--  hands. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bloody_Chocolate
-- 
-- 60 minutes, All Races
-- MP Recovered while healing +4
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
		user:addStatusEffect(EFFECT_FOOD,5646,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5646,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 