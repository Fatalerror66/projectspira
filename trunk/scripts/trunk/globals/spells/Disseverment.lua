--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Disseverment
-- 	Delivers a fivefold attack.  Additional effect: Poison.  Accuracy varies with TP.
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
M = 1.50;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor(((STR*0.2)+(DEX*0.2))*alpha);

chain = false;
bonusacc=0;
--Chain Affinity (ACCURACY VARIES WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, work out bonus accuracy (assuming 10ACC per 100% TP (5% hit rate))
	TP = caster:getTP();
	bonusacc = TP/10;
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
if (AzL ~= nil) then --Azure Lore is on, give 35 acc (Azure lore counts as 350% TP)
	bonusacc=35;
end
acc = acc+bonusacc;
--print("Bonus Acc: ",bonusacc);

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
family = calculateFamilyBonus(caster,12,target:getSystem());
M = M+family;

--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,999,5,leveldiff,chain,crit,M,level,0,sa);

--Deal additional effect
local double chance = math.random();
if (chance<=0.95) then --this will need to be changed to something more accurate!
	pois = target:getStatusEffect(EFFECT_POISON);
	if (pois ~= nil) then --poison is already on monster! Do not apply. (Disseverment is annoying like this -_-; damn RDMs...)
			--print("Poison already on monster! Not applying additional effect :-(");
	else --slow isn't on, apply!
		target:addStatusEffect(EFFECT_POISON,18,3,300);
	end
end

--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,3);

return final;
end;