-----------------------------------
--	Author: Bababooey
--	Nero di Seppia +1
--	More squid ink means more squid flavor!
--
--	http://wiki.ffxiclopedia.org/wiki/Nero_di_Seppia_%2B1
--
--	60 Minutes, All Races
--	Dexterity +3
--	Agility -1
--	Vitality +2
--	Mind -2
--	Charisma -1
--	HP +17% (Cap: 140@823 Base HP)
--	Store TP +6
--	Double Attack+1% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,5202,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5202,1,0,3600); --Adds effects specific to this food.
	end
end;
