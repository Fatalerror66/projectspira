-----------------------------------
--	Author: Bababooey
-- 	Medicinal Gruel
-- 	A hearty gruel with medicinal properties.
--
--	http://wiki.ffxiclopedia.org/wiki/Medicinal_Gruel
--
--	4 Hours, All Races
--	Vitality -1
--	Agility +2
--	Ranged Accuracy +15% (Cap: 15)
--	HP Recovered while healing +4
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
		user:addStatusEffect(EFFECT_FOOD,4534,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4534,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 