-----------------------------------
--	Author: Almendro & Michael
--  Persikos au Lait
--	Persikos-flavored milk. 
--
--	http://wiki.ffxiclopedia.org/wiki/Persikos_au_Lait
-- 
--  Regen Effect +4 
--  4 HP every 3 seconds, 800 total 
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
		user:addStatusEffect(EFFECT_FOOD,4303,0,600); --Adds the "has food" effect.
		user:addStatusEffect(4303,1,3,600); --Adds effects specific to this food.
	end
end; 