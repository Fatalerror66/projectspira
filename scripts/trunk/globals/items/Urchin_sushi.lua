-----------------------------------
--	Author: Bababooey
-- 	Urchin Sushi
-- 	The raw eggs of a Bibiki urchin served on a small portion of 
--	sweet vinegar rice wrapped in seaweed.
--
--	http://wiki.ffxiclopedia.org/wiki/Urchin_Sushi
--	
--	30 Minutes, All Races
--	HP +40
--	Strength +1
--	Vitality +5
--	Resist Sleep
--	Accuracy +15%
--	Ranged Accuracy +15%
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
		user:addStatusEffect(EFFECT_FOOD,5151,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5151,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 