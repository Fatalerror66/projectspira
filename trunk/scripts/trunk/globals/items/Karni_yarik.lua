-----------------------------------
--	Author: Bababooey
-- 	Karni Yarik
-- 	An eggplant stuffed with meat and topped with tomatoes.
--
--	http://wiki.ffxiclopedia.org/wiki/Karni_Yarik
--	
--	30 Minutes, All Races
--	Vitality -1
--	Agility +3
--	Attack +20% (Cap: 65@325 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5588,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5588,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 