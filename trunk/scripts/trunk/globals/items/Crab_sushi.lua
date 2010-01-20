-----------------------------------
--	Author: Bababooey
-- 	Crab Sushi
-- 	Sliced, raw crab served on a small portion of sweet vinegar rice, a
--	popular dish in Far Eastern nations. 
--
--	http://wiki.ffxiclopedia.org/wiki/Crab_Sushi
--	
--	30 Minutes, All Races
--	Vitality +1
--	Defense +10
--	Accuracy +13%
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
		user:addStatusEffect(EFFECT_FOOD,5721,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5721,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 