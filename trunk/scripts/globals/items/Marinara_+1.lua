-----------------------------------
--	Author: Bababooey
--	Marinara +1
--	Made with the most select seafood and pasta boiled to perfection, this
--	dish will no doubt leave an indellible impression on whoever is fortunate
--	enough to consume it.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +15% (Cap: 120@800 Base HP)
--	Defense +5
--	Store TP +7
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
		user:addStatusEffect(EFFECT_FOOD,5720,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5720,1,0,3600); --Adds effects specific to this food.
	end
end;
