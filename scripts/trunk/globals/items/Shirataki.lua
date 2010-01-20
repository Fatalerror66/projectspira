-----------------------------------
--	Author: Bababooey
--	Shirataki
--	This stringlike, elastic food is imported from the Far East.
--
--	http://wiki.ffxiclopedia.org/wiki/Shirataki
--
--	5 Minutes, All Races
--	Strength -3
--	Mind +1
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
		user:addStatusEffect(EFFECT_FOOD,5237,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5237,1,0,300); --Adds effects specific to this food.
	end
end;
