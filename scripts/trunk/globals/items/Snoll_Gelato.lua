-----------------------------------
--	Author: Psy aka psyclosis
--  Cone of Snoll Gelato
--
--	Sweet milk frozen with the essence of a snoll.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Snoll_Gelato
--  30 min, All Races
--  MP +16% (Cap: 75@468 Base MP)
--  MP Recovered while healing +1
--------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5147,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5147,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 