-----------------------------------
--	Author: Bababooey
-- 	Menemen
-- 	This fluffy omelette is fit for the Empress's table. 
-- 
--	http://wiki.ffxiclopedia.org/wiki/Menemen_%2B1
--
--	4 Hours, All Races
--	HP +35
--  MP +35
--	Agility +2
--	Intelligence -2
--  HP Recovered while healing +2
--	MP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5587,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5587,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 