-----------------------------------
--	Author: Bababooey
-- 	Imperial Omelette
-- 	This fluffy San d'Orian omelette has been cooked to perfection. 
--	Even the king himself would be pleased.
--
--	http://wiki.ffxiclopedia.org/wiki/Imperial_Omelette
--	
--	4 Hours, All Races
--	Strength +5
--	Dexterity +2
--	Intelligence -3
--	Mind +4
--	Attack +22% (Cap: 70@318 Base Attack)
--  Ranged Attack +22% (Cap: 70@318 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4331,14400); --Adds the "has food" effect.
		user:addStatusEffect(4331,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 