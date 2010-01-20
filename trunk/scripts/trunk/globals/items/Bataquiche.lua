-----------------------------------
--	Author: Bababooey
-- 	Bataquiche
-- 	A nutritious quiche made with fresh batagreens.
--
--	http://wiki.ffxiclopedia.org/wiki/Bataquiche
--	
--	30 Minutes, All Races
--	MP +8
--	Vitality -2
--	Agility +1
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
		user:addStatusEffect(EFFECT_FOOD,5168,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5168,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 