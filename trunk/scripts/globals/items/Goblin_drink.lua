-----------------------------------
--	Author: Bababooey
--	Goblin Drink
--	This Goblin Beverage is a mix of various strained vegetables
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Drink
--
--	3 Hours, All Races
--	MP Recovered while healing +1
-----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);

	effect = user:getStatusEffect(EFFECT_FOOD);

	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4541,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4541,1,0,10800); --Adds effects specific to this food.
	end
end;
