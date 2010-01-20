-----------------------------------
--	Author: Tenjou
-- 	Ibwam
--	Starts and ends quest "Lure of the Wildcat" in Windurst.  
--	After this quest and Aht Urghan mission 2,he will teleport you to Aht Urghan for 300g.
--Bitmask Designations:
--Windurst Woods
--    (J-13) Etsa Rhuyuli		00001
--    (H-10) Soni-Muni 		00002
--    (I-10) Cayu Pensharhumi	00004
--    (I-5/6) Umumu		00008
--    (J-3) Nanaa Mihgo		00010
--Windurst Walls
--    (J-11) Yoriri			00020
--    (K-7) Shantotto		00040
--    (J-6) Moan-Maon		00080
--    (H-3) Chomomo		00100
--    (F-5) Naih Arihmepp		00200
--Windurst Waters
--    (G-4) Npopo 			00400
--    (F-8) Lago-Charago 		00800
--    (G-9) Amagusa-Chigurusa	01000
--    (F-9) Funpo-Shipo 		02000
--    (F-10) Kyume-Romeh 	04000
--Port Windurst
--    (E-7) Kunchichi		08000 
--    (E-7) Yaman-Hachuman 	10000
--    (F-6) Choyi Totlihpa		20000
--    (G-7) Three of Clubs 	40000
--    (M-6) Yujuju 			80000
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local wildcat = player:getVar("lureOfTheWildcat-Windurst");
local wildcatcount = player:getVar("lureOfTheWildcat-W-Counter");
--print("Wildcat: ",wildcat);
if (wildcat == 0) then
	--Quest force start: the option does not make a difference.
	player:startEvent(Event(0x2e0));
	player:setVar("lureOfTheWildcat-Windurst",1);
	player:setVar("lureOfTheWildcat-W-Counter",0);
	player:addKeyItem(0x2e9);
	player:addQuest(2,94);
elseif (wildcat == 1) then
	if (wildcatcount == 0) then
		--Quest accepted.
		player:startEvent(Event(0x2e2));
	elseif (wildcatcount == 0xfffff) then
		--Complete quest.
		player:startEvent(Event(0x2e3));
		player:setVar("lureOfTheWildcat-Windurst",2);
		--Give rewards
		player:addKeyItem(0x2f3);
		player:removeKeyItem(0x2e9);
		--NEEDS A PACKET 2A HERE
		sendTellMsg("[pXI]Altana",player:getName(),"Obtained: Green Invitation Card");
		player:addFame(2,WIN_FAME*150);
		player:completeQuest(2,94);
	else
		--During quest.
		player:startEvent(Event(0x2e1));
	end
elseif (wildcat == 2) then
	player:startEvent(Event(0x2e4));
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