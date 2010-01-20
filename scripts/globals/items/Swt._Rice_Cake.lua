----------------------------------
--	Author: Psy aka psyclosis
--  Sweet Rice Cake
--
--	This three-layered rice cake has been
--  molded into a diamond shape. The
--  coloring used in the layers has
--  medicinal properties.   
-- 
--  http://wiki.ffxiclopedia.org/wiki/Sweet_Rice_Cake
--  30 min, All Races
--  MP Recovered while healing +2
--  HP Recovered while healing +2
--  Mind +1
--  Vitality +2
--  MP +17
--  Intelligence +3
--  Evasion +5
--  Resist Silence
----------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4270,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4270,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 