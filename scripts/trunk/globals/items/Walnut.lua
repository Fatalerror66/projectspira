-----------------------------------
--	Author: Bababooey
--	Walnut
--	This hard-shelled nut comes from trees of the same name.
--
--	http://wiki.ffxiclopedia.org/wiki/Walnut
--
--	3 Minutes, All Races
--	HP +30
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
		user:addStatusEffect(EFFECT_FOOD,5661,0,180); --Adds the "has food" effect.
		user:addStatusEffect(5661,1,0,180); --Adds effects specific to this food.
	end
end;
