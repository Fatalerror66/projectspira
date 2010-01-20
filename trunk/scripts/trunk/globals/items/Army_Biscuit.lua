-----------------------------------
--	Author: Bababooey
--	Army Biscuit
--	A hard, tasteless biscuit high in calories. Rationed to Federation Army
--	soldiers during the Crystal War.
--
--	http://wiki.ffxiclopedia.org/wiki/Army_Biscuit
--
--	 Minutes, All Races
--	HP Recovered while healing +3
--	MP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,5657,0,0); --Adds the "has food" effect.
		user:addStatusEffect(5657,1,0,0); --Adds effects specific to this food.
	end
end;
