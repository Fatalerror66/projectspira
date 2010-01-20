-----------------------------------
--	Author: Bababooey
--	Persikos
--	The flesh of this legendary fruit is soft and sweet.
--
--	http://wiki.ffxiclopedia.org/wiki/Persikos
--
--	5 Minutes, All Races
--	Agility -7
--	Intelligence +5
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
		user:addStatusEffect(EFFECT_FOOD,4274,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4274,1,0,300); --Adds effects specific to this food.
	end
end;
