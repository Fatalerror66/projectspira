-----------------------------------
--	Author: Bababooey
--  Yayla Corbasi
-- 	A Near Eastern soup made from yogurt and mint. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yayla_Corbasi
--
--	3 Hours, All Races
--	HP +20
--	Dexterity -1
--	Vitality +2
--	HP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5579,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5579,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 