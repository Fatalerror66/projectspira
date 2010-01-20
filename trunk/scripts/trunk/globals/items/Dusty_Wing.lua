-----------------------------------
--	Author: Almendro
-- 	Dusty Wing (5440)
-- 	Description: When used, these man-made wings instantly raise TP. Due to muscle strain, repeated use is prohibited. 
--
--	Effect: Increases TP of the user by 300%
--  Note: Doesn't check job trait StoreTP because It's not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
--Do it!
user:setTP(300);

--Message/Animation
item:setAnimation(76);
-- Wing doesn't need message
end; 