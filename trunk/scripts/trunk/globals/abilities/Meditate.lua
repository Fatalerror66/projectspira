-----------------------------------
--	Authors: atkb, Deviltti, Tenjou
-- 	Meditate
-- 	Gradually charges TP.
--
--	Actually grants a regain effect.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	--Pull relevant stats.
	head = user:getEquip(5);
	hands = user:getEquip(7);
	
	--Calculate strength.
	tp = 12;
	if (user:getMainJob() == 12) then --Samurai main job gets more than sub job.
		tp = 20;
	end
	
	--Calculate duration.
	duration = 10;
	
	--Try to give bonus duration.
	bonus = 2*math.random(1,2);
	if(head == 13868 or head == 15236) then --Myochin Kabuto
		duration = duration + bonus;
	end
	if(hands == 15113 or hands == 14920) then --Saotome Kote
		duration = duration + bonus;
	end
	
	--Do it!
	user:addStatusEffect(EFFECT_REGAIN,tp,2,duration);
	target:updateEnmity(user,0,320);
end;