-----------------------------------
--	Author: Bababooey
--  Loach Slop
-- 	This blend of brass loaches, burdock root, and a fresh bird egg 
--	is popular at Far Eastern parties. 
--
--	http://wiki.ffxiclopedia.org/wiki/Loach_Slop
--
--	3 Hours, All Races
--	
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
		user:addStatusEffect(EFFECT_FOOD,5669,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5669,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 