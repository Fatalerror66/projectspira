---------------------------
-- Energy Drain - Physical One Hit Weapon Skill
-- Mods Unknown. Assuming None.
-- fTP Multipliers (100/200/300) = 1.25,1.75,2.25 (estimated, actual fTP is not fully known)
-- Author: Kegsay
-- Deals no damage, needs message change.
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
	local base = attacker:getBaseDmg() + fSTR; --D+fSTR+WSC
		
	--Applying fTP multiplier
	ftp = attacker:getTP()/200 + 0.75;
	
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
	
	--First hit has 95% acc always. 
	local double firsthit = math.random();
	local finaldmg = 0;
	if (firsthit <= 0.95) then
	finaldmg = dmg * pdif;
	end
	
	
	--print("pdif/hitrate: ",pdif,hitrate); 
	
	--Applying server mods...
	finaldmg = finaldmg * WEAPON_SKILL_POWER;
	
	--Also steal that much MP.
	stealmp = finaldmg;
	maxmp = target:getMP();
	if (finaldmg > maxmp) then
		stealmp = maxmp;
	end
	target:removeMP(stealmp);
	attacker:addMP(stealmp);
	

				
---------------------------------------------
-- Dagger Weapon Skill Quest
-- Don't know if this WS gives WS points
---------------------------------------------
	DaggerofTrials = 0x44D0; -- Trial Dagger
	if(attacker:getEquip(1) == DaggerofTrials and attacker:getQuestStatus(5,13) == 1 and attacker:getVar("DaggerWeaponSkillPoints") < 300 and givesEXP(target,attacker) and stealmp > 0 ) then
			attacker:setVar("DaggerWeaponSkillPoints",attacker:getVar("DaggerWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return 0;
end
