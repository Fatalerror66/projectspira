---------------------------
-- Flat Blade - Thunder Elemental MAGICAL WEAPON SKILL
--TP Mods: 1/1/1 for 100/200/300
--STR+30%
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
	local damage = (attacker:getStat(1)) * 0.3 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	ftp = 1;
	
	--Assigning fINT addition...
	local int dInt = (attacker:getStat(5))-(target:getStat(5));
	if (dInt > 24) then
		dInt = 24;
	end
	local int fInt = 8+dInt/2;
	
	--Applying damage settings...
	damage = (damage * ftp)+fInt; 

	--Applying stun...
	if (target:getStatusEffect(EFFECT_STUN) == nil) then 
		--See if it lands... assuming a base of 3, and chance of 70%=100, 80%=200 and 90%=300.
		local double chanceproc = 0.6+(attacker:getTP()/1000);
		duration = 3;
		if (firsthit<=chanceproc) then
			target:addStatusEffect(EFFECT_STUN,1,0,duration);
		end
	end
	
	--Resistances, Day, Weather, MDIF and MDB need to be applied.
	--Make it so, Number One.
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