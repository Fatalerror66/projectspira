----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Elysian Eclair
--
--	A serving of mille feuille
--  baked to perfection using the
--  skills of a patissier.   
--  
--  http://wiki.ffxiclopedia.org/wiki/Elysian_Eclair
--
--  4 hours, All Races
--  Group Effects
--  HP Recovered while healing +2
--  MP Recovered while healing +2
--  HP +10
--  MP +15
--  INT +2
-------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5560,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5560,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 