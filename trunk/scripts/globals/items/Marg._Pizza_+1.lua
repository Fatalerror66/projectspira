-----------------------------------
--	Author: Bababooey
--	Margherita Pizza +1
--	A margherita among margheritas, this pizza has achieved the perfect
--	harmony of basil and tomato.
--
--	http://wiki.ffxiclopedia.org/wiki/Margherita_Pizza_%2B1
--
--	4 Hours, All Races
--	HP +30
--	Attack +10
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
		user:addStatusEffect(EFFECT_FOOD,5696,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5696,1,0,14400); --Adds effects specific to this food.
	end
end;
