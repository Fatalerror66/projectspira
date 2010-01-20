-----------------------------------
--	Author: Bababooey
-- 	Seafood Stewpot
-- 	A Far Eastern dish created from various ingredients. Each piece
--	of food may be removed and eaten as soon as it has finished cooking. 
--
--	http://wiki.ffxiclopedia.org/wiki/Seafood_Stewpot
--
--	3 Hours, All Races
--	Group Food Effects
--	HP +10% (Cap: 50@500 Base HP)
--	MP +10
--	Accuracy +5
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
		user:addStatusEffect(EFFECT_FOOD,5238,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5238,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 