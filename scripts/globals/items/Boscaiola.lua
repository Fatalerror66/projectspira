-----------------------------------
--	Author: Bababooey
--	Boscaiola
--	Popular among lumberjacks, this flavorful pasta is made from a
--	tomato and mushroom sauce.
--
--	http://wiki.ffxiclopedia.org/wiki/Boscaiola
--
--	30 Minutes, All Races
--	Strength -5
--	Dexterity -2
--	Vitality +2
--	Mind +4
--	MP Recovered while healing +1
--	MP +35
--	HP +18% (Cap: 120@666 Base HP)
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
		user:addStatusEffect(EFFECT_FOOD,5192,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5192,1,0,1800); --Adds effects specific to this food.
	end
end;
