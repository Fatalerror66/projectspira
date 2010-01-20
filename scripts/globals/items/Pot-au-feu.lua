-----------------------------------
--	Author: Bababooey
-- 	Pot-au-feu
-- 	A stew of rabbit meat and assorted vegetables in a lightly seasoned 
--	broth. A popular ration in the Kingdom during the Great War. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pot-au-feu
--
--	30 Minutes, All Races
--	Strength +3
--	Agility +3
--	Ranged Attack +15-25%
--	Ranged Accuracy +10-25%
--	Intelligence -3
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
		user:addStatusEffect(EFFECT_FOOD,5752,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5752,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 