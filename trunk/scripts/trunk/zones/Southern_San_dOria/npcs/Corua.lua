-----------------------------------
--	Author: Mana
-- 	Corua
-- 	Type: Regional Vendor NPC 
--        Ronfaure Region 
--        Location: Southern San d'Oria (G-9)  
--        Available only when San d'Oria has control of Ronfaure: 
--        Chestnut 108 - 124 
--        San d'Orian Carrot 28 - 33 
--        San d'Orian Flour 54 - 62 
--        San d'Orian Grape 68 - 79 
--  ?    Lost Chocobo - Diligent Chocobo Story  (Key Item 0x352)
--        
--        Involved in Quests:
--        Lost Chick 

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)




-- Thanks Tenjou
-- regional influence needed to determine if to call the shop and the correct text line to show
--player:showText(npc,);
--Open shop!!
nation = player:getNation();

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

player:showText(npc,0x06bc)

shop = player:createShop(0);
shop:addItem(0x27f,(124*SHOP_PRICE));
shop:addItem(0x1125,(33*SHOP_PRICE));
shop:addItem(0x262,(62*SHOP_PRICE));
shop:addItem(0x114f,(79*SHOP_PRICE));
--shop:addItem(,);
player:sendShop(shop);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 -- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;