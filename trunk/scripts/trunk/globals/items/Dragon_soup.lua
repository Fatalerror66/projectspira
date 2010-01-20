-----------------------------------
--	Author: Bababooey
-- 	Dragon Soup
-- 	Soup made from the meat of a dragon. 
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Soup
--
--	3 Hours, All Races
--	HP +20
--	Strength +7
--	Vitality +2
--	Agility +2
--	Intelligence -3
--	HP Recovered While Healing +9
--	Attack +22% (Cap: 150@681 Base Attack)
--	Ranged Attack +22% (Cap: 150@681 Base Ranged Attack)
--	Demon Killer 
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
		user:addStatusEffect(EFFECT_FOOD,4549,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4549,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 