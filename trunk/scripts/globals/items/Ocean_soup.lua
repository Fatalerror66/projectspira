-----------------------------------
--	Author: Bababooey
--  Ocean Soup
-- 	If you love the ocean, then you'll love the mouthwatering flavor of this
--	magnificent shark fin soup. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ocean_Soup
--
--	4 Hours, All Races
--	HP +5%
--	MP +5
--	Dexterity +4
--	Mind -3
--	HP Recovered while healing +9
--	Attack +14% (Cap: 65@464 Base Attack)
--	Ranged Attack +14% (Cap: 65@Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4285,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4285,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 