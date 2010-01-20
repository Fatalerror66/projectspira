-----------------------------------
--	Author: Bababooey
--	Bretzel
--	A kind of salted bread made in Bastok.
--
--	http://wiki.ffxiclopedia.org/wiki/Bretzel
--
--	3 Minutes, All Races
--	Vitality +2
--	MP +8% (Cap: 55@687 Base MP)
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
		user:addStatusEffect(EFFECT_FOOD,4391,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4391,1,0,180); --Adds effects specific to this food.
	end
end;
