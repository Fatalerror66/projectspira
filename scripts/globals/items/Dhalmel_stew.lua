-----------------------------------
--	Author: Bababooey
-- 	Dhalmel Stew
-- 	A rich, chunky soup of stewed dhalmel meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Dhalmel_Stew
--
--	3 Hours, All Races
--	Strength +4
--	Vitality +2
--	Agility +1
--	Intelligence -2
--	Attack +25% (Cap: 45@180 Base Attack)
--	Ranged Attack +25% (Cap: 45@180 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4433,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4433,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 