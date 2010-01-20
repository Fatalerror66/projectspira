-----------------------------------
--	Author: Bababooey
--	Melanzane +1
--	Made from the most exceptional eggplants in all of Vana'diel.
--
--	http://wiki.ffxiclopedia.org/wiki/Melanzane_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +25% (Cap: 105@420 Base HP)
--	Store TP +4
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
		user:addStatusEffect(EFFECT_FOOD,5214,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5214,1,0,3600); --Adds effects specific to this food.
	end
end;
