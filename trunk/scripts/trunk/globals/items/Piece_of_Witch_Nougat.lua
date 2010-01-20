----------------------------------
--	Author: Psy aka psyclosis
--  Piece of witch nougat
--
--	This ridiculously sweet candy is
--  said to be a favorite among witches.
-- 
--  http://wiki.ffxiclopedia.org/wiki/Witch_Nougat
--  60 min, All Races
--  HP +50
--  Intelligence +3
--  Agility -3
----------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5645,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5645,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 