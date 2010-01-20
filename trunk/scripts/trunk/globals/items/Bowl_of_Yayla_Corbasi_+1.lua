-----------------------------------
--	Author: Bababooey
--  Yayla Corbasi +1
-- 	You have never tasted a more delicious bowl of yayla corbasi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yayla_Corbasi_%2B1
--
--	4 Hours, All Races
--	HP +25
--	Dexterity -1
--	Vitality +3
--	HP Recovered while healing +5
--	MP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5580,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5580,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 