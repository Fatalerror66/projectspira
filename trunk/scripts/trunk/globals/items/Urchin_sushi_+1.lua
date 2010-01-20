-----------------------------------
--	Author: Bababooey
-- 	Urchin Sushi +1
-- 	If the urchin eggs on this sushi were any fresher, they'd hatch.
--
--	http://wiki.ffxiclopedia.org/wiki/Urchin_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +40
--	Strength +1
--	Vitality +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16%
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
		user:addStatusEffect(EFFECT_FOOD,5160,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5160,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 