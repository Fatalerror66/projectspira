-----------------------------------
--	Author: Bababooey
-- 	Steamed Catfish
--  An entire steamed giant catfish. Makes for a hearty meal.
--
--	http://wiki.ffxiclopedia.org/wiki/Steamed_Catfish
--	
--	3 Hours, All Races
--	HP +30
--	MP +1%
--	Dexterity +3
--	Intelligence +1
--	Mind -3
--	Earth Resist +10
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
		user:addStatusEffect(EFFECT_FOOD,4557,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4557,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 