---------------------------
-- Spirits Within WEAPON SKILL
--TP Mods: 64/512 -- 6/32 -- 15/32 for 100/200/300
--N/A
--str dex vit agi int mnd chr
-- 1  2    3    4   5  6   7
--Author: Kegsay
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double tp = 0;
	if (attacker:getTP() < 200) then
		tp=(attacker:getTP()/1600)+0.0625; 
	end
	if (attacker:getTP() > 199) then
		tp=(attacker:getTP()/355.55)-0.375;
	end
	
	local dmg = attacker:getHP()*tp;
	--print("TP Mod: ",tp);

---------------------------------------------
-- Sword Weapon Skill Quest
---------------------------------------------
	SaparaofTrials = 0x44F6; -- Trial Sword
	if(attacker:getEquip(1) == SaparaofTrials and attacker:getQuestStatus(0,102) == 1 and attacker:getVar("SwordWeaponSkillPoints") < 300 and givesEXP(target,attacker) and dmg > 0) then
			attacker:setVar("SwordWeaponSkillPoints",attacker:getVar("SwordWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return dmg;
end