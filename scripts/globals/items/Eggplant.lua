-----------------------------------
--	Author: Bababooey
--	Eggplant
--	This cute aubergine is egg-shaped.
--
--	http://wiki.ffxiclopedia.org/wiki/Eggplant
--
--	5 Minutes, All Races
--	Agility +3
--	Vitality -5
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
		user:addStatusEffect(EFFECT_FOOD,4388,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4388,1,0,300); --Adds effects specific to this food.
	end
end;
