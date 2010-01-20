--------------------------------------
--	Author: Tenjou, ReaperX's, Almendro
-- 	Utsusemi: San
--	Uses the ninja tool, "Shihei." Creates shadow images that each absorb a single attack directed at you.
--
--	Tenjou: Edited this during testing.  Tools are removed from spellcast.lua.
--------------------------------------
-- Includes
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");
--------------------------------------
-- Initialization
duration = 900;
power = 3;
--------------------------------------
function OnSpellCast(caster,target,spell)
	
  	utsusemi = target:getStatusEffect(EFFECT_UTSUSEMI);
  	blink = target:getStatusEffect(EFFECT_BLINK);
	if(blink ~= nil)then
		target:removeStatusType(EFFECT_BLINK);
  		target:addStatusEffect(EFFECT_UTSUSEMI,power,0,duration);
  		spell:setMsg(230);
	else
		if(utsusemi ~= nil)then
			target:removeStatusType(EFFECT_UTSUSEMI);
			target:addStatusEffect(EFFECT_UTSUSEMI,power,0,duration);
			spell:setMsg(230);
		else
			target:addStatusEffect(EFFECT_UTSUSEMI,power,0,duration);
			spell:setMsg(230);
		end
  	end  					
  	target:updateEnmity(caster,300,1);
  	final = EFFECT_UTSUSEMI;
  	return final;
end;