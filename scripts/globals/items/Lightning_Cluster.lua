-----------------------------------
--	Author: SharXeniX
-- 	Lightning Cluster
-- 	A cluster of lightning crystals
--
--	turn into a stack of lightning crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else
		user:addItem(4100,12);
		item:setAnimation(0x2B);
	end
end;