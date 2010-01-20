-----------------------------------
--	Author: 
-- 	Name of Ability
-- 	Description of ability.  Usually the same as the help text in-game.
--
--	Some comments about the source of any formulas you may find.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	target:updateEnmity(user,1,0);
end;