-----------------------------------
--	Author: Tenjou
-- 	Campfire
-- 	Used for quest "Smoke on the Mountain."
-----------------------------------
-- Includes
require("scripts/globals/settings");
COOKING_WAIT = 3480; --Amount of time to wait on the sausage being cooked during the quest.  Default is about 3480 (58 minutes).
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
cookingtime = player:getVar("smokeOnThe-CookingStartTime");
if (cookingtime == 0) then
	player:specialMessage(919);
else
	if (os.time() <= (cookingtime + COOKING_WAIT)) then
		--Still cooking!
		player:specialMessage(922,0x112b);
	else
		--Finished cooking!
		player:specialMessage(921,0x112b);
		player:addItem(0x112b);
		player:setVar("smokeOnThe-CookingStartTime",0);
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local smokemountain = player:getQuestStatus(1,15);
count = trade:getItemCount();
meat = trade:hasItemQty(0x1114,1);
if (smokemountain == 1 and meat and count == 1) then
	--Start cooking that meat!
	trade:isComplete();
	player:specialMessage(920,0x1114);
	--Record the start cooking time.
	player:setVar("smokeOnThe-CookingStartTime",os.time());
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;