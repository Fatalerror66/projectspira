-----------------------------------
--	Author: Bababooey
-- 	Crab Sushi +1
-- 	A flawless marriage of delectable claw meat and lovingly packed vinegar rice,
--	bound together by invigoratingly fresh wasabi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Crab_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Vitality +2
--	Defense +15
--	Accuracy +14%
--	Ranged Accuracy +14% (Unconfirmed)
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
		user:addStatusEffect(EFFECT_FOOD,5722,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5722,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 