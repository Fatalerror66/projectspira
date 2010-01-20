-----------------------------------
--	Author: Bababooey
-- 	Pot-au-feu +1
-- 	This hearty pot-au-feu is overflowing with succulent chunks of meat 
--	and the freshest vegetables. A particularly favored dish among the 
--	Kingdom's archers. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pot-au-feu_%2B1
--
--	60 Minutes, All Races
--	Strength +4
--	Agility +4
--	Ranged Attack +???%
--	Ranged Accuracy +???%
--	Intelligence -3
--	Defense +2
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
		user:addStatusEffect(EFFECT_FOOD,5753,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5753,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 