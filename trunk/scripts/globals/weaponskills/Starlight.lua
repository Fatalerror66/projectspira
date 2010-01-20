---------------------------
-- Starlight MAGICAL WEAPON SKILL
--TP Mods: 1/2/3 for 100/200/300
--N/A
--str dex vit agi int mnd chr
-- 1  2    3    4   5  6   7
--Author: Kegsay
--Message needs correcting.
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double ftp = 0;
	local club = attacker:getSkill(11);
	
	--Assigning mp formula...
	local damage = (club-10)/9; 
	
	--Assigning fTP multiplier...
	ftp=(attacker:getTP())/100;

	
	--Applying damage settings...
	damage = (damage * ftp); 
	
	--Applying server mods...
	damage = damage * WEAPON_SKILL_POWER;
	
	--Resistances, Day, Weather, MDIF and MDB need to be applied.
	--Make it so, Number One.
	attacker:addMP(damage);
	
					
---------------------------------------------
-- Club Weapon Skill Quest
---------------------------------------------
-- "The Club weaponskills Starlight and Moonlight are the only exception to the
--  experience rule, they always give 1 weaponskill point when performed regardless
--  of what enemy you are engaged with, as they are performed on yourself as the 
--  target, not the enemy."
-- It doesn't need the constraint to gain exp because you are the caster and target
-- its considered that way
---------------------------------------------
	ClubofTrials = 0x4430; -- Trial Club
	if(attacker:getEquip(1) == ClubofTrials and attacker:getQuestStatus(3,86) == 1 and attacker:getVar("ClubWeaponSkillPoints") < 300 and damage > 0) then
			attacker:setVar("ClubWeaponSkillPoints",attacker:getVar("ClubWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	
	return 0;
end
