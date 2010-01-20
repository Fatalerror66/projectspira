-----------------------------------
--	Author: Psy aka psyclosis
--  Roll of sylvan excursion
-- 
--	Made by a master patissier,
--  this gleaming buche au chocolat
--  is designed to melt on your tongue. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sylvan_Excursion
-- 
--  4 Hours, All Races
--  Group Food
--  MP +4%(Cap: 15@375 Base MP)
--  Intelligence +3
--  MP Recovered while healing +5
--  HP +10
----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5551,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5551,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 