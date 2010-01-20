-----------------------------------
--	Author: Bababooey
--	Nopales
--	A cactus originally bred to provide sustenance for residents
--	of Fort Karugo-Narugo.
--
--	http://wiki.ffxiclopedia.org/wiki/Nopales
--
--	5 Minutes, All Races
--	Agility +2
--	Vitality -4
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
		user:addStatusEffect(EFFECT_FOOD,5650,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5650,1,0,300); --Adds effects specific to this food.
	end
end;
