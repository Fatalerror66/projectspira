-----------------------------------
--	Author: Bababooey
-- 	Bataquiche +1
-- 	The flaky crust of this heavenly quiche will make a grown Galka cry.
--
--	http://wiki.ffxiclopedia.org/wiki/Bataquiche_%2B1
--	
--	60 Minutes, All Races
--	MP +10
--	Vitality -1
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
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
		user:addStatusEffect(EFFECT_FOOD,5169,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5169,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 