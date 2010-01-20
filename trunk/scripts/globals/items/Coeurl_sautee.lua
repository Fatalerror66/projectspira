-----------------------------------
--	Author: Bababooey
-- 	Coeurl Sautee
-- 	Coeurl meat sauteed in olive oil.
--
--	http://wiki.ffxiclopedia.org/wiki/Coeurl_Sautee
--	
--	3 hours, All Races
--	Stength +5
--	Agility +1
--	Intelligence -2
--	Resist Stun
-- 	Attack +20% (Cap: 75@375 Base Attack)
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4548,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4548,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 