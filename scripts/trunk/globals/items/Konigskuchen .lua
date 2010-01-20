-----------------------------------
--	Author: Psy aka psyclosis
--  Konigskuchen 
--	A Tavnazian cake eaten during the
--  weeks of the Starlight Celebration.
--  It is decorated with a golden crown  
--	http://wiki.ffxiclopedia.org/wiki/Konigskuchen
-- 
-- 3 hrs, All Races
-- INT +2
-- HP +8
-- MP +3%(cap: 13@~433MP)
-------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5614,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5614,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 