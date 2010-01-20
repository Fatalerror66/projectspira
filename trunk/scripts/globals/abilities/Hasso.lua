-----------------------------------
--	Authors: atkb
-- 	Hasso
-- 	Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
--
--  NOTE:
--  This only works on 2-handed weapons (not hand-to-hand) and this needs to be hard-coded into the core because
--  it's suppose to say so when you try to use it without a 2-handed weapon.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  -- Defines
  mjob = user:getMainJob();
  mlvl = user:getMainLvl();
  sjob = user:getSubJob();
  slvl = user:getSubLvl();
  -- Lasts for 5 minutes (300 seconds)
  duration = 300;
  -- Tier 1 of Hasso
  amount = 3;
  subamount = 3;

  -- Check MainJob
  if (mjob == 12) then
    if (mlvl >= 70) then
      amount = 10;
    elseif (mlvl >= 63) then
      amount = 9;
    elseif (mlvl >= 56) then
      amount = 8;
    elseif (mlvl >= 49) then
      amount = 7;
    elseif (mlvl >= 42) then
      amount = 6;
    elseif (mlvl >= 35) then
      amount = 5;
    elseif (mlvl >= 28) then
      amount = 4;
    elseif (mlvl >= 25) then
      amount = 3;
    end
  end

  -- Check SubJob
  if (sjob == 12) then
    if (slvl >= 35) then
      subamount = 5;
    elseif (slvl >= 28) then
      subamount = 4;
    elseif (slvl >= 25) then
      subamount = 3;
    end
  end

  -- Add only the highest
  if (subamount > amount) then
    amount = subamount;
  end

  -- Remove old
  if (user:getStatusEffect(EFFECT_HASSO)) then
    user:removeStatusType(EFFECT_HASSO);
  end

  --Do it!
  user:addStatusEffect(EFFECT_HASSO,amount,1,duration);
  target:updateEnmity(user,300,1);
end;