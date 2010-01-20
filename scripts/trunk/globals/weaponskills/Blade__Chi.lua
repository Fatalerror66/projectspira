---------------------------
-- Blade: Chi - Earth Elemental MAGICAL WEAPON SKILL
--Should be 2x hit, unsure how this works, treating as 1 (meaning damage from this WS will be below normal.)
--TP Mods: 1/1.5/2 for 100/200/300
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
	ftp=attacker:getTP()/200+0.5;
	
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
-- Katana Weapon Skill Quest
---------------------------------------------
	KodachiofTrials = 0x456D; -- Kodachi of Trials
	if(attacker:getEquip(1)==KodachiofTrials and attacker:getQuestStatus(5,147) == 1 and attacker:getVar("KatanaWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("KatanaWeaponSkillPoints",attacker:getVar("KatanaWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	return damage;
end
