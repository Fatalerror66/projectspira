----------------------------------
--	Author: Psy aka psyclosis
--  Silken Sash
--
--	This pumpkin cake is as smooth as silk.  
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Silken_Sash
--
--  4 hours, All Races
--
--  HP Recovered while healing +3
--  MP Recovered while healing +5
--------------------------------------
-

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5632,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5632,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 