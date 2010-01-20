-----------------------------------
--	Author: Bababooey
-- 	Royal Omelette
-- 	The traditional egg dish of the San d'Orian royal house.
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Omelette
--	
--	3 Hours, All Races
--	Strength +5
--	Dexterity +2
--	Intelligence -3
--	Mind +4
--	Attack +22% (Cap: 65@295 Base Attack)
--  Ranged Attack +22% (Cap: 65@295 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4564,10800); --Adds the "has food" effect.
		user:addStatusEffect(4564,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 