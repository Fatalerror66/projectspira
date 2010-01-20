-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of cherry bavarois +1
--	The sweetest, ripest cherries have
--  been hand-picked to create a sublime
--  bavarois fit for emperors and kings. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Bavarois_%2B1
-- 
-- 4 Hours, All Races
-- HP +30
-- Intelligence +4
-- MP +15
-- HP Recovered while healing +4
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
		user:addStatusEffect(EFFECT_FOOD,5746,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5746,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 