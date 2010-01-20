---------------------------
-- Tachi: Kagero - Fire Elemental MAGICAL WEAPON SKILL
--TP Mods: 1/1/1 for 100/200/300
--STR+50%
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
	local damage = (attacker:getStat(1)) * 0.5 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	ftp=1;
	
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
-- Great Katana Weapon Skill Quest
---------------------------------------------
	TachiofTrials = 0x4597; -- Tachi of Trials
	if(attacker:getEquip(1) == TachiofTrials and attacker:getQuestStatus(5,146) == 1 and attacker:getVar("GreatKatanaWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("GreatKatanaWeaponSkillPoints",attacker:getVar("GreatKatanaWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return damage;
end
