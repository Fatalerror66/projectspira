-----------------------------------
--	Author: Jax
-- 	Fontoumant
--	Quest added (The Brugaire Consortium)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------
-- Initialization
LauanShield = 12289;
MagicShopParcel = 593;
AuctionParcel = 594;
PubParcel = 595;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
BrugaireConsortium = player:getQuestStatus(0,12);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (BrugaireConsortium == 0) then
		player:startEvent(Event(0x01fd));
	elseif (BrugaireConsortium == 1 and player:getVar("MagicParcel") == 2) then
		player:startEvent(Event(0x01ff));
	elseif (BrugaireConsortium == 1 and player:getVar("AuctionParcel") == 2) then
		player:startEvent(Event(0x0200));
	elseif (BrugaireConsortium == 1 and player:getVar("PubParcel") == 2) then
		player:startEvent(Event(0x0203));
	elseif (BrugaireConsortium == 2) then
		player:startEvent(Event(0x0231));
	elseif (player:getVar("MagicParcel") == 1 or player:getVar("AuctionParcel") == 1 or player:getVar("PubParcel") == 1) then
		player:startEvent(Event(0x0230));
	end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x01fd and option == 0) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(MagicShopParcel);
			player:specialMessage(ITEM_OBTAINED,MagicShopParcel);
			player:addQuest(0,12)
			player:setVar("MagicParcel",1)
		else
			player:startEvent(Event(0x0219));
		end
	elseif (csid == 0x01ff) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(AuctionParcel);
			player:specialMessage(ITEM_OBTAINED,AuctionParcel);
			player:setVar("AuctionParcel",1)
			player:setVar("MagicParcel",0)
		else
			player:startEvent(Event(0x0219));
		end
	elseif (csid == 0x0200) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(PubParcel);
			player:specialMessage(ITEM_OBTAINED,PubParcel);
			player:setVar("PubParcel",1)
			player:setVar("AuctionParcel",0)
		else
			player:startEvent(Event(0x0219));
		end
	elseif (csid == 0x0203) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(LauanShield);
			player:specialMessage(ITEM_OBTAINED,LauanShield);
			player:setTitle(58); -- 	 Courier Extraordinaire
			player:completeQuest(0,12);
			player:addFame(0,SAN_FAME*30);
			player:setVar("PubParcel",0)
		else
			player:startEvent(Event(0x0219));
		end
	end
end;