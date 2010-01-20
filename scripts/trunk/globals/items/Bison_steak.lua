-----------------------------------
--	Author: Bababooey
-- 	Bison Steak
-- 	A juicy slab of medium rare bison meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bison_Steak
--	3 hours, All Races
--	Strength +6
--  Agility +1
--	Intelligence - 3
--	Lizard Killer
--  Attack +18% (Cap: 90@500 Base Attack)
--	Ranged Attack +18% (Cap: 90@500 Base Raneged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5142,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5142,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 