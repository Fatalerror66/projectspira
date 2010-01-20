-----------------------------------
--	Author: Almendro
-- 	Altep Ring (14666)
-- 	Description: Enchantment: "Teleport-Altep"
--
--	Effect: Teleports you to Altep
--  Note: Charges are not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Check for Altep Gate Crystal.
altep = user:hasKeyItem(0x165);
zone = user:getZone();
if (altep == 1 and zone ~= 0x83) then
	user:setPos(-60,4,230,0xc0,0x72);
end

--Message/Animation
item:setAnimation(79);
end; 