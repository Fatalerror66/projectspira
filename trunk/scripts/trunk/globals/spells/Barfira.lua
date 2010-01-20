--------------------------------------
--	Author: Tenjou
-- 	Barfira
-- 	Increases caster's resistance against fire.  Afflatus Solace: Grants MDB against fire.
--
--	http://wiki.ffxiclopedia.org/wiki/Bar_Elemental
--	Actually increases resistance by 40 + 0.2*enhancing magic skill.
--	Duration is 150 + 0.8(enhancing skill - 180).  Second term is dropped if enhancing is less than 180.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Pull relevant stats.
	enhancing = caster:getSkill(34);
	leg = caster:getEquip(8);
	
	--Calculate amount.
	resist = 40 + math.floor(0.2*enhancing);
	
	if (leg == 0x3b0f) then --Cleric's Pantaloons
		resist = resist + 20;
	elseif (leg == 0x3cde) then --Cleric's Pantaloons +1
		resist = resist + 22;
	end
	
	--Calculate duration.
	duration = 150;
	if (enhancing > 180) then
		duration = (duration + math.floor(0.8*(enhancing-180)));
	end
	
	--Try to kill other barelement effects.  (default behavior)
	for i = EFFECT_BARFIRE,EFFECT_BARWATER do
		barelement = target:getStatusEffect(i);
		if (barelement ~= nil and (BARELEMENT_OVERWRITE == 1 or (BARELEMENT_OVERWRITE == 0 and i == EFFECT_BARFIRE))) then
			target:removeStatusType(i);
		end
	end
	
	--Do it!
	target:addStatusEffect(EFFECT_BARFIRE,resist,0,duration,FLAG_DISPELABLE);
	target:updateEnmity(caster,80,1);
	final = EFFECT_BARFIRE;
	
	--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end
	
	return final;
end;