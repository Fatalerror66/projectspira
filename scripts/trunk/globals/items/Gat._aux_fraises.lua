-----------------------------------
--	Author: Psy aka psyclosis
--  Gateau aux fraises
--
--	A Bastokan cake made for
--  the Starlight Celebration.
--  Symbolizes the fire of civilization,
--  come to melt away the snow.     
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Gateau_aux_Fraises
--
--  3 hours, All Races
--  Group Effects
--  MP Recovered while healing +1
--  MP +8% (cap:50@625 Base MP)
--  HP +8
--  INT +1
------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5542,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5542,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 