---------------------------
-- True Strike - Physical One Hit Weapon Skill
-- STR:50% (Acc varies with TP) - Deals CRITICAL damage.
-- fTP Multipliers (100/200/300) = 1,1,1
-- TP 100/200/300 // Penalty -0.2/-0.1/0
-- Author: Kegsay
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double ftp = 0;
	local int dSTR = attacker:getStat(1)-target:getStat(3); --get dSTR
	
	--Get fSTR from dSTR
	local fSTR = getfSTR(dSTR);
	
	--Apply fSTR caps.
	if (fSTR<((attacker:getBaseDmg()/9)*(-1))) then
		fSTR = (attacker:getBaseDmg()/9)*(-1);
	end
	if (fSTR>((attacker:getBaseDmg()/9)+8)) then
		fSTR = (attacker:getBaseDmg()/9)+8;
	end 

	--The following will obtain alpha, the level correction multiplier for WSC 
	local alpha = getAlpha(attacker:getMainLvl());
	
	--Applying WSC
	local base = attacker:getBaseDmg() + fSTR + 
		(attacker:getStat(1) * 0.50) * alpha; --D+fSTR+WSC
		
	--Applying fTP multiplier
	ftp = 1;
	
	--Obtaining cRatio
	local double ratio = attacker:getAtt()/target:getDef();
	--Level penalty...
	local double levelcor = 0;
	if (attacker:getMainLvl() < target:getMainLvl()) then
	levelcor = 0.05 * (target:getMainLvl() - attacker:getMainLvl());
	end
	
	ratio = ratio - levelcor;
	
	--Adding 1 to ratio (Crit hit in True Strike)
	ratio = ratio+1;
	
	--Capping cRatio (with crit values) 
	if (ratio<0) then
	ratio = 0;
	end
	if (ratio>3) then
	ratio = 3;
	end
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (ratio<1.25) then
	cratiomin = 1.2 * ratio - 0.5;
	end
	if (ratio>=1.25 and ratio<=1.5) then
	cratiomin = 1;
	end
	if (ratio>1.5 and ratio<=3) then
	cratiomin = 1.2 * ratio - 0.8;
	end
	
	--Obtaining cRatio_MAX
	local double cratiomax = 0;
	if (ratio<0.5) then
	cratiomax = 0.4 + 1.2 * ratio;
	end
	if (ratio<=0.833 and ratio>=0.5) then
	cratiomax = 1;
	end
	if (ratio<=3 and ratio>0.833) then
	cratiomax = 1.2 * ratio;
	end
	
	--Applying fTP
	dmg = base * ftp;  
	
	--Applying pDIF
	local double pdif = math.random((cratiomin*1000),(cratiomax*1000)); 
	pdif = pdif/1000; --multiplier set.
	
	--Obtaining hit rate and applying TP penalty.
	local int acc = attacker:getAcc(attacker);
	local int eva = target:getEva();
	local double hitdiff = 0;
	local double hitrate = 75;
	if (acc>eva) then
	hitdiff = (acc-eva)/2;
	end
	if (eva>acc) then
	hitdiff = ((-1)*(eva-acc))/2;
	end
	
	
	hitrate = hitrate+hitdiff;
	hitrate = hitrate/100;
	
	--Applying hitrate caps
	if (hitrate>0.95) then
	hitrate = 0.95;
	end
	if (hitrate<0.2) then
	hitrate = 0.2;
	end
	
	--Imposing accuracy penalty as Accuracy varies with TP. At 300%, normal hit rate.
	--TP100%= hitrate-0.2 / TP=200%=hitrate-0.1 / TP300%=hitrate-0
	local double penalty = (attacker:getTP()/1000) - 0.3;
	--print("TP Acc Penalty: ",penalty);
	hitrate = hitrate + penalty;
	
	--Reapplying min hit rate cap
	if (hitrate<0.2) then
	hitrate = 0.2;
	end
	
	--Random num to work out if hit
	local double sechit = math.random();
	if (sechit<=hitrate) then
	finaldmg = dmg*pdif;
	end
	
	
	--print("pdif/hitrate: ",pdif,hitrate); 
	
	--Applying server mods...
	finaldmg = finaldmg * WEAPON_SKILL_POWER;
	

				
---------------------------------------------
-- Club Weapon Skill Quest
---------------------------------------------
	ClubofTrials = 0x4430; -- Trial Club
	if(attacker:getEquip(1) == ClubofTrials and attacker:getQuestStatus(3,86) == 1 and attacker:getVar("ClubWeaponSkillPoints") < 300 and givesEXP(target,attacker) and finaldmg > 0) then
			attacker:setVar("ClubWeaponSkillPoints",attacker:getVar("ClubWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return finaldmg;
end
