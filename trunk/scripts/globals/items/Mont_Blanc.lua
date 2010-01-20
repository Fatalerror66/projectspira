----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Mont blanc
--
--	A San d'Orian cake heaped with chestnuts to symbolize 
--  the white mountains of the Uleguerand Range.  
--  
--  http://wiki.ffxiclopedia.org/wiki/Mont_Blanc
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +4
--  MP Recovered while healing +5
--  HP +8
--  MP +10
--  INT +1
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
		user:addStatusEffect(EFFECT_FOOD,5557,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5557,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 