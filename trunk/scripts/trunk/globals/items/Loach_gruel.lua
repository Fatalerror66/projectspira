-----------------------------------
--	Author: Bababooey
--  Loach Gruel
-- 	This blend of select Far Eastern ingredients is much more delightful 
--	when eaten with friends.  
--
--	http://wiki.ffxiclopedia.org/wiki/Loach_Gruel
--
--	4 Hours, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5670,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5670,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 