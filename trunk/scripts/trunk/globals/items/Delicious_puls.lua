-----------------------------------
--	Author: Bababooey
-- 	Delicious Puls
-- 	This puls has been boiled to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Delicious_Puls
--
--	4 Hours, All Races
--	Vitality +3
--	Dexterity -1
--	HP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,4533,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4533,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 