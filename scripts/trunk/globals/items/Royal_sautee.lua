-----------------------------------
--	Author: Bababooey
-- 	Royal Sautee
-- 	Tender slices of coeurl meat grace this savory dish fit for a king. 
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Sautee
--	
--	4 hours, All Races
--	Stength +5
--	Agility +1
--	Intelligence -2
--	Resist Stun
-- 	Attack +20% (Cap: 80@400 Base Attack)
--	Ranged Attack +20% (Cap: 80@400 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4295,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4295,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 