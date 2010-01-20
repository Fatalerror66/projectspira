-----------------------------------
--	Author: Bababooey
--	Wild Pineapple
--	These pineapples grow wild on the island of Elshimo.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Pineapple
--
--	5 Minutes, All Races
--	Agility -5
--	Intelligence +3
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
		user:addStatusEffect(EFFECT_FOOD,4598,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4598,1,0,300); --Adds effects specific to this food.
	end
end;
