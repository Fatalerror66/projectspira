----------------------------------
--	Author: Psy aka psyclosis
--  Lebkuchen manse
--
--	A remarkably detailed lebkuchen house,
--  and quite delicious, too. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Lebkuchen_Manse
--  4 hours, All Races
--  MP +15% (Cap: 55@550 Base MP) info non complete on wiki
--  Intelligence +4
--  HP Recovered while healing +3
--  MP Recovered while healing +2 
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
		user:addStatusEffect(EFFECT_FOOD,5617,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5617,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 