--------------------------------------
--	Author: Tenjou
-- 	MP Drainkiss
-- 	Steals an enemy's MP.  Ineffective against undead.
--
--	See ffxiclopedia's article on the spell here:
--	http://wiki.ffxiclopedia.org/wiki/MP_Drainkiss
--	It's still pretty unclear.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();

--Pull relevant stats.
blue = caster:getSkill(43);
macc = 50; --Reasonable to assume the base is 50%.
daytime = getVanaHour();

--Calculate base damage.
base = (blue+macc)/3; --Reasonable assumption.

--Resistance
resist = spellResist(caster,target,spell,dINT);
--Higher chance of resist during the day.
if (daytime >= 6 and daytime <= 18) then
	macc = (macc-2); --Complete guess.
end
p = (macc / 100); -- Reasonable assumption based on 50% base magic accuracy.
half = (p*(1-p));
quart = (p*((1-p)^2));
eighth = ((1-p)^3);
sixteenth = ((1-p)^4); --Reasonable assumption based on the above pattern.
--Psuedo-randomized seed to calculate resist.
math.randomseed(os.time());
resvar = math.random();resvar = math.random();resvar = math.random();
--print("RES:",resvar);
--Determine final resist.
if (resvar <= sixteenth) then
	resist = 0.0625;
	--print("Spell resisted to 1/16!!!");
elseif (resvar <= eighth) then
	resist = 0.125;
	print ("Spell resisted to 1/8!");
elseif (resvar <= quart) then
	resist = 0.25;
	--print("Spell resisted to 1/4.");
elseif (resvar <= half) then
	resist = 0.5;
	--print("Spell resisted 1/2.");
elseif (resvar <= p) then
	resist = 1.0;
end

--Adjust bonus for staff.
staff = StaffBonus(caster, spell);

--Resistance
resist = spellResist(caster,target,spell,dINT,staff);
--print("RESIST:",resist);

day = spellDayWeatherBonus(caster, spell, false);

--print("Total day/weather bonus:",day);

--Without parties, magic burst adjustments cannot be implemented.
mb = 1.0;

final = base*resist*staff*day*mb*DRAIN_POWER;
if (final < 0) then final = 0; end

--Adjust for maximum damage cap.
if (final > 165) then
	final = 165;
end

--Lower the amount drained if the mob does not have enough MP.
mp = target:getMP();
--print("MP:",mp);
if (mp < final) then
	final = mp;
end

--Do it!
target:removeMP(final);
caster:addMP(final);

return final;
end;