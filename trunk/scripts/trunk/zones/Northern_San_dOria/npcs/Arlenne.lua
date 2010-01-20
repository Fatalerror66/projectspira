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
player:showText(npc,1897) 
shop = player:createShop(0); 
shop:addItem(17049,(46*SHOP_PRICE)); 
shop:addItem(17050,(333*SHOP_PRICE)); 
shop:addItem(17088,(57*SHOP_PRICE)); 
shop:addItem(17089,(571*SHOP_PRICE)); 
shop:addItem(17096,(4568*SHOP_PRICE)); 
shop:addItem(16833,(792*SHOP_PRICE)); 
shop:addItem(16834,(4680*SHOP_PRICE)); 
shop:addItem(16768,(309*SHOP_PRICE)); 
shop:addItem(16769,(2542*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
