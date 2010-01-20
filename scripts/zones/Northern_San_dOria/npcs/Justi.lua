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
player:showText(npc,1900) 
shop = player:createShop(0); 
shop:addItem(1657,(90*SHOP_PRICE)); 
shop:addItem(93,(507*SHOP_PRICE)); 
shop:addItem(57,(15535*SHOP_PRICE)); 
shop:addItem(24,(126360*SHOP_PRICE)); 
shop:addItem(46,(8194*SHOP_PRICE)); 
shop:addItem(49,(34506*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
