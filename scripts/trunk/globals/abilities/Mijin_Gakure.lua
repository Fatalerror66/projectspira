-----------------------------------
--	Author: hyourin
-- 	Mijin Gakure
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();
playerHP=user:getHP();
mobHP=target:getHP();
if(playerHP>mobHP)then
	playerHP=mobHP;
end
target:removeHP(playerHP);
user:setHP(0);
--ve=playerHP*((240)/(math.floor(31*target:getMainLvl()/50)+6));
--ce=playerHP*((80)/(math.floor(31*target:getMainLvl()/50)+6));
--print("ve: ",ve,"ce: ",ce);
--target:updateEnmity(user,ve,ce);
ability:setMsg(110);
ability:setResult(playerHP);
end;