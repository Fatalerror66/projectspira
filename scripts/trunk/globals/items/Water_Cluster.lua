-----------------------------------
--	Author: SharXeniX
-- 	Water Cluster
-- 	A cluster of water crystals
--
--	turn into a stack of water crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else
		user:addItem(4101,12);
		item:setAnimation(0x27);
	end
end;