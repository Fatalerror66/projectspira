-----------------------------------
--	Author: Xellos / Tenjou
-- 	Chakra
-- 	Restores a small amount of HP.
--
--  These values are based on FFXIclopedia. Since testing would 
--  be rediculously easy, I just trusted the values.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/status");

function OnUseAbility(user, target, ability, isFirstTarget)

--Grabbing variables.

    vit = user:getStat(3);
    body = user:getEquip(6);
    hand = user:getEquip(7);
    hp1 = user:getHP();
    buff = 0;
	poison=user:getStatusEffect(EFFECT_POISON);
	blind=user:getStatusEffect(EFFECT_BLIND);
	paralyze=user:getStatusEffect(EFFECT_PARALYZE);
	disease=user:getStatusEffect(EFFECT_DISEASE);

if(poison ~=nil) then
	user:removeStatusType(EFFECT_POISON);
end
if(blind ~=nil) then
	user:removeStatusType(EFFECT_BLIND);
end
--Adjusting Heal Ammount
if (body == 12639 or body ==14474) then
	buff = (buff + 1);
	if(paralyze ~=nil) then
		user:removeStatusType(EFFECT_PARALYZE);
	end
end
if (hand == 14910 or hand == 15103) then
	buff = (buff + .6);
	if(disease ~=nil) then
		user:removeStatusType(EFFECT_DISEASE);
	end
end
healhp = vit*(buff + 2);
--Cap final ammount
needhp = (user:getMaxHP() - hp1);
if (healhp > needhp) then healhp = needhp; 
end
--Do it!
user:addHP(healhp);
target:updateEnmity(user,300,1);
--Message
ability:setMsg(102);
ability:setResult(healhp);
end;