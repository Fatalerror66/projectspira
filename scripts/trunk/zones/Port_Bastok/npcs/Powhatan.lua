-----------------------------------
--	Author: Almendro
-- 	Powhatan
-- 	Welcome to Bastok & Guest of Hauteur Quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
WelcometoBastok = player:getQuestStatus(1,2);
GuestofHauteur = player:getQuestStatus(1,3);
if(WelcometoBastok~=2 and player:getFameLevel(1)>=1 and (player:getMainJob() == 1 or player:getMainJob() == 5 or player:getMainJob() == 7 or player:getMainJob() == 9 or player:getMainJob() == 12) )then
	if(WelcometoBastok == 0)then
		player:startEvent(Event(0x32));
	else
		if(player:getVar("WelcometoBastok") == 1) then
			player:startEvent(Event(0x33));
		elseif(player:getVar("WelcometoBastok") == 2) then
			player:startEvent(Event(0x35));
		end
	end
elseif(WelcometoBastok == 2 and GuestofHauteur~=2 and             -- Has done the previous quest (Welcome to Bastok) but hasn't completed "Guest of Hauteur"
	player:getFameLevel(1)>=3 and player:getMainLvl()>=31)then  -- Has Bastok Fame level 3 or higher and level 31+	
	if(GuestofHauteur == 0) then
		player:startEvent(Event(0x37));
	else
		if(player:getVar("GuestofHauteur") == 1) then
			player:startEvent(Event(0x38));
		elseif(player:getVar("GuestofHauteur") == 2) then
			player:startEvent(Event(0x3A));
		end
	end
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
if(csid == 0x32 and option == 0)then
	player:addQuest(1,2);
	player:setVar("WelcometoBastok",1);
elseif(csid == 0x35) then
	player:completeQuest(1,2);
	player:addItem(0x40B5); -- Spatha
	player:addFame(1,BAS_FAME*40);
	player:specialMessage(ITEM_OBTAINED,0x40B5);
	player:setVar("WelcometoBastok",0);
elseif(csid == 0x37 and option == 0)then
	player:addQuest(1,3);
	player:setVar("GuestofHauteur",1);
elseif(csid == 0x3A) then
	player:completeQuest(1,3);
	player:addItem(0x300C); -- Targe
	player:removeKeyItem(0xB);
	player:addFame(1,BAS_FAME*60);
	player:specialMessage(ITEM_OBTAINED,0x300C);
	player:setVar("GuestofHauteur",0);
end
end;