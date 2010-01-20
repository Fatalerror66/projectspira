-----------------------------------
--	Author: Almendro
-- 	Echo drops (4151)
-- 	This potion remedies silence.
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(4);
	if (target:getStatusEffect(EFFECT_SILENCE) == nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:removeStatusType(EFFECT_SILENCE);
		item:setMsg(64,6); -- <player> is no longer silenced. (message verified with retail)		
	end
end;