-----------------------------------
--	Author: Psy aka psyclosis
--  Jack-o'-pie
--	This delicious pumpkin pie is decorated with a frighteneing face.
--
--	http://wiki.ffxiclopedia.org/wiki/Jack-o'-Pie
-- 
-- 60 minutes, All Races
-- MP +45
-- Intelligence +4
-- Charisma -1
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
		user:addStatusEffect(EFFECT_FOOD,5644,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5644,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 