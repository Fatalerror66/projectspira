-----------------------------------
--	Author: Bababooey
-- 	Wild Stew
-- 	This dhalmel stew has an exceptionally gamy flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Stew
--
--	4 Hours, All Races
--	Strength +4
--	Vitality +2
--	Agility +1
--	Intelligence -2
--	Attack +25% (Cap: 50@200 Base Attack)
--	Ranged Attack +25% (Cap: 50@200 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4589,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4589,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 