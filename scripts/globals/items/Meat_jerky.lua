-----------------------------------
--	Author: Bababooey
-- 	Meat Jerky
-- 	A snack made from dried mutton. 
--
--	http://wiki.ffxiclopedia.org/wiki/Meat_Jerky
--
--	30 Minutes, All Races
--	Strength +3
--	Intelligence -1
--  Attack +22% (Cap: 30@136 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4376,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4376,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 