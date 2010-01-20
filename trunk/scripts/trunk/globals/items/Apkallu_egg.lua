-----------------------------------
--	Author: Bababooey
--	Apkallu Egg
--	This apkallu egg is a healthy addition to every balanced meal.
--
--	http://wiki.ffxiclopedia.org/wiki/Apkallu_Egg
--
--	5 Minutes, All Races
--	HP +6
--	MP +6
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
		user:addStatusEffect(EFFECT_FOOD,5568,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5568,1,0,300); --Adds effects specific to this food.
	end
end;
