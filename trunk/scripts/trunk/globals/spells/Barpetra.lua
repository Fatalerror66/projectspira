--------------------------------------
--	Author: Tenjou
-- 	Barpetra
-- 	Increases party's resistance against petrification.
--
--	http://wiki.ffxiclopedia.org/wiki/Bar_Spell
--	Needs more research.  Formulas based on barelement spells.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Pull relevant stats.
	enhancing = caster:getSkill(34);
	
	--Calculate amount.  Needs more research, but this seems reasonable given the poor potency in retail.
	resist = 10 + math.floor(0.05*enhancing);
	
	--Calculate duration.
	duration = 150;
	if (enhancing > 180) then
		duration = (duration + math.floor(0.8*(enhancing-180)));
	end
	
	--Try to kill other barstatus effects.  (default behavior)
	for i = EFFECT_BARSLEEP,EFFECT_BARVIRUS do
		barstatus = target:getStatusEffect(i);
		if (barstatus ~= nil and (BARSTATUS_OVERWRITE == 1 or (BARSTATUS_OVERWRITE == 0 and i == EFFECT_BARPETRIFY))) then
			target:removeStatusType(i);
		end
	end
	
	--Do it!
	target:addStatusEffect(EFFECT_BARPETRIFY,resist,0,duration,FLAG_DISPELABLE);
	--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end
	
	target:updateEnmity(caster,300,1);
	final = EFFECT_BARPETRIFY;
	
	return final;
end;