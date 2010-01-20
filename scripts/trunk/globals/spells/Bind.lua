--------------------------------------
--	Author: Tenjou
-- 	Bind
-- 	Binds an enemy, rooting it in place.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	--Pull base stats.
	stat = 5; --INT
	diff = (caster:getStat(stat) - target:getStat(stat));
	staff = StaffBonus(caster,spell);
	
	--Duration, including resistance.  May need more research.
	duration = math.random(5,60);
	
	--Resist
	resist = spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_BINDRES)) then
		if (resist >= 0.5) then --Do it!
			--Try to erase a weaker bind.
			bind = target:getStatusEffect(EFFECT_BIND)
			if (bind ~= nil) then
				if (bind:getPower() < 1) then
					target:removeStatusType(EFFECT_BIND);	
					target:addStatusEffect(EFFECT_BIND,power,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_BIND,power,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			end
		else
			if (spell:getCurrTargNum() == 1) then
				spell:setMsg(85);
			else
				spell:setMsg(284);
			end
		end
	else
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(85);
		else
			spell:setMsg(284);
		end
	end
	
	target:updateEnmity(caster,320,1);
	final = EFFECT_BIND;
	return final;
end;