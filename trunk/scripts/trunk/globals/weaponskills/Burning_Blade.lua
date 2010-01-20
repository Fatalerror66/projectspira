---------------------------
-- Burning Blade - Fire Elemental MAGICAL WEAPON SKILL
--TP Mods: 1/2/2.5 for 100/200/300
--STR+20% INT+20%
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
	local damage = (attacker:getStat(1)) * 0.2 + 
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
	--Applying server mods...
	finaldmg = finaldmg * WEAPON_SKILL_POWER;
	
---------------------------------------------
-- Sword Weapon Skill Quest
---------------------------------------------
	SaparaofTrials = 0x44F6; -- Trial Sword
	if(attacker:getEquip(1) == SaparaofTrials and attacker:getQuestStatus(0,102) == 1 and attacker:getVar("SwordWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("SwordWeaponSkillPoints",attacker:getVar("SwordWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return damage;
end
