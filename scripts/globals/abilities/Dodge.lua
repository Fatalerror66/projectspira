-----------------------------------
--	Author: Hyourin
-- 	Dodge
-- 	
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/status");

function OnUseAbility(user, target, ability, isFirstTarget)
	Feet=user:getEquip(9);
	Evasion=20;
	if(Feet == 14090 or Feet == 15353) then
		Evasion=30;
	end
	user:addStatusEffect(EFFECT_DODGE,Evasion,0,120);
	ability:setMsg(121);
	target:updateEnmity(user,300,1);
--Message
end;