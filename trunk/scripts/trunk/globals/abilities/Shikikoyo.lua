-------------------------
-- Shikikoyo
-- Author: atkb
-------------------------
require("/scripts/globals/settings");

function OnUseAbility(user, target, ability, isFirstTarget)
  selftp = user:getTP();
  targettp = target:getTP();

  if (selftp <= 100) then
    newttp = targettp;
    newstp = selftp;
    addtp = 0;
  end
  if (selftp >= 100) then
    addtp = selftp - 100;
    newttp = targettp + addtp;
    newstp = 100;
  end

  if (targettp >= 300) then
    newttp = targettp;
    newstp = selftp;
    addtp = 0;
  end
  if (selftp <= 100) then
    ability:setMsg(323);
    ability:setResult(addtp);
  else
    ability:setMsg(452);
    ability:setResult(addtp);
  end

  user:setTP(newstp);
  target:setTP(newttp);
  target:updateEnmity(user,300,1); --Possibly the same as Devotion or Martyr.
end;