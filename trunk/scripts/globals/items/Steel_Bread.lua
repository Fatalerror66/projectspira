-----------------------------------
--	Author: Bababooey
--	Steel Bread
--	Deliciously baked iron bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Steel_Bread
--
--	60 Minutes, All Races
--	Vitality +1
--	HP +6
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
		user:addStatusEffect(EFFECT_FOOD,4573,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4573,1,0,3600); --Adds effects specific to this food.
	end
end;
