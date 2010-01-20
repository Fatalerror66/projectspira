---------------------------
-- Earth Crusher - Earth Elemental MAGICAL WEAPON SKILL
--TP Mods: 1/2.3125/3.625 for 100/200/300
--STR+30% INT+30%
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
	local damage = (attacker:getStat(1)) * 0.3 + (attacker:getStat(5)) * 0.3 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	ftp = attacker:getTP()/76.19 - 0.3125;
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
	--AoE Effect needs to be applied.
	--Make it so, Number One.
---------------------------------------------
-- Staff Weapon Skill Quest
---------------------------------------------
	PoleofTrials = 0x4477; -- Trial Staff
	if(attacker:getEquip(1)==PoleofTrials and attacker:getQuestStatus(2,87) == 1 and attacker:getVar("StaffWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("StaffWeaponSkillPoints",attacker:getVar("StaffWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return damage;
end
