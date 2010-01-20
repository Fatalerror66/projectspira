---------------------------
-- Seraph Strike - Light Elemental MAGICAL WEAPON SKILL
--TP Mods: 1/2/3 for 100/200/300
--STR+30% MND+30%
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
	local damage = (attacker:getStat(1)) * 0.3 + (attacker:getStat(6)) * 0.3 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	ftp = attacker:getTP()/100;
	--print("ftp: ",ftp);
	
	--Assigning fINT addition...
	local int dInt = (attacker:getStat(5))-(target:getStat(5));
	if (dInt > 24) then
		dInt = 24;
	end
	local int fInt = 8+dInt/2;
	
	--Applying damage settings...
	damage = (damage * ftp)+fInt; 
	
	--Applying server mods...
	damage = damage * WEAPON_SKILL_POWER;
	
	--Resistances, Day, Weather, MDIF and MDB need to be applied.
	--Make it so, Number One.
---------------------------------------------
-- Club Weapon Skill Quest
---------------------------------------------
	ClubofTrials = 0x4430; -- Trial Club
	if(attacker:getEquip(1) == ClubofTrials and attacker:getQuestStatus(3,86) == 1 and attacker:getVar("ClubWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("ClubWeaponSkillPoints",attacker:getVar("ClubWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return damage;
end
