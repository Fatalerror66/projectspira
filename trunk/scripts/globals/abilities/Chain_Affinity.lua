-----------------------------------
--	Author: Kegsay
--  Chain Affinity
--	Makes it possible for your next "physical" blue magic spell to be used in a skillchain. Effect varies with TP.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_CHAIN_AFFINITY,1,0,30);
	target:updateEnmity(user,300,1);
end;