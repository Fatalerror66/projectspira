-----------------------------------
--  Author: atkb
--  Warcry
--  Enhances attacks of party members within area of effect.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  -- Defines
  mjob = target:getMainJob();
  sjob = target:getSubJob();
  mlvl = target:getMainLvl();
  slvl = target:getSubLvl();
  attack = 0.306; -- I can't find the formula, but Wiki says a WAR75 using Warcry gave +23 attack, while at 37 it gave +14. Dividing each value by the level being used gave ~0.306 so using that until a formula can be made.

  if (mjob == 1) then
    attpwr = attack * mlvl;
  else
    attpwr = attack * slvl;
  end

  -- Add it
  target:addStatusEffect(EFFECT_WARCRY,attpwr,0,30);

  -- Adjust message
  if (isFirstTarget == 1) then
    ability:setMsg(441);
  else
    ability:setMsg(421);
  end

  -- Enmity
  target:updateEnmity(user,300,1);
end;