-----------------------------------
--	Author: Bababooey
--	Marinara Sauce
--	A zesty tomato sauce flavored with olives and anchovies.
--	Perfect for seafood dishes.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_Sauce
--
--	5 Minutes, All Races
--	Mind +2
--	Intelligence +1
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
		user:addStatusEffect(EFFECT_FOOD,5747,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5747,1,0,300); --Adds effects specific to this food.
	end
end;
