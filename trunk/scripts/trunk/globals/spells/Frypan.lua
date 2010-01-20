--------------------------------------
--	Author: Tenjou/Kegsay
-- 	Frypan
-- 	Delivers an area attack.  Damage varies with TP.
-- Does not AoE!
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
M = 1.78;
dSTR = STR - eVIT;
alpha = getAlpha(level);
WSC = math.floor(((STR*0.2)+(MND*0.2))*alpha);

chain = false;
bonusacc=0;
--Chain Affinity (ACC VARIES WITH TP)
CA = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
if (CA ~= nil) then --Chain affinity is on, work out bonus acc
	TP = caster:getTP();
	bonusacc = 5+TP/20;
	chain = true;
	caster:removeStatusType(EFFECT_CHAIN_AFFINITY);
	caster:setTP(0);
end

--Azure Lore check
AzL = caster:getStatusEffect(EFFECT_AZURE_LORE);
if (AzL ~= nil) then --Azure Lore is on, give multi (Azure lore counts as 350% TP)
	bonusacc=22;
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
family = calculateFamilyBonus(caster,6,target:getSystem());
M = M+family;

acc=acc+bonusacc;
--pass it
--calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
final = calculateBlueMagicDamage(blue,def,acc,eva,dSTR,WSC,999,1,leveldiff,chain,crit,M,level,0,sa);

--Deal additional effect
local double chance = math.random();
if (chance<=0.95) then --this will need to be changed to something more accurate!
	stun = target:getStatusEffect(EFFECT_STUN);
	if (stun ~= nil) then --stun is already on monster! Do not apply. 
			--print("Stun already on :-(");
	else --stun isn't on, apply!
		target:addStatusEffect(EFFECT_STUN,1,0,6); --duration set to 6, will need to be modified depending on resistance.
	end
end

--Apply server mods...
final = final * BLUE_POWER;

--Do it!
final = takePhysicalBlueDamage(caster,target,final,spell,2);

return final;
end;