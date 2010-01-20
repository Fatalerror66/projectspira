-----------------------------------
--	Author: Bababooey
--	Pescatora +1
--	3 1/2 times better than the spaghetti pescatora your mom used to make.
--
--	http://wiki.ffxiclopedia.org/wiki/Pescatora_%2B1
--
--	60 Minutes, All Races
--	Vitality +3
--	Mind +1
--	HP +15% (Cap: 160@1066 Base HP)
--	Defense +22% (Cap: 70@318 Base Defense)
--	Store TP +6
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
		user:addStatusEffect(EFFECT_FOOD,5200,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5200,1,0,3600); --Adds effects specific to this food.
	end
end;
