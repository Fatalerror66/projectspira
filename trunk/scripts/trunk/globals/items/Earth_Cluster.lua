-----------------------------------
--	Author: SharXeniX
-- 	Earth Cluster
-- 	A cluster of earth crystals
--
--	turn into a stack of earth crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else
		user:addItem(4099,12);
		item:setAnimation(0x2D);
	end
end;