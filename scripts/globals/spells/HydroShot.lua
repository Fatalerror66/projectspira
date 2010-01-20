--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Hydro Shot
-- 	Additional effect: Enmity Down.  Chance of effect varies with TP.
--  Assuming Enmity Down is -10% enmity, assuming chance is 20>30>40>50 at 0/100/200/300 TP
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
AGI = caster:getStat(4);
blue = getblueskill(caster);
eVIT = target:getStat(3);
acc = caster:getAcc(caster);
eva = target:getEva();
def = target:getDef();
M = 1.25;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor((AGI*0.3)*alpha);

chain = false;
crit = 0;
chance=20;
--Chain Affinity (CHANCE VARIES WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, 
	TP = caster:getTP(); --assuming chance is 20>30>40>50 at 0/100/200/300 TP
	chance = 20 + TP/10;
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
if (AzL ~= nil) then --Azure Lore is on, set 2 hour multiplier
	chance=55;
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
family = calculateFamilyBonus(caster,6,target:getSystem());
M = M + family;

--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,999,1,leveldiff,chain,crit,M,level,0,sa);

--Applying enmity down...
local double randchance = math.random();
if (randchance<=(chance/100)) then
	--print("Enmity down procced!");
	--print("well not really, need getEnmity function!");
	--Need get enmity method to ensure that enmity doesnt go negative
	--therefore, cannot implement this yet.
end

--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,1);

return final;
end;