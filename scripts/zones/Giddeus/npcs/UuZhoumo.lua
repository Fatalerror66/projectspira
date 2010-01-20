-----------------------------------
--	Author: ReaperX
-- 	Uu Zhoumo
-- 	Involved in Bastok and Sandy Missions 2-3. 
-----------------------------------

     DullSword = 0x21;
ShieldOffering = 0x20;
    AspirKnife = 16509;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

mission_status = player:getVar("mission_status");

if (player:hasKeyItem(DullSword) == 1) then
  player:startEvent(Event(0x28))  -- bring him aspir knife
elseif (player:hasKeyItem(ShieldOffering) == 1) then
	player:startEvent(Event(0x2a))  
elseif (player:getMissionStatus(1,7) == 1) and (mission_status == 13) then
  player:startEvent(Event(0x2b)); -- repeats instructions to bring him aspir knife
else
  player:startEvent(Event(0x2c));
end; 
end
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

if (trade:getItemCount() == 1) and (trade:hasItemQty(AspirKnife,1)) then 
  player:startEvent(Event(0x29));
  trade:isComplete() 	
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x28) then
  player:setVar("mission_status",13);     --> get aspir knife
  player:removeKeyItem(DullSword)
elseif (csid == 0x29) then
  player:setVar("mission_status",14);     --> back to Windy
elseif (csid == 0x2a) then
	player:removeKeyItem(ShieldOffering)    
  player:setVar("mission_status",12);  		--> back to Windy
end;
end;