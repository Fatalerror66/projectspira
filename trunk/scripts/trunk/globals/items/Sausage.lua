-----------------------------------
--	Author: Bababooey
-- 	Sausage
-- 	Smoked sausages made by filling a sheep's intestines with mutton.  
--
--	http://wiki.ffxiclopedia.org/wiki/Sausage
--	
--	30 Minutes, All Races
--	HP +3%
--	Strength +3
--	Intelligence -1
--	Attack +27% (Cap: 30@111 Base Attack)
--	Ranged Attack +27% (Cap: 30@111 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4578,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4578,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 