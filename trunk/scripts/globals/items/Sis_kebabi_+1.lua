-----------------------------------
--	Author: Bababooey
-- 	Sis Kebabi +1
-- 	A sis kebabi made with exceptionally juicy meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Sis_Kebabi
--
--	60 Minutes, All Races
--	Strength +6
--	Intelligence -1
--	Vitality -1
--  Attack +20% (Cap: 75@375 Base Attack)
--  Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5599,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5599,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 