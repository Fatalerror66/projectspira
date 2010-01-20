-----------------------------------
--	Author: Bababooey
-- 	Black Curry Bun
-- 	A crispy fried bun with a piquant black curry filling. 
--
--	http://wiki.ffxiclopedia.org/wiki/Black_Curry_Bun
--
--	30 Minutes, All Races
--	Intelligence +1
--	Vitality +4
--	Dexterity +2
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
		user:addStatusEffect(EFFECT_FOOD,5758,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5758,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 