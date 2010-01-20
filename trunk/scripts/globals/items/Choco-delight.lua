-----------------------------------
--	Author: Bababooey
--	Choco-delight
--	The smooth, rich, and creamy flavor of this beverage puts regular chocomilk to shame.
--
--	http://wiki.ffxiclopedia.org/wiki/Choco-delight
--
--	4 Hours, All Races
--	MP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,4283,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4283,1,0,14400); --Adds effects specific to this food.
	end
end;
