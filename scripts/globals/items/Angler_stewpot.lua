-----------------------------------
--	Author: Bababooey
-- 	Angler Stewpot
-- 	A Far Eastern dish created with orobon meat, along with vegetables and a few
--	other ingredients. Each piece of food may be removed and eaten as soon as
--	it has finished cooking.
--
--	http://wiki.ffxiclopedia.org/wiki/Angler_Stewpot
--	3 Hours All Races
--	HP +10%
--  MP +10%
--  HP Recovered while healing +5
--  MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,5611,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5611,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 