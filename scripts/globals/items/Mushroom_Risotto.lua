-----------------------------------
--	Author: Bababooey
--	Mushroom Risotto
--	A dish of rice and various mushrooms.
--
--	http://wiki.ffxiclopedia.org/wiki/Mushroom_Risotto
--
--	3 Hours, All Races
--	Strength -1
--	Vitality +3
--	Mind +3
--	HP Recovered while healing +2
--	MP +30
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
		user:addStatusEffect(EFFECT_FOOD,4434,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4434,1,0,10800); --Adds effects specific to this food.
	end
end;
