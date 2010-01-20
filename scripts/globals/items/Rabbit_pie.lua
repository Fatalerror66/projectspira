-----------------------------------
--	Author: Bababooey
-- 	Rabbit Pie
-- 	No rabbits were harmed in the making of this pie.  
--
--	http://wiki.ffxiclopedia.org/wiki/Rabbit_Pie
--	
--	30 Minutes, All Races
--	Strength +5
--	Vitality +5
--	Attack +25% (Cap: 100)
--	Ranged Attack +25% (Cap: 100)
--	Defense +25 (Cap: 100)
--	Intelligence -2
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
		user:addStatusEffect(EFFECT_FOOD,5685,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5685,1,0,1800); --Adds effects specific to this food.
	end;
end; 
 
 
 