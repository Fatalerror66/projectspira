-----------------------------------
--	Author: Almendro
-- 	Dem Ring (14662)
-- 	Description: Enchantment: "Teleport-Dem"
--
--	Effect: Teleports you to Dem
--  Note: Charges are not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Check for Dem Gate Crystal.
dem = user:hasKeyItem(0x161);
zone = user:getZone();
if (dem == 1 and zone ~= 0x83) then
	user:setPos(220,19,305,0xc0,0x6c);
end

--Message/Animation
item:setAnimation(79);
end; 