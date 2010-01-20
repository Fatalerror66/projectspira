--------------------------------------
--	Author: ReaperX
-- 	Phalanx II
--	Gives a party member certain amount of damage resistance.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	
	PhalanxII_Level = 5; -- we assume for now that the spell has been merited to level 5.
		
	duration = 120 + 30*PhalanxII_Level;
	
	Enhancing = caster:getSkill(ENHANCING_MAGIC_SKILL);
	
	potency = math.floor(Enhancing/25) + 3*PhalanxII_Level + 1;
	  
	phalanx = target:getStatusEffect(EFFECT_PHALANX);
	
	if (phalanx ~= nil and phalanx:getPower() > potency) then
		if (spell:getCurrTargNum() == 1) then -- phalanx doesn't overwrite a phalanx of lesser potency
			spell:setMsg(75);
		else
			spell:setMsg(283);
		end
  else
  	if (phalanx ~= nil) then		
		  target:removeStatusType(EFFECT_PHALANX);
		end;
		
		target:addStatusEffect(EFFECT_PHALANX,potency,0,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end 
		
	end
		
	target:updateEnmity(caster,300,1);
	final = EFFECT_PHALANX;
	return final;
end;