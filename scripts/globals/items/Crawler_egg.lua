-----------------------------------
--	Author: Bababooey
--	Crawler Egg
--	Crawler eggs are known for their peculiar flavor. The shells are fragile,
--	so handle with care!
--
--	http://wiki.ffxiclopedia.org/wiki/Crawler_Egg
--
--	5 Minutes, All Races
--	HP +10
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
		user:addStatusEffect(EFFECT_FOOD,4357,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4357,1,0,300); --Adds effects specific to this food.
	end
end;
