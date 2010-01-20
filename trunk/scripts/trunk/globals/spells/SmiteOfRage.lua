--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Smite Of Rage
-- 	Damage varies with TP.
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
DEX = caster:getStat(2);
blue = getblueskill(caster);
eVIT = target:getStat(3);
acc = caster:getAcc(caster);
eva = target:getEva();
def = target:getDef();
M = 1.5;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor(((STR*0.2+DEX*0.2))*alpha);

chain = false;
--Chain Affinity (DAMAGE VARIES WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, work out damage multiplier
	TP = caster:getTP();
	if(TP<=150) then
		M = 0.005*TP+1.5;
	elseif (TP>150) then
		M = 0.00166*TP+2;
	end
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
if (AzL ~= nil) then --Azure Lore is on, give multi (Azure lore counts as 350% TP)
	M=2.53125;
end

--Sneak Attack (First hit critical!)
sneak = caster:getStatusEffect(EFFECT_SNEAK_ATTACK);
sa = false;
crit = 0;
if (sneak ~= nil) then --NEEDS POSITION CHECK!
	sa=true;
	crit = 1;
	caster:removeStatusType(EFFECT_SNEAK_ATTACK);
end

--Deal with families...
family = calculateFamilyBonus(caster,3,target:getSystem());
M = M+family;

--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,35,1,leveldiff,chain,crit,M,level,0,sa);

--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,4);

return final;
end;