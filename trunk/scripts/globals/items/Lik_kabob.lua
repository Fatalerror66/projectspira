-----------------------------------
--	Author: Bababooey
-- 	Lik Kabob
-- 	A lik on a stick, grilled over an open flame. 
--
--	http://wiki.ffxiclopedia.org/wiki/Lik_Kabob
--	
--	(Duration, Races) Unknown
--	Dexterity +4
--	Attack +8 (Unconfirmed)
--	Mind -3
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
		user:addStatusEffect(EFFECT_FOOD,5647,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5647,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 