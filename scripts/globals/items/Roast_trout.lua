-----------------------------------
--	Author: Bababooey
-- 	Roast Trout
--  A shining trout on a stick, grilled with salt. Can also be made with an
--	alabaligi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Trout
--	
--	30 Minutes, All Races
--	Dexterity +3
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
		user:addStatusEffect(EFFECT_FOOD,4404,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4404,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 