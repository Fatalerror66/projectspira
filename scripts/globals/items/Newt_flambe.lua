-----------------------------------
--	Author: Bababooey
-- 	Newt Flambe
-- 	Not your ordinary blackened newt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Newt_Flambe
--
--	4 hours, All Races
--	Dexterity +4
--  Mind -3
--  Attack +18% (Cap: 65@361 Base Attack)
--	Resist Virus
-- 	Resist Curse
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
		user:addStatusEffect(EFFECT_FOOD,4329,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4329,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 