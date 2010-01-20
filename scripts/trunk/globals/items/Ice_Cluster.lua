-----------------------------------
--	Author: SharXeniX
-- 	Ice Cluster
-- 	A cluster of ice crystals
--
--	turn into a stack of ice crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else
		user:addItem(4097,12);
		item:setAnimation(0x2A);
	end
end;