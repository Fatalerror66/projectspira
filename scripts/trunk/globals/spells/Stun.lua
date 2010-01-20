--------------------------------------
--	Author: Tenjou & Kegsay
-- 	Stun
-- 	Temporarily prevents an enemy from acting.
--  Base duration set to 8 seconds (fairly accurate)
--	Works 100%. Resistance may need altering.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
	--print();
	duration = 8;

	int = caster:getStat(5);
	mobint = target:getStat(5);
	dint = (int-mobint);

	--See if effect is already on....
	if (target:getStatusEffect(EFFECT_STUN) ~= nil) then --effect already on, do nothing
		spell:setMsg(75);
	else
		--See if it lands.... 2x checks, if pass 0=resist, 1=half, 2=full.
			--This is done using the ELEMENTAL MAGIC SPELL RESISTANCE CHECK (for consistency). This is done as follows:
		--Value   Effect
		-- 1       Full (8 sec)
		--0.5      Full (8 sec)
		--0.25     Half (4 sec)
		--0.125    Quart (2 sec)
		--0.0625   Resist.
		staff = StaffBonus(caster, spell);
		resist = spellResist(caster,target,spell,dint,(0.3+staff)); --0.3 is to allow additional macc when checking resist.
		if (100*math.random() >= target:getMod(MOD_STUNRES)) then
			if (resist == 1) then --Full hit, no duration penalty
				target:addStatusEffect(EFFECT_STUN,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			elseif (resist == 0.5) then --full duration
				target:addStatusEffect(EFFECT_STUN,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			elseif (resist == 0.25) then --half duration
				duration = duration/2;
				target:addStatusEffect(EFFECT_STUN,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			elseif (resist == 0.125) then --quarter duration
				duration = duration/4;
				target:addStatusEffect(EFFECT_STUN,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			else --resist!
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
	end
	target:updateEnmity(caster,1280,180);
	return EFFECT_STUN;
end;