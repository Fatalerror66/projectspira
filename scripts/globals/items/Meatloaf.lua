-----------------------------------
--	Author: Bababooey
-- 	Meatloaf
-- 	Finely seasoned meat formed into the shape of a loaf of bread and baked to
--	goodness. 
--
--	http://wiki.ffxiclopedia.org/wiki/Meatloaf
--
--	180 Minutes, All Races
--	Strength +6
--  Agility +2
--	Intelligence -3
--  Attack +20% (Cap: 75@403 Base Attack)
--	Maybe other stat bonuses
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
		user:addStatusEffect(EFFECT_FOOD,5689,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5689,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 