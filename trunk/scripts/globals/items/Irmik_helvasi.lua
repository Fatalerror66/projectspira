-----------------------------------
--	Author: Psy aka psyclosis
--  Irmik helvasi
--	A Near Eastern cake topped with pine nuts.
--  Its subtle sweetness makes it go well with chai.  
--
--	http://wiki.ffxiclopedia.org/wiki/Irmik_Helvasi
-- 
--  3 hrs, All Races
--  Group Food
--  MP Recovered while healing +1
--  MP +3(Cap: 13@433MP)
--  HP +10(Cap: 70@700 Base HP)
--  INT +1
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
		user:addStatusEffect(EFFECT_FOOD,5572,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5572,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 