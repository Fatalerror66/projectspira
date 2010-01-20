-----------------------------------
--	Author: SharXeniX
-- 	Light Cluster
-- 	A cluster of light crystals
--
--	turn into a stack of light crystals
-----------------------------------
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	if (target:getFreeSlotCount(0) <= 0) then
		item:setMsg(356,0);
		item:setAnimation(55);
		item:dontRemove();
	else
		user:addItem(4102,12);
		item:setAnimation(0x29);
	end
end;