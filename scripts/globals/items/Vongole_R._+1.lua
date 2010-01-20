-----------------------------------
--	Author: Bababooey
--	Vongole Rosso +1
--	In a recent survey, 87% of all vongola clams replied spaghetti vongole +1 is
--	the way they'd like to go.
--
--	http://wiki.ffxiclopedia.org/wiki/Vongole_Rosso_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	Mind -1
--	HP +20% (Cap: 95@475 Base HP)
--	Defense +25% (Cap: 35@140 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,5198,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5198,1,0,3600); --Adds effects specific to this food.
	end
end;
