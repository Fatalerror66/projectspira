-----------------------------------
--	Author: Bababooey
-- 	Pea Soup
-- 	A soup made from blue peas. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pea_Soup
--
--	3 Hours, All Races
--	Vitality -1
--	Agiltiy +1
--	Ranged Accuracy +5
--	HP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,4416,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4416,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 