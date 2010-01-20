-----------------------------------
--	Author: Bababooey
--	Ic Pilav +1
--	Just looking at this delectable plate of ic pilav makes your mouth water.
--
--	http://wiki.ffxiclopedia.org/wiki/Ic_Pilav_%2B1
--
--	4 Hours, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5585,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5585,1,0,14400); --Adds effects specific to this food.
	end
end;
