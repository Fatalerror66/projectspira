-----------------------------------
--	Author: Bababooey
-- 	Buttered Nebimonite
-- 	This blissful nebimonite bake has been buttered and basted to perfection.  
--
--	http://wiki.ffxiclopedia.org/wiki/Buttered_Nebimonite
--	
--	60 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Defense +25% (Cap: 75@300 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4267,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4267,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 