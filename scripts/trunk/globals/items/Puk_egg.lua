-----------------------------------
--	Author: Bababooey
--	Puk Egg
--	Puk eggs are a famous delicacy in the Near East.
--
--	http://wiki.ffxiclopedia.org/wiki/Puk_Egg
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
		user:addStatusEffect(EFFECT_FOOD,5569,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5569,1,0,300); --Adds effects specific to this food.
	end
end;
