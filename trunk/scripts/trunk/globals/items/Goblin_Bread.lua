-----------------------------------
--	Author: Bababooey
--	Goblin Bread
--	The Goblins make this hard bread from horo barley flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Bread
--
--	30 Minutes, All Races
--	Vitality +1
--	Charisma -5
--	HP +7
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
		user:addStatusEffect(EFFECT_FOOD,4458,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4458,1,0,1800); --Adds effects specific to this food.
	end
end;
