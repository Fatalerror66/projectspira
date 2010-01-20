--------------------------------------
--	Author: Tenjou
-- 	Queasyshroom
-- 	Additional effect: Poison.  Duration of effect varies with TP.
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
INT = caster:getStat(5);
blue = caster:getSkill(43);
eVIT = target:getStat(3);

--Calculate base damage.
base = (math.floor(blue*0.22)) + 3;
if (base >= 15) then
	base = 15;
end
M = 1.75;
dSTR = STR - eVIT;
fSTR = (getfSTR(dSTR))*2;
if (fSTR > 44) then fSTR = 44; end

--Find alpha based on level.
alpha = getAlpha(level);

WSC = math.floor((INT*0.2)*alpha);

--Note that mob type check, possible day/weather, gear bonuses, and BLU ability bonuses are not yet implemented.  Also, additional effects and TP effects are not considered right now.

--Final damage.
final = (math.floor((base+fSTR+WSC)*M))*BLUE_POWER;
if (final < 0) then final = 0; end

--Do it!
final = takeMagicalDamage(caster,target,final);

return final;
end;