-----------------------------------
--	Author: ReaperX
-- 	Runic Portal
-- 	Mamool Ja Teleporter Back to Aht Urgan Whitegate
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
has_port = player:getVar("MAMOOL_RUNIC_PORT")
if (has_port == 1) then
  event =  Event(0x006d);
else
  event =  Event(0x006f);
end
player:startEvent(event); 
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (option == 1) then
  player:setVar("MAMOOL_RUNIC_PORT",1)
  if ((getVanaMinute() % 2 ) == 0) then
    player:setPos(116.6,1.49,47,3,0x32) -- -> Aht Urgan Whitegate Teleport pad (right pad);
  else
    player:setPos(133.5,1.49,47,74,0x32) -- -> Aht Urgan Whitegate Teleport pad (left pad);
  end
end
end;
