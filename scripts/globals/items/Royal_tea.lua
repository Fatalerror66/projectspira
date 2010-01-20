-----------------------------------
--	Author: Bababooey
--	Royal Tea
--	A finely-brewed San d'Orian tea.
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Tea
--
--	4 Hours, All Races
--	Vitality -1
--	Charisma +3
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
		user:addStatusEffect(EFFECT_FOOD,4524,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4524,1,0,14400); --Adds effects specific to this food.
	end
end;
