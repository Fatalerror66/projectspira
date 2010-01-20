-----------------------------------
--	Author: Bababooey
--	Lizard Egg
--	Lizard eggs are known for their exquisite flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Lizard_Egg
--
--	5 Minutes, All Races
--	HP +5
--	MP +5
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
		user:addStatusEffect(EFFECT_FOOD,4362,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4362,1,0,300); --Adds effects specific to this food.
	end
end;
