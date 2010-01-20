-----------------------------------
--	Author: Tenjou
--  Sneak Attack
--	Allows the next melee attack to deal extra damage when striking an enemy from behind.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_SNEAK_ATTACK,1,0,60);
	target:updateEnmity(user,0,1);
end;