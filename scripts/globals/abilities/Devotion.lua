-----------------------------------
--	Author: Tenjou
-- 	Devotion
-- 	Sacrifices HP to grant a party member the same amount in MP.
--
--	FFXIclopedia says it's 25% of the user's current HP.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

--Pull relevant stats.
hp = math.floor(user:getHP()*0.25);
healmp = hp;

--Adjust to maxMP.
if ((target:getMaxMP() - target:getMP()) < healmp) then
	healmp = (target:getMaxMP() - target:getMP());
end

--Adjust message.
ability:setMsg(119);
ability:setResult(healmp);

--Do it!
user:removeHP(hp);
target:addMP(healmp);

target:updateEnmity(user,300,1);

end;