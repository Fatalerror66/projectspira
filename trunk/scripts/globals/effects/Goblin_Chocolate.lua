-----------------------------------
--	Author: Psy aka psyclosis
--  Chunk of Goblin chocolate
--	Chocolate made using special Goblin techniques. 
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Chocolate
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,4495,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4495,1,0,180); --Adds effects specific to this food.
	end
end;]]-- 
 
 
 