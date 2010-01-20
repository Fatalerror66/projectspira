-----------------------------------
--	Author: SharXeniX
-- 	Fire Cluster
-- 	A cluster of fire crystals
--
--	turn into a stack of fire crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else	
		user:addItem(4096,12);
		item:setAnimation(0x26);
	end
end;