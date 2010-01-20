-----------------------------------
--	Author: Bababooey
-- 	Jack-o'-Soup
-- 	A yummy pumpkin soup. 
--
--	http://wiki.ffxiclopedia.org/wiki/Jack-o%27-Soup
--
--	4 Hours, All Races
--	HP +2%
--	Vitality -1
--	Agility +3
--	HP Recovered while healing +5
--	Ranged Accuracy +8% (Cap: 25)
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
		user:addStatusEffect(EFFECT_FOOD,4522,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4522,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 