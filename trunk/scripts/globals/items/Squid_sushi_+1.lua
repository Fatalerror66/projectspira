-----------------------------------
--	Author: Bababooey
-- 	Squid Sushi +1
--  This divine squid sushi would bring tears to any mother's eyes.
--
--	http://wiki.ffxiclopedia.org/wiki/Squid_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +30
--	Dexterity +6
--	Agility +5
--	Accuracy +16%
--	Ranged Accuracy +16%
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
		user:addStatusEffect(EFFECT_FOOD,5162,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5162,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 