--------------------------------------
--	Author: Tenjou
-- 	Screwdriver
-- 	Deals critical damage.  Chance of critical hit varies with TP.
--
--	See ffxiclopedia's article on blue magic damage here:
--	http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
--------------------------------------
 require("/scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Pull relevant stats.
level = caster:getMainLvl();
mlevel = target:getMainLvl();
leveldiff = level-mlevel;
STR = caster:getStat(1);
MND = caster:getStat(6);
blue = getblueskill(caster);
eVIT = target:getStat(3);
acc = caster:getAcc(caster);
eva = target:getEva();
def = target:getDef();
M = 1.375;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor(((MND*0.2+STR*0.2))*alpha);

chain = false;
crit = 0;
--Chain Affinity (CRITICAL CHANCE WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, work out crit chance
	TP = caster:getTP();
	crit=0.2+TP/500;
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
if (AzL ~= nil) then --Azure Lore is on, give multi (Azure lore counts as 350% TP)
	crit=0.9;
end

--Sneak Attack (First hit critical!)
sneak = caster:getStatusEffect(EFFECT_SNEAK_ATTACK);
sa = false;
if (sneak ~= nil) then --NEEDS POSITION CHECK!
	sa=true;
	crit = 1;
	caster:removeStatusType(EFFECT_SNEAK_ATTACK);
end

--Deal with families...
family = calculateFamilyBonus(caster,2,target:getSystem());
M = M+family;

--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,27,1,leveldiff,chain,crit,M,level,0,sa);

--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,3);

return final;
end;