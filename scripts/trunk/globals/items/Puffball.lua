-----------------------------------
--	Author: Bababooey
--	Puffball
--	A large, rather tasty mushroom, shaped like a ball.
--
--	http://wiki.ffxiclopedia.org/wiki/Puffball
--
--	5 Minutes, All Races
--	Strength -4
--	Mind +2
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
		user:addStatusEffect(EFFECT_FOOD,4448,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4448,1,0,300); --Adds effects specific to this food.
	end
end;
