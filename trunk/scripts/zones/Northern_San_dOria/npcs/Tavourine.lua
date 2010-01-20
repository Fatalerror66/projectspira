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
player:showText(npc,1898) 
shop = player:createShop(0); 
shop:addItem(16465,(147*SHOP_PRICE)); 
shop:addItem(17059,(90*SHOP_PRICE)); 
shop:addItem(17081,(621*SHOP_PRICE)); 
shop:addItem(17034,(169*SHOP_PRICE)); 
shop:addItem(17035,(4363*SHOP_PRICE)); 
shop:addItem(16640,(284*SHOP_PRICE)); 
shop:addItem(16583,(2448*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
