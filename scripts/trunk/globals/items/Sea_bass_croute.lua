-----------------------------------
--	Author: Bababooey
-- 	Sea Bass Croute
--  A Zafmlug bass wrapped in a light pie crust. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sea_Bass_Croute
--	
--	30 Minutes, All Races
--	MP +5%
--	Dexterity +4
--	Mind +5
--	Accuracy +3
--	Ranged Accuracy +6% (Cap: 20@333)
--	HP Recovered while healing +9
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
		user:addStatusEffect(EFFECT_FOOD,4353,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4353,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 