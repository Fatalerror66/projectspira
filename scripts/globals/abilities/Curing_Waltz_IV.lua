-------------------------
--Curing Waltz IV
--Author: Kegsay
-------------------------
require("/scripts/globals/settings");

function OnUseAbility(user, target, ability, isFirstTarget)
  --Grabbing variables.
  local vit = target:getStat(3);
  local chr = user:getStat(7);
  local mjob = user:getMainJob(); --19 for DNC main.
  local cure = 0;

  --Performing mj check.
  if (mjob == 19) then
    cure = (vit+chr)+450;
  end

  --Reducing TP.
  local tp = user:getTP();
  tp = tp - 65;
  user:setTP(tp);

  --Applying server mods....
  cure = cure * CURE_POWER;

  --Cap the final amount to max HP.
  if ((target:getMaxHP() - target:getHP()) < cure) then
    cure = (target:getMaxHP() - target:getHP());
  end

  --Adjust message.
  ability:setMsg(306);
  ability:setResult(cure);

  --Do it
  target:addHP(cure);
  target:updateEnmity(user,cure*(240 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )),cure*(40 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )));
end;