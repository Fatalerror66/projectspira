--------------------------------------
--	Author: Almendro
-- 	Silence
-- 	Silence is a harmful status effect that makes the target unable to cast Magic of any type until it wears off or is removed.
--  It will not prevent players from speaking in any chat channel, nor will it stop abilities that would seem to rely on sound or voice, such as Whistle or Warcry. 
--  NOTES:
--      * This version is only a copy-paste-modify version of paralize from Kegsay.
--      * It hasnt been tested on retail.
--      * Feel free to modify it if you have done testes
--------------------------------------
-- Includes
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
require("/scripts/globals/status");
--------------------------------------
function OnSpellCast(caster,target,spell)
	--Calculate duration.
	local double duration = (0.2+math.random())*100; --generates rand# from 0.2~1.2 which is then x100 to form the duration (20-120).
	
	--Grabbing variables for silence
	mlevel = caster:getMainLvl();
	mnd = caster:getStat(6);
	mobmnd = target:getStat(6);
	dmnd = (mnd-mobmnd);
	multiplier = 150/mlevel;
	
	--Try to resist entirely.
	if (math.random(0,100) >= target:getMod(MOD_SILENCERES)) then
		--See if effect is already on....
		if (target:getStatusEffect(EFFECT_SILENCE) ~= nil) then --effect already on, do nothing
			spell:setMsg(75);
		else
			--See if it lands.... 2x checks, if pass 0=resist, 1=half, 2=full.
			--This is done using the ELEMENTAL MAGIC SPELL RESISTANCE CHECK (for consistency). This is done as follows:
			--Value   Effect
			-- 1       Full
			--0.5      Half
			--0.25     Resist
			--0.125    Resist
			--0.0625   Resist.
			staff = StaffBonus(caster, spell);
			resist = spellResist(caster,target,spell,dmnd,staff);
			if (resist == 1) then --Full hit, no duration penalty
				target:addStatusEffect(EFFECT_SILENCE,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			elseif (resist == 0.5) then --Half duration
				duration = duration/2;
				target:addStatusEffect(EFFECT_SILENCE,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			else --resist entirely.
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(85);
				else
					spell:setMsg(284);
				end
			end
		end
	else --resist entirely.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(85);
		else
			spell:setMsg(284);
		end
	end
	
	return EFFECT_SILENCE;
end;