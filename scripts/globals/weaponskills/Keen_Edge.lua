---------------------------
-- Keen Edge - One hit
-- STR:35%
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
		(attacker:getStat(1) * 0.35) * alpha; --D+fSTR+WSC
		
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
	end
	if (crit1>crithitrate) then
	finaldmg = dmg *pdif;
	end
	end
	
	
	
	--Applying server mods...
	finaldmg = finaldmg * WEAPON_SKILL_POWER;
				
---------------------------------------------
-- Great Axe Weapon Skill Quest
---------------------------------------------
	AxeofTrials = 0x415F; -- Axe of Trials(10529)
	if(attacker:getEquip(1) == AxeofTrials and attacker:getQuestStatus(1,66) == 1 and attacker:getVar("GreatAxeWeaponSkillPoints") < 300 and givesEXP(target,attacker) and finaldmg > 0) then
			attacker:setVar("GreatAxeWeaponSkillPoints",attacker:getVar("GreatAxeWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return finaldmg;
end