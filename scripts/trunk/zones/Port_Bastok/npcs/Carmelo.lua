-----------------------------------
--	Author: Almendro
-- 	Carmelo
-- 	Love and Ice, Siren's Tear.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
Carmelossongsheet = 0xA3;
	    LamiaHarp = 0x43CC;
		 UnMoment = 0x153;
		LEphemere = 0x154;
		LAncienne = 0x155;
 ChansondeLiberte = 0x156;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
      TheSirensTear = player:getQuestStatus(1,0);
TheSirensTearRepeat = player:getVar("TheSirensTearRepeat");

	TheStarsofIfrit = player:getQuestStatus(1,42);

	     LoveandIce = player:getQuestStatus(1,43);
 justDoneLoveandIce = player:getVar("temp_justDoneLoveandIce");
    ATestofTrueLove = player:getQuestStatus(1,62);
	LoversintheDusk = player:getQuestStatus(1,63);
 

			  bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 7 and ATestofTrueLove == 2 and LoversintheDusk == 0)then
	player:startEvent(Event(0x113));
elseif(LoversintheDusk == 1)then
	player:startEvent(Event(0x114));
elseif(bflvl >= 7  and LoveandIce == 2 and ATestofTrueLove == 0 and justDoneLoveandIce ~= 1)then
	player:startEvent(Event(0x10E));
	player:addQuest(1,62);
elseif(ATestofTrueLove == 1 and player:hasKeyItem(UnMoment) == 1 and player:hasKeyItem(LEphemere) == 1 and player:hasKeyItem(LAncienne) == 1)then
	player:startEvent(Event(0x110));
	player:removeKeyItem(UnMoment);
	player:removeKeyItem(LEphemere);
	player:removeKeyItem(LAncienne);
	player:setVar("temp_ATestofTrueLove",1);
elseif(ATestofTrueLove == 1 and player:getVar("temp_ATestofTrueLove") == 1)then
	player:startEvent(Event(0x111));
elseif(ATestofTrueLove == 1 and player:getVar("temp_ATestofTrueLove") == 2)then
	player:startEvent(Event(0x112));
elseif(ATestofTrueLove == 1)then
	player:startEvent(Event(0x10F));
elseif(TheStarsofIfrit == 2 and TheSirensTear == 2 and bflvl >= 5 and LoveandIce == 0)then
	player:startEvent(Event(0xB9));
elseif(LoveandIce == 1 and player:hasKeyItem(Carmelossongsheet) == 0)then
	player:startEvent(Event(0xBA));
elseif(TheSirensTear == 1 or TheSirensTearRepeat == 1)then
	player:startEvent(Event(0x6));
elseif(LoversintheDusk == 2)then
	player:startEvent(Event(0x115));
else
	player:startEvent(Event(0x13));
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
if(csid == 0x6 and option == 0)then
	TheSirensTearRepeat = player:getVar("TheSirensTearRepeat");
	if(TheSirensTearRepeat == 1)then
		player:setVar("TheSirensTearRepeat",2);
	end
elseif(csid == 0xB9)then
	player:addQuest(1,43);
	player:addKeyItem(Carmelossongsheet);
	player:specialMessage(KEYITEM_OBTAINED,Carmelossongsheet);
elseif(csid == 0xBA)then
	player:completeQuest(1,43);
	player:addItem(LamiaHarp);
	player:specialMessage(ITEM_OBTAINED,LamiaHarp);
	player:addFame(1,BAS_FAME*150);
	player:setTitle(102);
	player:setVar("temp_justDoneLoveandIce",1);
elseif(csid == 0x112)then
	player:completeQuest(1,62);
	player:addGil(GIL_RATE*10000);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*10000);
	player:addFame(1,BAS_FAME*350);
	player:setVar("temp_ATestofTrueLove",0); -- Deletes from server
elseif(csid == 0x113)then
	player:addQuest(1,63);
	player:addKeyItem(ChansondeLiberte);
	player:specialMessage(KEYITEM_OBTAINED,ChansondeLiberte);
end
end;