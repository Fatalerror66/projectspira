-----------------------------------
--	Author: Bababooey
-- 	Zesti Zoni
-- 	Zillions of zany zealots love ze zestiness of ze zesty zoni. 
--
--	http://wiki.ffxiclopedia.org/wiki/Zesty_Zoni
--
--	3 Hours All Races
--	HP +10
--	MP +10
--	Strength +1
--	Dexterity +1
--	Vitality +1
--	Agility +1
--	HP Recovered while healing +1
--	MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,5619,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5619,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 