-----------------------------------
--	Author: Bababooey
-- 	Tender Navarin
-- 	The slow-cooked mutton in this navarin will simply melt in your mouth. 
-- 
--	http://wiki.ffxiclopedia.org/wiki/Tender_Navarin
--
--	4 Hours, All Races
--	HP +3%
--  Strength +3
--	Vitality +1
--	Agility +1
--	Intelligence -1
--  Attack +27% (Cap: 35@129 Base Attack)
--  Ranged Attack +27% (Cap: 35@129 Base Ranged Attack)
--	Evasion +6
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
		user:addStatusEffect(EFFECT_FOOD,4284,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4284,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 