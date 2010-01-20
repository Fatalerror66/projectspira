-----------------------------------
--	Author: Bababooey
-- 	Dorado Sushi +1
-- 	This dorado sushi will entice the palate of any sushi connoisseur.
--
--	http://wiki.ffxiclopedia.org/wiki/Dorado_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Dexterity +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16% 
--	Enmity +3
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
		user:addStatusEffect(EFFECT_FOOD,5179,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5179,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 