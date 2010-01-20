-----------------------------------
--	Author: Bababooey
--	Zaru Soba +1
--	Arguably one of the best servings of zaru soba ever made.
--
--	http://wiki.ffxiclopedia.org/wiki/Zaru_Soba_%2B1
--
--	30 Minutes, All Races
--	Agility +3
--	HP +12% (Cap: 180@1500 Base HP)
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
		user:addStatusEffect(EFFECT_FOOD,5728,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5728,1,0,1800); --Adds effects specific to this food.
	end
end;
