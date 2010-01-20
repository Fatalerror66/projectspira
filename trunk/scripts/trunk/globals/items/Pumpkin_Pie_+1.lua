-----------------------------------
--	Author: Psy aka psyclosis
--  Pumpkin pie +1
--	A yummy pie made from ogre pumpkins.
--
--	http://wiki.ffxiclopedia.org/wiki/pumpkin_Pie_+1
-- 
-- 60 minutes, All Races
-- MP +45
-- Intelligence +4
-- Charisma -1
-- MP recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4525,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4525,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 