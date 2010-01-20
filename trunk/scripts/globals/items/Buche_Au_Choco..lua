-----------------------------------
--	Author: Psy aka psyclosis
--  Roll of buche au chocolat
-- 
--	A San d'Orian cake made for
--  the Starlight Celebration.
--  Symbolizes thankfulness to the forest
--  for firewood to keep homes warm.  
--
--	http://wiki.ffxiclopedia.org/wiki/Buche_au_Chocolat
-- 
--  3 Hours, All Races
--  Group Food
--  MP +3%(Cap: 13@433 Base MP)
--  Intelligence +2
--  MP Recovered while healing +4
--  HP +8
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
		user:addStatusEffect(EFFECT_FOOD,5550,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5550,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 