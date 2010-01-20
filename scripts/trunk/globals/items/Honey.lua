-----------------------------------
--	Author: Bababooey
--	Honey
--	Bees make this sweet honey from flower nectar.
--
--	http://wiki.ffxiclopedia.org/wiki/Honey
--
--	5 Minutes, All Races
--	MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4370,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4370,1,0,300); --Adds effects specific to this food.
	end
end;
