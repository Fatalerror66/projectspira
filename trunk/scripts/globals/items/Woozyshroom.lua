-----------------------------------
--	Author: Bababooey
--	Woozyshroom
--	An edible mushroom that grows on funguar.
--
--	http://wiki.ffxiclopedia.org/wiki/Woozyshroom
--
--	5 Minutes, All Races
--	Strength -4
--	Mind +2
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
		user:addStatusEffect(EFFECT_FOOD,4373,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4373,1,0,300); --Adds effects specific to this food.
	end
end;
