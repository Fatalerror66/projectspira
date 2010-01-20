-----------------------------------
--	Author: Bababooey
--	Ilm-Long Salmon Sub
--	The toppings on this delicious salmon sub are piled a malm high.
--
--	http://wiki.ffxiclopedia.org/wiki/Ilm-long_Salmon_Sub
--
--	60 Minutes, All Races
--	Dexterity +2
--	Agility +1
--	Vitality +1
--	Mind -2
--	Intelligence +2
--	Ranged Accuracy +3
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
		user:addStatusEffect(EFFECT_FOOD,4266,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4266,1,0,3600); --Adds effects specific to this food.
	end
end;
