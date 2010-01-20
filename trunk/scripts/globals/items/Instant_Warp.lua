-----------------------------------
--	Author: Tenjou
-- 	Scroll of Instant Warp
-- 	The black magic spell Warp is inscribed on this parchment.
--
--	Should work the same as warp
-----------------------------------
 
require("scripts/globals/settings");
function OnUseItem(user,target,item)

if (target:getZone() ~= 0x83) then
	target:warp();
end

item:setAnimation(80);
end; 
 
 
 