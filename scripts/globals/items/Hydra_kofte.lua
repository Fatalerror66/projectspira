-----------------------------------
--	Author: Bababooey
-- 	Hydra Kofte
-- 	A dish made from grilled ground hydra meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hydra_Kofte
--	
--	3 Hours, All Races
--	Strength +7
--	Intelligence -3
--	Attack +20% (Cap: 150@750 Base Attack)
--  Ranged Attack +20% (Cap: 150@750 Base Attack)
--	Defense +25% (Cap: 70@280 Base Defense)
--	Resist Poison
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
		user:addStatusEffect(EFFECT_FOOD,5602,10800); --Adds the "has food" effect.
		user:addStatusEffect(5602,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 