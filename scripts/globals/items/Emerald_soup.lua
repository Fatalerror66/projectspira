-----------------------------------
--	Author: Bababooey
-- 	Emerald Soup
-- 	A delicious variety of pea soup. 
--
--	http://wiki.ffxiclopedia.org/wiki/Emerald_Soup
--
--	4 Hours, All Races
--	Vitality -1
--	Agiltiy +2
--	Ranged Accuracy +6
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
		user:addStatusEffect(EFFECT_FOOD,4327,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4327,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 