-----------------------------------
--	Author: Bababooey
--	Watermelon
--	A very sweet, very juicy melon.
--
--	http://wiki.ffxiclopedia.org/wiki/Watermelon
--
--	5 Minutes, All Races
--	Agility -6
--	Intelligence +4
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
		user:addStatusEffect(EFFECT_FOOD,4491,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4491,1,0,300); --Adds effects specific to this food.
	end
end;
