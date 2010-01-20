--------------------------------------
--	Author: Tenjou
-- 	Aspir
-- 	Steals an enemy's MP.  Ineffective against undead.
--
--	Much is unknown about this spell.  From FFXIclopedia, the amount "is most highly affected by Dark Magic skill, and secondly Magic Accuracy.  INT and MAB have no effect on Drain/Aspir."
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
	function OnSpellCast(caster,target,spell)
	--print();
	--Pull relevant stats.
	INT = caster:getStat(5);
	RES = target:getStat(5);
	macc = 50; --Reasonable to assume 50% base magic accuracy.

	--Calculate base damage.
	dark = caster:getSkill(DARK_MAGIC_SKILL);

	macc = 50; --Reasonable to assume the base is 50%, based on this: http://robonosto.blogspot.com/2008/12/on-magic-resist-rates.html
	base = (dark + macc)/3; --A reasonable guess based on forum posts talking about "max" aspir builds.

	--Adjust bonus for staff.
	zone = Zone(caster:getZone());
	if (caster:getEquip(1) == DiabolosPole) and ( (zone:getWeather() == Gloom) or (zone:getWeather() == Darkness) or (caster:getStatusEffect(EFFECT_VOIDSTORM) ~= nil)) then
		staff = 1.25
		--print("Diabolos' Pole active!");
	else 
	  staff = StaffBonus(caster, spell);
	end;

	--Resistance
	resist = spellResist(caster,target,spell,0,staff);
	--print("RESIST:",resist);

	day = spellDayWeatherBonus(caster, spell, false);

	--print("Total day/weather bonus:",day);

	--Without parties, magic burst adjustments cannot be implemented.
	mb = 1.0;

	final = base*resist*staff*day*mb*DRAIN_POWER;
	if (final < 0) then final = 0; end
	--Lower the amount drained if the mob does not have enough MP.
	mp = target:getMP();
	--print("MP:",mp);
	if ((mp - final) < 0) then
		final = mp;
	end
	
	--Try to reverse the effects on undead.
	undead = cureResist(target:getFamily());
	if (undead == -1) then
		final = 0;
		spell:setMsg(75);
	end
	
	--Do it!
	target:removeMP(final);
	caster:addMP(final);
	target:updateEnmity(caster,0,320);
	return final;
end;