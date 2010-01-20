-----------------------------------
--	Author: Bababooey
--	Tortilla
--	A thin shell made from corn flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Tortilla
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +4
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
		user:addStatusEffect(EFFECT_FOOD,4408,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4408,1,0,1800); --Adds effects specific to this food.
	end
end;
