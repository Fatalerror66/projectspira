---------------------------
-- Sturmwind - 2 HIT
-- STR:30%
-- fTP Multipliers (100/200/300) = 1,1,1 (listed on wiki... but this does not
-- match "damage varies with TP". Therefore, I have adjusted this to show 1,1.5,2
-- like most other Two-Hit Physical "Damage Varies TP" weapon skills. ~Kegsay
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
		(attacker:getStat(1) * 0.3) * alpha; --D+fSTR+WSC
		
	--Applying fTP multiplier
	ftp = (attacker:getTP()/200)+0.5;
	
	--Obtaining cRatio
	local double ratio = attacker:getAtt()/target:getDef();
	--Level penalty...
	local double levelcor = 0;
	if (attacker:getMainLvl() < target:getMainLvl()) then
	levelcor = 0.05 * (target:getMainLvl() - attacker:getMainLvl());
	end
	ratio = ratio - levelcor;
	
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
	
	--Applying fTP
	dmg = base * ftp;  
	
	--Applying pDIF
	local double pdif = math.random((cratiomin*1000),(cratiomax*1000)); 
	pdif = pdif/1000; --multiplier set.
	
	--First hit has 95% acc always. Second hit affected by hit rate.
	local double firsthit = math.random();
	local finaldmg = 0;
	if (firsthit <= 0.95) then
	finaldmg = dmg * pdif;
	end
	
	
	--working out hit rate for 2nd hit
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
	
	--Random num to work out if hit
	--Second hit, fTP goes to 1.0 so just using base instead of of dmg.
	local double sechit = math.random();
	if (sechit<=hitrate) then
	--print("Hit Twice.");
	finaldmg = finaldmg+base*pdif;
	end
	
	--print("pdif/hitrate: ",pdif,hitrate); 
	
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
