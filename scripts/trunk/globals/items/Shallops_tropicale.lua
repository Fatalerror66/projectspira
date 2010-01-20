-----------------------------------
--	Author: Bababooey
-- 	Shallops Tropicale
--  A dish of shallops, steamed in Khazam pineapple juice.
--
--	http://wiki.ffxiclopedia.org/wiki/Shallops_Tropicale
--	
--	3 Hours, All Races
--	MP +20
--	Dexterity +1
--	Vitality +4
--	Intelligence +1
--	Defense +25% (Cap 100@400 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4554,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4554,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 