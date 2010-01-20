---------------------------
-- Gust Slash - Wind Elemental MAGICAL WEAPON SKILL
--TP Mods: 1/2/2.5 for 100/200/300
--DEX+20% INT+20%
--str dex vit agi int mnd chr
-- 1  2    3    4   5  6   7
--Author: Kegsay
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double ftp = 0;
	
	--Assigning magical WSC and base...
	local damage = (attacker:getStat(2)) * 0.2 + 
					(attacker:getStat(5)) * 0.2 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	if (attacker:getTP() < 200) then
	ftp = (attacker:getTP())/100;
	end
	if (attacker:getTP() > 199) then
	ftp = (attacker:getTP()/200)+1;
	end
	
	--Assigning fINT addition...
	local int dInt = (attacker:getStat(5))-(target:getStat(5));
	if (dInt > 24) then
		dInt = 24;
	end
	local int fInt = 8+dInt/2;
	
	--Applying damage settings...
	damage = (damage * ftp)+fInt; 
	
	--Resistances, Day, Weather, MDIF and MDB need to be applied.
	--Make it so, Number One.
---------------------------------------------
-- Dagger Weapon Skill Quest
---------------------------------------------
	DaggerofTrials = 0x44D0; -- Trial Dagger
	if(attacker:getEquip(1) == DaggerofTrials and attacker:getQuestStatus(5,13) == 1 and attacker:getVar("DaggerWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("DaggerWeaponSkillPoints",attacker:getVar("DaggerWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return damage;
end