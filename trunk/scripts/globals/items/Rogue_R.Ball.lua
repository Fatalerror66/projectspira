-----------------------------------
--	Author: Bababooey
--	Rogue Rice Ball
--	This rice ball has been made to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Rogue_Rice_Ball
--
--	60 Minutes, All Races
--	Vitality +3
--	HP Recovered while healing +2
--	HP +12
--	Defense +50
--	Beast Killer
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
		user:addStatusEffect(EFFECT_FOOD,4604,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4604,1,0,3600); --Adds effects specific to this food.
	end
end;
