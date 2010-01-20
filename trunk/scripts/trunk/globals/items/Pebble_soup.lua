-----------------------------------
--	Author: Bababooey
-- 	Pebble Soup
-- 	Heated rocks are placed in this white gruel to keep it warm. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pebble_Soup
--
--	3 Hours, All Races
--	HP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,4455,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4455,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 