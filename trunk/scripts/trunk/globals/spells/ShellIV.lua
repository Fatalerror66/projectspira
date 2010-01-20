--------------------------------------
--	Author: Tenjou
-- 	Shell IV
--	Enhances target's magic defense.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate magic defense.  Although this isn't available to players, it should match Shellra V in that it can be enhanced through WHM merits.
	defense = 28;
	
	--Calculate duration
	duration = 1800;
	
	--Scale down duration based on level.
	if (target:getMainLvl() < 68) then
		duration = duration * target:getMainLvl() / 68;
	end
	
	--Try to erase same level shell.
	shell = target:getStatusEffect(EFFECT_SHELL);
	if (shell ~= nil and shell:getPower() <= defense) then
		target:removeStatusType(EFFECT_SHELL);
	end
	
	--Check for a higher level shell.
	if (shell ~= nil and shell:getPower() > defense) then
		spell:setMsg(75);
	else
		--Do it!
		target:addStatusEffect(EFFECT_SHELL,defense,0,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	end
	
	target:updateEnmity(caster,80,1);
	final = EFFECT_SHELL;
	return final;
end;