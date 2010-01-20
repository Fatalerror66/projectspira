-----------------------------------
--	Author: Bababooey
-- 	Kohlrouladen
-- 	This delectable dish of seasoned ground beef rolled in pickled cabbage
--	leaves was a popular wartime ration among Republican soldiers. 
--
--	http://wiki.ffxiclopedia.org/wiki/Kohlrouladen
--
--	30 Minutes, All Races
--	Strength +3
--	Agility +3
--	Intelligence -5
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
		user:addStatusEffect(EFFECT_FOOD,5760,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5760,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 