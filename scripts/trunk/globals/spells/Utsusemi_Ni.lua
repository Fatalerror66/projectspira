--------------------------------------
--	Author: ReaperX, Almendro
-- 	Utsusemi: Ni
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
power = 2;
--------------------------------------
function OnSpellCast(caster,target,spell)
	
  	utsusemi = target:getStatusEffect(EFFECT_UTSUSEMI);
  	blink = target:getStatusEffect(EFFECT_BLINK);
	if(blink ~= nil)then
		target:removeStatusType(EFFECT_BLINK);
  		target:addStatusEffect(EFFECT_UTSUSEMI,power,0,duration);
  		spell:setMsg(230);
	else
		if (utsusemi ~= nil and utsusemi:getPower() > power) then -- Utsusemi: San already up?
			spell:setMsg(75); -- Ni won't overwrite San shadows
		elseif(utsusemi ~= nil and utsusemi:getPower() <= power)then -- Utsusemi: Ni or Ichi overwrite
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