-----------------------------------
--	Author: ReaperX
-- 	Runic Portal
-- 	Caedarva Mire Teleporter Back to Aht Urgan Whitegate
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
if (player:getXPos() > 0) then          -- are we at Azouph or Dvucca isle?
  port_name = "AZOUPH_RUNIC_PORT";
  first_use_event = Event(0x007c);
  regular_use_event = Event(0x0083);
else
  port_name = "DVUCCA_RUNIC_PORT"
  first_use_event = Event(0x007d);
  regular_use_event = Event(0x0086);
end;
has_port = player:getVar(port_name)
if (has_port == 1) then
  event = regular_use_event; -- player already has this staging point
else
  event = first_use_event; -- player still needs to get the staging point;
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
  player:setVar(port_name,1)
  if ((getVanaMinute() % 2 ) == 0) then
    player:setPos(116.6,1.49,47,3,0x32) -- -> Aht Urgan Whitegate Teleport pad (right pad);
  else
    player:setPos(133.5,1.49,47,74,0x32) -- -> Aht Urgan Whitegate Teleport pad (left pad);
  end
end
end;
