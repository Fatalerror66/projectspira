-----------------------------------
--	Author: Bababooey
-- 	Vegetable Broth
-- 	The flavor of this all vegetable soup is beyond compare.  
--
--	http://wiki.ffxiclopedia.org/wiki/Vegetable_Broth
--
--	4 Hours, All Races
--	Vitality -1
--	Agility +5
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
		user:addStatusEffect(EFFECT_FOOD,4323,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4323,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 