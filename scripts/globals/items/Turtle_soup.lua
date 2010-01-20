-----------------------------------
--	Author: Bababooey
-- 	Turtle Soup
-- 	A soup made from the vicious red terrapin. 
--
--	http://wiki.ffxiclopedia.org/wiki/Turtle_Soup
--
--	3 Hours, All Races
--	HP +10%
--	Dexterity +4
--	Vitality +6
--	Mind -3
--	HP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,4418,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4418,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 