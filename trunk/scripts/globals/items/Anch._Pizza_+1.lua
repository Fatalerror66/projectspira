-----------------------------------
--	Author: Bababooey
--	Anchovy Pizza +1
--	Only the choicest of anchovies are
--	given the privilege of topping this
--	transcendental pizza.
--
--	http://wiki.ffxiclopedia.org/wiki/Anchovy_Pizza_%2B1
--
--	4 Hours, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5700,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5700,1,0,14400); --Adds effects specific to this food.
	end
end;
