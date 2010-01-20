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
player:showText(npc,3164) 
shop = player:createShop(0); 
shop:addItem(12633,(270*SHOP_PRICE)); 
shop:addItem(12634,(270*SHOP_PRICE)); 
shop:addItem(12755,(162*SHOP_PRICE)); 
shop:addItem(12759,(162*SHOP_PRICE)); 
shop:addItem(12885,(234*SHOP_PRICE)); 
shop:addItem(12889,(234*SHOP_PRICE)); 
shop:addItem(13006,(162*SHOP_PRICE)); 
shop:addItem(13011,(162*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
