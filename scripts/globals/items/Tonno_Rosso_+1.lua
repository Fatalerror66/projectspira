-----------------------------------
--	Author: Bababooey
--	Tonno Rosso +1
--	An exceptionally delicious serving of spaghetti tonno rosso.
--
--	http://wiki.ffxiclopedia.org/wiki/Tonno_Rosso_%2B1
--
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	HP +13% (Cap: 185@1400 Base HP)
--	Store TP +5
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
		user:addStatusEffect(EFFECT_FOOD,5624,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5624,1,0,1800); --Adds effects specific to this food.
	end
end;
