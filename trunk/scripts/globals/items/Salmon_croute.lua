-----------------------------------
--	Author: Bababooey
-- 	Salmon Croute
--  A cheval salmon in a flaky pie wrapping.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Croute
--	
--	30 Minutes, All Races
--	HP +8
--	MP +8
--	Dexterity +2
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
		user:addStatusEffect(EFFECT_FOOD,4551,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4551,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 