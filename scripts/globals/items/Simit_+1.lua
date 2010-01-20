-----------------------------------
--	Author: Bababooey
--	Simit +1
--	This simit has been baked to mouthwatering perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Simit_%2B1
--
--	60 Minutes, All Races
--	Vitality +4
--	HP +18
--	Defense +2
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
		user:addStatusEffect(EFFECT_FOOD,5597,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5597,1,0,3600); --Adds effects specific to this food.
	end
end;
