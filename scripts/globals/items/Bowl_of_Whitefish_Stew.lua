-----------------------------------
--	Author: Bababooey
-- 	Medicinal Gruel
-- 	A hearty gruel with medicinal properties.
--
--	http://wiki.ffxiclopedia.org/wiki/Medicinal_Gruel
--
--	3 Hours, All Races
--	HP +10
--	Dexterity +3
--	Mind -3
--	Accuracy +3
--	Ranged Accuracy +7% (Cap: 10)
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
		user:addStatusEffect(EFFECT_FOOD,4440,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4440,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 