--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Terror Touch
-- 	Additional effect: Weakens attacks.  Accuracy varies with TP.
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
INT = caster:getStat(5);
blue = getblueskill(caster);
eVIT = target:getStat(3);
acc = caster:getAcc(caster);
eva = target:getEva();
def = target:getDef();
M = 1.5;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor(((DEX*0.2+INT*0.2))*alpha);

chain = false;
bonusacc=0;
--Chain Affinity (DAMAGE VARIES WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, work out bonus acc (assuming 4 per 100TP, 4 base)
	TP = caster:getTP();
	bonusacc = 4+TP/25;
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
if (AzL ~= nil) then --Azure Lore is on, give multi (Azure lore counts as 350% TP)
	bonusacc=18;
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
family = calculateFamilyBonus(caster,16,target:getSystem());
M = M+family;

--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,41,1,leveldiff,chain,crit,M,level,0,sa);

--Apply additional effect (95%, will need changing....)
--Terror Touch ATK DOWN - Static duration 60secs (tested)
local double chance = math.random();
if (chance<=0.95) then --this will need to be changed to something more accurate!
	if (target:getStatusEffect(EFFECT_ATT_DOWN) == nil) then --ATK down not on monster!
			--work out strength (using Blue Skill/25 as part of a percentage reduction. This means even at 300 skill, max reduction is ~14% which is fine.
				atkdownp = blue/25;
				--print("Atk down (%): ",atkdownp);
				beforev = target:getAtt();
				actualatkdown = math.floor(beforev * atkdownp/100);
				--print("BEFORE: ",beforev);
				--print("ACTUAL REDUCTION IN ATTACK: ",actualatkdown);
				target:addStatusEffect(EFFECT_ATT_DOWN,actualatkdown, 0, 60,FLAG_ERASBLE);
				afterv = target:getAtt();
				--print("AFTER: ",afterv);
			
	end
end

--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,1);

return final;
end;