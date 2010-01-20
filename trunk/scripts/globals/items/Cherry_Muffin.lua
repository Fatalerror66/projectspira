-----------------------------------
--	Author: Psy aka psyclosis
--  Cherry muffin
--	A tiny cake filled with Yagudo cherries
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Muffin
-- 
-- 30 min, All Races
-- MP  +10%
-- Intelligence +1
-- Agility -1
-----------------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5653,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5653,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 