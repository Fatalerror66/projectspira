---------------------------
-- Vorpal Blade - 4 HIT
-- STR:30%  
-- fTP Multipliers (100/200/300) = 1, 1, 1
-- Crit hit rate VS TP is unknown so has been estimated.
-- Linear, 100%TP=20%crithitrate / 200%=40% / 300%=60% 
-- Author: Kegsay
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double ftp = 0;
	
	--The following will obtain fSTR accurately. This applies to ALL PHYSICAL WEAPON SKIlLLS
	--so feel free to copy and paste.
	local int dSTR = attacker:getStat(1)-target:getStat(3); --get dSTR
	local int fSTR = 0;
	
	if (dSTR>11) then
		fSTR = (dSTR+4)/4;
	end
	if (dSTR<12 and dSTR > 5) then
		fSTR = (dSTR+6)/4;
	end
	if (dSTR>0 and dSTR<6) then
		fSTR = (dSTR+7)/4;
	end
	if (dSTR>(-3) and dSTR < 1) then
		fSTR = (dSTR+8)/4;
	end 
	if (dSTR>=(-7) and dSTR<=(-3)) then
		fSTR = (dSTR+9)/4;
	end
	if (dSTR>=(-15) and dSTR<=(-8)) then
		fSTR = (dSTR+10)/4;
	end
	if (dSTR>=(-21) and dSTR<=(-16)) then 
		fSTR = (dSTR+12)/4;
	end
	if (dSTR<=(-22)) then
		fSTR = (dSTR+13)/4;
	end
	
	--Apply fSTR caps.
	if (fSTR<((attacker:getBaseDmg()/9)*(-1))) then
		fSTR = (attacker:getBaseDmg()/9)*(-1);
	end
	if (fSTR>((attacker:getBaseDmg()/9)+8)) then
		fSTR = (attacker:getBaseDmg()/9)+8;
	end 

	--End of fSTR calculations.
	--The following will obtain alpha, the level correction multiplier for WSC 
	--(WSC is STR+30%/MND+50% * alpha)

	local double alpha = 0;
	if (attacker:getMainLvl() == 75 or attacker:getMainLvl() == 74) then
		alpha = 0.83;
	end
	 if (attacker:getMainLvl() <= 5) then
		alpha = 1;
	end
	 if (attacker:getMainLvl() <= 11 and attacker:getMainLvl() >= 6)then
		alpha = 0.99;
	end
	 if (attacker:getMainLvl() <= 17 and attacker:getMainLvl() >= 12)then
		alpha = 0.98;
	end
	 if (attacker:getMainLvl() <= 23 and attacker:getMainLvl() >= 18)then
		alpha = 0.97;
	end
	 if (attacker:getMainLvl() <= 29 and attacker:getMainLvl() >= 24)then
		alpha = 0.96;
	end
	 if (attacker:getMainLvl() <= 35 and attacker:getMainLvl() >= 30)then
		alpha = 0.95;
	end
	 if (attacker:getMainLvl() <= 41 and attacker:getMainLvl() >= 36)then
		alpha = 0.94;
	end
	 if (attacker:getMainLvl() <= 47 and attacker:getMainLvl() >= 42)then
		alpha = 0.93;
	end
	 if (attacker:getMainLvl() <= 53 and attacker:getMainLvl() >= 48)then
		alpha = 0.92;
	end
	 if (attacker:getMainLvl() <= 59 and attacker:getMainLvl() >= 54)then
		alpha = 0.91;
	end
	 if (attacker:getMainLvl() == 61 or attacker:getMainLvl() == 60)then
		alpha = 0.90;
	end
	 if (attacker:getMainLvl() == 63 or attacker:getMainLvl() == 62)then
		alpha = 0.89;
	end
	 if (attacker:getMainLvl() == 65 or attacker:getMainLvl() == 64)then
		alpha = 0.88;
	end
	 if (attacker:getMainLvl() == 67 or attacker:getMainLvl() == 66)then
		alpha = 0.87;
	end
	 if (attacker:getMainLvl() == 69 or attacker:getMainLvl() == 68)then
		alpha = 0.86;
	end
	 if (attacker:getMainLvl() == 71 or attacker:getMainLvl() == 70)then
		alpha = 0.85;
	end
	 if (attacker:getMainLvl() == 73 or attacker:getMainLvl() == 72)then
		alpha = 0.84;
	end
	--Level correction factor "alpha" obtained.
	
	--Applying WSC
	local base = attacker:getBaseDmg() + fSTR + 
		(attacker:getStat(1) * 0.3) * alpha; --D+fSTR+WSC
		
	--Applying fTP multiplier and working out TP mod for Crit hits (guessing)
	ftp = 1;
	
	--Assuming at 100% = 20% crit hit rate, at 200% = 40%, at 300% = 60%. Fairly reasonable.
	local int crithitrate = (attacker:getTP()/5)/100;
	--print("crithitrate: ",crithitrate);
	
	
	
	--Obtaining cRatio
	local double ratio = attacker:getAtt()/target:getDef();
	--Level penalty...
	local double levelcor = 0;
	if (attacker:getMainLvl() < target:getMainLvl()) then
	levelcor = 0.05 * (target:getMainLvl() - attacker:getMainLvl());
	end
	ratio = ratio - levelcor;
	
	--Obtaining Critical Ratio
	local double criticalratio = ratio+1;
	if (criticalratio>3) then
	criticalratio = 3;
	end
	
	--Capping cRatio 
	if (ratio<0) then
	ratio = 0;
	end
	if (ratio>2) then
	ratio = 2;
	end
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (ratio<1.25) then
	cratiomin = 1.2 * ratio - 0.5;
	end
	if (ratio>=1.25 and ratio<=1.5) then
	cratiomin = 1;
	end
	if (ratio>1.5 and ratio<=2) then
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
	if (ratio<=2 and ratio>0.833) then
	cratiomax = 1.2 * ratio;
	end
	
	--Obtaining Critical cRatio_MIN
	local double cratiomincrit = 0;
	if (criticalratio<1.25) then
	cratiomincrit = 1.2 * criticalratio - 0.5;
	end
	if (criticalratio>=1.25 and criticalratio<=1.5) then
	cratiomincrit = 1;
	end
	if (criticalratio>1.5 and criticalratio<=3) then
	cratiomincrit = 1.2 * criticalratio - 0.8;
	end
	
	--Obtaining Critical cRatio_MAX
	local double cratiomaxcrit = 0;
	if (criticalratio<0.5) then
	cratiomaxcrit = 0.4 + 1.2 * criticalratio;
	end
	if (criticalratio<=0.833 and criticalratio>=0.5) then
	cratiomaxcrit = 1;
	end
	if (criticalratio<=3 and criticalratio>0.833) then
	cratiomaxcrit = 1.2 * criticalratio;
	end
	
	--Applying fTP
	dmg = base * ftp;  
	
	--Applying pDIF
	local double pdif = math.random((cratiomin*1000),(cratiomax*1000)); 
	pdif = pdif/1000; --multiplier set.
	
	--Applying Crit pDIF
	local double cpdif = math.random((cratiomincrit*1000),(cratiomaxcrit*1000)); 
	cpdif = cpdif/1000; --multiplier set.
	
	--First hit has 95% acc always. Second hit affected by hit rate.
	local double firsthit = math.random();
	local finaldmg = 0;
	if (firsthit <= 0.95) then
	--print("Hit.");
	--See if crits
	local double crit1 = math.random();
	if (crit1<=crithitrate) then
	--print("Critical hit!");
	finaldmg = dmg *cpdif;
	--print("final damage so far: ",finaldmg);
	end
	if (crit1>crithitrate) then
	finaldmg = dmg *pdif;
	--print("final damage so far: ",finaldmg);
	end
	end
	
	
	--working out hit rate for 2nd, 3rd and 4th hits
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
	
	--Random num to work out if hit#2
	local double sechit = math.random();
	local double sechitc = math.random();
	if (sechit<=hitrate) then
	--print("Hit.");
	if (sechitc<=crithitrate) then
	--print("Critical Hit!");
	finaldmg = finaldmg + base*cpdif;
	--print("final damage so far: ",finaldmg);
	end
	if (sechitc>crithitrate) then
	finaldmg = finaldmg+base*pdif;
	--print("final damage so far: ",finaldmg);
	end
	end
	
	--Random num to work out if hit#3
	local double trihit = math.random();
	local double trihitc = math.random();
	if (trihit<=hitrate) then
	--print("Hit.");
	if (trihitc<=crithitrate) then
	--print("Critical Hit!");
	finaldmg = finaldmg + base*cpdif;
	--print("final damage so far: ",finaldmg);
	end
	if (trihitc>crithitrate) then
	finaldmg = finaldmg+base*pdif;
	--print("final damage so far: ",finaldmg);
	end
	end
	
	--Random num to work out if hit#4
	local double quadhit = math.random();
	local double quadhitc = math.random();
	if (quadhit<=hitrate) then
	--print("Hit.");
	if (quadhitc<=crithitrate) then
	--print("Critical Hit!");
	finaldmg = finaldmg + base*cpdif;
	--print("final damage so far: ",finaldmg);
	end
	if (quadhitc>crithitrate) then
	finaldmg = finaldmg+base*pdif; 
	--print("final damage so far: ",finaldmg);
	end
	end
	
	--print("hitrate: ",hitrate);
	--print("Total Damage: ",finaldmg);
	
					
	--Applying server mods...
	finaldmg = finaldmg * WEAPON_SKILL_POWER;
				
---------------------------------------------
-- Sword Weapon Skill Quest
---------------------------------------------
	SaparaofTrials = 0x44F6; -- Trial Sword
	if(attacker:getEquip(1) == SaparaofTrials and attacker:getQuestStatus(0,102) == 1 and attacker:getVar("SwordWeaponSkillPoints") < 300 and givesEXP(target,attacker) and finaldmg > 0) then
			attacker:setVar("SwordWeaponSkillPoints",attacker:getVar("SwordWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return finaldmg;
end
