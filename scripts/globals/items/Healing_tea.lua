-----------------------------------
--	Author: Bababooey
--	Healing Tea
--	This savory blend of chamomile tea is
--	rumored to have soothing properties.
--
--	http://wiki.ffxiclopedia.org/wiki/Healing_Tea
--
--	4 Hours, All Races
--	Vitality -1
--	Charisma +3
--	MP Recovered while healing +2
--	MP +10
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
		user:addStatusEffect(EFFECT_FOOD,4286,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4286,1,0,14400); --Adds effects specific to this food.
	end
end;
