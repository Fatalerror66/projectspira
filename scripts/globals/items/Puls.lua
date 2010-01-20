-----------------------------------
--	Author: Bababooey
-- 	Puls
-- 	A porridge made from flour. 
--
--	http://wiki.ffxiclopedia.org/wiki/Puls
--
--	3 Hours, All Races
--	Vitality +2
--	Dexterity -1
--	HP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,4492,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4492,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 