-----------------------------------
--	Author: Bababooey
--	Rarab Tail
--	Dark energy was used to germinate this strain of blue pea.
--
--	http://wiki.ffxiclopedia.org/wiki/Rarab_Tail
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
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
		user:addStatusEffect(EFFECT_FOOD,4444,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4444,1,0,300); --Adds effects specific to this food.
	end
end;
