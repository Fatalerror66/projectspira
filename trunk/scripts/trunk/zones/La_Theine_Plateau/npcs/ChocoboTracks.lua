-----------------------------------
--	Author: Almendro
-- 	Chocobo Tracks
-- 	Involved in "Chocobo on the Loose!" Quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("chocoboOnTheLoose") == 1) then
	player:startEvent(Event(0xD1));
	player:setVar("chocoboOnTheLoose",2);
else
	player:specialMessage(1443); -- There are chocobo tracks on the ground here.
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------
--questflag = player:getVar(""); --Quest flags
item1 = trade:hasItemQty(0x000,1); --Item ID and amount; add more as needed.
if (count == 1 and item1 == true and questflag == 0) then --# of slots needed, check for item, and check for questflag.
	--Correct trade, usually completes a quest, hence the quest flag.
	player:startEvent(Event(0x000));
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;