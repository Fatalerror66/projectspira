----------------------------------
--	Author: Psy aka psyclosis
--  Lebkuchen house
--
--	A house-shaped cake traditionally
--  baked by Selbina residents for the
--  Starlight Celebration. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Lebkuchen_House
--  3 hours, All Races
--  MP +10% (Cap: 45@450 Base MP)
--  Intelligence +3
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
		user:addStatusEffect(EFFECT_FOOD,5616,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5616,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 