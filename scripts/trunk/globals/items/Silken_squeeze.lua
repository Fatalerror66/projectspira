----------------------------------
--	Author: Psy aka psyclosis
--  Silken Squeeze
--
--	This orange cake is as smooth as silk.   
--  
--  http://wiki.ffxiclopedia.org/wiki/Silken_Squeeze
--
--  4 hours, All Races
--  Group Effects
--  HP Recovered while healing +4
--  MP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,5630,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5630,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 