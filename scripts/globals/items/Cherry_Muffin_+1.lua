-----------------------------------
--	Author: Psy aka psyclosis
--  Cherry muffin +1
--	An exceptionally delicious cherry
--  muffin. All the Yagudo cherries inside
--  are equidistant from each other.
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Muffin_%2B1
-- 
-- 60 min, All Races
-- MP  +10% (Cap 85@850 base MP)
-- Intelligence +2
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
		user:addStatusEffect(EFFECT_FOOD,5654,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5654,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 