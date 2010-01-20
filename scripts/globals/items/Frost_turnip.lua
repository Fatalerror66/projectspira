-----------------------------------
--	Author: Bababooey
--	Frost Turnip
--	This vegetable is native to cold regions.
--
--	http://wiki.ffxiclopedia.org/wiki/Frost_Turnip
--
--	5 Minutes, All Races
--	Agility +2
--	Vitality -4
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
		user:addStatusEffect(EFFECT_FOOD,4382,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4382,1,0,300); --Adds effects specific to this food.
	end
end;
