-----------------------------------
--	Author: Tenjou
-- 	Blade Bash
-- 	Delivers an attack that can plague the target.  Two-handed weapon required.
--
--	Mainly added for enmity, but will also do damage.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();
if (user:getEquip(1) > 0x4000 and (user:getEquip(2) > 19000 or user:getEquip(2) == 0)) then --Player is using a 2-handed weapon.
	final = user:getMainLvl(); --Complete guess at damage.
	--if (user:getEquip(12) == 0x39a6 or user:getEquip(13) == 0x39a6) then --Knightly Earring
	--	final = final+10;
	--end
	target:removeHP(final);
	target:updateEnmity(user,900,1); --Unconfirmed, but would probably be the same as the other bash abilities.
	ability:setMsg(110);
	ability:setResult(final);
else
	final = 0; --Temporary solution, yes it should check in the code first, quit whining.
end
end;