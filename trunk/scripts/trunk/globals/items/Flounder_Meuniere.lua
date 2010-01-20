-----------------------------------
--	Author: Bababooey
-- 	Flounder Meuniere
-- 	This flounder has been covered in flour and fried with butter
--
--	http://wiki.ffxiclopedia.org/wiki/Flounder_Meuniere
--	
--	3 Hours, All Races
--	Dexterity +6
--	Mind -1
--	Ranged Accuracy +15
--	Ranged Attack +14% (Cap: 25@178 Base Ranged Attack)
--	Enmity -3
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
		user:addStatusEffect(EFFECT_FOOD,4584,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4584,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 