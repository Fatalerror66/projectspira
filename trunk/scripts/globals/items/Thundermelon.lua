-----------------------------------
--	Author: Bababooey
--	Thundermelon
--	This fruit is sweet, but the electric field it generates numbs your tongue.
--
--	http://wiki.ffxiclopedia.org/wiki/Thundermelon
--
--	5 Minutes, All Races
--	Agility -6
--	Intelligence +4
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
		user:addStatusEffect(EFFECT_FOOD,4412,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4412,1,0,300); --Adds effects specific to this food.
	end
end;
