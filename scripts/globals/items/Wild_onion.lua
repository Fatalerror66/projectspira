-----------------------------------
--	Author: Bababooey
--	Wild Onion
--	A wild variety of onion.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Onion
--
--	5 Minutes, All Races
--	Agility +4
--	Vitality -6
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
		user:addStatusEffect(EFFECT_FOOD,4387,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4387,1,0,300); --Adds effects specific to this food.
	end
end;
