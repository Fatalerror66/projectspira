-----------------------------------
--	Author: Psy aka psyclosis
--  Cupid chocolate 
--	A beautifully wrapped, heart-shaped
--  chocolate. A Cupid's arrow design has
--  been printed in its center.
--
--	http://wiki.ffxiclopedia.org/wiki/Cupid_Chocolate
-- 
-- 3 hrs, All Races
-- Attack +10
-----------------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5681,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5681,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 