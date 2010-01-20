-----------------------------------
--	Author: Bababooey
-- 	Herb Quus
-- 	This quus is baked with herbs to counter its gamy taste.
--
--
--	http://wiki.ffxiclopedia.org/wiki/Herb_Quus
--	
--	3 Hours, All Races
--	Dexterity +1
--	Mind -1
--	Ranged Accuracy +7% (Cap: 10@143)
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
		user:addStatusEffect(EFFECT_FOOD,4559,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4559,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 