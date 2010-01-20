-----------------------------------
--	Author: Bababooey
-- 	Boiled Cockatrice
-- 	A stew made out of cockatrice meat, boiled to tender perfection. 
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Cockatrice
--	3 hours, All Races
--  Strength +5
--	Agility +2
--  Intelligence -2
--	Mind +1
--  Attack +22% (Cap: 60@272 Base Attack)
--  Ranged Attack +22% (Cap: 60@272 Base Ranged Attack)
--  Resist Petrify
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
		user:addStatusEffect(EFFECT_FOOD,4547,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4547,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 