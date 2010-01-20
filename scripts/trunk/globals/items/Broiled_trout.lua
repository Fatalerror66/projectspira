-----------------------------------
--	Author: Bababooey
-- 	Broiled Trout
-- 	An exceptionally delicious trout on a stick, grilled with salt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Broiled_Trout
--	
--	60 Minutes, All Races
--	Dexterity +4
--	Mind -1
--	Ranged Attack +14% (Cap: 85@607 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4587,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4587,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 