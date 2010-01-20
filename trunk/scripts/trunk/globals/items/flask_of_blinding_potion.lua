-----------------------------------
--	Author: Almendro
-- 	Blinding potion (4163)
-- 	This potion induces blindness.
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(70);
	if (target:getStatusEffect(EFFECT_BLIND) ~= nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:addStatusEffect(EFFECT_BLIND,15,0,180);
		item:setMsg(0,0);
	end
end;