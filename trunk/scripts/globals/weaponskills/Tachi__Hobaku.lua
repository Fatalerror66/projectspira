---------------------------
-- Tachi: Hobaku - Physical One Hit Weapon Skill
-- STR:30% 
-- fTP Multipliers (100/200/300) = 1,1,1
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
	ftp = 1;
	
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

	--Applying stun...
	if (target:getStatusEffect(EFFECT_STUN) == nil) then 
		--See if it lands... assuming a base of 3, and chance of 70%=100, 80%=200 and 90%=300.
		local double chanceproc = 0.6+(attacker:getTP()/1000);
		duration = 3;
		if (firsthit<=chanceproc) then
			target:addStatusEffect(EFFECT_STUN,1,0,duration);
		end
	end
	
	
	--print("pdif/hitrate: ",pdif,hitrate); 
	
	--Applying server mods...
	finaldmg = finaldmg * WEAPON_SKILL_POWER;
	

				
---------------------------------------------
-- Great Katana Weapon Skill Quest
---------------------------------------------
	TachiofTrials = 0x4597; -- Tachi of Trials
	if(attacker:getEquip(1) == TachiofTrials and attacker:getQuestStatus(5,146) == 1 and attacker:getVar("GreatKatanaWeaponSkillPoints") < 300 and givesEXP(target,attacker) and finaldmg > 0) then
			attacker:setVar("GreatKatanaWeaponSkillPoints",attacker:getVar("GreatKatanaWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return finaldmg;
end
