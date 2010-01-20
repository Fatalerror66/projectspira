-----------------------------------
--	Author: Tenjou
-- 	Martyr
-- 	Sacrifices HP to heal a party member double the amount.
--
--	FFXIclopedia says it's 25% of the user's current HP.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

--Pull relevant stats.
hp = math.floor(user:getHP()*0.25);
healhp = hp*2;

--Adjust to maxHP.
if ((target:getMaxHP() - target:getHP()) < healhp) then
	healhp = (target:getMaxHP() - target:getHP());
end

--Adjust message.
ability:setMsg(119);
ability:setResult(healhp);

--Do it!
user:removeHP(hp);
target:addHP(healhp);

target:updateEnmity(user,300,1);

end;