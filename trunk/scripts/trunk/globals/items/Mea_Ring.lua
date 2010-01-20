-----------------------------------
--	Author: Almendro
-- 	Mea Ring (14663)
-- 	Description: Enchantment: "Teleport-Mea"
--
--	Effect: Teleports you to Mea
--  Note: Charges are not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Check for Mea Gate Crystal.
mea = user:hasKeyItem(0x162);
zone = user:getZone();
if (mea == 1 and zone ~= 0x83) then
	user:setPos(95,35,340,0x80,0x75);
end

--Message/Animation
item:setAnimation(79);
end; 