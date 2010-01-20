-----------------------------------
--	Author: Bababooey
--	Ortolana
--	A more than generous serving of assorted vegetables prepared in olive
--	oil, served over spaghetti al dente.
--
--	http://wiki.ffxiclopedia.org/wiki/Ortolana
--
--	30 Minutes, All Races
--	Agility +2
--	Vitality +2
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
		user:addStatusEffect(EFFECT_FOOD,5658,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5658,1,0,1800); --Adds effects specific to this food.
	end
end;
