-----------------------------------
--	Author: Tenjou
-- 	Eagle Eye Shot
-- 	Delivers an accurate and powerful ranged attack.
--
--	Some comments about the source of any formulas you may find.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

final = user:getBaseDmg()*5; --NEEDS TO BE FIXED

--Do it!
target:removeHP(final);
ability:setMsg(110);
ability:setResult(final);
end;