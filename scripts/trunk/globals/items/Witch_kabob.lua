-----------------------------------
--	Author: Bababooey
-- 	Witch Kabob
-- 	These roast mushrooms have been bewitched.
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Kabob
--	
--	60 Minutes, All Races
--	MP +15
--	Mind +4
--	MP Recovered while healing +3
--	Enmity -1
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
		user:addStatusEffect(EFFECT_FOOD,4343,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4343,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 