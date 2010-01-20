-----------------------------------
--	Author: Bababooey
-- 	Menemen
-- 	This Near Eastern omelette is packed with nutritious value.
-- 
--	http://wiki.ffxiclopedia.org/wiki/Menemen
--
--	3 Hours, All Races
--	HP +30
--  MP +30
--	Agility +1
--	Intelligence -1
--  HP Recovered while healing +1
--	MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,5586,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5586,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 