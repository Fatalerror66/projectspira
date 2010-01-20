-----------------------------------
--	Author: Bababooey
-- 	Salmon Meuniere +1
--  This salmon meuniere is so delicious that it will bring you to tears. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Meuniere_%2B1
--	
--	4 Hours, All Races
--	Dexterity +2
--	Mind -2
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
		user:addStatusEffect(EFFECT_FOOD,4347,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4347,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 