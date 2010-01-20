--------------------------------------
--	Author: Kegsay
--	Paralyze II
--	Paralyzes an enemy.
--	Potency is enhanced by merits. Assuming a bonus of 5 MND per extra merit.
--
--	Please do not edit the formula without extra research into Paralyze II specifically.
--
--	Merits will need to be accounted for, at the moment they are NOT.
--
--	Tenjou: Added a check for MOD_PARALYZERES, for use with the job trait and the spell, and other things.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate duration.
	local double duration = (0.2+math.random())*100; --generates rand# from 0.2~1.2 which is then x100 to form the duration (20-120).
	--Grabbing variables for paralyze potency
	mlevel = caster:getMainLvl();
	mnd = caster:getStat(6);
	mobmnd = target:getStat(6);
	dmnd = (mnd-mobmnd);
	merits = 0*5;
	multiplier = (150/mlevel);
	
	--Calculate potency.
	potency = 10+(multiplier*(mnd+dmnd+merits))/10;
	--print("Duration : ",duration);
	--print("Potency : ",potency);
	if (potency>46) then
		potency=46;
	end
	
	--Try to resist entirely.
	if (math.random(0,100) >= target:getMod(MOD_PARALYZERES)) then
		--See if effect is already on....
		if (target:getStatusEffect(EFFECT_PARALYZE) ~= nil) then --effect already on, do nothing
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
				target:addStatusEffect(EFFECT_PARALYZE,potency,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			elseif (resist == 0.5) then --Half duration
				duration = duration/2;
				target:addStatusEffect(EFFECT_PARALYZE,potency,0,duration);
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
	
	return EFFECT_PARALYZE;
end;