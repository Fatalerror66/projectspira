-----------------------------------
--	Author: Almendro
-- 	black drop (4265)
-- 	A fruit-flavored candy. It is shaped like a dark bead.
--  Transports users to their Home Point
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
	item:setAnimation(80);
	if(target:getStatusEffect(EFFECT_MEDICATED) ~= nil)then
		item:setMsg(111,0); -- You cannot use potions while medicated.
		item:dontRemove();
	else
		target:addStatusEffect(EFFECT_MEDICATED,1,0,3600);
		target:warp();
	end
end;