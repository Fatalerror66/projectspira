-----------------------------------
--	Author: Psy aka psyclosis
--  Irmik Helvasi +1 
--	An irmik helvasi baked to perfection
--  by a master patissier.  
--
--	http://wiki.ffxiclopedia.org/wiki/Irmik_Helvasi_%2B1
-- 
--  4 hrs, All Races
--  Group Food
--  MP Recovered while healing +1
--  MP +3(Cap: 20@575MP) !!Cap on wiki not verified
--  HP +10(Cap: 75@750Base HP)!! cap on wiki not verified
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
		user:addStatusEffect(EFFECT_FOOD,5573,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5573,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 