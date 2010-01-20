-----------------------------------
--	Author: Bababooey
-- 	Bass Meuniere +1
-- 	This bass meuniere rivals those made by Vana'diel's finest chefs. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bass_Meuniere_%2B1
--	
--
--	4 Hours, All Races
--	HP +3%
--	Dexterity +3
--	Agility +3
--	Mind -3
--	Ranged Accuracy +6% (Cap: 20)
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
		user:addStatusEffect(EFFECT_FOOD,4346,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4346,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 