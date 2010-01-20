-----------------------------------
--	Author: Psy aka psyclosis
--  Cone of Seraph's Kiss
--
--	Made by a master patissier,
--  one taste of this gleaming snoll gelato
--  will leave you craving more. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Seraph%27s_Kiss
--  60 min, All Races
--  MP +16% (Cap: 85@531 Base MP)
--  MP Recovered while healing +2
--  HP +15
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
		user:addStatusEffect(EFFECT_FOOD,5556,0,3800); --Adds the "has food" effect.
		user:addStatusEffect(5556,1,0,3800); --Adds effects specific to this food.
	end
end; 
 
 
 