-----------------------------------
--	Author: Bababooey
--	Chocomilk
--	A frothy drink made of kukuru beans. Popular in Bastok.
--
--	http://wiki.ffxiclopedia.org/wiki/Chocomilk
--
--	3 Hours, All Races
--	MP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,4498,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4498,1,0,10800); --Adds effects specific to this food.
	end
end;
