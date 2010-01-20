-----------------------------------
--	Author: Tenjou
-- 	Flask of Silencing Potion
-- 	This potion induces silence.
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(0);
	target:addStatusEffect(EFFECT_SILENCE,1,0,60);
end; 
 
 
 