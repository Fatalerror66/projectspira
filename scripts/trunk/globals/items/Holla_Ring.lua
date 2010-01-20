-----------------------------------
--	Author: Almendro
-- 	Holla Ring (14661)
-- 	Description: Enchantment: "Teleport-Holla"
--
--	Effect: Teleports you to Holla
--  Note: Charges are not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Check for Holla Gate Crystal.
holla = user:hasKeyItem(0x160);
zone = user:getZone();
if (holla == 1 and zone ~= 0x83) then
	user:setPos(420,19,25,0xc0,0x66);
end

--Message/Animation
item:setAnimation(79);
end; 