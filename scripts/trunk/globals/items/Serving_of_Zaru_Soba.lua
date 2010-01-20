-----------------------------------
--	Author: Bababooey
--	Zaru Soba
--	Delicious and nutritious, this traditional dish from the Far East
--	is comprised of noodles made from buckwheat flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Zaru_Soba
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
		user:addStatusEffect(EFFECT_FOOD,5727,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5727,1,0,1800); --Adds effects specific to this food.
	end
end;
