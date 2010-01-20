-----------------------------------
--	Author: Almendro
-- 	Vahzl Ring (14664)
-- 	Description: Enchantment: "Teleport-Vahzl"
--
--	Effect: Teleports you to Vahzl
--  Note: Charges are not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Check for Vahzl Gate Crystal.
Vahzl = user:hasKeyItem(0x163);
zone = user:getZone();
if (Vahzl == 1 and zone ~= 0x83) then
	user:setPos(151,-21,-38,0,0x70);
end

--Message/Animation
item:setAnimation(79);
end; 