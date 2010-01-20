-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Forine
-- 	Part of San d'Oria Mission 2-3.  Her other events are 0x1c5,0x1cd,0x1d0,and 0x1d7. 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

--[[ Forine Events:

0x1bd greeting for citizens of other nations
0x1be greeting for citizen of Sandy
0x1c5 "your orders are to proceed to Heaven's tower in Windurst walls, where a magic shield will be handed to you."
0x1cd "your efforts are well noted. Take care on your journey to Bastok."
0x1d0 instructions for how to get into Giddeus for BCNM part
0x1d7 "you mentioned that when the nether beast appeared, a Mithra guard came to your aid?"
 
--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


nation = player:getNation();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Different dialogue for San d'Orians.
if ((player:hasKeyItem(KindredCrest) == 1) or (player:hasKeyItem(KindredReport) == 1)) and (player:getMissionStatus(0,9) == 1) then 
  player:startEvent(Event(0x1d7));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status == 11) then
	player:showText(npc,2041); -- "Act according.."
elseif (player:getMissionStatus(0,9) == 1) and (mission_status >= 7) then
	player:startEvent(Event(0x1d0));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status == 10) then
	player:startEvent(Event(0x1c5));
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 14) then
	player:startEvent(Event(0x1cd));	
elseif (nation ~= 0) then
	local event0x1bd = Event(0x1bd);
	event0x1bd:setParams(0,nation);
	player:startEvent(event0x1bd);
else
	player:startEvent(Event(0x1be));
end
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
end;