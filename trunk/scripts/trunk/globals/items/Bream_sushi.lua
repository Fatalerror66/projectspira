-----------------------------------
--	Author: Bababooey
-- 	Bream Sushi
-- 	Sliced, raw bream served on a smallportion of sweet vinegar rice, a
--	popular dish in the eastern empire. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bream_Sushi
--	
--	30 Minutes, All Races
--	Dexterity +6
--	Vitality +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16%
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
		user:addStatusEffect(EFFECT_FOOD,5176,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5176,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 