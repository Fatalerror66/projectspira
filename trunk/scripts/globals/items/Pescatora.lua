-----------------------------------
--	Author: Bababooey
--	Pescatora
--	Fishermen the world over salivate over this delectable blend of pomodoro
--	sauce and seafood served over spaghetti al dente.
--
--	http://wiki.ffxiclopedia.org/wiki/Pescatora
--
--	30 Minutes, All Races
--	Vitality +3
--	Mind -1
--	HP +15% (Cap: 150@1000 Base HP)
--	Defense +22% (Cap: 65@295 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,5191,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5191,1,0,1800); --Adds effects specific to this food.
	end
end;
