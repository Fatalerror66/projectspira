-----------------------------------
--	Author: Bababooey
--	Pumpernickel
--	Deliciously baked black bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Pumpernickel
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +10
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
		user:addStatusEffect(EFFECT_FOOD,4591,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4591,1,0,3600); --Adds effects specific to this food.
	end
end;
