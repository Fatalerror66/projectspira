-----------------------------------
--	Author: Bababooey
-- 	Anchovy
-- 	Icefish or sandfish pickled in oil. Mass produced and rationed to the
--	Republican Army during the Crystal War. 
--
--	http://wiki.ffxiclopedia.org/wiki/Anchovy
--	
--	Wiki lists this as a 3-minute food.  
--
--	3 Minutes, All Races
--	Dexterity +1
--	Mind -3
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
		user:addStatusEffect(EFFECT_FOOD,5652,0,180); --Adds the "has food" effect.
		user:addStatusEffect(5652,1,0,180); --Adds effects specific to this food.
	end
end; 
 
 
 