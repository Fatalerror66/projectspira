-----------------------------------
--	Author: Bababooey
-- 	Meat Mithkabob
-- 	Mithra love this tasty meat-on-a-stick meal. 
--
--	http://wiki.ffxiclopedia.org/wiki/Meat_Mithkabob
--
--	30 Minutes, All Races
--	Strength +5
--  Agility +1
--	Intelligence -2
--  Attack +22% (Cap: 60@272 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4381,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4381,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 