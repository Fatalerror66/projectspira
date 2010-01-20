-----------------------------------
--	Author: Tenjou
-- 	Elixir
-- 	This potion instantly restores a few HP and MP.
--
--	Actually restores 25% of HP and MP.
-----------------------------------

require("scripts/globals/settings");
function OnUseItem(user,target,item)

finalhp = math.floor(0.25*target:getMaxHP());
finalmp = math.floor(0.25*target:getMaxMP());

--Cap the final amount to max HP.
if ((target:getMaxHP() - target:getHP()) < finalhp) then
	finalhp = (target:getMaxHP() - target:getHP());
end

--Cap the final amount to max MP.
if ((target:getMaxMP() - target:getMP()) < finalmp) then
	finalmp = (target:getMaxMP() - target:getMP());
end

--Do it!
target:addHP(finalhp);
target:addMP(finalmp);

--Message/Animation
item:setMsg(26,final);
item:setAnimation(0x22);
end; 
 
 
 