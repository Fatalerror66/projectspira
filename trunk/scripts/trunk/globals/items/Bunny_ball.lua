-----------------------------------
--	Author: Bababooey
-- 	Bunny Ball
-- 	This specially cooked rarab meatball is overflowing with juices.
--
--	http://wiki.ffxiclopedia.org/wiki/Bunny_Ball
--	4 Hours, All Races
--  HP +10
--	Strength +2
--	Vitality +2
--	Intelligence -1
--  Attack +30% (Cap: 25@83 Base Attack)
--	Ranged Attack +30% (Cap: 25@83 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4349,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4349,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 