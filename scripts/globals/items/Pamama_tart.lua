-----------------------------------
--	Author: Psy aka psyclosis
--  Pamama Tart
--	A round cake crust topped with plenty of pamamas.                
--
--	http://wiki.ffxiclopedia.org/wiki/pamama_tart
-- 
-- 30 minutes, All Races
-- MP +10
-- Intelligence +3
-- HP +10
-- Dexterity -1
-- MP recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,4563,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4563,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 