-----------------------------------
--	Author: Psy aka psyclosis
--  Rolsin
--	Only the sweetest dried rolanberries can be deemed "rolsins." 
--	http://wiki.ffxiclopedia.org/wiki/Rolsin
-- 
-- 5 min, All Races
-- INT +1
-- AGI -3
---------------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5673,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5673,1,0,300); --Adds effects specific to this food.
	end
end; 
 
 
 