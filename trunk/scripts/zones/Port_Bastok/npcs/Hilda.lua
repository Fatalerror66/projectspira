-----------------------------------
--	Author: Almendro, ReaperX
-- 	Hilda
-- 	"Lure of the Wildcat (Bastok)", Bastok Mission 7.2 "On My Way", "Cid's Secret", "The Usual"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
       UnfinishedLetter = 0x72;
SteamingSheepInvitation = 0x7F;
            KingTruffle = 0x1122; -- 4386
          Rolanberry874 = 0x11B2; -- 4530
		       SpeedBow = 0x4312;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x00008);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

---- Hilda Events ----------
-- 0030 default: wish I had time to chat, but I'm busy.
-- 0031 "Thank you very much for all your help."
-- 0084 quest "Cid's Secret"
-- 0085 final CS for quest "Cid's Secret"
-- 0086 quest "The Usual"
-- 0087 quest "The Usual"
-- 0088 quest "The Usual"
-- 00FF Bastok 7.2 "On My Way" 
-- 0141 something about a group of little beastmen coming in, talking to a Galka and then leaving
-- 0164 Lure of the Wildcat

bflvl = player:getFameLevel(1);
mission_status = player:getVar("mission_status");
CidsSecret = player:getQuestStatus(1,26);
  TheUsual = player:getQuestStatus(1,27);
CidsSecret_tempVar = player:getVar("CidsSecret_tempVar");
  TheUsual_tempVar = player:getVar("TheUsual_tempVar");
----------------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00008);
	player:startEvent(Event(0x164));
----------------------------------------
-- Bastok Mission 7.2 "On My Way"
elseif (player:getMissionStatus(1,19) == 1) and (mission_status == 2) then
  player:startEvent(Event(0xFF));
elseif (player:getMissionStatus(1,19) == 1) and (mission_status == 3) then
  player:showText(npc,1785);
  if (DEBUG_MODE) then
	  player:setPos(-358, 104, -260, 0, 0x90);   -- to Waughroom Shrine
	end;
----------------------------------------
-- "Cid's Secret"
elseif(CidsSecret == 1 and CidsSecret_tempVar == 1)then
	player:startEvent(Event(0x84));
	player:setVar("CidsSecret_tempVar",2);
----------------------------------------
-- "The Usual"
elseif(bflvl >= 5 and CidsSecret == 2 and TheUsual == 0)then
	player:startEvent(Event(0x86));
	player:addQuest(1,27);
	player:setVar("TheUsual_tempVar",1);
elseif(TheUsual == 1 and TheUsual_tempVar == 3 )then
	player:startEvent(Event(0x88));
----------------------------------------
-- Default texts
elseif(TheUsual == 2)then
	player:startEvent(Event(0x31));
else
	player:startEvent(Event(0x30));
end
----------------------------------------
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
        CidsSecret = player:getQuestStatus(1,26);
CidsSecret_tempVar = player:getVar("CidsSecret_tempVar");
   Rolanberry874_1 = trade:hasItemQty(Rolanberry874,1);

          TheUsual = player:getQuestStatus(1,27);
  TheUsual_tempVar = player:getVar("TheUsual_tempVar");
      KingTruffle1 = trade:hasItemQty(KingTruffle,1);

             count = trade:getItemCount();
               gil = trade:getGil();
------------------------------------------
-- "Cid's Secret"
if (CidsSecret_tempVar == 2 and count == 1 and Rolanberry874_1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x85));
------------------------------------------
-- "The Usual"
elseif(TheUsual_tempVar == 1 and count == 1 and KingTruffle1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0x87));
------------------------------------------
end
end;  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0xFF)then
	player:setVar("mission_status",3);
elseif(csid == 0x85)then
	player:addKeyItem(UnfinishedLetter);
	player:specialMessage(KEYITEM_OBTAINED,UnfinishedLetter);
elseif(csid == 0x87)then
	player:addKeyItem(SteamingSheepInvitation);
	player:specialMessage(KEYITEM_OBTAINED,SteamingSheepInvitation);
	player:setVar("TheUsual_tempVar",2);
elseif(csid == 0x88)then
	if(player:getFreeSlotCount(0)>=1)then
		player:completeQuest(1,27);
		player:addFame(1,BAS_FAME*300);
		player:addItem(SpeedBow);
		player:specialMessage(ITEM_OBTAINED,SpeedBow);
		player:setTitle(105); -- 'Steaming Sheep' Regular
		player:setVar("TheUsual_tempVar",0); -- Delete from server
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,SpeedBow);
	end
end
end;