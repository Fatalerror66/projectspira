-----------------------------------
--  Author: atkb
--  Sublimation
--  Gradually creates a storage of MP while reducing your HP.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  if (user:getStatusEffect(EFFECT_SUBLIMATION_ACTIVATE) or user:getStatusEffect(EFFECT_SUBLIMATION_COMPLETE)) then
    user:removeStatusType(EFFECT_SUBLIMATION_ACTIVATE);
    user:removeStatusType(EFFECT_SUBLIMATION_COMPLETE);
    mp = user:getMod(MOD_SUBLIMATION_POOL);
    user:removeMod(MOD_SUBLIMATION_POOL,user:getMod(MOD_SUBLIMATION_POOL));

    if ((user:getMaxMP() - user:getMP()) < mp) then
      mp = (user:getMaxMP() - user:getMP());
    end

    ability:setMsg(451);
    ability:setResult(mp);
    user:addMP(mp);
  else
    user:addStatusEffect(EFFECT_SUBLIMATION_ACTIVATE,2,3,3600);
  end
  target:updateEnmity(user,300,1);
end;