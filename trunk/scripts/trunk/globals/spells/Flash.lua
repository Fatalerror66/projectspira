--------------------------------------
--	Author: Tenjou
-- 	Flash
-- 	Temporarily blinds an enemy, greatly lowering its accuracy.
--
--	DOES NOT ACTUALLY FLASH!!!  Only added it because it is a major enmity move.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
final = 156;
spell:setMsg(236);
target:addStatusEffect(EFFECT_BLIND,75,0,8); --Guess at power for now.
target:updateEnmity(caster,1280,180);
return final;
end;