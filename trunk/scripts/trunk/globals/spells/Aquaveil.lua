--------------------------------------
--	Author: ReaperX
-- 	Aquaveil
--	Reduces chance of having a spell interrupted.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	  
	if (target:getStatusEffect(EFFECT_AQUAVEIL) ~= nil) then
		target:removeStatusType(EFFECT_AQUAVEIL);
	end
		
	-- duration is said to be based on enhancing skill with max 5 minutes, but I could find no
	-- tests that quantify the relationship so I'm using 5 minutes for now.
		
	target:addStatusEffect(EFFECT_AQUAVEIL,AQUAVEIL_INTERR_RATE,0,300,FLAG_DISPELABLE);
	--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end
		
	target:updateEnmity(caster,300,1);
	final = EFFECT_AQUAVEIL;
	return final;
end;