-----------------------------------
--	Author: Bababooey
--  Shark Fin Soup
-- 	This soup is flavored with shark fin. 
--
--	http://wiki.ffxiclopedia.org/wiki/Shark_Fin_Soup
--
--	3 Hours, All Races
--	HP +5%
--	MP +5
--	Dexterity +4
--	Mind -4
--	HP Recovered while healing +9
--	Attack +14% (Cap: 60@428 Base Attack)
--	Ranged Attack +14% (Cap: 60@428 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4452,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4452,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 