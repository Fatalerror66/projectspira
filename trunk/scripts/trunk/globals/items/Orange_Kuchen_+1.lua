-----------------------------
--	Author: Psy aka psyclosis
--  Orange kuchen +1
--
--	One of the most delicious orange 
--  kuchens you have ever tasted.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Orange_Kuchen_%2B1
--  4 hrs, All Races
--  MP +13% (Cap: 80@615 Base MP)
--  MP Recovered while healing +1
--------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4332,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4332,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 