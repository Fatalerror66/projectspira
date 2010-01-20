-----------------------------------
--	Author: Tenjou
-- 	Benediction
-- 	Restores a large amount of HP and removes all status ailments for party members within area of effect.
--
--	From FFXIclopedia: Formula for restored HP seems to be 
--	(max HP of target) * (level of WHM) / (level of target). 
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

final = target:getMaxHP()*user:getMainLvl()/target:getMainLvl()
--Adjust to maxHP.
if (final > (target:getMaxHP() - target:getHP())) then
	final = (target:getMaxHP() - target:getHP());
end

--Adjust message for multiple targets
if (isFirstTarget == 1) then
	ability:setMsg(102);
else
	ability:setMsg(263);
end
ability:setResult(final);

--Do it!
target:addHP(final);
target:updateEnmity(user,final*(240/((target:getMainLvl()/1.6)+10)),final*(40/((target:getMainLvl()/1.6)+10)));

--Also remove all negative statuses (a lot).
target:removeStatusType(EFFECT_SLEEP);
target:removeStatusType(EFFECT_POISON);
target:removeStatusType(EFFECT_PARALYZE);
target:removeStatusType(EFFECT_BLIND);
target:removeStatusType(EFFECT_SILENCE);
target:removeStatusType(EFFECT_PETRIFY);
target:removeStatusType(EFFECT_DISEASE);
target:removeStatusType(EFFECT_CURSE);
target:removeStatusType(EFFECT_STUN);
target:removeStatusType(EFFECT_BIND);
target:removeStatusType(EFFECT_WEIGHT);
target:removeStatusType(EFFECT_SLOW);
target:removeStatusType(EFFECT_GRADUAL_PETRIFY);
target:removeStatusType(EFFECT_MUTE);
target:removeStatusType(EFFECT_BANE);
target:removeStatusType(EFFECT_PLAGUE);
target:removeStatusType(EFFECT_BURN);
target:removeStatusType(EFFECT_FROST);
target:removeStatusType(EFFECT_CHOKE);
target:removeStatusType(EFFECT_RASP);
target:removeStatusType(EFFECT_SHOCK);
target:removeStatusType(EFFECT_DROWN);
target:removeStatusType(EFFECT_DIA);
target:removeStatusType(EFFECT_BIO);
target:removeStatusType(EFFECT_STR_DOWN);
target:removeStatusType(EFFECT_DEX_DOWN);
target:removeStatusType(EFFECT_VIT_DOWN);
target:removeStatusType(EFFECT_AGI_DOWN);
target:removeStatusType(EFFECT_INT_DOWN);
target:removeStatusType(EFFECT_MND_DOWN);
target:removeStatusType(EFFECT_CHR_DOWN);
target:removeStatusType(EFFECT_ACC_DOWN);
target:removeStatusType(EFFECT_ATT_DOWN);
target:removeStatusType(EFFECT_EVA_DOWN);
target:removeStatusType(EFFECT_DEF_DOWN);
target:removeStatusType(EFFECT_MAGIC_DEF_DOWN);
target:removeStatusType(EFFECT_INHIBIT_TP);
target:removeStatusType(EFFECT_MAGIC_ACC_DOWN);
target:removeStatusType(EFFECT_MAGIC_ATT_DOWN);
target:removeStatusType(EFFECT_ENCUMBRANCE);
target:removeStatusType(EFFECT_HELIX);
target:removeStatusType(EFFECT_MAX_TP_DOWN);
target:removeStatusType(EFFECT_REQUIEM);
target:removeStatusType(EFFECT_LULLABY);
target:removeStatusType(EFFECT_ELEGY);
--Try to remove Doom.
if (math.random() > 0.5) then
	target:removeStatusType(EFFECT_DOOM);
end

end;