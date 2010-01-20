-----------------------------------
--	Author: Bababooey
-- 	Herb Crawler Eggs
-- 	This cuisine is made with a flavorful sauce over fried crawler eggs. 
--
--	http://wiki.ffxiclopedia.org/wiki/Herb_Crawler_Eggs
--	
--	3 Hours, All Races
--	HP +6% (Cap: 80@1333 Base HP)
--	MP +10
--	Vitality -1
--	Agility +3
--	Evasion +8
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
		user:addStatusEffect(EFFECT_FOOD,4552,10800); --Adds the "has food" effect.
		user:addStatusEffect(4552,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 