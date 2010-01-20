-----------------------------------
--	Author: Bababooey
-- 	Smoked Salmon
--  A smoked delicacy made from Cheval salmon. 
--
--	http://wiki.ffxiclopedia.org/wiki/Smoked_Salmon
--	
--	30 Minutes, All Races
--	Dexterity +2
--	Mind -3
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
		user:addStatusEffect(EFFECT_FOOD,4380,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4380,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 