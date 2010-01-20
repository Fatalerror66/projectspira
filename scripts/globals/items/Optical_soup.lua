-----------------------------------
--	Author: Bababooey
-- 	Optical Soup
-- 	This eyeball soup is so fresh, the eyeballs are still blinking. 
--
--	http://wiki.ffxiclopedia.org/wiki/Optical_Soup
--
--	4 Hours All Races
--	HP +6% (Cap: 75@1250 Base HP)
--  Charisma -15
--  HP Recovered while healing +5
--  Accuracy +15
--  Ranged Accuracy +15
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
		user:addStatusEffect(EFFECT_FOOD,4340,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4340,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 