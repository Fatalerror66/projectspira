-----------------------------------
--	Author: Bababooey
--	Stone Cheese
--	A hard cheese made from giant sheep's milk.
--
--	http://wiki.ffxiclopedia.org/wiki/Stone_Cheese
--
--	30 Minutes, All Races
--	HP +6% (Cap: 40)
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
		user:addStatusEffect(EFFECT_FOOD,4460,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4460,1,0,1800); --Adds effects specific to this food.
	end
end;
