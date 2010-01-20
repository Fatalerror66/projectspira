-----------------------------------
--	Author: Psy aka psyclosis
--  Cone of Sub-Zero Gelato
--
--	This delicious gelato has been known to 
--  give Tarutaru brain-freeze.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Sub-Zero_Gelato
--  60 min, All Races
--  MP +16% (Cap: 80@500 Base MP)
--  MP Recovered while healing +2
--  HP +10
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
		user:addStatusEffect(EFFECT_FOOD,5155,0,3800); --Adds the "has food" effect.
		user:addStatusEffect(5155,1,0,3800); --Adds effects specific to this food.
	end
end; 
 
 
 