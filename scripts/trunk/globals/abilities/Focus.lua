-----------------------------------
--	Author: Hyourin
-- 	Focus
-- 	
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/status");

function OnUseAbility(user, target, ability, isFirstTarget)
	Accuracy=20;
	Head=user:getEquip(5);
	if(Head == 12512 or Head == 15226) then
		Accuracy=30;
	end
	user:addStatusEffect(EFFECT_FOCUS,Accuracy,0,120);
	ability:setMsg(120);
	target:updateEnmity(user,300,1);
end;