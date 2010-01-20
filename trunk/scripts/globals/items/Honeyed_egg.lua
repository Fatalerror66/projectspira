-----------------------------------
--	Author: Bababooey
-- 	Honeyed Egg
-- 	An incredibly simple beverage made by mixing raw egg with honey.
--
--	http://wiki.ffxiclopedia.org/wiki/Honeyed_Egg
--	
--	30 Minutes, All Races
--	MP +8
--	Intelligence +1
--	MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,5739,1800); --Adds the "has food" effect.
		user:addStatusEffect(5739,1,0,1800); --Adds effects specific to this food.
	end;
end; 
 
 
 