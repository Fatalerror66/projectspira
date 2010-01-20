-----------------------------------
--	Author: Bababooey
--	Iron Bread
--	A traditional hard-baked Galkan bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Iron_Bread
--
--	30 Minutes, All Races
--	Vitality +1
--	HP +4
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
		user:addStatusEffect(EFFECT_FOOD,4499,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4499,1,0,1800); --Adds effects specific to this food.
	end
end;
