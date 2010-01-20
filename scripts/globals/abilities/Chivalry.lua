-------------------------
-- Chivarly (TP->MP)
-- Author: atkb
-------------------------
require("/scripts/globals/settings");

function OnUseAbility(user, target, ability, isFirstTarget)
  mp = user:getMP();
  tp = user:getTP();
  mnd = user:getStat(6);

  mp = tp * (0.5 + 0.015 * mnd);

  if ((user:getMaxMP() - user:getMP()) < mp) then
    mp = (user:getMaxMP() - user:getMP());
  end

  ability:setMsg(451);
  ability:setResult(mp);

  user:setTP(0);
  user:addMP(mp);
  target:updateEnmity(user,300,1);
end;