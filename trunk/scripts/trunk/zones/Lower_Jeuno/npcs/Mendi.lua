-----------------------------------
--	Author: Tenjou
-- 	Mendi
-- 	Checks Jeuno fame based on the average of the three nations' fame.  His event has the fame levels built in.
--
--	Level 1: 0
--	Level 2: 200
--	Level 3: 500
--	Level 4: 900
--	Level 5: 1300
--	Level 6: 1700
--	Level 7: 1952
--	Level 8: 2200
--	Level 9: 2450
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--DEBUG: Set Fame
--player:setFame(0,2500);
--player:setFame(1,2500);
--player:setFame(2,2500);

--Gather nation fame.
famesan = player:getFame(0);
famebas = player:getFame(1);
famewin = player:getFame(2);
--print("Fame: " .. famesan .. " " .. famebas .. " " .. famewin);

--Jeuno fame is reported to be the average of the three nations' fame.
famejeu = math.floor(((famesan + famebas + famewin)/3));
--print("Fame: " .. famejeu);

--Give fame dialogue.
event0x52 = Event(0x52);
event0x52:setParams(famejeu);
player:startEvent(event0x52);
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