-----------------------------------
--	Author: Bababooey
--	Arrabbiata
--	A delightful blend of pomodoro sauce and dragon meat served over spaghetti
--	al dente, with enough mustard to make your eyes pop in surprise.
--
--	http://wiki.ffxiclopedia.org/wiki/Arrabbiata
--
--	30 Minutes, All Races
--	Strength +5
--	Vitality +2
--	Intelligence -7
--	HP +12% (Cap: 150@1250 Base HP)
--	Attack +23% (Cap: 120@533 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5211,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5211,1,0,1800); --Adds effects specific to this food.
	end
end;
