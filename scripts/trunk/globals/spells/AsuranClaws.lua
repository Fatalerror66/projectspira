--------------------------------------
--	Author: Tenjou
-- 	Asuran Claws
-- 	Delivers a sixfold attack.  Accuracy varies with TP.
--
--	See ffxiclopedia's article on blue magic damage here:
--	http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Pull relevant stats.
level = caster:getMainLvl();
STR = caster:getStat(1);
blue = caster:getSkill(43);
eVIT = target:getStat(3);

--Calculate base damage.
base = (math.floor(blue*0.22)) + 3;
if (base >= 69) then
	base = 69;
end
M = 1.50; --Reasonable assumption.
dSTR = STR - eVIT;
fSTR = getfSTR(dSTR);
if (fSTR > 22) then fSTR = 22; end

--Find alpha based on level.
alpha = getAlpha(level);

WSC = math.floor((STR*0.3)*alpha); --Reasonable assumption.

--Note that mob type check, possible day/weather, gear bonuses, and BLU ability bonuses are not yet implemented.  Also, additional effects and TP effects are not considered right now.

--Final damage.
final = (math.floor((base+fSTR+WSC)*M))*BLUE_POWER;
if (final < 0) then final = 0; end

--Sixfold attack.
math.randomseed(os.time());
sf = math.random(); sf = math.random(); sf = math.random();
--print("SF:",sf);
if (sf >= 0.67) then
	final = final*3;
elseif (sf >= 0.33) then
	final = final*2;
end

--Do it!
final = takeMagicalDamage(caster,target,final);

return final;
end;