-----------------------------------
--	Author: Bababooey
-- 	Marbeled Steak
-- 	Marbled with succulent fat, this heavenly bison steak will melt in your mouth. 
--
--	http://wiki.ffxiclopedia.org/wiki/Marbled_Steak
--	4 hours, All Races
--	Strength +6
--  Agility +1
--	Intelligence -3
--	Lizard Killer
--  Attack +18% (Cap: 95@527 Base Attack)
--	Ranged Attack +32% (Cap: 95@527 Base Raneged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5157,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5157,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 