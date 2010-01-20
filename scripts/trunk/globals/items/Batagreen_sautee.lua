-----------------------------------
--	Author: Bababooey
-- 	Batagreen Sautee
-- 	A dish of Batagreens, sauteed in Selbina butter.
--
--	http://wiki.ffxiclopedia.org/wiki/Batagreen_Sautee
--	
--	3 Hours, All Races
--	Vitailty -2
--	Agility +1
--	Ranged Accuracy +7% (Cap: 15@214)
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
		user:addStatusEffect(EFFECT_FOOD,4553,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4553,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 