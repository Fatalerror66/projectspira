-----------------------------------
--	Author: Psy aka psyclosis
--  Chunk of Hobgoblin chocolate
--	This Goblin chocolate is especially bitter. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hobgoblin_Chocolate
-- 
-- 35minutes, All Races
-- MP Recovered while healing +7
-- Lizard Killer
-- Resist Petrify
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4324,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4324,1,0,300); --Adds effects specific to this food.
	end
end; 
 
 
 