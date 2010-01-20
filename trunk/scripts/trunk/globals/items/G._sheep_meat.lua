-----------------------------------
--	Author: Bababooey
--	Giant Sheep Meat
--	This mutton is a little tough.
--	Widely eaten on the Quon Continent.
--
--	http://wiki.ffxiclopedia.org/wiki/Giant_Sheep_Meat
--
--	5 Minutes, Galka Only
--	Strength +2
--	Intelligence -4
-----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);

	effect = user:getStatusEffect(EFFECT_FOOD);
	notgalkan = (player.getRace() ~= 8);
	
	if (effect ~= nil) or notgalkan then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4372,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4372,1,0,300); --Adds effects specific to this food.
	end
end;
