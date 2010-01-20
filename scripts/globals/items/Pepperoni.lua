-----------------------------------
--	Author: Bababooey
-- 	Pepperoni
-- 	A hard, spicy sausage made of giant sheep meat. Mass produced
--	and rationed to the Royal Army during the Crystal War.  
--
--	http://wiki.ffxiclopedia.org/wiki/Pepperoni
--	
--	30 Minutes, All Races
--	HP +3% 
--	Strength +3
--	Intelligence -1
--	Attack +??% (Cap: ???)
--  UNCONFRIMED
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
		user:addStatusEffect(EFFECT_FOOD,5660,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5660,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 