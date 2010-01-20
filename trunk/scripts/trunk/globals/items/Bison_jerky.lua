-----------------------------------
--	Author: Bababooey
-- 	Bison Jerky
-- 	Made from the happiest bovines in Vana'diel.
--
--	http://wiki.ffxiclopedia.org/wiki/Bison_Jerky
--	60 minutes, All Races
--	Strength +5
--  Mind -2
--  Attack +18% (Cap: 70@388 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5207,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5207,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 