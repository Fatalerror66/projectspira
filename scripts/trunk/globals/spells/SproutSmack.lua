--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Sprout Smack
-- 	Additional effect: Slow.  Duration of effect varies with TP.
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
VIT = caster:getStat(3);
blue = getblueskill(caster);
eVIT = target:getStat(3);
acc = caster:getAcc(caster);
eva = target:getEva();
def = target:getDef();
M = 1.5;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor((VIT*0.3)*alpha);

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
	slow = target:getStatusEffect(EFFECT_SLOW);
	if (slow ~= nil) then --slow is already on monster!
			if (slow:getPower() > -15) then --this slow is better! Apply.
				target:removeStatusType(EFFECT_SLOW);	
				target:addStatusEffect(EFFECT_SLOW,-15,0,duration);
			end
	else --slow isn't on, apply!
		target:addStatusEffect(EFFECT_SLOW,-15,0,duration);
	end
end
--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,2);

return final;
end;