-----------------------------------
--	Author: Bababooey
-- 	Salmon Meuniere
--  These eggs of the freshwater Cheval salmon
--	are said to be a rare delicacy.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Eggs
--	
--	3 Hours, All Races
--	Dexterity +2
--	Mind -2
--	Ranged Accuracy +7% (Cap: 10@143)
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
		user:addStatusEffect(EFFECT_FOOD,4583,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4583,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 