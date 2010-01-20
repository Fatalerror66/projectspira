--------------------------------------
--	Author: ReaperX
-- 	Blink
--	Creates shadow images that each absorb a single attack directed at you.
--------------------------------------
-- Includes
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");
--------------------------------------
function OnSpellCast(caster,target,spell)
	
	duration = 300;
			
	blink = target:getStatusEffect(EFFECT_BLINK);
	utsusemi = target:getStatusEffect(EFFECT_UTSUSEMI);
	if(blink == nil and utsusemi == nil)then
		target:addStatusEffect(EFFECT_BLINK,BLINK_SHADOWS,0,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	else
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(75);
		else
			spell:setMsg(283);
		end
	end
	target:updateEnmity(caster,300,1);
	final = EFFECT_BLINK;
	return final;
end;