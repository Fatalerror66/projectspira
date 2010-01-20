-----------------------------------
--	Author: Tenjou
-- 	Steal
-- 	Steals an item from certain targets.
--
--	TEST ONLY.  Set to 50% chance.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	ability:setMsg(0);
	
	--Calculate steal chance.
	chance = 50;
	
	--Do it!
	user:steal(target,chance);
	target:updateEnmity(user,300,1);
end;