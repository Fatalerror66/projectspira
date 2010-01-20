-- Auto-Generated Script from FFXImonV3 
-- By: Mana  
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
end; 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
player:showText(npc,1894) 
shop = player:createShop(0); 
shop:addItem(219,(900*SHOP_PRICE)); 
shop:addItem(1774,(1984*SHOP_PRICE)); 
shop:addItem(12984,(111*SHOP_PRICE)); 
shop:addItem(12985,(1462*SHOP_PRICE)); 
shop:addItem(17318,(3*SHOP_PRICE)); 
shop:addItem(17336,(5*SHOP_PRICE)); 
shop:addItem(4150,(2335*SHOP_PRICE)); 
shop:addItem(4148,(284*SHOP_PRICE)); 
shop:addItem(4151,(720*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
