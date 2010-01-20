-----------------------------------
--	Author: Kegsay
--  Azure Lore
--	Enhances the effect of blue magic spells.
-----------------------------------
 
require("/scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_AZURE_LORE,1,0,30);
	target:updateEnmity(user,300,1);
end;