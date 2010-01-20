-----------------------------------
--	Author: Bababooey
--	Salty Bretzel
--	This ridiculously salted bretzel is frowned upon by physicians
--	everywhere.
--
--	http://wiki.ffxiclopedia.org/wiki/Salty_Bretzel
--
--	5 Minutes, All Races
--	Vitality +2
--	MP +8% (Cap: 60@750 Base MP)
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
		user:addStatusEffect(EFFECT_FOOD,5182,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5182,1,0,300); --Adds effects specific to this food.
	end
end;
