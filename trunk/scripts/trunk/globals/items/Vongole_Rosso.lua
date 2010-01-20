-----------------------------------
--	Author: Bababooey
--	Vongole Rosso
--	Red mages across Vana'diel adore this sumptuous blend of tomato sauce and
--	vongola clams over spaghetti al dente.
--
--	http://wiki.ffxiclopedia.org/wiki/Vongole_Rosso
--
--	30 Minutes, All Races
--	Vitality +2
--	Mind -1
--	HP +17% (Cap: 90@529 Base HP)
--	Defense +25% (Cap: 30@120 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,5189,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5189,1,0,1800); --Adds effects specific to this food.
	end
end;
