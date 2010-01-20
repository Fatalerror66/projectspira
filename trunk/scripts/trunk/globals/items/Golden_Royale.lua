----------------------------------
--	Author: Psy aka psyclosis
--  Serving of golden royale
--
--	A serving of mont blanc baked to perfection 
--  using the skills of a patissier.  
--  
--  http://wiki.ffxiclopedia.org/wiki/Golden_Royale
--
--  4 hours, All Races
--  Group Effects
--  HP Recovered while healing +2
--  MP Recovered while healing +2
--  HP +10
--  MP +10
--  INT +2
--------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5558,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5558,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 