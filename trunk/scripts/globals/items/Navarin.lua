-----------------------------------
--	Author: Bababooey
-- 	Navarin
-- 	A meal of stewed giant sheep meat. 
-- 
--	http://wiki.ffxiclopedia.org/wiki/Navarin
--
--	3 Hours, All Races
--	HP +3%
--  Strength +3
--	Vitality +1
--	Agility +1
--	Intelligence -1
--  Attack +27% (Cap: 30@111 Base Attack)
--  Ranged Attack +27% (Cap: 30@111 Base Ranged Attack)
--	Evasion +5
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
		user:addStatusEffect(EFFECT_FOOD,4439,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4439,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 