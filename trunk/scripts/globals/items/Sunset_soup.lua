-----------------------------------
--	Author: Bababooey
-- 	Sunset Soup
-- 	The flavor of this tomato soup is sublime. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sunset_Soup
--
--	4 Hours, All Races
--	Agility +3
--	Vitality -1
--	HP Recovered while healing +5
--	Ranged Accuracy +9% (Cap: 20)
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
		user:addStatusEffect(EFFECT_FOOD,4341,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4341,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 