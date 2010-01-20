-----------------------------------
--	Author: Bababooey
-- 	Sheep Jerky
-- 	The flavor of this jerky is sublime. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sheep_Jerky
--
--	60 Minutes, All Races
--	Strength +3
--	Intelligence -1
--  Attack +22% (Cap: 35@159 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4518,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4518,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 