-----------------------------------
--	Author: Bababooey
-- 	Ikra Gunkan
-- 	A Far Eastern dish made by shaping steamed rice into a ball, placing
--	salmon roe on top, and wrapping the sides in tall seaweed. The finished
--	product is said to resemble a warship. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ikra_Gunkan
--	
--	30 Minutes, All Races
--	HP +13
--	MP +10
--	Dexterity +3
--	Mind -2
--	Accuracy +17% (Cap: 28@165)
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
		user:addStatusEffect(EFFECT_FOOD,5219,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5219,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 