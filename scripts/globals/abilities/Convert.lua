-----------------------------------
--	Author: Tenjou
-- 	Convert
-- 	Swaps current HP with MP.
--
--	Mythic weapon doubles MP return if your HP is above 50%, and you can't wind up with 0 HP.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();

	--Pull relevant stats.
	hp = user:getHP();
	mp = user:getMP();
	sword = user:getEquip(1);

	hptemp = mp;
	--print("HPTEMP:",hptemp);
	mptemp = hp;

	--Murgleis augments Convert.
	if (sword == 18995 and (user:getHP() > (user:getMaxHP()/2))) then
		mptemp = (mptemp * 2);
	end

	--Prevent unwitting Red Mages from dying...
	if (hptemp == 0) then 
		hptemp = 1; 
	end

	--Do it!
	user:setMP(mptemp);
	user:setHP(hptemp);
	target:updateEnmity(user,80,1);
end;