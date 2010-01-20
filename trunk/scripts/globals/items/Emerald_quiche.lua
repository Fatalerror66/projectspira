-----------------------------------
--	Author: Bababooey
-- 	Emerald Quiche
-- 	Only the finest of chefs can bake a quiche of this quality.
--
--	http://wiki.ffxiclopedia.org/wiki/Emerald_Quiche
--	
--	60 Minutes, All Races
--	MP +15
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
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
		user:addStatusEffect(EFFECT_FOOD,5171,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5171,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 