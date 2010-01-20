-----------------------------------
--	Author: Bababooey
-- 	Buffalo Jerky
-- 	Dried buffalo meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Buffalo_Jerky
--	30 Minutes, All Races
--  Strength +4
--	Mind -2
--  Attack +18% (Cap: 65@361 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5196,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5196,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 