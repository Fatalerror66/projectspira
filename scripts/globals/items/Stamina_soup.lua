-----------------------------------
--	Author: Bababooey
-- 	Stamina Soup
-- 	This turtle soup puts most others to shame.
--
--	http://wiki.ffxiclopedia.org/wiki/Stamina_Soup
--
--	4 Hours, All Races
--	HP +10%
--	Dexterity +4
--	Vitality +6
--	Mind -3
--	HP Recovered while healing +10
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
		user:addStatusEffect(EFFECT_FOOD,4337,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4337,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 