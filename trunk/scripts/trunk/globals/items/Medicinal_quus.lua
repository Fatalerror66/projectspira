-----------------------------------
--	Author: Bababooey
-- 	Medicinal Quus
-- 	The herbs used in this healthy dish are said to have healing properties.
--
--
--	http://wiki.ffxiclopedia.org/wiki/Medicinal_Quus
--	
--	4 Hours, All Races
--	Dexterity +1
--	Mind -1
--	Ranged Accuracy +7% (Cap: 15@214)
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
		user:addStatusEffect(EFFECT_FOOD,4294,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4294,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 