-----------------------------------
--	Author: Tenjou
-- 	Koru-Moru
--	Starts and ends quests "Star Struck","Blast from the Past",and "Nothing Matters".
--	Involved in BLM AF and SMN AF quests.
--	Involved in quest "Making the Grade".
--	Involved in Promathia Mission 3-3.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0xc1));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
blmafthree = player:getVar("theRootOfTheProblem");
blmafthreek = player:getVar("theRootOfT-KoruMoruCS");
count = trade:getItemCount();
item3 = trade:hasItemQty(0x33d,1);
if (blmafthree == 1 and item3 and count == 1) then
	trade:isComplete();
	player:startEvent(Event(0x15d));
	player:setVar("theRootOfT-KoruMoruCS",1);
end
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;