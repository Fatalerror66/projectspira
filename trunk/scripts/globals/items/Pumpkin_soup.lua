-----------------------------------
--	Author: Bababooey
-- 	Pumpkin Soup
-- 	A fine soup made from ogre pumpkins. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pumpkin_Soup
--
--	3 Hours, All Races
--	HP +1%
--	Vitality -1
--	Agility +3
--	HP Recovered while healing +5
--	Ranged Accuracy +8% (Cap: 20)
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
		user:addStatusEffect(EFFECT_FOOD,4430,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4430,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 