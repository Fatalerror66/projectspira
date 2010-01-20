--------------------------------------
--	Author: ReaperX,Almendro
-- 	Stoneskin
--	Absorbs a certain amount of damage from physical and magical attacks.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	
	duration = 300;
	
	MND = caster:getStat(6);
	Enhancing = caster:getSkill(ENHANCING_MAGIC_SKILL);
	X = math.floor((Enhancing/3)+MND);
	
	if (X < 80) then
	  HP_ABSORBED = X;
	elseif( 80 <= X and X <= 130) then
		HP_ABSORBED = 2*X-60;
	else
		HP_ABSORBED = 3*X-190;
	end;
	if (HP_ABSORBED > STONESKIN_CAP) then
		HP_ABSORBED = STONESKIN_CAP;
	end
	-- Cap is applied before equipment because equipment is acumulative even if it excedes the cap
	-- http://wiki.ffxiclopedia.org/wiki/Stoneskin
	hands = target:getEquip(7);
	neck = target:getEquip(10);
	
	if (hands == StoneMufflers) then
		HP_ABSORBED = HP_ABSORBED + 30;
	end
  
	if (neck == StoneGorget) then
		HP_ABSORBED = HP_ABSORBED + 30;
	end
	
		
	-- missing: Stoneskin  overwrites Metallic Body and Earthen Ward Stoneskin effects.
			
	stoneskin = target:getStatusEffect(EFFECT_STONESKIN);
	if (stoneskin ~= nil) then -- stoneskin doesn't overwrite itself
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(75);
		else
			spell:setMsg(283);
		end
	else
		target:addStatusEffect(EFFECT_STONESKIN,HP_ABSORBED,0,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	end
	
	target:updateEnmity(caster,300,1);
	final = EFFECT_STONESKIN;
	return final;
end;