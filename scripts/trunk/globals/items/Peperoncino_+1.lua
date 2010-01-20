-----------------------------------
--	Author: Bababooey
--	Peperoncino +1
--	This spaghetti peperoncino is so hot, you will need at least Water IV to
--	cool off the fire in your mouth.
--
--	http://wiki.ffxiclopedia.org/wiki/Peperoncino_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +30% (Cap: 75@250 Base HP)
--	Store TP +6
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
		user:addStatusEffect(EFFECT_FOOD,5197,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5197,1,0,3600); --Adds effects specific to this food.
	end
end;
