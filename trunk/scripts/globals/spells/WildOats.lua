--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Wild Oats
-- 	Additional effect: VIT Down.  Duration of effect varies with TP. VIT-10 which decays without CA.
--
--	See ffxiclopedia's article on blue magic damage here:
--	http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
--------------------------------------
   require("/scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
require("/scripts/globals/fieldsofvalor");
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
M = 1.84;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor((AGI*0.3)*alpha);

chain = false;
crit = 0;
duration = 60;
--Chain Affinity (DURATION VARIES WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, work out duration, testing shows 60sec base, +20sec per 100, max 120.
	TP = caster:getTP();
	duration= duration + TP/5;
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
bonusmacc = 0;
if (AzL ~= nil) then --Azure Lore is on, set 2 hour multiplier
	bonusmacc=30; --guess.
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
family = calculateFamilyBonus(caster,14,target:getSystem());
M = M + family;

--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,11,1,leveldiff,chain,crit,M,level,0,sa);

--Deal additional effect
local double chance = math.random();
if (chance<=0.95) then --this will need to be changed to something more accurate!
	if (target:getStatusEffect(EFFECT_VIT_DOWN) == nil) then --VIT down not on monster!
			--work out strength (using Blue Skill/20, fairly accurate, anectodoctal)
				vitdown = math.floor(blue/20);
				--print("Vit down: ",vitdown);
				beforev = target:getStat(3);
				--print("BEFORE: ",beforev);
				target:addStatusEffect(EFFECT_VIT_DOWN,vitdown, 9, vitdown*9,FLAG_ERASBLE);
				afterv = target:getStat(3);
				--print("AFTER: ",afterv);
			
	end
end
--Apply server mods...
final = final * BLUE_POWER;
bob = getReward(23);
--print("REG23:",bob);
--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,3);

return final;
end;