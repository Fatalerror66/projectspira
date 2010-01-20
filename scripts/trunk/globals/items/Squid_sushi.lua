-----------------------------------
--	Author: Bababooey
-- 	Sole Sushi +1
--  Sliced, raw squid served on a small portion of sweet 
--	vinegar rice, a popular dish in the eastern empire.
--
--	http://wiki.ffxiclopedia.org/wiki/Squid_Sushi
--	
--	30 Minutes, All Races
--	HP +30
--	Dexterity +6
--	Agility +5
--	Mind -1
--	Accuracy +15%
--	Ranged Accuracy +15%
--	Resist Sleep
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
		user:addStatusEffect(EFFECT_FOOD,5148,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5148,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 