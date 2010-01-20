-----------------------------------
--	Author: Almendro
-- 	Yhoat Ring (14665)
-- 	Description: Enchantment: "Teleport-Yhoat"
--
--	Effect: Teleports you to Yhoat
--  Note: Charges are not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Check for Yhoat Gate Crystal.
Yhoat = user:hasKeyItem(0x164);
zone = user:getZone();
if (Yhoat == 1 and zone ~= 0x83) then
	user:setPos(-280,0,-140,0,0x7c);
end

--Message/Animation
item:setAnimation(79);
end; 