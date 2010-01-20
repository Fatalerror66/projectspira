-----------------------------------
--	Author: Bababooey
--	Margherita Pizza
--	This pizza derives its popularity from the tried-and-tested combinatorial
--	deliciousness of cheese, basil, and tomato.
--
--	http://wiki.ffxiclopedia.org/wiki/Margherita_Pizza
--
--	3 Hours, All Races
--	HP +30
--	Attack +10
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
		user:addStatusEffect(EFFECT_FOOD,5695,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5695,1,0,10800); --Adds effects specific to this food.
	end
end;
