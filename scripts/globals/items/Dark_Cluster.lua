-----------------------------------
--	Author: SharXeniX
-- 	DarkCluster
-- 	A cluster of dark crystals
--
--	turn into a stack of dark crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else	
		user:addItem(4103,12);
		item:setAnimation(0x2C);
	end
end;