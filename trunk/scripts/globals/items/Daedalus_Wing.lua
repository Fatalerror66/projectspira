-----------------------------------
--	Author: Almendro
-- 	Daedalus Wing (4202)
-- 	Description: When used, these man-made wings instantly raise TP. 
--
--	Effect: Increases TP of the user by 100%
--  Note: Doesn't check job trait StoreTP because It's not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
currentTP = user:getTP();

if(currentTP + 100 >= 300)then
	finalTP = 300;
else
	finalTP = currentTP + 100; 
end

--Do it!
user:setTP(finalTP);

--Message/Animation
item:setAnimation(76);
-- Wing doesn't need message
end; 