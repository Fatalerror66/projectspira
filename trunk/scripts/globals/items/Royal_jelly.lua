-----------------------------------
--	Author: Bababooey
--	Royal Jelly
--	A highly nutritious bee secretion eaten only by the queen bee.
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Jelly
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
		user:addStatusEffect(EFFECT_FOOD,4508,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4508,1,0,10800); --Adds effects specific to this food.
	end
end;
