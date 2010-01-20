-----------------------------------
--	Author: Bababooey
--	Marinara
--	Bountiful portions of seafood flavor in a pomodoro sauce sautee. A favorite
--	among seafarers.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara
--
--	30 Minutes, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5719,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5719,1,0,1800); --Adds effects specific to this food.
	end
end;
