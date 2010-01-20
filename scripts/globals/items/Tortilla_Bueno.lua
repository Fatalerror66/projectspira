-----------------------------------
--	Author: Bababooey
--	Tortilla Bueno
--	About as tasty as you can make flour and water.
--
--	http://wiki.ffxiclopedia.org/wiki/Tortilla_Bueno
--
--	60 Minutes, All Races
--	Vitality +4
--	HP +8
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
		user:addStatusEffect(EFFECT_FOOD,5181,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5181,1,0,3600); --Adds effects specific to this food.
	end
end;
