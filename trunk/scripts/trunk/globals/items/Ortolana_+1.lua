-----------------------------------
--	Author: Bababooey
--	Ortolana_+1
--	A sumptuous alternative for the voracious vegans of Vana'diel.
--
--	http://wiki.ffxiclopedia.org/wiki/Ortolana_%2B1
--
--	60 Minutes, All Races
--	Agility +2
--	Vitality +2
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
		user:addStatusEffect(EFFECT_FOOD,5659,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5659,1,0,3600); --Adds effects specific to this food.
	end
end;
