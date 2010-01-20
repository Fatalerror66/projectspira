-----------------------------------
--	Author: Bababooey
--  Mushroom Soup
-- 	A soup made with a variety of mushrooms. 
--
--	http://wiki.ffxiclopedia.org/wiki/Mushroom_Soup
--
--	3 Hours, All Races
--	MP +20
--	Strength -1
--	Mind +2
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
		user:addStatusEffect(EFFECT_FOOD,4419,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4419,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 