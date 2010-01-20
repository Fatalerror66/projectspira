-----------------------------------
--	Author: Bababooey
--	Carbonara +1
--	This spaghetti carbonara is so creamy, the word "creamy" isn't creamy enough
--	to describe its creaminess.
--
--	http://wiki.ffxiclopedia.org/wiki/Carbonara_%2B1
--
--	60 Minutes, All Races
--	Strength +4
--	Vitality +2
--	Intelligence -3
--	MP +15
--	HP +14% (Cap: 180@1285 Base HP)
--	Attack +18% (Cap: 70@388 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5199,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5199,1,0,3600); --Adds effects specific to this food.
	end
end;
