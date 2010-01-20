-----------------------------------
--	Author: Almendro
-- 	bottle of cantarella
-- 	The duration and potency of this deadly poison can be altered by
--  a skilled alchemist.
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
	item:setAnimation(68);
	power = 10;
	effect = target:getStatusEffect(EFFECT_POISON);
	if(effect ~= nil)then
		if(power <= effect:getPower())then
			target:removeStatusType(EFFECT_POISON);
			target:addStatusEffect(EFFECT_POISON,power,3,3600);
		else
			item:setMsg(283,0);
		end
	else
		target:addStatusEffect(EFFECT_POISON,power,3,3600);
	end
end;