-----------------------------------
--	Author: Bababooey
-- 	Sis Kebabi
-- 	Sheep meat and onions on a skewer. Popular in the Near East.
--
--	http://wiki.ffxiclopedia.org/wiki/Sis_Kebabi
--
--	30 Minutes, All Races
--	Strength +6
--	Intelligence -2
--	Vitality -2
--  Attack +20% (Cap: 70@350 Base Attack)
--  Ranged Attack +20% (Cap: 70@350 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5598,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5598,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 