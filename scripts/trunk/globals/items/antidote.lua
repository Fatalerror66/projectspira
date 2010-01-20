-----------------------------------
--	Author: Almendro
-- 	Antidote (4148)
-- 	This potion remedies poison. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(1);
	if (target:getStatusEffect(EFFECT_POISON) == nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:removeStatusType(EFFECT_POISON);
		item:setMsg(64,3); -- <player> is no longer poisoned. (message verified with retail)		
	end
end;