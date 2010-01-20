-----------------------------------
--	Author: Almendro
-- 	Sleeping potion (4161)
-- 	This potion induces sleep.
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(72);
	if (target:getStatusEffect(EFFECT_SLEEP) ~= nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:addStatusEffect(EFFECT_SLEEP,1,0,30);
		item:setMsg(0,0);
	end
end;