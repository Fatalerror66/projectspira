-----------------------------------
--	Author: Bababooey
-- 	Juicy Mutton
-- 	Succulent juices flow from this tasty roast mutton. 
--
--	http://wiki.ffxiclopedia.org/wiki/Juicy_Mutton
--	
--	4 Hours, All Races
--	Strength +3
--	Intelligence -1
--	Attack +27% (Cap: 35@129 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4335,14400); --Adds the "has food" effect.
		user:addStatusEffect(4335,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 