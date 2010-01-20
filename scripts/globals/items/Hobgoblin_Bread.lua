-----------------------------------
--	Author: Bababooey
--	Hobgoblin Bread
--	This strangely baked Goblin bread looks burnt in some places.
--
--	http://wiki.ffxiclopedia.org/wiki/Hobgoblin_Bread
--
--	60 Minutes, All Races
--	Vitality +3
--	Charisma -7
--	HP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,4328,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4328,1,0,3600); --Adds effects specific to this food.
	end
end;
