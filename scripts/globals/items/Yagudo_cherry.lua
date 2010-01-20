-----------------------------------
--	Author: Bababooey
--	Yagudo Cherry
--	The Yagudo love this tree-growing fruit.
--
--	http://wiki.ffxiclopedia.org/wiki/Yagudo_Cherry
--
--	5 Minutes, All Races
--	Agility -1
--	Intelligence +1
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
		user:addStatusEffect(EFFECT_FOOD,4445,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4445,1,0,300); --Adds effects specific to this food.
	end
end;
