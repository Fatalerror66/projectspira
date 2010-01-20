-----------------------------------
--	Author: Tenjou
-- 	Name of Item
-- 	Description of the item.  Usually the same as the help text in-game.
--
--	Some comments about the source of any formulas you may find.
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(0);
end; 
 
 
 