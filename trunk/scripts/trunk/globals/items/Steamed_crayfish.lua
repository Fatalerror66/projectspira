-----------------------------------
--	Author: Bababooey
-- 	Steamed Crayfish
-- 	One step above your average boiled crayfish.
--
--	http://wiki.ffxiclopedia.org/wiki/Steamed_Crayfish
--	
--
--	60 Minutes, All Races
--	Defense +30% (Cap: 30@100 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4338,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4338,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 