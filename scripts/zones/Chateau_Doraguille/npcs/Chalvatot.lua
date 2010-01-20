-----------------------------------
--	Author: ReaperX
-- 	Chalvatot
-- 	Sandy Missions "The Crystal Spring" and "Leaute's Last Wish", quests
--  to be done: different default responses based on nationality, and whether
--  you talk to him for the first time.
--------------------------------------
require("scripts/globals/settings");
require("scripts/globals/rankpoints");

--[[ Events:

004C (final CS for Sandy 9-1 "Breaking Barriers")
0009 (Halver: final CS for Sandy 9-2 "The Heir to the Light" + Promotion to rank 10!)
0213 default response: "I'm busy. I'd appreciate a little peace and quiet."
006F Chateau_LeautesLastWishes_Pt2: final CS for 6-1 "Leaute's Last Wishes"
0000 CS with Princess between sandy missions 7-1 and 7-2
003B "this place is not open to commoners, but since you're here, have a look. Queen Leaute would be pleased." (after finishing Sandy 6-1 or "Her majesty's garden"?)
021B default response if you talk to him for the first time as non-Sandy citizen
021A default response if you talk to him for the first time as Sandy citizen
0054 opening CS for "Her Majesty's Garden" (Map of the Northlands Areas quest) 
0052 CS for "Her Majesty's Garden"
0053 final CS for "Her Majesty's Garden"
0063 BRD AF3 quest
0062 BRD AF3 quest
0060 BRD AF3 quest
0061 BRD AF3 quest
022C Sandy Mission 3-2 "The Crystal Spring"
0231 Lure of the Wildcat

Princess Claidie CS:
0210 nothing?
0074 talks about her Coming of Age ceremony getting nearer
0064 CS for Sandy 8-2 "Lightbringer" (?)

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("chalvatot") == 1) then
	if (player:getNation() == 0) then
		player:startEvent(Event(0x21A));
	else
		player:startEvent(Event(0x21B));
	end;
elseif (player:getMissionStatus(0,16) == 2) and (player:getNation() == 0) then
	player:startEvent(Event(0x3B));
elseif (player:getMissionStatus(0,11) == 1) and (player:getVar("mission_status") == 3) then
  player:startEvent(Event(0x22C));
else
  player:startEvent(Event(0x213));
end;
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
if (csid == 0x22C) then
  add_rank_points_for_mission(player);
 	player:completeMission(0,11);
 	player:setVar("mission_status",0); 
elseif (csid == 0x21A) or (csid == 0x21B) then
	player:setVar("chalvatot",0); 
end;
end;