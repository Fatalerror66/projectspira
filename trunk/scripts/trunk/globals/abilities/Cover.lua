-----------------------------------
--	Author: Tenjou
-- 	Cover
-- 	Allows user to protect the target by placing themselves between them and the enemy.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	ability:setMsg(0);
	if (target ~= user) then
		target:addStatusEffect(EFFECT_COVER,1,0,60);
		cover = target:getStatusEffect(EFFECT_COVER);
		cover:setEffector(user);
	end
	--target:updateEnmity(user,300,1);
end;