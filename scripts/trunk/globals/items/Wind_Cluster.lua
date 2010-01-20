-----------------------------------
--	Author: SharXeniX
-- 	Wind Cluster
-- 	A cluster of wind crystals
--
--	turn into a stack of wind crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else
		user:addItem(4098,12);
		item:setAnimation(0x28);
	end
end;