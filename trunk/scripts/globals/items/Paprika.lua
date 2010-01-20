-----------------------------------
--	Author: Bababooey
--	Paprika
--	A spice coveted more for its sweetness than its spiciness.
--
--	http://wiki.ffxiclopedia.org/wiki/Paprika
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
--	Defense -1
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
		user:addStatusEffect(EFFECT_FOOD,5740,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5740,1,0,300); --Adds effects specific to this food.
	end
end;
